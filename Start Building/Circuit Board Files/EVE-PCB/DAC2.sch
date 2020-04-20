EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
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
L EVE-PCB-rescue:GND-power #PWR?
U 1 1 5CD8860B
P 3250 4850
AR Path="/5CD8860B" Ref="#PWR?"  Part="1" 
AR Path="/5CB20BFC/5CD8860B" Ref="#PWR?"  Part="1" 
AR Path="/5CA7DFAE/5CD8860B" Ref="#PWR?"  Part="1" 
AR Path="/5CA80A88/5CD8860B" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 3250 4600 50  0001 C CNN
F 1 "GND" H 3255 4677 50  0000 C CNN
F 2 "" H 3250 4850 50  0001 C CNN
F 3 "" H 3250 4850 50  0001 C CNN
	1    3250 4850
	1    0    0    -1  
$EndComp
NoConn ~ 3100 3250
NoConn ~ 3100 3350
Wire Wire Line
	1700 3450 1700 3550
Connection ~ 1700 3450
$Comp
L EVE-PCB-rescue:GND-power #PWR?
U 1 1 5CD88616
P 1200 3450
AR Path="/5CD88616" Ref="#PWR?"  Part="1" 
AR Path="/5CB20BFC/5CD88616" Ref="#PWR?"  Part="1" 
AR Path="/5CA7DFAE/5CD88616" Ref="#PWR?"  Part="1" 
AR Path="/5CA80A88/5CD88616" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 1200 3200 50  0001 C CNN
F 1 "GND" H 1205 3277 50  0000 C CNN
F 2 "" H 1200 3450 50  0001 C CNN
F 3 "" H 1200 3450 50  0001 C CNN
	1    1200 3450
	1    0    0    -1  
$EndComp
Text Label 1300 3250 0    50   ~ 0
SCL
Text Label 1300 3850 0    50   ~ 0
SDA
Text HLabel 1500 1150 0    50   BiDi ~ 0
SCL
Text HLabel 1500 1450 0    50   BiDi ~ 0
SDA
Text Label 1950 1150 2    50   ~ 0
SCL
Text Label 1950 1450 2    50   ~ 0
SDA
Wire Wire Line
	1200 3450 1700 3450
$Comp
L EVE-PCB-rescue:+5V-power #PWR?
U 1 1 5CD88623
P 900 3250
AR Path="/5CD88623" Ref="#PWR?"  Part="1" 
AR Path="/5CA7DFAE/5CD88623" Ref="#PWR?"  Part="1" 
AR Path="/5CA80A88/5CD88623" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 900 3100 50  0001 C CNN
F 1 "+5V" H 915 3423 50  0000 C CNN
F 2 "" H 900 3250 50  0001 C CNN
F 3 "" H 900 3250 50  0001 C CNN
	1    900  3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4850 3250 4850
$Comp
L EVE-PCB-rescue:+5V-power #PWR?
U 1 1 5CD8862B
P 3250 3050
AR Path="/5CD8862B" Ref="#PWR?"  Part="1" 
AR Path="/5CA7DFAE/5CD8862B" Ref="#PWR?"  Part="1" 
AR Path="/5CA80A88/5CD8862B" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 3250 2900 50  0001 C CNN
F 1 "+5V" H 3265 3223 50  0000 C CNN
F 2 "" H 3250 3050 50  0001 C CNN
F 3 "" H 3250 3050 50  0001 C CNN
	1    3250 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3050 3250 3050
$Comp
L SamacSys_Parts:1841539 L?
U 1 1 5CD88638
P 7800 3000
AR Path="/5CA7DFAE/5CD88638" Ref="L?"  Part="1" 
AR Path="/5CA80A88/5CD88638" Ref="L3"  Part="1" 
F 0 "L3" H 8250 3265 50  0000 C CNN
F 1 "1841539" H 8250 3174 50  0000 C CNN
F 2 "SamacSys_Parts:1841539" H 8550 3100 50  0001 L CNN
F 3 "https://www.phoenixcontact.com/online/portal/us?uri=pxc-oc-itemdetail:pid=1841539&library=usen&tab=1" H 8550 3000 50  0001 L CNN
F 4 "Phoenix Contact PCB Terminal Block" H 8550 2900 50  0001 L CNN "Description"
F 5 "24.2" H 8550 2800 50  0001 L CNN "Height"
F 6 "651-1841539" H 8550 2700 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=651-1841539" H 8550 2600 50  0001 L CNN "Mouser Price/Stock"
F 8 "Phoenix Contact" H 8550 2500 50  0001 L CNN "Manufacturer_Name"
F 9 "1841539" H 8550 2400 50  0001 L CNN "Manufacturer_Part_Number"
	1    7800 3000
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:ULN2803ADWR Q?
U 1 1 5CD88645
P 4750 2800
AR Path="/5CA7DFAE/5CD88645" Ref="Q?"  Part="1" 
AR Path="/5CA80A88/5CD88645" Ref="Q3"  Part="1" 
F 0 "Q3" H 5250 3065 50  0000 C CNN
F 1 "ULN2803ADWR" H 5250 2974 50  0000 C CNN
F 2 "footprints:ULN2803ADWR" H 5600 2900 50  0001 L CNN
F 3 "http://www.ti.com/lit/gpn/uln2803a" H 5600 2800 50  0001 L CNN
F 4 "Darlington Transistor Array" H 5600 2700 50  0001 L CNN "Description"
F 5 "2.65" H 5600 2600 50  0001 L CNN "Height"
F 6 "595-ULN2803ADWR" H 5600 2500 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=595-ULN2803ADWR" H 5600 2400 50  0001 L CNN "Mouser Price/Stock"
F 8 "Texas Instruments" H 5600 2300 50  0001 L CNN "Manufacturer_Name"
F 9 "ULN2803ADWR" H 5600 2200 50  0001 L CNN "Manufacturer_Part_Number"
	1    4750 2800
	1    0    0    -1  
