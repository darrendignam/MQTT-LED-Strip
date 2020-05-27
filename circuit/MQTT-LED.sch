EESchema Schematic File Version 4
LIBS:MQTT-LED-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Transistor_BJT:BC549 Q1
U 1 1 5ECD8A5D
P 5600 4100
F 0 "Q1" H 5791 4146 50  0000 L CNN
F 1 "BC549" H 5791 4055 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 5800 4025 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 5600 4100 50  0001 L CNN
	1    5600 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0101
U 1 1 5ECD8ABC
P 6550 1750
F 0 "#PWR0101" H 6550 1600 50  0001 C CNN
F 1 "+12V" H 6565 1923 50  0000 C CNN
F 2 "" H 6550 1750 50  0001 C CNN
F 3 "" H 6550 1750 50  0001 C CNN
	1    6550 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 5ECD8AE7
P 5950 1750
F 0 "#PWR0102" H 5950 1600 50  0001 C CNN
F 1 "+5V" H 5965 1923 50  0000 C CNN
F 2 "" H 5950 1750 50  0001 C CNN
F 3 "" H 5950 1750 50  0001 C CNN
	1    5950 1750
	1    0    0    -1  
$EndComp
$Comp
L dk_Transistors-FETs-MOSFETs-Single:FQP30N06L Q2
U 1 1 5ECD8D11
P 6550 3800
F 0 "Q2" H 6713 3853 60  0000 L CNN
F 1 "FQP30N06L" H 6713 3747 60  0000 L CNN
F 2 "digikey-footprints:TO-220-3" H 6750 4000 60  0001 L CNN
F 3 "https://www.fairchildsemi.com/datasheets/FQ/FQP30N06L.pdf" H 6750 4100 60  0001 L CNN
F 4 "FQP30N06L-ND" H 6750 4200 60  0001 L CNN "Digi-Key_PN"
F 5 "FQP30N06L" H 6750 4300 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 6750 4400 60  0001 L CNN "Category"
F 7 "Transistors - FETs, MOSFETs - Single" H 6750 4500 60  0001 L CNN "Family"
F 8 "https://www.fairchildsemi.com/datasheets/FQ/FQP30N06L.pdf" H 6750 4600 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/on-semiconductor/FQP30N06L/FQP30N06L-ND/1055122" H 6750 4700 60  0001 L CNN "DK_Detail_Page"
F 10 "MOSFET N-CH 60V 32A TO-220" H 6750 4800 60  0001 L CNN "Description"
F 11 "ON Semiconductor" H 6750 4900 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6750 5000 60  0001 L CNN "Status"
	1    6550 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5ECD8D91
P 6200 4900
F 0 "#PWR0103" H 6200 4650 50  0001 C CNN
F 1 "GND" H 6205 4727 50  0000 C CNN
F 2 "" H 6200 4900 50  0001 C CNN
F 3 "" H 6200 4900 50  0001 C CNN
	1    6200 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5ECD8E22
P 5950 3350
F 0 "R1" H 6020 3396 50  0000 L CNN
F 1 "10k" H 6020 3305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 5880 3350 50  0001 C CNN
F 3 "~" H 5950 3350 50  0001 C CNN
	1    5950 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5ECD8E66
P 4950 4100
F 0 "R3" V 5157 4100 50  0000 C CNN
F 1 "2.2k" V 5066 4100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 4880 4100 50  0001 C CNN
F 3 "~" H 4950 4100 50  0001 C CNN
	1    4950 4100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 5ECD8EA8
P 5250 4500
F 0 "R2" H 5320 4546 50  0000 L CNN
F 1 "10k" H 5320 4455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 5180 4500 50  0001 C CNN
F 3 "~" H 5250 4500 50  0001 C CNN
	1    5250 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R-LED1
U 1 1 5ECD8EEC
P 7200 3150
F 0 "R-LED1" H 7270 3196 50  0000 L CNN
F 1 "500R" H 7270 3105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 7130 3150 50  0001 C CNN
F 3 "~" H 7200 3150 50  0001 C CNN
	1    7200 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3900 5950 3900
