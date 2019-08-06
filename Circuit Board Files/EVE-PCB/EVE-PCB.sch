EESchema Schematic File Version 4
LIBS:EVE-PCB-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title ""
Date "15 nov 2012"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 3300 1650 2    50   ~ 0
SDA
Text Label 3300 1550 2    50   ~ 0
SCL
$Comp
L power:GND #PWR0101
U 1 1 5CAF017E
P 3250 1950
F 0 "#PWR0101" H 3250 1700 50  0001 C CNN
F 1 "GND" H 3255 1777 50  0000 C CNN
F 2 "" H 3250 1950 50  0001 C CNN
F 3 "" H 3250 1950 50  0001 C CNN
	1    3250 1950
	1    0    0    -1  
$EndComp
Text Label 4400 1400 0    50   ~ 0
PD1_NEG
Text Label 4400 1500 0    50   ~ 0
PD2_NEG
Text Label 4400 1800 0    50   ~ 0
PD3_NEG
Text Label 4400 2000 0    50   ~ 0
PD4_NEG
$Comp
L Device:R R1
U 1 1 5CAF996E
P 7700 1150
F 0 "R1" V 7493 1150 50  0000 C CNN
F 1 "1M" V 7584 1150 50  0000 C CNN
F 2 "SamacSys_Parts:RC0201FR-071ML" V 7630 1150 50  0001 C CNN
F 3 "~" H 7700 1150 50  0001 C CNN
	1    7700 1150
	0    1    1    0   
$EndComp
Text Label 6650 1100 2    50   ~ 0
AIN0
Text Label 6650 1200 2    50   ~ 0
AIN1
Text Label 6650 1300 2    50   ~ 0
AIN2
Text Label 6650 1400 2    50   ~ 0
AIN3
$Comp
L Device:R R2
U 1 1 5CAFA8CC
P 7700 1550
F 0 "R2" V 7493 1550 50  0000 C CNN
F 1 "1M" V 7584 1550 50  0000 C CNN
F 2 "SamacSys_Parts:RC0201FR-071ML" V 7630 1550 50  0001 C CNN
F 3 "~" H 7700 1550 50  0001 C CNN
	1    7700 1550
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5CAFB32D
P 7700 1950
F 0 "R3" V 7493 1950 50  0000 C CNN
F 1 "1M" V 7584 1950 50  0000 C CNN
F 2 "SamacSys_Parts:RC0201FR-071ML" V 7630 1950 50  0001 C CNN
F 3 "~" H 7700 1950 50  0001 C CNN
	1    7700 1950
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5CAFB4DE
P 7700 2350
F 0 "R4" V 7493 2350 50  0000 C CNN
F 1 "1M" V 7584 2350 50  0000 C CNN
F 2 "SamacSys_Parts:RC0201FR-071ML" V 7630 2350 50  0001 C CNN
F 3 "~" H 7700 2350 50  0001 C CNN
	1    7700 2350
	0    1    1    0   
$EndComp
Text Label 1600 1450 0    50   ~ 0
AIN0
Text Label 1600 1550 0    50   ~ 0
AIN1
Text Label 1600 1650 0    50   ~ 0
AIN2
Text Label 1600 1750 0    50   ~ 0
AIN3
$Comp
L LM324DR:LM324DR U2
U 1 1 5CB01964
P 5750 1500
F 0 "U2" H 5750 2270 50  0000 C CNN
F 1 "LM324DR" H 5750 2179 50  0000 C CNN
F 2 "LM324DR:SOIC127P600X175-14N" H 5750 1500 50  0001 L BNN
F 3 "SOIC-14 Rohm" H 5750 1500 50  0001 L BNN
F 4 "LM324DR" H 5750 1500 50  0001 L BNN "Field4"
F 5 "https://www.digikey.com/product-detail/en/rohm-semiconductor/LM324DR/LM324DRRS-ND/4003944?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 5750 1500 50  0001 L BNN "Field5"
F 6 "Rohm" H 5750 1500 50  0001 L BNN "Field6"
F 7 "OP Amp Quad GP ±16V/32V 14-Pin SOIC T/R" H 5750 1500 50  0001 L BNN "Field7"
F 8 "LM324DRRS-ND" H 5750 1500 50  0001 L BNN "Field8"
	1    5750 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5CB02683