$EndComp
Text Label 6150 3200 2    50   ~ 0
A_FAN3
Text Label 6150 3300 2    50   ~ 0
A_SFAN3
Text Label 6150 3100 2    50   ~ 0
A_LED3
Text Label 6150 3000 2    50   ~ 0
A_WASTE3
Text Label 6150 2900 2    50   ~ 0
A_MEDIA3
Text Label 6150 2800 2    50   ~ 0
A_DRUGS3
Text Label 4350 3200 0    50   ~ 0
D_FAN3
Text Label 4350 3300 0    50   ~ 0
D_SFAN3
Text Label 4350 3100 0    50   ~ 0
D_LED3
Text Label 4350 3000 0    50   ~ 0
D_WASTE3
Text Label 4350 2900 0    50   ~ 0
D_MEDIA3
Text Label 4350 2800 0    50   ~ 0
D_DRUGS3
Wire Wire Line
	6150 2800 5750 2800
Wire Wire Line
	6150 2900 5750 2900
Wire Wire Line
	6150 3000 5750 3000
Wire Wire Line
	6150 3100 5750 3100
Wire Wire Line
	6150 3200 5750 3200
Wire Wire Line
	6150 3300 5750 3300
NoConn ~ 5750 3400
NoConn ~ 5750 3500
NoConn ~ 4750 3400
NoConn ~ 4750 3500
$Comp
L EVE-PCB-rescue:+12V-power #PWR?
U 1 1 5CD8866E
P 6100 3600
AR Path="/5CA7DFAE/5CD8866E" Ref="#PWR?"  Part="1" 
AR Path="/5CA80A88/5CD8866E" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 6100 3450 50  0001 C CNN
F 1 "+12V" H 6115 3773 50  0000 C CNN
F 2 "" H 6100 3600 50  0001 C CNN
F 3 "" H 6100 3600 50  0001 C CNN
	1    6100 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3600 5750 3600
$Comp
L EVE-PCB-rescue:GND-power #PWR?
U 1 1 5CD88675
P 4350 3600
AR Path="/5CD88675" Ref="#PWR?"  Part="1" 
AR Path="/5CB20BFC/5CD88675" Ref="#PWR?"  Part="1" 
AR Path="/5CA7DFAE/5CD88675" Ref="#PWR?"  Part="1" 
AR Path="/5CA80A88/5CD88675" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 4350 3350 50  0001 C CNN
F 1 "GND" H 4355 3427 50  0000 C CNN
F 2 "" H 4350 3600 50  0001 C CNN
F 3 "" H 4350 3600 50  0001 C CNN
	1    4350 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 3600 4750 3600
Wire Wire Line
	4350 2800 4750 2800
Wire Wire Line
	4350 2900 4750 2900
Wire Wire Line
	4350 3000 4750 3000
Wire Wire Line
	4350 3100 4750 3100
Wire Wire Line
	4350 3200 4750 3200
Wire Wire Line
	4350 3300 4750 3300
Text Label 3250 1300 2    50   ~ 0
DRUG3_POS
Text Label 4600 950  0    50   ~ 0
DRUG3_NEG
Text Label 4600 1150 0    50   ~ 0
MEDIA3_NEG
Text Label 4600 1350 0    50   ~ 0
WASTE3_NEG
Text Label 4600 1650 0    50   ~ 0
LED3_NEG
Text Label 4600 1950 0    50   ~ 0
FAN3_NEG
Text Label 3250 1400 2    50   ~ 0
MEDIA3_POS
Text Label 3250 1500 2    50   ~ 0
WASTE3_POS
Text Label 3250 1600 2    50   ~ 0
LED3_POS
Text Label 3250 1700 2    50   ~ 0
FAN3_POS
$Comp
L EVE-PCB-rescue:+12V-power #PWR?
U 1 1 5CD8868C
P 2750 1150
AR Path="/5CA7DFAE/5CD8868C" Ref="#PWR?"  Part="1" 
AR Path="/5CA80A88/5CD8868C" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 2750 1000 50  0001 C CNN
F 1 "+12V" H 2765 1323 50  0000 C CNN
F 2 "" H 2750 1150 50  0001 C CNN
F 3 "" H 2750 1150 50  0001 C CNN
	1    2750 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 1150 2750 1300
