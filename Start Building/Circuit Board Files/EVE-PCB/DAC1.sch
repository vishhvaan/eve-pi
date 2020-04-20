EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
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
L MCP23017T-E_SO:MCP23017T-E_SO U?
U 1 1 5CA9820D
P 2250 3800
AR Path="/5CA9820D" Ref="U?"  Part="1" 
AR Path="/5CB20BFC/5CA9820D" Ref="U?"  Part="1" 
AR Path="/5CA7DFAE/5CA9820D" Ref="U5"  Part="1" 
F 0 "U5" H 2250 4967 50  0000 C CNN
F 1 "MCP23017T-E_SO" H 2250 4876 50  0000 C CNN
F 2 "MCP23017T-E_SO:SOIC127P1030X265-28N" H 2250 3800 50  0001 L BNN
F 3 "Microchip" H 2250 3800 50  0001 L BNN
F 4 "MCP23017T-E/SOCT-ND" H 2250 3800 50  0001 L BNN "Field4"
F 5 "16-bit Input/Output Expander, I2C interface, Pb-free28 SOIC .300in T/R" H 2250 3800 50  0001 L BNN "Field5"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/MCP23017T-E-SO/MCP23017T-E-SOCT-ND/5358289?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 2250 3800 50  0001 L BNN "Field6"
F 7 "SOIC-28 Microchip" H 2250 3800 50  0001 L BNN "Field7"
F 8 "MCP23017T-E/SO" H 2250 3800 50  0001 L BNN "Field8"
	1    2250 3800
	1    0    0    -1  
$EndComp
$Comp
L EVE-PCB-rescue:GND-power #PWR?
U 1 1 5CA9821A
P 3100 4700
AR Path="/5CA9821A" Ref="#PWR?"  Part="1" 
AR Path="/5CB20BFC/5CA9821A" Ref="#PWR?"  Part="1" 
AR Path="/5CA7DFAE/5CA9821A" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 3100 4450 50  0001 C CNN
F 1 "GND" H 3105 4527 50  0000 C CNN
F 2 "" H 3100 4700 50  0001 C CNN
F 3 "" H 3100 4700 50  0001 C CNN
	1    3100 4700
	1    0    0    -1  
$EndComp
NoConn ~ 2950 3100
NoConn ~ 2950 3200
Wire Wire Line
	1550 3200 1550 3300
Wire Wire Line
	1550 3300 1550 3400
Connection ~ 1550 3300
$Comp
L EVE-PCB-rescue:GND-power #PWR?
U 1 1 5CA98225
P 1050 3300
AR Path="/5CA98225" Ref="#PWR?"  Part="1" 
AR Path="/5CB20BFC/5CA98225" Ref="#PWR?"  Part="1" 
AR Path="/5CA7DFAE/5CA98225" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 1050 3050 50  0001 C CNN
F 1 "GND" H 1055 3127 50  0000 C CNN
F 2 "" H 1050 3300 50  0001 C CNN
F 3 "" H 1050 3300 50  0001 C CNN
	1    1050 3300
	1    0    0    -1  
$EndComp
Text Label 1150 3100 0    50   ~ 0
SCL
Text Label 1150 3700 0    50   ~ 0
SDA
Text HLabel 1350 1000 0    50   BiDi ~ 0
SCL
Text HLabel 1350 1300 0    50   BiDi ~ 0
SDA
Text Label 1800 1000 2    50   ~ 0
SCL
Text Label 1800 1300 2    50   ~ 0
SDA
Wire Wire Line
	1050 3300 1550 3300
$Comp
L EVE-PCB-rescue:+5V-power #PWR?
U 1 1 5CB343B8
P 800 3500
AR Path="/5CB343B8" Ref="#PWR?"  Part="1" 
AR Path="/5CA7DFAE/5CB343B8" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 800 3350 50  0001 C CNN
F 1 "+5V" H 815 3673 50  0000 C CNN
F 2 "" H 800 3500 50  0001 C CNN
F 3 "" H 800 3500 50  0001 C CNN
	1    800  3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3500 1250 3500
Wire Wire Line
	2950 4700 3100 4700