P 4900 2400
F 0 "#PWR0102" H 4900 2150 50  0001 C CNN
F 1 "GND" H 4905 2227 50  0000 C CNN
F 2 "" H 4900 2400 50  0001 C CNN
F 3 "" H 4900 2400 50  0001 C CNN
	1    4900 2400
	1    0    0    -1  
$EndComp
Text Label 7150 1950 0    50   ~ 0
PD3_NEG
Text Label 7150 2350 0    50   ~ 0
PD4_NEG
Text Label 8200 1150 2    50   ~ 0
AIN0
Text Label 8200 1550 2    50   ~ 0
AIN1
Text Label 8200 1950 2    50   ~ 0
AIN2
Text Label 8200 2350 2    50   ~ 0
AIN3
Wire Wire Line
	7850 1150 8200 1150
Wire Wire Line
	7850 1550 8200 1550
Wire Wire Line
	7850 1950 8200 1950
Wire Wire Line
	7850 2350 8200 2350
$Comp
L ADS1015IDGSR:ADS1015IDGSR U1
U 1 1 5CB080D6
P 2400 1450
F 0 "U1" H 2450 2120 50  0000 C CNN
F 1 "ADS1015IDGSR" H 2450 2029 50  0000 C CNN
F 2 "ADS1015IDGSR:SOP50P490X110-10N" H 2400 1450 50  0001 L BNN
F 3 "Texas Instruments" H 2400 1450 50  0001 L BNN
F 4 "296-41185-1-ND" H 2400 1450 50  0001 L BNN "Field4"
F 5 "12-Bit ADC with Integrated MUX, PGA, Comparator, Oscillator, and Reference 10-VSSOP -40 to 125" H 2400 1450 50  0001 L BNN "Field5"
F 6 "https://www.digikey.com/product-detail/en/texas-instruments/ADS1015IDGSR/296-41185-1-ND/5222640?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 2400 1450 50  0001 L BNN "Field6"
F 7 "MSOP-10 Texas Instruments" H 2400 1450 50  0001 L BNN "Field7"
F 8 "ADS1015IDGSR" H 2400 1450 50  0001 L BNN "Field8"
	1    2400 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5CB0A15A
P 1550 1150
F 0 "#PWR0103" H 1550 900 50  0001 C CNN
F 1 "GND" H 1555 977 50  0000 C CNN
F 2 "" H 1550 1150 50  0001 C CNN
F 3 "" H 1550 1150 50  0001 C CNN
	1    1550 1150
	1    0    0    -1  
$EndComp
$Comp
L BSN20BKR:BSN20BKR U3
U 1 1 5CB129A0
P 9700 1000
F 0 "U3" H 9700 1163 50  0000 C CNN
F 1 "BSN20BKR" H 9700 1072 50  0000 C CNN
F 2 "BSN20BKR:BSN20_215" H 9700 1000 50  0001 L BNN
F 3 "SOT-23 Nexperia" H 9700 1000 50  0001 L BNN
F 4 "BSN20BKR" H 9700 1000 50  0001 L BNN "Field4"
F 5 "https://www.digikey.com/product-detail/en/nexperia-usa-inc/BSN20BKR/1727-2341-1-ND/5423815?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 9700 1000 50  0001 L BNN "Field5"
F 6 "Nexperia USA" H 9700 1000 50  0001 L BNN "Field6"
F 7 "N-Channel 60 V 2.8 Ohm 310 mW 0.49 nC Surface Mount Trench MosFet - SOT-23" H 9700 1000 50  0001 L BNN "Field7"
F 8 "1727-2341-1-ND" H 9700 1000 50  0001 L BNN "Field8"
	1    9700 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5CB13406
P 10000 1300
F 0 "R5" V 9793 1300 50  0000 C CNN
F 1 "10K" V 9884 1300 50  0000 C CNN
F 2 "SamacSys_Parts:RC0201FR-0710KL" V 9930 1300 50  0001 C CNN
F 3 "~" H 10000 1300 50  0001 C CNN
	1    10000 1300
	-1   0    0    1   