Wire Wire Line
	3250 1300 2750 1300
Connection ~ 2750 1300
Wire Wire Line
	2750 1300 2750 1400
Wire Wire Line
	3250 1400 2750 1400
Connection ~ 2750 1400
Wire Wire Line
	2750 1400 2750 1500
Wire Wire Line
	3250 1500 2750 1500
Connection ~ 2750 1500
Wire Wire Line
	2750 1500 2750 1600
Wire Wire Line
	3250 1600 2750 1600
Connection ~ 2750 1600
Wire Wire Line
	2750 1600 2750 1700
Wire Wire Line
	3250 1700 2750 1700
Text Label 5950 2150 2    50   ~ 0
A_SFAN3
Text Label 4600 2150 0    50   ~ 0
FAN3_NEG
Text Label 5950 1950 2    50   ~ 0
A_FAN3
Text Label 5950 1650 2    50   ~ 0
A_LED3
Text Label 5950 1350 2    50   ~ 0
A_WASTE3
Text Label 5950 1150 2    50   ~ 0
A_MEDIA3
Text Label 5950 950  2    50   ~ 0
A_DRUGS3
$Comp
L EVE-PCB-rescue:R-Device R?
U 1 1 5CD886A7
P 5300 1950
AR Path="/5CA7DFAE/5CD886A7" Ref="R?"  Part="1" 
AR Path="/5CA80A88/5CD886A7" Ref="R15"  Part="1" 
F 0 "R15" V 5093 1950 50  0000 C CNN
F 1 "400" V 5184 1950 50  0000 C CNN
F 2 "SamacSys_Parts:RC0201FR-07402RL" V 5230 1950 50  0001 C CNN
F 3 "~" H 5300 1950 50  0001 C CNN
	1    5300 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	5450 1950 5950 1950
$Comp
L EVE-PCB-rescue:BAT43-Diode D?
U 1 1 5CD886AF
P 8500 2150
AR Path="/5CA7DFAE/5CD886AF" Ref="D?"  Part="1" 
AR Path="/5CA80A88/5CD886AF" Ref="D12"  Part="1" 
F 0 "D12" H 8500 2366 50  0000 C CNN
F 1 "BAT43" H 8500 2275 50  0000 C CNN
F 2 "SamacSys_Parts:B160-13-F" H 8500 1975 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 8500 2150 50  0001 C CNN
	1    8500 2150
	1    0    0    -1  
$EndComp
Text Label 9150 2150 2    50   ~ 0
FAN3_NEG
Wire Wire Line
	5150 1950 4600 1950
Text Label 9150 1100 2    50   ~ 0
DRUG3_NEG
Text Label 9150 1450 2    50   ~ 0
MEDIA3_NEG
Text Label 9150 1800 2    50   ~ 0
WASTE3_NEG
$Comp
L EVE-PCB-rescue:+12V-power #PWR?
U 1 1 5CD886BB
P 8150 1050
AR Path="/5CA7DFAE/5CD886BB" Ref="#PWR?"  Part="1" 
AR Path="/5CA80A88/5CD886BB" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 8150 900 50  0001 C CNN
F 1 "+12V" H 8165 1223 50  0000 C CNN
F 2 "" H 8150 1050 50  0001 C CNN
F 3 "" H 8150 1050 50  0001 C CNN
	1    8150 1050
	1    0    0    -1  
$EndComp
$Comp
L EVE-PCB-rescue:BAT43-Diode D?
U 1 1 5CD886C1
P 8500 1800
AR Path="/5CA7DFAE/5CD886C1" Ref="D?"  Part="1" 
AR Path="/5CA80A88/5CD886C1" Ref="D11"  Part="1" 
F 0 "D11" H 8500 2016 50  0000 C CNN
F 1 "BAT43" H 8500 1925 50  0000 C CNN
F 2 "SamacSys_Parts:B160-13-F" H 8500 1625 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 8500 1800 50  0001 C CNN
	1    8500 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 2150 9150 2150
$Comp
L EVE-PCB-rescue:BAT43-Diode D?
U 1 1 5CD886C9
P 8500 1450
AR Path="/5CA7DFAE/5CD886C9" Ref="D?"  Part="1" 
AR Path="/5CA80A88/5CD886C9" Ref="D10"  Part="1" 
F 0 "D10" H 8500 1666 50  0000 C CNN
F 1 "BAT43" H 8500 1575 50  0000 C CNN
F 2 "SamacSys_Parts:B160-13-F" H 8500 1275 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 8500 1450 50  0001 C CNN
	1    8500 1450
	1    0    0    -1  
