/* ************************************************************************************************************************** *\
**     MQTT-LED-Strip Firmware for ESP32 Arduino compatible PlatformIO project                                                                         
**     (c) 2020 Darren Dignam        
**                                                                 
**                                                                                                       
**                                                                                                        
**      This project relies on the community of ESP32 developers, and AdaFruit and others.                
**                                                                                                       
**      This project supports OTA Firmware updates, check the platformio.ini file for info.               
**
**      Included in the project is an OTA.h file that has the code creatd by Andreas Spiess: 
**      https://github.com/SensorsIot/ESP32-OTA
**
**      OTA allows the ESP boards to be reflashed over Wifi.
**      Like his project, this code expects you to have a credentials.h file thad defines your Wifi details. you can
**      remove the include in OTA and just define the valuse, or create the file and put your details in it. The
**      Format is like this:
**      
**      //Wifi
**      #define mySSID "WIFI-ssid"
**      #define myPASSWORD "WIFI-Password"
**      //MQTT
**      #define MQTT_BROKER_IP "192.168.1.123"
**      #define MQTT_BROKER_PORT 1883
**
**                                                                                                       
\* ************************************************************************************************************************** */

#include "ArduinoJson.h"               // https://github.com/bblanchon/ArduinoJson
#include "Adafruit_MQTT.h"             // https://github.com/adafruit/Adafruit_MQTT_Library
#include "Adafruit_MQTT_Client.h"      //
#include "OTA.h"                       // https://github.com/SensorsIot/ESP32-OTA

// Use this to set the topic. 
// The device will publish to MQTT_TOPIC_BASE + "/get" and will recieve commands on MQTT_TOPIC_BASE + "/set"

#define MQTT_TOPIC_BASE_GET "led-strip/strip1/status/get"
#define MQTT_TOPIC_BASE_SET "led-strip/strip1/status/set"

// Keep this unique for your various ESP projects
#define OTA_HOSTNAME "MQTT_APP_1"

// The output pin for the PWM signal. The code assumes the signal is inverted, so a HIGH output results in the LED off.
// If you use a logic level MOSFET or a single BJT, then edit the LED_PWM_Update() function and remove the "1024 - " bits (in two places) to invert the PWM output.
#define LED 5

//MQTT Setup:
WiFiClient WiFiMQTT;
Adafruit_MQTT_Client mqtt(&WiFiMQTT, MQTT_BROKER_IP, MQTT_BROKER_PORT);
// Adafruit_MQTT_Client mqtt(&WiFiMQTT, MQTT_BROKER_IP, MQTT_BROKER_PORT, "MQTT_USERNAME", "MQTT_KEY_or_PASS"); // Use this if you need user/pass for your broker

// Setup a feed called 'clientStatus' for publishing.  MQTT_TOPIC_BASE
const char CLIENTSTATUS_FEED[] PROGMEM = MQTT_TOPIC_BASE_GET ;
Adafruit_MQTT_Publish tClientStatus = Adafruit_MQTT_Publish(&mqtt, CLIENTSTATUS_FEED);
// Setup a feed called 'status/set' or just COMMAND for subscribing to changes.
const char COMMAND_FEED[] PROGMEM = MQTT_TOPIC_BASE_SET ;
Adafruit_MQTT_Subscribe tCommand = Adafruit_MQTT_Subscribe(&mqtt, COMMAND_FEED);

//TODO: As part of the status, we should perhaps send the IP address of this ESP boar?, so it is easier to configre? especially for OTA?

//ESP PWM STUFF // 10 bit PWM settings
int freq = 5000;
int ledChannel = 0;
int resolution = 10; //1024

//Vars to control the devie state
//mode switches between normal PWM, and the imporved version
int mode = 0;   //0 is linear, 1 is Log
int state = 1;  //0 is off, 1 is on, start on please!
int smooth = 1; //1 is YES 0 is NO, smoothly change the PWM value over time to ease into and out of

// Start LEDs fully on. desired allows fading, saving allows for
int currentBrightness = 1024;
int desiredBrightness = 1024;
int savedBrightness = 1024;