Wire Wire Line
	5950 3500 5950 3900
Connection ~ 5950 3900
Wire Wire Line
	5950 3900 6150 3900
Wire Wire Line
	5250 4650 5250 4900
Wire Wire Line
	5250 4900 5700 4900
Wire Wire Line
	6550 4100 6550 4900
Wire Wire Line
	6550 4900 6200 4900
Connection ~ 6200 4900
Wire Wire Line
	5700 4300 5700 4900
Connection ~ 5700 4900
Wire Wire Line
	5700 4900 6200 4900
Wire Wire Line
	5400 4100 5250 4100
Wire Wire Line
	5250 4350 5250 4100
Connection ~ 5250 4100
Wire Wire Line
	5250 4100 5100 4100
$Comp
L Device:LED D1
U 1 1 5ECDA196
P 7200 2750
F 0 "D1" V 7238 2633 50  0000 R CNN
F 1 "LED" V 7147 2633 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 7200 2750 50  0001 C CNN
F 3 "~" H 7200 2750 50  0001 C CNN
	1    7200 2750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7200 2900 7200 3000
Wire Wire Line
	7200 3300 7200 3400
Wire Wire Line
	7200 3400 6550 3400
Wire Wire Line
	6550 3400 6550 3500
Wire Wire Line
	7200 2600 7200 2550
Wire Wire Line
	7200 2550 6550 2550
$Comp
L Device:R R-LED2
U 1 1 5ECDA801
P 7850 3150
F 0 "R-LED2" H 7920 3196 50  0000 L CNN
F 1 "500R" H 7920 3105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 7780 3150 50  0001 C CNN
F 3 "~" H 7850 3150 50  0001 C CNN
	1    7850 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 5ECDA808
P 7850 2750
F 0 "D2" V 7888 2633 50  0000 R CNN
F 1 "LED" V 7797 2633 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 7850 2750 50  0001 C CNN
F 3 "~" H 7850 2750 50  0001 C CNN
	1    7850 2750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7850 2900 7850 3000
Wire Wire Line
	7850 3300 7850 3400
Wire Wire Line
	7850 3400 7200 3400
Wire Wire Line
	7850 2600 7850 2550
Wire Wire Line
	7850 2550 7200 2550
$Comp
L Device:R R-LED3
U 1 1 5ECDAA56
P 8500 3150
F 0 "R-LED3" H 8570 3196 50  0000 L CNN
F 1 "500R" H 8570 3105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 8430 3150 50  0001 C CNN
F 3 "~" H 8500 3150 50  0001 C CNN
	1    8500 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 5ECDAA5D
P 8500 2750
F 0 "D3" V 8538 2633 50  0000 R CNN
F 1 "LED" V 8447 2633 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 8500 2750 50  0001 C CNN
F 3 "~" H 8500 2750 50  0001 C CNN
	1    8500 2750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8500 2900 8500 3000
Wire Wire Line
	8500 3300 8500 3400
Wire Wire Line
	8500 3400 7850 3400
Wire Wire Line
	8500 2600 8500 2550
Wire Wire Line
	8500 2550 7850 2550
$Comp
L Device:R R-LED4
U 1 1 5ECDAD74
P 9150 3150
F 0 "R-LED4" H 9220 3196 50  0000 L CNN
F 1 "500R" H 9220 3105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 9080 3150 50  0001 C CNN
F 3 "~" H 9150 3150 50  0001 C CNN
	1    9150 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D4
U 1 1 5ECDAD7B
P 9150 2750
F 0 "D4" V 9188 2633 50  0000 R CNN
F 1 "LED" V 9097 2633 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 9150 2750 50  0001 C CNN
F 3 "~" H 9150 2750 50  0001 C CNN
	1    9150 2750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9150 2900 9150 3000
Wire Wire Line
	9150 3300 9150 3400