$Comp
L EVE-PCB-rescue:+5V-power #PWR?
U 1 1 5CB346D2
P 3100 2900
AR Path="/5CB346D2" Ref="#PWR?"  Part="1" 
AR Path="/5CA7DFAE/5CB346D2" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 3100 2750 50  0001 C CNN
F 1 "+5V" H 3115 3073 50  0000 C CNN
F 2 "" H 3100 2900 50  0001 C CNN
F 3 "" H 3100 2900 50  0001 C CNN
	1    3100 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 2900 3100 2900
$Comp
L SamacSys_Parts:1841539 L1
U 1 1 5CB34BB6
P 7650 2850
F 0 "L1" H 8100 3115 50  0000 C CNN
F 1 "1841539" H 8100 3024 50  0000 C CNN
F 2 "SamacSys_Parts:1841539" H 8400 2950 50  0001 L CNN
F 3 "https://www.phoenixcontact.com/online/portal/us?uri=pxc-oc-itemdetail:pid=1841539&library=usen&tab=1" H 8400 2850 50  0001 L CNN
F 4 "Phoenix Contact PCB Terminal Block" H 8400 2750 50  0001 L CNN "Description"
F 5 "24.2" H 8400 2650 50  0001 L CNN "Height"
F 6 "651-1841539" H 8400 2550 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=651-1841539" H 8400 2450 50  0001 L CNN "Mouser Price/Stock"
F 8 "Phoenix Contact" H 8400 2350 50  0001 L CNN "Manufacturer_Name"
F 9 "1841539" H 8400 2250 50  0001 L CNN "Manufacturer_Part_Number"
	1    7650 2850
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:ULN2803ADWR Q1
U 1 1 5CB34DEA
P 4600 2650
F 0 "Q1" H 5100 2915 50  0000 C CNN
F 1 "ULN2803ADWR" H 5100 2824 50  0000 C CNN
F 2 "footprints:ULN2803ADWR" H 5450 2750 50  0001 L CNN
F 3 "http://www.ti.com/lit/gpn/uln2803a" H 5450 2650 50  0001 L CNN
F 4 "Darlington Transistor Array" H 5450 2550 50  0001 L CNN "Description"
F 5 "2.65" H 5450 2450 50  0001 L CNN "Height"
F 6 "595-ULN2803ADWR" H 5450 2350 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=595-ULN2803ADWR" H 5450 2250 50  0001 L CNN "Mouser Price/Stock"
F 8 "Texas Instruments" H 5450 2150 50  0001 L CNN "Manufacturer_Name"
F 9 "ULN2803ADWR" H 5450 2050 50  0001 L CNN "Manufacturer_Part_Number"
	1    4600 2650
	1    0    0    -1  
$EndComp
Text Label 3350 4100 2    50   ~ 0
D_FAN1
Text Label 3350 4200 2    50   ~ 0
D_SFAN1
Text Label 3350 4000 2    50   ~ 0
D_LED1
Text Label 3350 3900 2    50   ~ 0
D_WASTE1
Text Label 3350 3800 2    50   ~ 0
D_MEDIA1
Text Label 3350 3700 2    50   ~ 0
D_DRUGS1
Text Label 6000 3050 2    50   ~ 0
A_FAN1
Text Label 6000 3150 2    50   ~ 0
A_SFAN1
Text Label 6000 2950 2    50   ~ 0
A_LED1
Text Label 6000 2850 2    50   ~ 0
A_WASTE1
Text Label 6000 2750 2    50   ~ 0
A_MEDIA1
Text Label 6000 2650 2    50   ~ 0
A_DRUGS1
Wire Wire Line
	3350 3700 2950 3700
Wire Wire Line
	3350 3800 2950 3800
Wire Wire Line
	2950 3900 3350 3900
Wire Wire Line
	2950 4000 3350 4000
Wire Wire Line
	3350 4100 2950 4100
Wire Wire Line
	3350 4200 2950 4200
Text Label 4200 3050 0    50   ~ 0
D_FAN1
Text Label 4200 3150 0    50   ~ 0
D_SFAN1
Text Label 4200 2950 0    50   ~ 0
D_LED1
Text Label 4200 2850 0    50   ~ 0
D_WASTE1
Text Label 4200 2750 0    50   ~ 0
D_MEDIA1
Text Label 4200 2650 0    50   ~ 0
D_DRUGS1
Wire Wire Line
	6000 2650 5600 2650
Wire Wire Line
	6000 2750 5600 2750
Wire Wire Line
	6000 2850 5600 2850