$EndComp
$Comp
L EVE-PCB-rescue:BAT43-Diode D?
U 1 1 5CD886D0
P 8500 1100
AR Path="/5CA7DFAE/5CD886D0" Ref="D?"  Part="1" 
AR Path="/5CA80A88/5CD886D0" Ref="D9"  Part="1" 
F 0 "D9" H 8500 1316 50  0000 C CNN
F 1 "BAT43" H 8500 1225 50  0000 C CNN
F 2 "SamacSys_Parts:B160-13-F" H 8500 925 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 8500 1100 50  0001 C CNN
	1    8500 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 1050 8150 1100
Wire Wire Line
	8150 2150 8350 2150
Wire Wire Line
	8350 1800 8150 1800
Connection ~ 8150 1800
Wire Wire Line
	8150 1800 8150 2150
Wire Wire Line
	8350 1450 8150 1450
Connection ~ 8150 1450
Wire Wire Line
	8150 1450 8150 1800
Wire Wire Line
	8350 1100 8150 1100
Connection ~ 8150 1100
Wire Wire Line
	8150 1100 8150 1450
Wire Wire Line
	9150 1800 8650 1800
Wire Wire Line
	9150 1450 8650 1450
Wire Wire Line
	9150 1100 8650 1100
$Comp
L EVE-PCB-rescue:R-Device R?
U 1 1 5CD886E5
P 5300 1650
AR Path="/5CA7DFAE/5CD886E5" Ref="R?"  Part="1" 
AR Path="/5CA80A88/5CD886E5" Ref="R14"  Part="1" 
F 0 "R14" V 5093 1650 50  0000 C CNN
F 1 "130" V 5184 1650 50  0000 C CNN
F 2 "SamacSys_Parts:RC0201FR-07130RL" V 5230 1650 50  0001 C CNN
F 3 "~" H 5300 1650 50  0001 C CNN
	1    5300 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	5450 1650 5950 1650
Wire Wire Line
	5150 1650 4600 1650
Wire Wire Line
	4600 2150 5950 2150
Wire Wire Line
	4600 1350 5950 1350
Wire Wire Line
	4600 1150 5950 1150
Wire Wire Line
	4600 950  5950 950 
$Comp
L EVE-PCB-rescue:BAT43-Diode D?
U 1 1 5CD886F2
P 9950 2150
AR Path="/5CA7DFAE/5CD886F2" Ref="D?"  Part="1" 
AR Path="/5CA80A88/5CD886F2" Ref="D16"  Part="1" 
F 0 "D16" H 9950 2366 50  0000 C CNN
F 1 "BAT43" H 9950 2275 50  0000 C CNN
F 2 "SamacSys_Parts:B160-13-F" H 9950 1975 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 9950 2150 50  0001 C CNN
	1    9950 2150
	1    0    0    -1  
$EndComp
Text Label 10600 2150 2    50   ~ 0
FAN4_NEG
Text Label 10600 1100 2    50   ~ 0
DRUG4_NEG
Text Label 10600 1450 2    50   ~ 0
MEDIA4_NEG
Text Label 10600 1800 2    50   ~ 0
WASTE4_NEG
$Comp
L EVE-PCB-rescue:+12V-power #PWR?
U 1 1 5CD886FD
P 9600 1050
AR Path="/5CA7DFAE/5CD886FD" Ref="#PWR?"  Part="1" 
AR Path="/5CA80A88/5CD886FD" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 9600 900 50  0001 C CNN
F 1 "+12V" H 9615 1223 50  0000 C CNN
F 2 "" H 9600 1050 50  0001 C CNN
F 3 "" H 9600 1050 50  0001 C CNN
	1    9600 1050
	1    0    0    -1  
$EndComp
$Comp
L EVE-PCB-rescue:BAT43-Diode D?
U 1 1 5CD88703
P 9950 1800
AR Path="/5CA7DFAE/5CD88703" Ref="D?"  Part="1" 
AR Path="/5CA80A88/5CD88703" Ref="D15"  Part="1" 
F 0 "D15" H 9950 2016 50  0000 C CNN
F 1 "BAT43" H 9950 1925 50  0000 C CNN
F 2 "SamacSys_Parts:B160-13-F" H 9950 1625 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 9950 1800 50  0001 C CNN
	1    9950 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 2150 10600 2150
$Comp
L EVE-PCB-rescue:BAT43-Diode D?
U 1 1 5CD8870B
P 9950 1450
AR Path="/5CA7DFAE/5CD8870B" Ref="D?"  Part="1" 
AR Path="/5CA80A88/5CD8870B" Ref="D14"  Part="1" 
F 0 "D14" H 9950 1666 50  0000 C CNN
F 1 "BAT43" H 9950 1575 50  0000 C CNN
F 2 "SamacSys_Parts:B160-13-F" H 9950 1275 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 9950 1450 50  0001 C CNN
	1    9950 1450
	1    0    0    -1  