$EndComp
Text Label 10500 1100 2    50   ~ 0
SCL-3.3
Wire Wire Line
	9900 1100 10000 1100
$Comp
L power:+3V3 #PWR0105
U 1 1 5CB13B9F
P 10400 1500
F 0 "#PWR0105" H 10400 1350 50  0001 C CNN
F 1 "+3V3" H 10415 1673 50  0000 C CNN
F 2 "" H 10400 1500 50  0001 C CNN
F 3 "" H 10400 1500 50  0001 C CNN
	1    10400 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 1300 9800 1500
Wire Wire Line
	9800 1500 10000 1500
Wire Wire Line
	10000 1150 10000 1100
Connection ~ 10000 1100
Wire Wire Line
	10000 1450 10000 1500
Connection ~ 10000 1500
Text Label 9100 1100 0    50   ~ 0
SCL
$Comp
L power:+5V #PWR0106
U 1 1 5CB15101
P 9000 1500
F 0 "#PWR0106" H 9000 1350 50  0001 C CNN
F 1 "+5V" H 9015 1673 50  0000 C CNN
F 2 "" H 9000 1500 50  0001 C CNN
F 3 "" H 9000 1500 50  0001 C CNN
	1    9000 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5CB15AFC
P 9400 1300
F 0 "R6" V 9193 1300 50  0000 C CNN
F 1 "10K" V 9284 1300 50  0000 C CNN
F 2 "SamacSys_Parts:RC0201FR-0710KL" V 9330 1300 50  0001 C CNN
F 3 "~" H 9400 1300 50  0001 C CNN
	1    9400 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 1500 9400 1450
Wire Wire Line
	9400 1150 9400 1100
Connection ~ 9400 1100
Wire Wire Line
	9400 1100 9500 1100
Wire Wire Line
	4900 1300 4900 1600
Wire Wire Line
	4900 1300 5050 1300
Wire Wire Line
	5050 1600 4900 1600
Connection ~ 4900 1600
Wire Wire Line
	4900 1600 4900 1700
Wire Wire Line
	5050 1700 4900 1700
Connection ~ 4900 1700
Wire Wire Line
	4900 1700 4900 1900
Wire Wire Line
	5050 1900 4900 1900
Connection ~ 4900 1900
Wire Wire Line
	4900 1900 4900 2200
Wire Wire Line
	5050 2200 4900 2200
Connection ~ 4900 2200
Wire Wire Line
	4900 2200 4900 2400
Wire Wire Line
	4900 1100 5050 1100
Wire Wire Line
	3100 1050 3200 1050
Wire Wire Line
	3200 1050 3200 900 
$Comp
L Device:R R7
U 1 1 5CB348CD
P 3550 1700
F 0 "R7" V 3343 1700 50  0000 C CNN
F 1 "10K" V 3434 1700 50  0000 C CNN
F 2 "SamacSys_Parts:RC0201FR-0710KL" V 3480 1700 50  0001 C CNN
F 3 "~" H 3550 1700 50  0001 C CNN
	1    3550 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	3100 1350 3400 1350
Wire Wire Line
	3400 1350 3400 1700
Wire Wire Line
	3700 1700 3800 1700
Wire Wire Line
	3100 1950 3250 1950
Wire Wire Line
	1550 1150 1800 1150
Wire Wire Line
	9000 1500 9400 1500
Wire Wire Line
	10000 1500 10400 1500
$Comp
L BSN20BKR:BSN20BKR U4
U 1 1 5CB4AB18
P 9700 1850
F 0 "U4" H 9700 2013 50  0000 C CNN
F 1 "BSN20BKR" H 9700 1922 50  0000 C CNN
F 2 "BSN20BKR:BSN20_215" H 9700 1850 50  0001 L BNN
F 3 "SOT-23 Nexperia" H 9700 1850 50  0001 L BNN
F 4 "BSN20BKR" H 9700 1850 50  0001 L BNN "Field4"
F 5 "https://www.digikey.com/product-detail/en/nexperia-usa-inc/BSN20BKR/1727-2341-1-ND/5423815?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 9700 1850 50  0001 L BNN "Field5"
F 6 "Nexperia USA" H 9700 1850 50  0001 L BNN "Field6"
F 7 "N-Channel 60 V 2.8 Ohm 310 mW 0.49 nC Surface Mount Trench MosFet - SOT-23" H 9700 1850 50  0001 L BNN "Field7"
F 8 "1727-2341-1-ND" H 9700 1850 50  0001 L BNN "Field8"
	1    9700 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5CB4AB1F