Wire Wire Line
	6000 2950 5600 2950
Wire Wire Line
	6000 3050 5600 3050
Wire Wire Line
	6000 3150 5600 3150
NoConn ~ 5600 3250
NoConn ~ 5600 3350
NoConn ~ 4600 3250
NoConn ~ 4600 3350
$Comp
L EVE-PCB-rescue:+12V-power #PWR011
U 1 1 5CB549FF
P 5950 3450
F 0 "#PWR011" H 5950 3300 50  0001 C CNN
F 1 "+12V" H 5965 3623 50  0000 C CNN
F 2 "" H 5950 3450 50  0001 C CNN
F 3 "" H 5950 3450 50  0001 C CNN
	1    5950 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 3450 5600 3450
$Comp
L EVE-PCB-rescue:GND-power #PWR?
U 1 1 5CB54F53
P 4200 3450
AR Path="/5CB54F53" Ref="#PWR?"  Part="1" 
AR Path="/5CB20BFC/5CB54F53" Ref="#PWR?"  Part="1" 
AR Path="/5CA7DFAE/5CB54F53" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 4200 3200 50  0001 C CNN
F 1 "GND" H 4205 3277 50  0000 C CNN
F 2 "" H 4200 3450 50  0001 C CNN
F 3 "" H 4200 3450 50  0001 C CNN
	1    4200 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 3450 4600 3450
Wire Wire Line
	4200 2650 4600 2650
Wire Wire Line
	4200 2750 4600 2750
Wire Wire Line
	4200 2850 4600 2850
Wire Wire Line
	4200 2950 4600 2950
Wire Wire Line
	4200 3050 4600 3050
Wire Wire Line
	4200 3150 4600 3150
Text Label 3100 1150 2    50   ~ 0
DRUG1_POS
Text Label 4450 800  0    50   ~ 0
DRUG1_NEG
Text Label 4450 1000 0    50   ~ 0
MEDIA1_NEG
Text Label 4450 1200 0    50   ~ 0
WASTE1_NEG
Text Label 4450 1500 0    50   ~ 0
LED1_NEG
Text Label 4450 1800 0    50   ~ 0
FAN1_NEG
Text Label 3100 1250 2    50   ~ 0
MEDIA1_POS
Text Label 3100 1350 2    50   ~ 0
WASTE1_POS
Text Label 3100 1450 2    50   ~ 0
LED1_POS
Text Label 3100 1550 2    50   ~ 0
FAN1_POS
$Comp
L EVE-PCB-rescue:+12V-power #PWR04
U 1 1 5CB5F5B6
P 2600 1000
F 0 "#PWR04" H 2600 850 50  0001 C CNN
F 1 "+12V" H 2615 1173 50  0000 C CNN
F 2 "" H 2600 1000 50  0001 C CNN
F 3 "" H 2600 1000 50  0001 C CNN
	1    2600 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 1000 2600 1150
Wire Wire Line
	3100 1150 2600 1150
Connection ~ 2600 1150
Wire Wire Line
	2600 1150 2600 1250
Wire Wire Line
	3100 1250 2600 1250
Connection ~ 2600 1250
Wire Wire Line
	2600 1250 2600 1350
Wire Wire Line
	3100 1350 2600 1350
Connection ~ 2600 1350
Wire Wire Line
	2600 1350 2600 1450
Wire Wire Line
	3100 1450 2600 1450
Connection ~ 2600 1450
Wire Wire Line
	2600 1450 2600 1550
Wire Wire Line
	3100 1550 2600 1550
Text Label 5800 2000 2    50   ~ 0
A_SFAN1
Text Label 4450 2000 0    50   ~ 0
FAN1_NEG
Text Label 5800 1800 2    50   ~ 0
A_FAN1
Text Label 5800 1500 2    50   ~ 0
A_LED1
Text Label 5800 1200 2    50   ~ 0
A_WASTE1
Text Label 5800 1000 2    50   ~ 0
A_MEDIA1
Text Label 5800 800  2    50   ~ 0
A_DRUGS1
$Comp
L EVE-PCB-rescue:R-Device R11
U 1 1 5CB6FCFC
P 5150 1800
F 0 "R11" V 4943 1800 50  0000 C CNN
F 1 "400" V 5034 1800 50  0000 C CNN
F 2 "SamacSys_Parts:RC0201FR-07402RL" V 5080 1800 50  0001 C CNN
F 3 "~" H 5150 1800 50  0001 C CNN
	1    5150 1800
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 1800 5800 1800
$Comp
L EVE-PCB-rescue:BAT43-Diode D4
U 1 1 5CB8FF05
P 8350 2000
F 0 "D4" H 8350 2216 50  0000 C CNN
F 1 "BAT43" H 8350 2125 50  0000 C CNN
F 2 "SamacSys_Parts:B160-13-F" H 8350 1825 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 8350 2000 50  0001 C CNN
	1    8350 2000
	1    0    0    -1  