$EndComp
$Comp
L EVE-PCB-rescue:BAT43-Diode D?
U 1 1 5CD88712
P 9950 1100
AR Path="/5CA7DFAE/5CD88712" Ref="D?"  Part="1" 
AR Path="/5CA80A88/5CD88712" Ref="D13"  Part="1" 
F 0 "D13" H 9950 1316 50  0000 C CNN
F 1 "BAT43" H 9950 1225 50  0000 C CNN
F 2 "SamacSys_Parts:B160-13-F" H 9950 925 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 9950 1100 50  0001 C CNN
	1    9950 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 1050 9600 1100
Wire Wire Line
	9600 2150 9800 2150
Wire Wire Line
	9800 1800 9600 1800
Connection ~ 9600 1800
Wire Wire Line
	9600 1800 9600 2150
Wire Wire Line
	9800 1450 9600 1450
Connection ~ 9600 1450
Wire Wire Line
	9600 1450 9600 1800
Wire Wire Line
	9800 1100 9600 1100
Connection ~ 9600 1100
Wire Wire Line
	9600 1100 9600 1450
Wire Wire Line
	10600 1800 10100 1800
Wire Wire Line
	10600 1450 10100 1450
Wire Wire Line
	10600 1100 10100 1100
Text Label 6350 950  0    50   ~ 0
DRUG4_NEG
Text Label 6350 1150 0    50   ~ 0
MEDIA4_NEG
Text Label 6350 1350 0    50   ~ 0
WASTE4_NEG
Text Label 6350 1650 0    50   ~ 0
LED4_NEG
Text Label 6350 1950 0    50   ~ 0
FAN4_NEG
Text Label 7700 2150 2    50   ~ 0
A_SFAN4
Text Label 6350 2150 0    50   ~ 0
FAN4_NEG
Text Label 7700 1950 2    50   ~ 0
A_FAN4
Text Label 7700 1650 2    50   ~ 0
A_LED4
Text Label 7700 1350 2    50   ~ 0
A_WASTE4
Text Label 7700 1150 2    50   ~ 0
A_MEDIA4
Text Label 7700 950  2    50   ~ 0
A_DRUGS4
$Comp
L EVE-PCB-rescue:R-Device R?
U 1 1 5CD88733
P 7050 1950
AR Path="/5CA7DFAE/5CD88733" Ref="R?"  Part="1" 
AR Path="/5CA80A88/5CD88733" Ref="R17"  Part="1" 
F 0 "R17" V 6843 1950 50  0000 C CNN
F 1 "400" V 6934 1950 50  0000 C CNN
F 2 "SamacSys_Parts:RC0201FR-07402RL" V 6980 1950 50  0001 C CNN
F 3 "~" H 7050 1950 50  0001 C CNN
	1    7050 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	7200 1950 7700 1950
Wire Wire Line
	6900 1950 6350 1950
$Comp
L EVE-PCB-rescue:R-Device R?
U 1 1 5CD8873C
P 7050 1650
AR Path="/5CA7DFAE/5CD8873C" Ref="R?"  Part="1" 
AR Path="/5CA80A88/5CD8873C" Ref="R16"  Part="1" 
F 0 "R16" V 6843 1650 50  0000 C CNN
F 1 "130" V 6934 1650 50  0000 C CNN
F 2 "SamacSys_Parts:RC0201FR-07130RL" V 6980 1650 50  0001 C CNN
F 3 "~" H 7050 1650 50  0001 C CNN
	1    7050 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	7200 1650 7700 1650
Wire Wire Line
	6900 1650 6350 1650
Wire Wire Line
	6350 2150 7700 2150
Wire Wire Line
	6350 1350 7700 1350
Wire Wire Line
	6350 1150 7700 1150
Wire Wire Line
	6350 950  7700 950 
Text Label 4200 1300 2    50   ~ 0
DRUG4_POS
Text Label 4200 1400 2    50   ~ 0
MEDIA4_POS
Text Label 4200 1500 2    50   ~ 0
WASTE4_POS
Text Label 4200 1600 2    50   ~ 0
LED4_POS
Text Label 4200 1700 2    50   ~ 0
FAN4_POS
$Comp
L EVE-PCB-rescue:+12V-power #PWR?
U 1 1 5CD8874E
P 3700 1150
AR Path="/5CA7DFAE/5CD8874E" Ref="#PWR?"  Part="1" 
AR Path="/5CA80A88/5CD8874E" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 3700 1000 50  0001 C CNN
F 1 "+12V" H 3715 1323 50  0000 C CNN
F 2 "" H 3700 1150 50  0001 C CNN
F 3 "" H 3700 1150 50  0001 C CNN
	1    3700 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 1150 3700 1300