P 10000 2150
F 0 "R9" V 9793 2150 50  0000 C CNN
F 1 "10K" V 9884 2150 50  0000 C CNN
F 2 "SamacSys_Parts:RC0201FR-0710KL" V 9930 2150 50  0001 C CNN
F 3 "~" H 10000 2150 50  0001 C CNN
	1    10000 2150
	-1   0    0    1   
$EndComp
Text Label 10500 1950 2    50   ~ 0
SDA-3.3
Wire Wire Line
	9900 1950 10000 1950
$Comp
L power:+3V3 #PWR0108
U 1 1 5CB4AB28
P 10400 2350
F 0 "#PWR0108" H 10400 2200 50  0001 C CNN
F 1 "+3V3" H 10415 2523 50  0000 C CNN
F 2 "" H 10400 2350 50  0001 C CNN
F 3 "" H 10400 2350 50  0001 C CNN
	1    10400 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 2150 9800 2350
Wire Wire Line
	9800 2350 10000 2350
Wire Wire Line
	10000 2000 10000 1950
Wire Wire Line
	10000 2300 10000 2350
Connection ~ 10000 2350
Text Label 9100 1950 0    50   ~ 0
SDA
$Comp
L power:+5V #PWR0109
U 1 1 5CB4AB37
P 9000 2350
F 0 "#PWR0109" H 9000 2200 50  0001 C CNN
F 1 "+5V" H 9015 2523 50  0000 C CNN
F 2 "" H 9000 2350 50  0001 C CNN
F 3 "" H 9000 2350 50  0001 C CNN
	1    9000 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 5CB4AB3D
P 9400 2150
F 0 "R8" V 9193 2150 50  0000 C CNN
F 1 "10K" V 9284 2150 50  0000 C CNN
F 2 "SamacSys_Parts:RC0201FR-0710KL" V 9330 2150 50  0001 C CNN
F 3 "~" H 9400 2150 50  0001 C CNN
	1    9400 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 2350 9400 2300
Wire Wire Line
	9400 2000 9400 1950
Connection ~ 9400 1950
Wire Wire Line
	9400 1950 9500 1950
Wire Wire Line
	9000 2350 9400 2350
Wire Wire Line
	10000 2350 10400 2350
$Sheet
S 9150 2800 1000 900 
U 5CA7DFAE
F0 "DAC1" 50
F1 "DAC1.sch" 50
F2 "SDA" B L 9150 2950 50 
F3 "SCL" B L 9150 3150 50 
F4 "PD1_NEG" O L 9150 3350 50 
F5 "PD2_NEG" O L 9150 3550 50 
$EndSheet
$Sheet
S 9150 3950 1000 900 
U 5CA80A88
F0 "DAC2" 50
F1 "DAC2.sch" 50
F2 "SDA" B L 9150 4100 50 
F3 "SCL" B L 9150 4300 50 
F4 "PD3_NEG" O L 9150 4500 50 
F5 "PD4_NEG" O L 9150 4700 50 
$EndSheet
Text Label 8750 2950 0    50   ~ 0
SDA
Text Label 8750 3150 0    50   ~ 0
SCL
Text Label 8800 4100 0    50   ~ 0
SDA
Text Label 8800 4300 0    50   ~ 0
SCL
Wire Wire Line
	8800 4100 9150 4100
Wire Wire Line
	8800 4300 9150 4300
Wire Wire Line
	1600 1450 1800 1450
Wire Wire Line
	1600 1550 1800 1550
Wire Wire Line
	1600 1650 1800 1650
Wire Wire Line
	1600 1750 1800 1750
Wire Wire Line
	3300 1550 3100 1550
Wire Wire Line
	3300 1650 3100 1650
Wire Wire Line
	4400 1400 5050 1400
Wire Wire Line
	4400 1500 5050 1500