$EndComp
Text Label 9000 2000 2    50   ~ 0
FAN1_NEG
Wire Wire Line
	5000 1800 4450 1800
Text Label 9000 950  2    50   ~ 0
DRUG1_NEG
Text Label 9000 1300 2    50   ~ 0
MEDIA1_NEG
Text Label 9000 1650 2    50   ~ 0
WASTE1_NEG
$Comp
L EVE-PCB-rescue:+12V-power #PWR013
U 1 1 5CB9FE50
P 8000 900
F 0 "#PWR013" H 8000 750 50  0001 C CNN
F 1 "+12V" H 8015 1073 50  0000 C CNN
F 2 "" H 8000 900 50  0001 C CNN
F 3 "" H 8000 900 50  0001 C CNN
	1    8000 900 
	1    0    0    -1  
$EndComp
$Comp
L EVE-PCB-rescue:BAT43-Diode D3
U 1 1 5CB9FE57
P 8350 1650
F 0 "D3" H 8350 1866 50  0000 C CNN
F 1 "BAT43" H 8350 1775 50  0000 C CNN
F 2 "SamacSys_Parts:B160-13-F" H 8350 1475 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 8350 1650 50  0001 C CNN
	1    8350 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 2000 9000 2000
$Comp
L EVE-PCB-rescue:BAT43-Diode D2
U 1 1 5CBAC3A9
P 8350 1300
F 0 "D2" H 8350 1516 50  0000 C CNN
F 1 "BAT43" H 8350 1425 50  0000 C CNN
F 2 "SamacSys_Parts:B160-13-F" H 8350 1125 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 8350 1300 50  0001 C CNN
	1    8350 1300
	1    0    0    -1  
$EndComp
$Comp
L EVE-PCB-rescue:BAT43-Diode D1
U 1 1 5CBAEDCC
P 8350 950
F 0 "D1" H 8350 1166 50  0000 C CNN
F 1 "BAT43" H 8350 1075 50  0000 C CNN
F 2 "SamacSys_Parts:B160-13-F" H 8350 775 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 8350 950 50  0001 C CNN
	1    8350 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 900  8000 950 
Wire Wire Line
	8000 2000 8200 2000
Wire Wire Line
	8200 1650 8000 1650
Connection ~ 8000 1650
Wire Wire Line
	8000 1650 8000 2000
Wire Wire Line
	8200 1300 8000 1300
Connection ~ 8000 1300
Wire Wire Line
	8000 1300 8000 1650
Wire Wire Line
	8200 950  8000 950 
Connection ~ 8000 950 
Wire Wire Line
	8000 950  8000 1300
Wire Wire Line
	9000 1650 8500 1650
Wire Wire Line
	9000 1300 8500 1300
Wire Wire Line
	9000 950  8500 950 
$Comp
L EVE-PCB-rescue:R-Device R10
U 1 1 5CBC545D
P 5150 1500
F 0 "R10" V 4943 1500 50  0000 C CNN
F 1 "130" V 5034 1500 50  0000 C CNN
F 2 "SamacSys_Parts:RC0201FR-07130RL" V 5080 1500 50  0001 C CNN
F 3 "~" H 5150 1500 50  0001 C CNN
	1    5150 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 1500 5800 1500
Wire Wire Line
	5000 1500 4450 1500
Wire Wire Line
	4450 2000 5800 2000
Wire Wire Line
	4450 1200 5800 1200
Wire Wire Line
	4450 1000 5800 1000
Wire Wire Line
	4450 800  5800 800 
$Comp
L EVE-PCB-rescue:BAT43-Diode D8
U 1 1 5CBD943B
P 9800 2000
F 0 "D8" H 9800 2216 50  0000 C CNN
F 1 "BAT43" H 9800 2125 50  0000 C CNN
F 2 "SamacSys_Parts:B160-13-F" H 9800 1825 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 9800 2000 50  0001 C CNN
	1    9800 2000
	1    0    0    -1  