Wire Wire Line
	9150 3400 8500 3400
Wire Wire Line
	9150 2600 9150 2550
Wire Wire Line
	9150 2550 8500 2550
$Comp
L ESP32-footprints-Shem-Lib:ESP-32S U1
U 1 1 5ECE2B75
P 3400 3850
F 0 "U1" H 3375 5237 60  0000 C CNN
F 1 "ESP-32S" H 3375 5131 60  0000 C CNN
F 2 "ESP32-footprints-Lib:ESP-32S" H 3750 5200 60  0001 C CNN
F 3 "" H 2950 4300 60  0001 C CNN
	1    3400 3850
	1    0    0    -1  
$EndComp
Connection ~ 7200 2550
Connection ~ 7200 3400
Connection ~ 7850 2550
Connection ~ 7850 3400
Connection ~ 8500 2550
Connection ~ 8500 3400
$Comp
L dk_PMIC-Voltage-Regulators-Linear:LD1117V33 U2
U 1 1 5ECE381A
P 3800 6850
F 0 "U2" H 3850 7137 60  0000 C CNN
F 1 "LD1117V33" H 3850 7031 60  0000 C CNN
F 2 "digikey-footprints:TO-220-3" H 4000 7050 60  0001 L CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/99/3b/7d/91/91/51/4b/be/CD00000544.pdf/files/CD00000544.pdf/jcr:content/translations/en.CD00000544.pdf" H 4000 7150 60  0001 L CNN
F 4 "497-1491-5-ND" H 4000 7250 60  0001 L CNN "Digi-Key_PN"
F 5 "LD1117V33" H 4000 7350 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 4000 7450 60  0001 L CNN "Category"
F 7 "PMIC - Voltage Regulators - Linear" H 4000 7550 60  0001 L CNN "Family"
F 8 "http://www.st.com/content/ccc/resource/technical/document/datasheet/99/3b/7d/91/91/51/4b/be/CD00000544.pdf/files/CD00000544.pdf/jcr:content/translations/en.CD00000544.pdf" H 4000 7650 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/stmicroelectronics/LD1117V33/497-1491-5-ND/586012" H 4000 7750 60  0001 L CNN "DK_Detail_Page"
F 10 "IC REG LINEAR 3.3V 800MA TO220AB" H 4000 7850 60  0001 L CNN "Description"
F 11 "STMicroelectronics" H 4000 7950 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4000 8050 60  0001 L CNN "Status"
	1    3800 6850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 5ECE3B57
P 3250 6850
F 0 "#PWR0104" H 3250 6700 50  0001 C CNN
F 1 "+5V" H 3265 7023 50  0000 C CNN
F 2 "" H 3250 6850 50  0001 C CNN
F 3 "" H 3250 6850 50  0001 C CNN
	1    3250 6850
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0105
U 1 1 5ECE3B89
P 4450 6850
F 0 "#PWR0105" H 4450 6700 50  0001 C CNN
F 1 "+3V3" H 4465 7023 50  0000 C CNN
F 2 "" H 4450 6850 50  0001 C CNN
F 3 "" H 4450 6850 50  0001 C CNN
	1    4450 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 6850 4450 6850
Wire Wire Line
	3250 6850 3400 6850
$Comp
L power:GND #PWR0106
U 1 1 5ECE4CD7
P 3800 7350
F 0 "#PWR0106" H 3800 7100 50  0001 C CNN
F 1 "GND" H 3805 7177 50  0000 C CNN
F 2 "" H 3800 7350 50  0001 C CNN
F 3 "" H 3800 7350 50  0001 C CNN
	1    3800 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 7250 3800 7350