Wire Wire Line
	4400 1800 5050 1800
Wire Wire Line
	4400 2000 5050 2000
Wire Wire Line
	6650 1100 6450 1100
Wire Wire Line
	6650 1200 6450 1200
Wire Wire Line
	6650 1300 6450 1300
Wire Wire Line
	6650 1400 6450 1400
Wire Wire Line
	10000 1100 10500 1100
Wire Wire Line
	9100 1100 9400 1100
Wire Wire Line
	9100 1950 9400 1950
$Comp
L power:+5V #PWR0111
U 1 1 5CAD3B2B
P 4900 1100
F 0 "#PWR0111" H 4900 950 50  0001 C CNN
F 1 "+5V" H 4915 1273 50  0000 C CNN
F 2 "" H 4900 1100 50  0001 C CNN
F 3 "" H 4900 1100 50  0001 C CNN
	1    4900 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0112
U 1 1 5CAD789A
P 3800 1700
F 0 "#PWR0112" H 3800 1550 50  0001 C CNN
F 1 "+5V" H 3815 1873 50  0000 C CNN
F 2 "" H 3800 1700 50  0001 C CNN
F 3 "" H 3800 1700 50  0001 C CNN
	1    3800 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0113
U 1 1 5CADB22B
P 3200 900
F 0 "#PWR0113" H 3200 750 50  0001 C CNN
F 1 "+5V" H 3215 1073 50  0000 C CNN
F 2 "" H 3200 900 50  0001 C CNN
F 3 "" H 3200 900 50  0001 C CNN
	1    3200 900 
	1    0    0    -1  
$EndComp
$Comp
L Connector:Raspberry_Pi_2_3 J1
U 1 1 5CAE0D0F
P 6150 4350
F 0 "J1" H 6150 5828 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 6150 5737 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x20_P2.54mm_Vertical" H 6150 4350 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf" H 6150 4350 50  0001 C CNN
	1    6150 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR02
U 1 1 5CAE0D83
P 7050 3050
F 0 "#PWR02" H 7050 2900 50  0001 C CNN
F 1 "+3V3" H 7065 3223 50  0000 C CNN
F 2 "" H 7050 3050 50  0001 C CNN
F 3 "" H 7050 3050 50  0001 C CNN
	1    7050 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 3050 7050 3050
NoConn ~ 6950 3450
NoConn ~ 6950 3550
NoConn ~ 6950 4050
NoConn ~ 6950 4150
NoConn ~ 6950 4250
NoConn ~ 6950 4450
NoConn ~ 6950 4550
NoConn ~ 6950 4650
NoConn ~ 6950 4750
NoConn ~ 6950 4850
NoConn ~ 5950 3050
NoConn ~ 6050 3050
NoConn ~ 6950 5050
NoConn ~ 6950 5150
NoConn ~ 5350 3450
NoConn ~ 5350 3550
NoConn ~ 5350 3750
NoConn ~ 5350 3850
NoConn ~ 5350 3950
NoConn ~ 5350 4150
NoConn ~ 5350 4250
NoConn ~ 5350 4350
NoConn ~ 5350 4550
NoConn ~ 5350 4650
NoConn ~ 5350 4750
NoConn ~ 5350 4850
NoConn ~ 5350 4950
NoConn ~ 5350 5050
Wire Wire Line
	6250 3050 6350 3050
Connection ~ 6350 3050
$Comp
L power:GND #PWR01
U 1 1 5CB31D3A
P 7000 5700
F 0 "#PWR01" H 7000 5450 50  0001 C CNN
F 1 "GND" H 7005 5527 50  0000 C CNN
F 2 "" H 7000 5700 50  0001 C CNN
F 3 "" H 7000 5700 50  0001 C CNN
	1    7000 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 5650 5850 5650
Wire Wire Line
	7000 5650 7000 5700
Connection ~ 5850 5650
Wire Wire Line
	5850 5650 5950 5650
Connection ~ 5950 5650
Wire Wire Line
	5950 5650 6050 5650
Connection ~ 6050 5650
Wire Wire Line
	6050 5650 6150 5650
Connection ~ 6150 5650
Wire Wire Line
	6150 5650 6250 5650