$EndComp
Text Label 10450 2000 2    50   ~ 0
FAN2_NEG
Text Label 10450 950  2    50   ~ 0
DRUG2_NEG
Text Label 10450 1300 2    50   ~ 0
MEDIA2_NEG
Text Label 10450 1650 2    50   ~ 0
WASTE2_NEG
$Comp
L EVE-PCB-rescue:+12V-power #PWR014
U 1 1 5CBD9446
P 9450 900
F 0 "#PWR014" H 9450 750 50  0001 C CNN
F 1 "+12V" H 9465 1073 50  0000 C CNN
F 2 "" H 9450 900 50  0001 C CNN
F 3 "" H 9450 900 50  0001 C CNN
	1    9450 900 
	1    0    0    -1  
$EndComp
$Comp
L EVE-PCB-rescue:BAT43-Diode D7
U 1 1 5CBD944C
P 9800 1650
F 0 "D7" H 9800 1866 50  0000 C CNN
F 1 "BAT43" H 9800 1775 50  0000 C CNN
F 2 "SamacSys_Parts:B160-13-F" H 9800 1475 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 9800 1650 50  0001 C CNN
	1    9800 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 2000 10450 2000
$Comp
L EVE-PCB-rescue:BAT43-Diode D6
U 1 1 5CBD9454
P 9800 1300
F 0 "D6" H 9800 1516 50  0000 C CNN
F 1 "BAT43" H 9800 1425 50  0000 C CNN
F 2 "SamacSys_Parts:B160-13-F" H 9800 1125 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 9800 1300 50  0001 C CNN
	1    9800 1300
	1    0    0    -1  
$EndComp
$Comp
L EVE-PCB-rescue:BAT43-Diode D5
U 1 1 5CBD945B
P 9800 950
F 0 "D5" H 9800 1166 50  0000 C CNN
F 1 "BAT43" H 9800 1075 50  0000 C CNN
F 2 "SamacSys_Parts:B160-13-F" H 9800 775 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 9800 950 50  0001 C CNN
	1    9800 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 900  9450 950 
Wire Wire Line
	9450 2000 9650 2000
Wire Wire Line
	9650 1650 9450 1650
Connection ~ 9450 1650
Wire Wire Line
	9450 1650 9450 2000
Wire Wire Line
	9650 1300 9450 1300
Connection ~ 9450 1300
Wire Wire Line
	9450 1300 9450 1650
Wire Wire Line
	9650 950  9450 950 
Connection ~ 9450 950 
Wire Wire Line
	9450 950  9450 1300
Wire Wire Line
	10450 1650 9950 1650
Wire Wire Line
	10450 1300 9950 1300
Wire Wire Line
	10450 950  9950 950 
Text Label 6200 800  0    50   ~ 0
DRUG2_NEG
Text Label 6200 1000 0    50   ~ 0
MEDIA2_NEG
Text Label 6200 1200 0    50   ~ 0
WASTE2_NEG
Text Label 6200 1500 0    50   ~ 0
LED2_NEG
Text Label 6200 1800 0    50   ~ 0
FAN2_NEG
Text Label 7550 2000 2    50   ~ 0
A_SFAN2
Text Label 6200 2000 0    50   ~ 0
FAN2_NEG
Text Label 7550 1800 2    50   ~ 0
A_FAN2
Text Label 7550 1500 2    50   ~ 0
A_LED2
Text Label 7550 1200 2    50   ~ 0
A_WASTE2
Text Label 7550 1000 2    50   ~ 0
A_MEDIA2
Text Label 7550 800  2    50   ~ 0
A_DRUGS2
$Comp
L EVE-PCB-rescue:R-Device R13
U 1 1 5CBDAD58
P 6900 1800
F 0 "R13" V 6693 1800 50  0000 C CNN
F 1 "400" V 6784 1800 50  0000 C CNN
F 2 "SamacSys_Parts:RC0201FR-07402RL" V 6830 1800 50  0001 C CNN
F 3 "~" H 6900 1800 50  0001 C CNN
	1    6900 1800
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 1800 7550 1800
Wire Wire Line
	6750 1800 6200 1800