//led fading settings
unsigned long p_delay_Millis = 0;
const long millis_interval = 10;

//PWM Math (Used to generate a LOG scale for the PWM levels, as teh human eye is more sensitive to low level light changes.)
const int pwmIntervals = 500;
float R;

//will keep the MQTT connection alive, called in the main loop to keep device connected.
void connectMQTT()
{
  int8_t ret;

  // Stop if already connected.
  if (mqtt.connected())
  {
    return;
  }
  Serial.print("Connecting to MQTT... ");

  while ((ret = mqtt.connect()) != 0)
  { // connect will return 0 for connected
    Serial.println(mqtt.connectErrorString(ret));
    Serial.println("Retrying MQTT connection in 5 seconds...");
    mqtt.disconnect();
    delay(5000); // wait 5 seconds
  }
  Serial.println("MQTT Connected!");
}

//Build the JSON data and publish it to the topic.
void sendStatus()
{
  DynamicJsonDocument doc(200);
  JsonObject status = doc.to<JsonObject>();
  if (state)
  {
    status["STATE"] = "ON";
  }
  else
  {
    status["STATE"] = "OFF";
  }
  if (mode)
  {
    status["MODE"] = "LOG";
  }
  else
  {
    status["MODE"] = "LINEAR";
  }
  if (smooth)
  {
    status["SMOOTH"] = "YES";
  }
  else
  {
    status["SMOOTH"] = "NO";
  }
  status["BRIGHTNESS"] = desiredBrightness;

  char statusText[200];
  serializeJson(status, statusText);

  if (!tClientStatus.publish(statusText))
  {
    Serial.println(F("Send Status Failed"));
  }
  else
  {
    Serial.println(F("Sent OK!"));
  }
}

// Main function of the application, receives MQTT commands and processes them.
void receiveCommand()
{
  // this is our 'wait for incoming subscription packets' busy subloop
  Adafruit_MQTT_Subscribe *subscription;
  while ((subscription = mqtt.readSubscription(10)))
  {
    if (subscription == &tCommand)
    {
      Serial.print(F("Got Command: "));
      Serial.println((char *)tCommand.lastread);
      DynamicJsonDocument doc(200);
      DeserializationError error = deserializeJson(doc, (char *)tCommand.lastread);
      if (error)
      {
        Serial.print(F("deserializeJson() failed: "));
        Serial.println(error.c_str());
        return;
      }

      //Fetch data
      const char *inSTATE = doc["STATE"];   // "OFF"
      const char *inMODE = doc["MODE"];     // "LINEAR"
      const char *inSMOOTH = doc["SMOOTH"]; // "YES"
      int inBRIGHTNESS = doc["BRIGHTNESS"]; // 255

      // First check if mode or smoothing changed, and then just flip their state vars if needed
      if (inMODE)
      {
        if (strcmp(inMODE, "LOG") == 0)
        {
          mode = 1; //log
        }
        else
        {
          mode = 0; //linear
        }
      }
      // Check for change to smoothing
      if (inSMOOTH)
      {
        if (strcmp(inSMOOTH, "NO") == 0)
        {
          smooth = 0; //No Smoothing
        }
        else
        {
          smooth = 1; //Smoothing
        }
      }

      // Now check if the desired brightness changed
      // if (inBRIGHTNESS)
      // This is a little complex, as if the light is off, we should turn on now, but there might be a full object, with brightness, but we turn off, because the order is off, just happens to have a brightness value.
      if (doc.containsKey("BRIGHTNESS") && doc.containsKey("STATE"))
      {
        if (strcmp(inSTATE, "OFF") == 0)
        {
          if (state)
          {
            //if you send a brightness, and an off command, then we save that brightness, turn off
            if (inBRIGHTNESS >= 0 && inBRIGHTNESS <= 1024)
            {
              savedBrightness = inBRIGHTNESS;
            }
            else
            {
              savedBrightness = currentBrightness;
            }
            desiredBrightness = 0;
            state = 0;
          }
          //if you send me an OFF and I am already off, then i do nothing
        }
        else
        {
          //you are sending me a brightness, and an on command, so i goto that brightness, and if i am set to off, i set myself to on.
          if (inBRIGHTNESS >= 0 && inBRIGHTNESS <= 1024)
          {
            desiredBrightness = inBRIGHTNESS;
          }
          else
          {
            if (!state)
            {
              //you sent invalid brightness, but you wantedd me on, and im off, so have my previous brightness;
              desiredBrightness = savedBrightness;
            }
          }
          state = 1;
        }
      }
      else if (doc.containsKey("BRIGHTNESS"))
      {
        if (inBRIGHTNESS >= 0 && inBRIGHTNESS <= 1024)
        {
          //If you send only a brightness, then we got it, setting ourselves to ON in the process
          desiredBrightness = inBRIGHTNESS;
          state = 1;
        }
      }
      else if (doc.containsKey("STATE"))
      {
        if (strcmp(inSTATE, "OFF") == 0) //turn off LEDs
        {
          if (state)
          {
            //I'm on and your tellg me to OFF, so save brightness and turn off
            state = 0;
            savedBrightness = currentBrightness;
            desiredBrightness = 0;
          }
        }
        else //turn on LEDs
        {
          if (!state)
          {
            state = 1;
            desiredBrightness = savedBrightness;
          }
          else
          {
            if (desiredBrightness <= 30)
            {
              //telling me to turn on, but im already on, but I was set to a low value, then ill get brighter...
              desiredBrightness = 500;
            }
          }
        }
      }
      //we processed the command, so return the status
      sendStatus();
    }
  }
}