Wire Wire Line
	4200 1300 3700 1300
Connection ~ 3700 1300
Wire Wire Line
	3700 1300 3700 1400
Wire Wire Line
	4200 1400 3700 1400
Connection ~ 3700 1400
Wire Wire Line
	3700 1400 3700 1500
Wire Wire Line
	4200 1500 3700 1500
Connection ~ 3700 1500
Wire Wire Line
	3700 1500 3700 1600
Wire Wire Line
	4200 1600 3700 1600
Connection ~ 3700 1600
Wire Wire Line
	3700 1600 3700 1700
Wire Wire Line
	4200 1700 3700 1700
Wire Wire Line
	1500 1150 1950 1150
Wire Wire Line
	1500 1450 1950 1450
NoConn ~ 3100 4450
NoConn ~ 3100 4550
NoConn ~ 1700 4700
NoConn ~ 1700 4550
Wire Wire Line
	900  3350 900  3250
Wire Wire Line
	1300 3850 1700 3850
Wire Wire Line
	1300 3250 1700 3250
$Comp
L SamacSys_Parts:1841539 L?
U 1 1 5CD8877F
P 7800 4650
AR Path="/5CA7DFAE/5CD8877F" Ref="L?"  Part="1" 
AR Path="/5CA80A88/5CD8877F" Ref="L4"  Part="1" 
F 0 "L4" H 8250 4915 50  0000 C CNN
F 1 "1841539" H 8250 4824 50  0000 C CNN
F 2 "SamacSys_Parts:1841539" H 8550 4750 50  0001 L CNN
F 3 "https://www.phoenixcontact.com/online/portal/us?uri=pxc-oc-itemdetail:pid=1841539&library=usen&tab=1" H 8550 4650 50  0001 L CNN
F 4 "Phoenix Contact PCB Terminal Block" H 8550 4550 50  0001 L CNN "Description"
F 5 "24.2" H 8550 4450 50  0001 L CNN "Height"
F 6 "651-1841539" H 8550 4350 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=651-1841539" H 8550 4250 50  0001 L CNN "Mouser Price/Stock"
F 8 "Phoenix Contact" H 8550 4150 50  0001 L CNN "Manufacturer_Name"
F 9 "1841539" H 8550 4050 50  0001 L CNN "Manufacturer_Part_Number"
	1    7800 4650
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:ULN2803ADWR Q?
U 1 1 5CD8878C
P 4750 4450
AR Path="/5CA7DFAE/5CD8878C" Ref="Q?"  Part="1" 
AR Path="/5CA80A88/5CD8878C" Ref="Q4"  Part="1" 
F 0 "Q4" H 5250 4715 50  0000 C CNN
F 1 "ULN2803ADWR" H 5250 4624 50  0000 C CNN
F 2 "footprints:ULN2803ADWR" H 5600 4550 50  0001 L CNN
F 3 "http://www.ti.com/lit/gpn/uln2803a" H 5600 4450 50  0001 L CNN
F 4 "Darlington Transistor Array" H 5600 4350 50  0001 L CNN "Description"
F 5 "2.65" H 5600 4250 50  0001 L CNN "Height"
F 6 "595-ULN2803ADWR" H 5600 4150 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=595-ULN2803ADWR" H 5600 4050 50  0001 L CNN "Mouser Price/Stock"
F 8 "Texas Instruments" H 5600 3950 50  0001 L CNN "Manufacturer_Name"
F 9 "ULN2803ADWR" H 5600 3850 50  0001 L CNN "Manufacturer_Part_Number"
	1    4750 4450
	1    0    0    -1  
$EndComp
Text Label 6150 4850 2    50   ~ 0
A_FAN4
Text Label 6150 4950 2    50   ~ 0
A_SFAN4
Text Label 6150 4750 2    50   ~ 0
A_LED4
Text Label 6150 4650 2    50   ~ 0
A_WASTE4
Text Label 6150 4550 2    50   ~ 0
A_MEDIA4
Text Label 6150 4450 2    50   ~ 0
A_DRUGS4
Text Label 4350 4850 0    50   ~ 0
D_FAN4
Text Label 4350 4950 0    50   ~ 0
D_SFAN4
Text Label 4350 4750 0    50   ~ 0
D_LED4
Text Label 4350 4650 0    50   ~ 0
D_WASTE4
Text Label 4350 4550 0    50   ~ 0
D_MEDIA4
Text Label 4350 4450 0    50   ~ 0
D_DRUGS4
Wire Wire Line
	6150 4450 5750 4450
Wire Wire Line
	6150 4550 5750 4550
Wire Wire Line
	6150 4650 5750 4650
Wire Wire Line
	6150 4750 5750 4750
Wire Wire Line
	6150 4850 5750 4850
Wire Wire Line
	6150 4950 5750 4950