$Comp
L EVE-PCB-rescue:R-Device R12
U 1 1 5CBDAD61
P 6900 1500
F 0 "R12" V 6693 1500 50  0000 C CNN
F 1 "130" V 6784 1500 50  0000 C CNN
F 2 "SamacSys_Parts:RC0201FR-07130RL" V 6830 1500 50  0001 C CNN
F 3 "~" H 6900 1500 50  0001 C CNN
	1    6900 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 1500 7550 1500
Wire Wire Line
	6750 1500 6200 1500
Wire Wire Line
	6200 2000 7550 2000
Wire Wire Line
	6200 1200 7550 1200
Wire Wire Line
	6200 1000 7550 1000
Wire Wire Line
	6200 800  7550 800 
Text Label 4050 1150 2    50   ~ 0
DRUG2_POS
Text Label 4050 1250 2    50   ~ 0
MEDIA2_POS
Text Label 4050 1350 2    50   ~ 0
WASTE2_POS
Text Label 4050 1450 2    50   ~ 0
LED2_POS
Text Label 4050 1550 2    50   ~ 0
FAN2_POS
$Comp
L EVE-PCB-rescue:+12V-power #PWR07
U 1 1 5CBDEDD4
P 3550 1000
F 0 "#PWR07" H 3550 850 50  0001 C CNN
F 1 "+12V" H 3565 1173 50  0000 C CNN
F 2 "" H 3550 1000 50  0001 C CNN
F 3 "" H 3550 1000 50  0001 C CNN
	1    3550 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1000 3550 1150
Wire Wire Line
	4050 1150 3550 1150
Connection ~ 3550 1150
Wire Wire Line
	3550 1150 3550 1250
Wire Wire Line
	4050 1250 3550 1250
Connection ~ 3550 1250
Wire Wire Line
	3550 1250 3550 1350
Wire Wire Line
	4050 1350 3550 1350
Connection ~ 3550 1350
Wire Wire Line
	3550 1350 3550 1450
Wire Wire Line
	4050 1450 3550 1450
Connection ~ 3550 1450
Wire Wire Line
	3550 1450 3550 1550
Wire Wire Line
	4050 1550 3550 1550
Wire Wire Line
	1350 1000 1800 1000
Wire Wire Line
	1350 1300 1800 1300
NoConn ~ 2950 4300
NoConn ~ 2950 4400
NoConn ~ 1550 4550
NoConn ~ 1550 4400
Wire Wire Line
	1250 3500 1250 3600
Wire Wire Line
	1250 3600 800  3600
Wire Wire Line
	800  3600 800  3500
Text Label 1150 4200 0    50   ~ 0
D_FAN2
Text Label 1150 4300 0    50   ~ 0
D_SFAN2
Text Label 1150 4100 0    50   ~ 0
D_LED2
Text Label 1150 4000 0    50   ~ 0
D_WASTE2
Text Label 1150 3900 0    50   ~ 0
D_MEDIA2
Text Label 1150 3800 0    50   ~ 0
D_DRUGS2
Wire Wire Line
	1150 3800 1550 3800
Wire Wire Line
	1150 3900 1550 3900
Wire Wire Line
	1550 4000 1150 4000
Wire Wire Line
	1550 4100 1150 4100
Wire Wire Line
	1150 4200 1550 4200
Wire Wire Line
	1150 4300 1550 4300
Wire Wire Line
	1150 3700 1550 3700
Wire Wire Line
	1150 3100 1550 3100