$Comp
L power:GND #PWR0107
U 1 1 5ECE5B66
P 2950 5300
F 0 "#PWR0107" H 2950 5050 50  0001 C CNN
F 1 "GND" H 2955 5127 50  0000 C CNN
F 2 "" H 2950 5300 50  0001 C CNN
F 3 "" H 2950 5300 50  0001 C CNN
	1    2950 5300
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0108
U 1 1 5ECE5B9E
P 2000 2850
F 0 "#PWR0108" H 2000 2700 50  0001 C CNN
F 1 "+3V3" H 2015 3023 50  0000 C CNN
F 2 "" H 2000 2850 50  0001 C CNN
F 3 "" H 2000 2850 50  0001 C CNN
	1    2000 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 3250 2000 3250
Wire Wire Line
	2000 3250 2000 2850
Wire Wire Line
	2450 3150 2300 3150
Wire Wire Line
	2300 3150 2300 5100
Wire Wire Line
	4500 3200 4300 3200
Wire Wire Line
	2300 5100 2950 5100
Wire Wire Line
	2950 4900 2950 5100
Connection ~ 2950 5100
Wire Wire Line
	2950 5300 2950 5100
Wire Wire Line
	4300 4100 4800 4100
$Comp
L power:GND #PWR0109
U 1 1 5ECEA90E
P 4500 3200
F 0 "#PWR0109" H 4500 2950 50  0001 C CNN
F 1 "GND" H 4505 3027 50  0000 C CNN
F 2 "" H 4500 3200 50  0001 C CNN
F 3 "" H 4500 3200 50  0001 C CNN
	1    4500 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5ECEAB00
P 3400 7100
F 0 "C1" H 3492 7146 50  0000 L CNN
F 1 "10n" H 3492 7055 50  0000 L CNN
F 2 "Capacitor_THT:CP_Axial_L10.0mm_D4.5mm_P15.00mm_Horizontal" H 3400 7100 50  0001 C CNN
F 3 "~" H 3400 7100 50  0001 C CNN
	1    3400 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5ECEABD6
P 4300 7100
F 0 "C2" H 4392 7146 50  0000 L CNN
F 1 "10n" H 4392 7055 50  0000 L CNN
F 2 "Capacitor_THT:CP_Axial_L10.0mm_D4.5mm_P15.00mm_Horizontal" H 4300 7100 50  0001 C CNN
F 3 "~" H 4300 7100 50  0001 C CNN
	1    4300 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 7000 4300 6850
Connection ~ 4300 6850
Wire Wire Line
	3400 7000 3400 6850
Connection ~ 3400 6850
Wire Wire Line
	3800 7350 3400 7350
Wire Wire Line
	3400 7350 3400 7200
Connection ~ 3800 7350
Wire Wire Line
	3800 7350 4300 7350
Wire Wire Line
	4300 7350 4300 7200
Text Notes 1650 6150 0    50   ~ 0
The ESP32 requires many more support components not shown here. \nI have the WROOM and a 3v3 Linear regulator, to demonstrate the circuit.\n\nIdeally you would use a breadboard friendly breakout board from Adafruit.
Wire Notes Line
	9600 3550 9600 2300
Wire Notes Line
	9600 2300 6950 2300
Wire Notes Line
	6950 2300 6950 3550
Wire Notes Line
	6950 3550 9600 3550
Text Notes 7150 2500 0    50   ~ 0
Some LEDs with current limiting resistors, but in the real\nproject this was some cheap LED Tape from eBay.
Wire Wire Line
	6550 1750 6550 2550
Wire Wire Line
	5950 1750 5950 3200
Text Notes 3300 1350 0    50   ~ 0
For the project I used a mains 12V @ 2A isolated power supply from a reputable manufacturer. \nThat came with a brand name wifi router i no longer use.\nThe 5v rail was created with an eBay 12v to 5v buck converter module.\n5v is then connected to the ESP module V-in pin, and to the transistors as shown.\nThe ESP board has its own on board 3v3 regulator.
Text Label 8150 7650 0    50   ~ 0
27-05-2020
Text Label 10600 7650 0    50   ~ 0
1.0
Text Label 7400 7500 0    50   ~ 0
BasicSchematicv1.0
$EndSCHEMATC