NoConn ~ 5750 5050
NoConn ~ 5750 5150
NoConn ~ 4750 5050
NoConn ~ 4750 5150
$Comp
L EVE-PCB-rescue:+12V-power #PWR?
U 1 1 5CD887A9
P 6100 5250
AR Path="/5CA7DFAE/5CD887A9" Ref="#PWR?"  Part="1" 
AR Path="/5CA80A88/5CD887A9" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 6100 5100 50  0001 C CNN
F 1 "+12V" H 6115 5423 50  0000 C CNN
F 2 "" H 6100 5250 50  0001 C CNN
F 3 "" H 6100 5250 50  0001 C CNN
	1    6100 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 5250 5750 5250
$Comp
L EVE-PCB-rescue:GND-power #PWR?
U 1 1 5CD887B0
P 4350 5250
AR Path="/5CD887B0" Ref="#PWR?"  Part="1" 
AR Path="/5CB20BFC/5CD887B0" Ref="#PWR?"  Part="1" 
AR Path="/5CA7DFAE/5CD887B0" Ref="#PWR?"  Part="1" 
AR Path="/5CA80A88/5CD887B0" Ref="#PWR024"  Part="1" 
F 0 "#PWR024" H 4350 5000 50  0001 C CNN
F 1 "GND" H 4355 5077 50  0000 C CNN
F 2 "" H 4350 5250 50  0001 C CNN
F 3 "" H 4350 5250 50  0001 C CNN
	1    4350 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 5250 4750 5250
Wire Wire Line
	4350 4450 4750 4450
Wire Wire Line
	4350 4550 4750 4550
Wire Wire Line
	4350 4650 4750 4650
Wire Wire Line
	4350 4750 4750 4750
Wire Wire Line
	4350 4850 4750 4850
Wire Wire Line
	4350 4950 4750 4950
Text Label 9200 3000 2    50   ~ 0
DRUG3_POS
Text Label 9200 3100 2    50   ~ 0
MEDIA3_POS
Text Label 9200 3200 2    50   ~ 0
WASTE3_POS
Text Label 9200 3400 2    50   ~ 0
LED3_POS
Text Label 9200 3300 2    50   ~ 0
FAN3_POS
Text Label 9200 3500 2    50   ~ 0
PD3_POS
Wire Wire Line
	9200 3000 8700 3000
Wire Wire Line
	9200 3100 8700 3100
Wire Wire Line
	9200 3200 8700 3200
Wire Wire Line
	9200 3300 8700 3300
Wire Wire Line
	9200 3400 8700 3400
Wire Wire Line
	9200 3500 8700 3500
Text Label 7300 3000 0    50   ~ 0
DRUG3_NEG
Text Label 7300 3100 0    50   ~ 0
MEDIA3_NEG
Text Label 7300 3200 0    50   ~ 0
WASTE3_NEG
Text Label 7300 3400 0    50   ~ 0
LED3_NEG
Text Label 7300 3300 0    50   ~ 0
FAN3_NEG
Text Label 7300 3500 0    50   ~ 0
PD3_NEG
Wire Wire Line
	7300 3000 7800 3000
Wire Wire Line
	7300 3100 7800 3100
Wire Wire Line
	7300 3200 7800 3200
Wire Wire Line
	7300 3300 7800 3300
Wire Wire Line
	7300 3400 7800 3400
Wire Wire Line
	7300 3500 7800 3500
Text Label 9200 4650 2    50   ~ 0
DRUG4_POS
Text Label 9200 4750 2    50   ~ 0
MEDIA4_POS
Text Label 9200 4850 2    50   ~ 0
WASTE4_POS
Text Label 9200 5050 2    50   ~ 0
LED4_POS
Text Label 9200 4950 2    50   ~ 0
FAN4_POS
Text Label 9200 5150 2    50   ~ 0
PD4_POS
Wire Wire Line
	9200 4650 8700 4650
Wire Wire Line
	9200 4750 8700 4750
Wire Wire Line
	9200 4850 8700 4850
Wire Wire Line
	9200 4950 8700 4950
Wire Wire Line
	9200 5050 8700 5050
Wire Wire Line
	9200 5150 8700 5150
Text Label 7300 4650 0    50   ~ 0
DRUG4_NEG
Text Label 7300 4750 0    50   ~ 0
MEDIA4_NEG
Text Label 7300 4850 0    50   ~ 0
WASTE4_NEG
Text Label 7300 5050 0    50   ~ 0
LED4_NEG
Text Label 7300 4950 0    50   ~ 0
FAN4_NEG
Text Label 7300 5150 0    50   ~ 0
PD4_NEG
Wire Wire Line
	7300 4650 7800 4650
Wire Wire Line
	7300 4750 7800 4750
Wire Wire Line
	7300 4850 7800 4850
Wire Wire Line
	7300 4950 7800 4950
Wire Wire Line
	7300 5050 7800 5050
Wire Wire Line
	7300 5150 7800 5150