$Comp
L SamacSys_Parts:1841539 L2
U 1 1 5CC2A178
P 7650 4500
F 0 "L2" H 8100 4765 50  0000 C CNN
F 1 "1841539" H 8100 4674 50  0000 C CNN
F 2 "SamacSys_Parts:1841539" H 8400 4600 50  0001 L CNN
F 3 "https://www.phoenixcontact.com/online/portal/us?uri=pxc-oc-itemdetail:pid=1841539&library=usen&tab=1" H 8400 4500 50  0001 L CNN
F 4 "Phoenix Contact PCB Terminal Block" H 8400 4400 50  0001 L CNN "Description"
F 5 "24.2" H 8400 4300 50  0001 L CNN "Height"
F 6 "651-1841539" H 8400 4200 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=651-1841539" H 8400 4100 50  0001 L CNN "Mouser Price/Stock"
F 8 "Phoenix Contact" H 8400 4000 50  0001 L CNN "Manufacturer_Name"
F 9 "1841539" H 8400 3900 50  0001 L CNN "Manufacturer_Part_Number"
	1    7650 4500
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:ULN2803ADWR Q2
U 1 1 5CC2A185
P 4600 4300
F 0 "Q2" H 5100 4565 50  0000 C CNN
F 1 "ULN2803ADWR" H 5100 4474 50  0000 C CNN
F 2 "footprints:ULN2803ADWR" H 5450 4400 50  0001 L CNN
F 3 "http://www.ti.com/lit/gpn/uln2803a" H 5450 4300 50  0001 L CNN
F 4 "Darlington Transistor Array" H 5450 4200 50  0001 L CNN "Description"
F 5 "2.65" H 5450 4100 50  0001 L CNN "Height"
F 6 "595-ULN2803ADWR" H 5450 4000 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=595-ULN2803ADWR" H 5450 3900 50  0001 L CNN "Mouser Price/Stock"
F 8 "Texas Instruments" H 5450 3800 50  0001 L CNN "Manufacturer_Name"
F 9 "ULN2803ADWR" H 5450 3700 50  0001 L CNN "Manufacturer_Part_Number"
	1    4600 4300
	1    0    0    -1  
$EndComp
Text Label 6000 4700 2    50   ~ 0
A_FAN2
Text Label 6000 4800 2    50   ~ 0
A_SFAN2
Text Label 6000 4600 2    50   ~ 0
A_LED2
Text Label 6000 4500 2    50   ~ 0
A_WASTE2
Text Label 6000 4400 2    50   ~ 0
A_MEDIA2
Text Label 6000 4300 2    50   ~ 0
A_DRUGS2
Text Label 4200 4700 0    50   ~ 0
D_FAN2
Text Label 4200 4800 0    50   ~ 0
D_SFAN2
Text Label 4200 4600 0    50   ~ 0
D_LED2
Text Label 4200 4500 0    50   ~ 0
D_WASTE2
Text Label 4200 4400 0    50   ~ 0
D_MEDIA2
Text Label 4200 4300 0    50   ~ 0
D_DRUGS2
Wire Wire Line
	6000 4300 5600 4300
Wire Wire Line
	6000 4400 5600 4400
Wire Wire Line
	6000 4500 5600 4500
Wire Wire Line
	6000 4600 5600 4600
Wire Wire Line
	6000 4700 5600 4700
Wire Wire Line
	6000 4800 5600 4800
NoConn ~ 5600 4900
NoConn ~ 5600 5000
NoConn ~ 4600 4900
NoConn ~ 4600 5000
$Comp
L EVE-PCB-rescue:+12V-power #PWR012
U 1 1 5CC2A1A2
P 5950 5100
F 0 "#PWR012" H 5950 4950 50  0001 C CNN
F 1 "+12V" H 5965 5273 50  0000 C CNN
F 2 "" H 5950 5100 50  0001 C CNN
F 3 "" H 5950 5100 50  0001 C CNN
	1    5950 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 5100 5600 5100
$Comp
L EVE-PCB-rescue:GND-power #PWR?
U 1 1 5CC2A1A9
P 4200 5100
AR Path="/5CC2A1A9" Ref="#PWR?"  Part="1" 
AR Path="/5CB20BFC/5CC2A1A9" Ref="#PWR?"  Part="1" 
AR Path="/5CA7DFAE/5CC2A1A9" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 4200 4850 50  0001 C CNN
F 1 "GND" H 4205 4927 50  0000 C CNN
F 2 "" H 4200 5100 50  0001 C CNN
F 3 "" H 4200 5100 50  0001 C CNN
	1    4200 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 5100 4600 5100
Wire Wire Line
	4200 4300 4600 4300
Wire Wire Line
	4200 4400 4600 4400
Wire Wire Line
	4200 4500 4600 4500
Wire Wire Line
	4200 4600 4600 4600
Wire Wire Line
	4200 4700 4600 4700
Wire Wire Line
	4200 4800 4600 4800