Connection ~ 6250 5650
Wire Wire Line
	6250 5650 6350 5650
Connection ~ 6350 5650
Wire Wire Line
	6350 5650 6450 5650
Connection ~ 6450 5650
Wire Wire Line
	6450 5650 7000 5650
Text Label 7450 3850 2    50   ~ 0
SCL-3.3
Wire Wire Line
	6950 3850 7450 3850
Text Label 7450 3750 2    50   ~ 0
SDA-3.3
Wire Wire Line
	6950 3750 7450 3750
Wire Wire Line
	10000 1950 10500 1950
Connection ~ 10000 1950
Wire Wire Line
	7150 1950 7550 1950
Wire Wire Line
	7150 2350 7550 2350
Wire Wire Line
	7150 1550 7550 1550
Wire Wire Line
	7150 1150 7550 1150
Text Label 7150 1550 0    50   ~ 0
PD2_NEG
Text Label 7150 1150 0    50   ~ 0
PD1_NEG
Wire Wire Line
	8750 3550 9150 3550
Wire Wire Line
	8750 3350 9150 3350
Text Label 8750 3550 0    50   ~ 0
PD2_NEG
Text Label 8750 3350 0    50   ~ 0
PD1_NEG
Wire Wire Line
	8750 2950 9150 2950
Wire Wire Line
	8750 3150 9150 3150
Text Label 8750 4500 0    50   ~ 0
PD3_NEG
Text Label 8750 4700 0    50   ~ 0
PD4_NEG
Wire Wire Line
	8750 4500 9150 4500
Wire Wire Line
	8750 4700 9150 4700
$Comp
L PJ-002A:PJ-002A J2
U 1 1 5CDD2B8F
P 1000 4100
F 0 "J2" H 994 4440 50  0000 C CNN
F 1 "PJ-002A" H 994 4349 50  0000 C CNN
F 2 "PJ-002A:CUI_PJ-002A" H 1000 4100 50  0001 L BNN
F 3 "2.0 mm Center Pin, 2.5 A, Right Angle, Through Hole, Dc Power Jack Connector" H 1000 4100 50  0001 L BNN
F 4 "https://www.cui.com/product/interconnect/dc-power-connectors/jacks/2.0-mm-center-pin/pj-002a?utm_source=snapeda.com&utm_medium=referral&utm_campaign=snapedaBOM" H 1000 4100 50  0001 L BNN "Field4"
F 5 "None" H 1000 4100 50  0001 L BNN "Field5"
F 6 "https://www.digikey.com/product-detail/en/cui-inc/PJ-002A/CP-002A-ND/96962?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 1000 4100 50  0001 L BNN "Field6"
F 7 "PJ-002A" H 1000 4100 50  0001 L BNN "Field7"
F 8 "CUI Inc." H 1000 4100 50  0001 L BNN "Field8"
F 9 "CP-002A-ND" H 1000 4100 50  0001 L BNN "Field9"
	1    1000 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5CDD5CE7
P 1750 4400
F 0 "#PWR0104" H 1750 4150 50  0001 C CNN
F 1 "GND" H 1755 4227 50  0000 C CNN
F 2 "" H 1750 4400 50  0001 C CNN
F 3 "" H 1750 4400 50  0001 C CNN
	1    1750 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 4100 1350 4100
Wire Wire Line
	1750 4300 1750 4400
Wire Wire Line
	1350 3850 1350 4000
Wire Wire Line
	1350 4000 1200 4000
$Comp
L Device:D D17
U 1 1 5CE0AEF1
P 1500 3850
F 0 "D17" H 1500 3634 50  0000 C CNN
F 1 "S1KB" H 1500 3725 50  0000 C CNN
F 2 "footprints:S1KB-13-F" H 1500 3850 50  0001 C CNN
F 3 "~" H 1500 3850 50  0001 C CNN
	1    1500 3850
	-1   0    0    1   