// Manages the actual LED brightness
void LED_PWM_Update()
{
  if (mode == 0) //standard PWM
  {
    ledcWrite(ledChannel, 1024 - currentBrightness);
  }
  else // Luminosity scaled PWM
  {
    int mapped = map(currentBrightness, 0, 1024, 0, 500);
    int luminosity = pow(2, (mapped / R)) - 1;

    ledcWrite(ledChannel, 1024 - luminosity);
  }
}

void setup()
{
  //used during the PWM log stuff.
  R = (pwmIntervals * log10(2) / log10(1024));

  Serial.begin(115200);
  Serial.println("Booting UP!");
  // Serial.println(R);

  ArduinoOTA.setHostname(OTA_HOSTNAME);
  setupOTA();

  // //PWM
  ledcSetup(ledChannel, freq, resolution);
  ledcAttachPin(LED, ledChannel);

  mqtt.subscribe(&tCommand);

  sendStatus();//ping the server
}

/*
    The main loop just performs housekeeping and adjusts PWM.
    Keeping us connected to the MQTT broker, 
    checking for OTA updates and commands from the MQTT network.
*/
void loop()
{
  ArduinoOTA.handle();
  yield();
  connectMQTT();

  receiveCommand();
  LED_PWM_Update();

  // LED smooth fading
  // The settings are updated into global vars, and this logic actually changes the LED brightness
  unsigned long currentMillis = millis();
  if (currentMillis - p_delay_Millis >= (millis_interval))
  {
    if (currentBrightness != desiredBrightness)
    {
      if (smooth)
      {
        //get direction
        int diff = desiredBrightness - currentBrightness;
        int size = abs(desiredBrightness - currentBrightness);

        //1024/4 = 256
        int dir = diff / size;
        if (size > 512)
        {
          currentBrightness += (75 * dir);
        }
        else if (size > 256)
        {
          currentBrightness += (50 * dir);
        }
        else if (size > 128)
        {
          currentBrightness += (10 * dir);
        }
        else if (size > 100)
        {
          currentBrightness += (5 * dir);
        }
        else
        {
          currentBrightness = desiredBrightness;
        }
        //Debugging...
        // Serial.print(size); Serial.print(" ");  Serial.print(currentBrightness); Serial.print(" : ");Serial.println(desiredBrightness);
      }
      else
      {
        currentBrightness = desiredBrightness;
      }
    }

    p_delay_Millis = currentMillis;
  }
}