Text Label 9050 2850 2    50   ~ 0
DRUG1_POS
Text Label 9050 2950 2    50   ~ 0
MEDIA1_POS
Text Label 9050 3050 2    50   ~ 0
WASTE1_POS
Text Label 9050 3250 2    50   ~ 0
LED1_POS
Text Label 9050 3150 2    50   ~ 0
FAN1_POS
Text Label 9050 3350 2    50   ~ 0
PD1_POS
Wire Wire Line
	9050 2850 8550 2850
Wire Wire Line
	9050 2950 8550 2950
Wire Wire Line
	9050 3050 8550 3050
Wire Wire Line
	9050 3150 8550 3150
Wire Wire Line
	9050 3250 8550 3250
Wire Wire Line
	9050 3350 8550 3350
Text Label 7150 2850 0    50   ~ 0
DRUG1_NEG
Text Label 7150 2950 0    50   ~ 0
MEDIA1_NEG
Text Label 7150 3050 0    50   ~ 0
WASTE1_NEG
Text Label 7150 3250 0    50   ~ 0
LED1_NEG
Text Label 7150 3150 0    50   ~ 0
FAN1_NEG
Text Label 7150 3350 0    50   ~ 0
PD1_NEG
Wire Wire Line
	7150 2850 7650 2850
Wire Wire Line
	7150 2950 7650 2950
Wire Wire Line
	7150 3050 7650 3050
Wire Wire Line
	7150 3150 7650 3150
Wire Wire Line
	7150 3250 7650 3250
Wire Wire Line
	7150 3350 7650 3350
Text Label 9050 4500 2    50   ~ 0
DRUG2_POS
Text Label 9050 4600 2    50   ~ 0
MEDIA2_POS
Text Label 9050 4700 2    50   ~ 0
WASTE2_POS
Text Label 9050 4900 2    50   ~ 0
LED2_POS
Text Label 9050 4800 2    50   ~ 0
FAN2_POS
Text Label 9050 5000 2    50   ~ 0
PD2_POS
Wire Wire Line
	9050 4500 8550 4500
Wire Wire Line
	9050 4600 8550 4600
Wire Wire Line
	9050 4700 8550 4700
Wire Wire Line
	9050 4800 8550 4800
Wire Wire Line
	9050 4900 8550 4900
Wire Wire Line
	9050 5000 8550 5000
Text Label 7150 4500 0    50   ~ 0
DRUG2_NEG
Text Label 7150 4600 0    50   ~ 0
MEDIA2_NEG
Text Label 7150 4700 0    50   ~ 0
WASTE2_NEG
Text Label 7150 4900 0    50   ~ 0
LED2_NEG
Text Label 7150 4800 0    50   ~ 0
FAN2_NEG
Text Label 7150 5000 0    50   ~ 0
PD2_NEG
Wire Wire Line
	7150 4500 7650 4500
Wire Wire Line
	7150 4600 7650 4600
Wire Wire Line
	7150 4700 7650 4700
Wire Wire Line
	7150 4800 7650 4800
Wire Wire Line
	7150 4900 7650 4900
Wire Wire Line
	7150 5000 7650 5000
Text Label 3100 1750 2    50   ~ 0
PD1_POS
$Comp
L EVE-PCB-rescue:GND-power #PWR05
U 1 1 5CCCBCCC
P 2600 1750
F 0 "#PWR05" H 2600 1500 50  0001 C CNN
F 1 "GND" H 2605 1577 50  0000 C CNN
F 2 "" H 2600 1750 50  0001 C CNN
F 3 "" H 2600 1750 50  0001 C CNN
	1    2600 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 1750 3100 1750
Text Label 4050 1750 2    50   ~ 0
PD2_POS
$Comp
L EVE-PCB-rescue:GND-power #PWR08
U 1 1 5CCEE678
P 3550 1750
F 0 "#PWR08" H 3550 1500 50  0001 C CNN
F 1 "GND" H 3555 1577 50  0000 C CNN
F 2 "" H 3550 1750 50  0001 C CNN
F 3 "" H 3550 1750 50  0001 C CNN
	1    3550 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1750 4050 1750
Text Label 1800 1900 2    50   ~ 0
PD2_NEG
Text Label 1800 1600 2    50   ~ 0
PD1_NEG
Text HLabel 1350 1600 0    50   Output ~ 0
PD1_NEG
Text HLabel 1350 1900 0    50   Output ~ 0
PD2_NEG
Wire Wire Line
	1350 1600 1800 1600
Wire Wire Line
	1350 1900 1800 1900
$EndSCHEMATC