$EndComp
$Comp
L SamacSys_Parts:UA7805CKCT Q5
U 1 1 5CE230D9
P 2200 3950
F 0 "Q5" H 2850 4215 50  0000 C CNN
F 1 "UA7805CKCT" H 2850 4124 50  0000 C CNN
F 2 "SamacSys_Parts:UA7805CKCT" H 3350 4050 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/ua7805.pdf" H 3350 3950 50  0001 L CNN
F 4 "Linear Voltage Regulator 5V 1.5A TO-220 Texas Instruments UA78xx UA7805CKCT, Single Linear Voltage Regulator, 1.5A 5 V, 3-Pin TO-220" H 3350 3850 50  0001 L CNN "Description"
F 5 "4.65" H 3350 3750 50  0001 L CNN "Height"
F 6 "595-UA7805CKCT" H 3350 3650 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=595-UA7805CKCT" H 3350 3550 50  0001 L CNN "Mouser Price/Stock"
F 8 "Texas Instruments" H 3350 3450 50  0001 L CNN "Manufacturer_Name"
F 9 "UA7805CKCT" H 3350 3350 50  0001 L CNN "Manufacturer_Part_Number"
	1    2200 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 3850 2000 3950
Wire Wire Line
	2000 3950 2200 3950
Wire Wire Line
	2200 4300 1750 4300
$Comp
L power:+12V #PWR?
U 1 1 5CE2DC86
P 2000 3700
AR Path="/5CA7DFAE/5CE2DC86" Ref="#PWR?"  Part="1" 
AR Path="/5CE2DC86" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 2000 3550 50  0001 C CNN
F 1 "+12V" H 2015 3873 50  0000 C CNN
F 2 "" H 2000 3700 50  0001 C CNN
F 3 "" H 2000 3700 50  0001 C CNN
	1    2000 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 3700 2000 3850
Wire Wire Line
	1200 4200 1350 4200
Wire Wire Line
	2200 4050 2200 4300
$Comp
L Device:C C2
U 1 1 5CE50296
P 3650 4100
F 0 "C2" H 3765 4146 50  0000 L CNN
F 1 "0.1 uF" H 3765 4055 50  0000 L CNN
F 2 "GRM0335C1E101JA01D:CAPC0603X39N" H 3688 3950 50  0001 C CNN
F 3 "~" H 3650 4100 50  0001 C CNN
	1    3650 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0110
U 1 1 5CE53FA4
P 3650 3700
F 0 "#PWR0110" H 3650 3550 50  0001 C CNN
F 1 "+5V" H 3665 3873 50  0000 C CNN
F 2 "" H 3650 3700 50  0001 C CNN
F 3 "" H 3650 3700 50  0001 C CNN
	1    3650 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3950 3650 3950
Connection ~ 3650 3950
Wire Wire Line
	2200 4300 3650 4300
Wire Wire Line
	3650 4300 3650 4250
Connection ~ 2200 4300
Wire Wire Line
	3650 3700 3650 3950
$Comp
L Device:C C3
U 1 1 5CE84515
P 4150 4100
F 0 "C3" H 4265 4146 50  0000 L CNN
F 1 "1 uF" H 4265 4055 50  0000 L CNN
F 2 "footprints:GRM033R71E102KA01D" H 4188 3950 50  0001 C CNN
F 3 "~" H 4150 4100 50  0001 C CNN
	1    4150 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4250 4150 4300
Wire Wire Line
	4150 4300 3650 4300
Connection ~ 3650 4300
Wire Wire Line
	3650 3950 4150 3950
Connection ~ 2000 3850
Connection ~ 1750 4300
Wire Wire Line
	1350 4300 1750 4300
Connection ~ 1350 4200
Wire Wire Line
	1650 3850 1750 3850
$Comp
L Device:C C1
U 1 1 5CAC5E05
P 1750 4100
F 0 "C1" H 1865 4146 50  0000 L CNN
F 1 "10 uF" H 1865 4055 50  0000 L CNN
F 2 "GRM21BR61E106MA73L:CAPC2012X135N" H 1788 3950 50  0001 C CNN
F 3 "~" H 1750 4100 50  0001 C CNN
	1    1750 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 4200 1350 4300
Wire Wire Line
	1350 4100 1350 4200
Wire Wire Line
	1750 4300 1750 4250
Wire Wire Line
	1750 3950 1750 3850
Connection ~ 1750 3850
Wire Wire Line
	1750 3850 2000 3850
$EndSCHEMATC