Text Label 3250 1900 2    50   ~ 0
PD3_POS
$Comp
L EVE-PCB-rescue:GND-power #PWR?
U 1 1 5CD887EE
P 2750 1900
AR Path="/5CA7DFAE/5CD887EE" Ref="#PWR?"  Part="1" 
AR Path="/5CA80A88/5CD887EE" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 2750 1650 50  0001 C CNN
F 1 "GND" H 2755 1727 50  0000 C CNN
F 2 "" H 2750 1900 50  0001 C CNN
F 3 "" H 2750 1900 50  0001 C CNN
	1    2750 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 1900 3250 1900
Text Label 4200 1900 2    50   ~ 0
PD4_POS
$Comp
L EVE-PCB-rescue:GND-power #PWR?
U 1 1 5CD887F6
P 3700 1900
AR Path="/5CA7DFAE/5CD887F6" Ref="#PWR?"  Part="1" 
AR Path="/5CA80A88/5CD887F6" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 3700 1650 50  0001 C CNN
F 1 "GND" H 3705 1727 50  0000 C CNN
F 2 "" H 3700 1900 50  0001 C CNN
F 3 "" H 3700 1900 50  0001 C CNN
	1    3700 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 1900 4200 1900
Text Label 1950 2050 2    50   ~ 0
PD4_NEG
Text Label 1950 1750 2    50   ~ 0
PD3_NEG
Text HLabel 1500 1750 0    50   Output ~ 0
PD3_NEG
Text HLabel 1500 2050 0    50   Output ~ 0
PD4_NEG
Wire Wire Line
	1500 1750 1950 1750
Wire Wire Line
	1500 2050 1950 2050
Text Label 1300 4350 0    50   ~ 0
D_FAN4
Text Label 1300 4450 0    50   ~ 0
D_SFAN4
Text Label 1300 4250 0    50   ~ 0
D_LED4
Text Label 1300 4150 0    50   ~ 0
D_WASTE4
Text Label 1300 4050 0    50   ~ 0
D_MEDIA4
Text Label 1300 3950 0    50   ~ 0
D_DRUGS4
Wire Wire Line
	1300 3950 1700 3950
Wire Wire Line
	1300 4050 1700 4050
Wire Wire Line
	1300 4150 1700 4150
Wire Wire Line
	1300 4250 1700 4250
Wire Wire Line
	1300 4350 1700 4350
Wire Wire Line
	1300 4450 1700 4450
Text Label 3500 4250 2    50   ~ 0
D_FAN3
Text Label 3500 4350 2    50   ~ 0
D_SFAN3
Text Label 3500 4150 2    50   ~ 0
D_LED3
Text Label 3500 4050 2    50   ~ 0
D_WASTE3
Text Label 3500 3950 2    50   ~ 0
D_MEDIA3
Text Label 3500 3850 2    50   ~ 0
D_DRUGS3
Wire Wire Line
	3500 3850 3100 3850
Wire Wire Line
	3500 3950 3100 3950
Wire Wire Line
	3500 4050 3100 4050
Wire Wire Line
	3500 4150 3100 4150
Wire Wire Line
	3500 4250 3100 4250
Wire Wire Line
	3500 4350 3100 4350
$Comp
L MCP23017T-E_SO:MCP23017T-E_SO U?
U 1 1 5CD88604
P 2400 3950
AR Path="/5CD88604" Ref="U?"  Part="1" 
AR Path="/5CB20BFC/5CD88604" Ref="U?"  Part="1" 
AR Path="/5CA7DFAE/5CD88604" Ref="U?"  Part="1" 
AR Path="/5CA80A88/5CD88604" Ref="U6"  Part="1" 
F 0 "U6" H 2400 5117 50  0000 C CNN
F 1 "MCP23017T-E_SO" H 2400 5026 50  0000 C CNN
F 2 "MCP23017T-E_SO:SOIC127P1030X265-28N" H 2400 3950 50  0001 L BNN
F 3 "Microchip" H 2400 3950 50  0001 L BNN
F 4 "MCP23017T-E/SOCT-ND" H 2400 3950 50  0001 L BNN "Field4"
F 5 "16-bit Input/Output Expander, I2C interface, Pb-free28 SOIC .300in T/R" H 2400 3950 50  0001 L BNN "Field5"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/MCP23017T-E-SO/MCP23017T-E-SOCT-ND/5358289?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 2400 3950 50  0001 L BNN "Field6"
F 7 "SOIC-28 Microchip" H 2400 3950 50  0001 L BNN "Field7"
F 8 "MCP23017T-E/SO" H 2400 3950 50  0001 L BNN "Field8"
	1    2400 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 3650 1400 3650
Wire Wire Line
	1700 3350 900  3350
Connection ~ 900  3350
Wire Wire Line
	1400 3650 1400 3700
Wire Wire Line
	1400 3700 900  3700
Wire Wire Line
	900  3700 900  3350
$EndSCHEMATC
