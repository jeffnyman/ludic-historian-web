100 GOSUB 5690
110 I=RND(-VAL(RIGHT$(TIME$,2)))
120 IF RND>.5 THEN RH$="ROMULAN" ELSE RH$="KLINGON"
130 DIM Q(8,8),Z(8,8),Q$(64),D(8),C(9,2),K(4,3)
140 FOR HJ=1 TO 10:READ NC$(HJ):KEY HJ,NC$(HJ)+CHR$(13):NEXT HJ
150 DATA MOVE,SRSCAN,LRSCAN,PHASER,PHOTONS,SHIELDS
160 DATA DAMAGE,COMPUTER,HELP,END
170 T0=INT(RND(1)*20+20)*100:T=T0
180 T9=40:D0=0:E0=3000:P0=10:P=10
190 S9=200:P4=100:E=2200:S=800
200 DEF FND(D)=SQR((K(I,1)-S1)^2+(K(I,2)-S2)^2)
210 DEF FNR(X)=INT(RND*X+1)
220 Q1=FNR(8):Q2=FNR(8):S1=FNR(8):S2=FNR(8)
230 EN$=CHR$(205)+CHR$(251):BA$=CHR$(233)+CHR$(233):ST$=" "+CHR$(15)
240 IF RH$="ROMULAN" THEN KL$=CHR$(236)+CHR$(207):GOTO 260
250 KL$=CHR$(224)+CHR$(174)
260 X=RND(1)
270 C(2,1)=-1:C(3,1)=-1:C(4,1)=-1:C(4,2)=-1
280 C(5,2)=-1:C(6,2)=-1:C(1,1)=0:C(3,2)=0
290 C(5,1)=0:C(7,2)=0:C(9,1)=0:C(1,2)=1
300 C(2,2)=1:C(6,1)=1:C(7,1)=1:C(8,1)=1
310 C(8,2)=1:C(9,2)=1
320 D$="Warp enginesS.R. SensorsL.R. SensorsPhaser cntrl"
330 D$=D$+"Photon TubesDamage cntrl"
340 E$="Shield cntrlComputer    "
350 K9=0:B9=0
360 FOR I=1 TO 8
370 FOR J=1 TO 8
380 R1=RND
390 K3=0:B3=0
400 IF R1>.9799999 THEN K3=4:GOTO 440
410 IF R1>.94 THEN K3=3:GOTO 440
420 IF R1>.89 THEN K3=2:GOTO 440
430 IF R1>.79 THEN K3=1:GOTO  440
440 K9=K9+K3
450 IF R1>=.95 THEN B3=1:B9=B9+1
460 S3=FNR(8)
470 Q(I,J)=K3*100+B3*10+S3
480 Z(I,J)=0
490 NEXT J
500 NEXT I:CLS
510 IF B9=0 THEN 350
520 K7=K9:K8=B9
530 GOSUB 5500
540 LOCATE 1,1,0:COLOR 14:PRINT "                             S.P.A.C.E.  T.R.E.K."
550 COLOR 15:LOCATE ,30:PRINT "��������������������"
560 COLOR 11:LOCATE 14,6,0:PRINT "As Commander of the U.S.S. Enterprise, it is your"
570 LOCATE 15,6,0:PRINT "Mission to Destroy the "RH$" forces established"
580 LOCATE 16,6,0:PRINT "in Violation of treaties in your Galaxy."
590 LOCATE 19,8,0:PRINT "You must Destroy"K9""RH$"s in"T9"Stardates"
600 LOCATE 20,22,0:PRINT "with"B9"Starbases."
610 K3=0:B3=0:S3=0
620 IF Q1<1 OR Q1>8 OR Q2<1 OR Q2>8 THEN 710
630 X=Q(Q1,Q2)/100
640 K3=INT(X)
650 B3=INT((X-K3)*10)
660 S3=Q(Q1,Q2)-INT(Q(Q1,Q2)*.1)*10
670 IF S>200 THEN 710
680 GOSUB 5500
690 COLOR 14:LOCATE 15,7,0:PRINT "Combat Area  -  Condition";:COLOR 12:PRINT "  RED"
700 COLOR 14:LOCATE 17,7,0:PRINT "   SHIELDS Dangerously Low."
710 FOR I=1 TO 4:K(I,3)=0:NEXT
720 FOR I=1 TO 64:Q$(I)="  ":NEXT
730 A$=EN$:Z1=S1:Z2=S2:GOSUB 5240
740 IF K3=0 THEN 770
750 FOR I=1 TO K3:GOSUB 5200:A$=KL$:Z1=R1:Z2=R2:GOSUB 5240
760 K(I,1)=R1:K(I,2)=R2:K(I,3)=S9:NEXT I
770 IF B3=0 THEN 790
780 FOR I=1 TO B3:GOSUB 5200:A$=BA$:Z1=R1:Z2=R2:GOSUB 5240:NEXT I
790 IF S3=0 THEN 810
800 FOR I=1 TO S3:GOSUB 5200:A$=ST$:Z1=R1:Z2=R2:GOSUB 5240:NEXT I
810 IF K3<=0 THEN 840
820 IF RND(1)>.333 THEN 840
830 GOSUB 3690
840 GOSUB 4100
850 '
860 LOCATE 23,25:PRINT "          ":LOCATE 23,6
870 SOUND 440,1:SOUND 600,1
880 COLOR 14:PRINT "COMMAND  Captain   ";:COLOR 15:INPUT W1$
890 IF W1$="END" THEN CHAIN "MENU"
900 W$=W1$
910 IF W1$<>"HEL" THEN 970
920 GOSUB 5500
930 COLOR 14:LOCATE 14,17,0:PRINT "COMMANDS are :"
940 PRINT:COLOR 10
950 FOR I=1 TO 10 STEP 2:LOCATE ,17:PRINT USING "F\\  \     \       F\\  \      \";MID$(STR$(I),2),NC$(I),MID$(STR$(I+1),2),NC$(I+1)
960 NEXT:GOTO 860
970 FOR HJ=1 TO 10
980 IF LEFT$(NC$(HJ),LEN(W$))=W$ THEN 1010
990 NEXT HJ:COLOR 10:LOCATE 23,6:PRINT "INVALID COMMAND              "
1000 SOUND 650,6:SOUND 550,6:SOUND 450,6:GOTO 920
1010 W$=W1$:IF W$="" THEN 920
1020 IF HJ>9 THEN 4090
1030 ON HJ GOTO 1040,840,2030,2280,2610,3330,3430,4530,920
1040 GOSUB 5580
1050 COLOR 10:LOCATE 11,66,0:PRINT " COURSE"
1060 COLOR 11:LOCATE 14,66:PRINT "    3"
1070 LOCATE ,66:PRINT "  4";:COLOR 15:PRINT " �";:COLOR 11:PRINT " 2"
1080 LOCATE ,66:PRINT "5";:COLOR 15:PRINT " �����";:COLOR 11:PRINT " 1"
1090 LOCATE ,66:PRINT "  6";:COLOR 15:PRINT " �";:COLOR 11:PRINT " 8"
1100 LOCATE ,66:PRINT "    7"
1110 SOUND 500,1
1120 COLOR 14:LOCATE 20,66,0:INPUT"##";C1$:C1=VAL(C1$)
1130 IF C1=0 THEN 850
1140 IF C1<1 OR C1>=9 THEN 1120
1150 COLOR 10:LOCATE 22,66,0:PRINT "WARP (0-8)"
1160 SOUND 540,1
1170 COLOR 14:LOCATE 24,66,0:INPUT;"##";Z$:LOCATE 1:W1=VAL(Z$)
1180 IF W1=0 THEN 850
1190 IF W1<0 OR W1>8 THEN 1170
1200 LOCATE 15,6:T=T+1+INT(W1/3)
1210 IF D(1)>=0 OR W1<=.25 THEN 1260
1220 GOSUB 5500
1230 COLOR 10:LOCATE 15,6:PRINT "Warp Engines Damaged."
1240 LOCATE 17,6:PRINT "Maximum Speed is (Warp .25)"
1250 GOTO  850
1260 IF K3<=0 THEN 1300
1270 GOSUB 3690
1280 IF K3<=0 THEN 1300
1290 IF S<0 THEN 3950
1300 N=INT(W1*8)
1310 IF N<1 THEN N=1
1320 IF E-N>0 THEN 1390
1330 IF S<1 THEN 3840
1340 GOSUB 5500
1350 COLOR 10:LOCATE 15,6:PRINT "Not enough energy to warp";:COLOR 14:PRINT W1
1360 COLOR 10:LOCATE 17,6:PRINT "You have"E"Units of Energy Left."
1370 LOCATE 19,6:PRINT "Suggest you get some from the Shields."
1380 GOTO  850
1390 FOR I=1 TO 8
1400 IF D(I)>=0 THEN 1420
1410 D(I)=D(I)+1
1420 NEXT I
1430 IF RND(1)>.2 THEN 1620
1440 R1=FNR(8)
1450 IF RND(1)>.5 THEN 1560
1460 GOSUB 5500
1470 COLOR 10:LOCATE 15,6:PRINT "*** Meteorite Storm ***":GOSUB 1490
1480 GOTO  1620
1490 COLOR 10:LOCATE 17,6:PRINT "Damage Control Report :"
1500 GOSUB 5270
1510 COLOR 10:PRINT " damaged ";
1520 IF SGN(D(R1))=-1 THEN PRINT "some more";
1530 PRINT
1540 D(R1)=D(R1)-(RND(1)*5+1)
1550 RETURN
1560 IF D(R1)>=0 THEN 1620
1570 GOSUB 5500
1580 COLOR 10:LOCATE 14,6:PRINT "Damage Control Report :"
1590 GOSUB 5270
1600 COLOR 10:PRINT " state of Repair has Improved."
1610 D(R1)=D(R1)+(RND(1)*5+1)
1620 A$="  ":Z1=S1:Z2=S2
1630 GOSUB 5240
1640 X=S1:Y=S2:Z8=C1-INT(C1):C1=INT(C1):Z7=C(C1,1):Z4=C(C1,2)
1650 Z5=C(C1+1,1)-Z7:Z6=C(C1+1,2)-Z4
1660 X1=Z7+(Z5*Z8):X2=Z4+(Z6*Z8)
1670 FOR I=1 TO N
1680 S1=S1+X1:S2=S2+X2
1690 IF S1<1 OR S1>=9 OR S2<1 OR S2>=9 THEN 1930
1700 A$="  ":Z1=S1:Z2=S2
1710 GOSUB 5310
1720 IF Z3=1 THEN 1850
1730 A$=BA$
1740 GOSUB 5310
1750 IF Z3=1 THEN 5360
1760 A$=KL$
1770 GOSUB 5310
1780 IF Z3=1 THEN 5430
1790 GOSUB 5500
1800 COLOR 10:LOCATE 15,6:PRINT "Warp Engines Shutdown at Sector"S1"-"S2
1810 LOCATE 17,6:PRINT "Due to bad Navigation."
1820 W1=0:S1=S1-X1:S2=S2-X2:R1=FNR(8)
1830 GOSUB 1490
1840 GOTO 1860
1850 NEXT I
1860 A$=EN$:Z1=S1:Z2=S2
1870 GOSUB 5240
1880 E=E-N
1890 IF W1<1 THEN 1910
1900 T=T+1+INT(W1/3)
1910 IF T>T0+T9 THEN 3910
1920 GOTO  840
1930 X=Q1*8+X+X1*N:Y=Q2*8+Y+X2*N
1940 Q1=INT(X/8):Q2=INT(Y/8)
1950 S1=INT(X-Q1*8):S2=INT(Y-Q2*8)
1960 IF S1<>0 THEN 1980
1970 Q1=Q1-1:S1=8
1980 IF S2<>0 THEN 2000
1990 Q2=Q2-1:S2=8
2000 E=E-N
2010 IF T>T0+T9 THEN 3910
2020 GOTO 610
2030 IF D(3)>=0 THEN 2060
2040 GOSUB 5500:PRINT "Long Range sensors are Inoperable."
2050 GOTO 850
2060 '
2070 COLOR 15:LOCATE 1,60,0:PRINT "������������������Ŀ"
2080 LOCATE ,60:PRINT "�";:COLOR 11:PRINT "      L  R  S";:COLOR 15:PRINT "     �"
2090 LOCATE ,60:PRINT "�                  �"
2100 LOCATE ,60:PRINT "�";:COLOR 14:PRINT "  Quadrant"Q1"-"Q2"";:COLOR 15:PRINT " �"
2110 LOCATE ,60:PRINT "������������������Ĵ"
2120 FOR I=Q1-1 TO Q1+1
2130 COLOR 15:LOCATE ,60:PRINT "�  ";
2140 COLOR 10:FOR J=Q2-1 TO Q2+1
2150 IF J<>Q2-1 THEN PRINT "   ";
2160 IF I<1 OR I>8 OR J<1 OR J>8 THEN PRINT "���";:GOTO  2200
2170 LL=LEN(STR$(Q(I,J)))
2180 PRINT MID$("00",1,4-LL);MID$(STR$(Q(I,J)),2);
2190 IF D(8)>=0 THEN Z(I,J)=Q(I,J)
2200 NEXT J
2210 COLOR 15:PRINT " �"
2220 NEXT I
2230 COLOR 15:LOCATE ,60:PRINT "��������������������"
2240 IF D(8)>=0 THEN 850
2250 GOSUB 5500
2260 LOCATE 15,6:PRINT "Computer Damaged Scan not Recorded."
2270 GOTO  850
2280 GOSUB 5500
2290 IF D(4)>=0 THEN 2320
2300 IF K3<=0 THEN 3610
2310 LOCATE 15,6:PRINT "Phasors are NOT Operational.":GOTO  850
2320 IF D(2)<0 THEN 2340
2330 IF K3=0 THEN 3610
2340 IF D(7)>=0 THEN 2370
2350 LOCATE 15,6:PRINT "Computer failure hampers Accuracy."
2360 SOUND 400,1
2370 LOCATE 17,6:PRINT "Phasors Locked on Target(s)"
2380 LOCATE 19,6:PRINT "  Energy Available ="E
2390 LOCATE 21,6:INPUT "Number of units to fire";Z$:X=VAL(Z$)
2400 GOSUB 5500
2410 IF X<=0 THEN 850
2420 IF E-X<=0 THEN 2370
2430 E=E-X
2440 IF D(7)<0 THEN X=X*RND(1)
2450 X=X+X*RND(1)
2460 FOR I=1 TO 4
2470 IF K(I,3)<=0 THEN 2550
2480 H=INT(X/K3/FND(0)):K(I,3)=K(I,3)-H
2490 LOCATE ,3:PRINT USING "####";H;:PRINT " Units hit "RH$" at Sec"K(I,1)"-"K(I,2);
2500 IF K(I,3)<=0 THEN 2530
2510 PRINT "   {"K(I,3)"Left }"
2520 GOTO  2550
2530 GOSUB 3630
2540 IF K9<1 THEN 4000
2550 NEXT I
2560 FOR HM=1 TO 1000:NEXT
2570 GOSUB 3690
2580 IF E<=0 THEN 2600
2590 GOTO  840
2600 IF S<1 THEN 3840 ELSE 1360
2610 IF D(5)>=0 THEN 2640
2620 GOSUB 5500
2630 LOCATE 15,6:PRINT "Photon Tubes are NOT Operational.":GOTO  850
2640 IF P>0 THEN 2670
2650 GOSUB 5500
2660 LOCATE 15,6:PRINT "All Photon Torpedos are Expended.":GOTO  850
2670 IF E>P4 THEN 2700
2680 GOSUB 5500
2690 LOCATE 15,6:PRINT "Insufficient Energy to fire Torpedo":GOTO  850
2700 '
2710 GOSUB 5580
2720 SOUND 360,1:GOSUB 5500
2730 LOCATE 11,66,0:PRINT " TORPEDO"
2740 COLOR 11:LOCATE 14,66:PRINT "    3"
2750 LOCATE ,66:PRINT "  4";:COLOR 15:PRINT " �";:COLOR 11:PRINT " 2"
2760 LOCATE ,66:PRINT "5";:COLOR 15:PRINT " �����";:COLOR 11:PRINT " 1"
2770 LOCATE ,66:PRINT "  6";:COLOR 15:PRINT " �";:COLOR 11:PRINT " 8"
2780 LOCATE ,66:PRINT "    7"
2790 SOUND 500,1
2800 LOCATE 20,62:INPUT"DIRECTION # ";C1$:C1=VAL(C1$)
2810 GOSUB 5580
2820 IF C1<1 OR C1>=9 THEN 2700
2830 Z7=C(INT(C1),1):Z4=C(INT(C1),2):Z8=C1-INT(C1)
2840 Z5=C(INT(C1)+1,1)-Z7:Z6=C(INT(C1)+1,2)-Z4
2850 X1=Z7+(Z5*Z8):X2=Z4+(Z6*Z8):X=S1:Y=S2
2860 P=P-1:E=E-P4
2870 LOCATE 11,67:PRINT "Track":LOCATE 13
2880 X=X+X1:Y=Y+X2
2890 IF X<1 OR X>=9 OR Y<1 OR Y>=9 THEN 3290
2900 LOCATE ,66:PRINT INT(X*10)/10;"-";INT(Y*10)/10
2910 A$="  ":Z1=X:Z2=Y
2920 GOSUB 5310
2930 SOUND 400,1
2940 IF Z3=0 THEN 2960
2950 GOTO  2880
2960 A$=KL$:Z1=X:Z2=Y
2970 GOSUB 5310
2980 IF Z3=0 THEN 3100
2990 GOSUB 5460
3000 LOCATE 15,6:PRINT RH$;" Destroyed"
3010 FOR DE=100 TO 500 STEP 30:SOUND DE,1:NEXT DE
3020 K3=K3-1:K9=K9-1
3030 IF K9<=0 THEN 4000
3040 FOR I=1 TO 4
3050 IF INT(X+.5)<>K(I,1) THEN 3070
3060 IF INT(Y+.5)=K(I,2) THEN 3080
3070 NEXT I
3080 K(I,3)=0
3090 GOTO 3250
3100 A$=ST$
3110 Z1=X:Z2=Y
3120 GOSUB 5310
3130 IF Z3<>1 THEN 3190
3140 GOSUB 5460
3150 LOCATE 15,6:PRINT "STAR Destroyed  at  Sector"INT(X)"-"INT(Y)
3160 E5=E5-10
3170 A$="  ":Z1=X:Z2=Y:GOSUB 5240
3180 Q(Q1,Q2)=K3*100+B3*10+S3-1:S3=S3-1:GOTO  3300
3190 A$=BA$:Z1=X:Z2=Y
3200 GOSUB 5310
3210 GOSUB 5460
3220 E5=E5-200:LOCATE 15,6:PRINT "STARBASE Destroyed."
3230 FOR DE=150 TO 200 STEP 10:SOUND DE,1:NEXT
3240 B3=B3-1
3250 A$="  ":Z1=X:Z2=Y
3260 GOSUB 5240
3270 Q(Q1,Q2)=K3*100+B3*10+S3
3280 GOTO  3300
3290 LOCATE 15,6:PRINT "TORPEDO Missed."
3300 GOSUB 3690
3310 IF E<=0 THEN 2600
3320 GOTO  840
3330 GOSUB 5500:IF D(7)>=0 THEN 3350
3340 LOCATE 15,6:PRINT "Shield Control is NOT Operational.":GOTO  850
3350 LOCATE 15,6:PRINT "Energy available ="E+S
3360 SOUND 600,1
3370 LOCATE 17,6:INPUT"Number of units to transfer to shields";Z$:X=VAL(Z$)
3380 IF X<=0 THEN 850
3390 IF E+S-X<0 THEN 3350
3400 E=E+S-X:S=X
3410 GOTO  850
3420 NEXT
3430 GOSUB 5500:IF D(6)>=0 THEN 3460
3440 LOCATE 15,6:PRINT "Damage control is damaged !"
3450 GOTO  850
3460 GOSUB 5500:LOCATE 14,6:PRINT "DEVICE         STATE of REPAIR"
3470 FOR R1=1 TO 8
3480 GOSUB 5270
3490 IF D(R1)>=0 THEN PRINT "     Operational":GOTO 3590
3500 PRINT "     Damaged";
3510 LOCATE ,38:PRINT "ETR ="INT(-D(R1)+1)"Stardates"
3520 SOUND 450,1:J=CSRLIN
3530 LOCATE 23,6:INPUT"Energy for Repair";Z$:RE=VAL(Z$)
3540 LOCATE J,6:IF RE<1 OR RE>=E THEN 3590
3550 E=E-RE:IF RND>RE/700 THEN 3580
3560 LOCATE J-1,23:PRINT "Circuit OVERLOAD Compounds Damage !"
3570 D(R1)=D(R1)-FNR(RE/100):GOTO  3590
3580 D(R1)=D(R1)+FNR(RE/(-D(R1)*10)+1)-1
3590 NEXT R1
3600 GOTO  850
3610 LOCATE 15,6:PRINT "S.R. Sensor Report no "RH$"s in this Quadrant."
3620 GOTO  850
3630 X=K(I,1):Y=K(I,2):GOSUB 5460
3640 LOCATE ,40:PRINT RH$" Destroyed."
3650 K3=K3-1:K9=K9-1:A$="  ":Z1=K(I,1):Z2=K(I,2)
3660 GOSUB 5240
3670 Q(Q1,Q2)=K3*100+B3*10+S3
3680 RETURN
3690 ZA=0:IF C$<>"DOCKED" THEN 3720
3700 LOCATE 21,6:PRINT "Starbase Shields Protect the Enterprise."
3710 RETURN
3720 IF K3<=0 THEN 3830
3730 FOR I=1 TO 4
3740 IF K(I,3)<=0 THEN 3820
3750 H=INT(1.5*K(I,3)/FND(0))
3760 IF C$="DOCKED" THEN 3820
3770 IF ZA=0 THEN GOSUB 5500:LOCATE 14,17:PRINT "-- SHIELD CONTROL REPORT --":ZA=1:PRINT
3780 S=S-H
3790 LOCATE ,7:PRINT USING "###";H;:PRINT " Units hit the Enterprise from ";
3800 PRINT "Sector"K(I,1)"-"K(I,2)"
3810 IF S<0 THEN 3950
3820 NEXT I
3830 RETURN
3840 GOSUB 5500
3850 LOCATE 15,6:PRINT "The Enterprise is DEAD in Space. If you survive all"
3860 LOCATE 17,6:PRINT "impending attackes, you will be demoted to the rank"
3870 LOCATE 19,6:PRINT "of Private."
3880 IF K3<=0 THEN 3980
3890 GOSUB 3690
3900 GOTO 3880
3910 GOSUB 5500
3920 LOCATE 15,6:PRINT "You have Run out of Time."
3930 LOCATE 17,6:PRINT "It is Stardate"T"."
3940 GOTO  3980
3950 GOSUB 5500
3960 LOCATE 15,6:PRINT "The Enterprise has been DESTROYED !!!"
3970 LOCATE 17,6:PRINT "The Federation will be Conquered."
3980 LOCATE 19,6:PRINT "There are still"K9;RH$" Battle Cruisers left."
3990 GOTO  4060
4000 GOSUB 5500
4010 LOCATE 15,6:PRINT "The Last "RH$" Battle Cruiser in the"
4020 LOCATE 17,6:PRINT "Galaxy has been Destroyed."
4030 LOCATE 19,6:PRINT "The Federation has been Saved."
4040 EF=((K7/(T-T0))*5000)/(K8+2)
4050 LOCATE 21,6:PRINT "YOUR EFFICIENCY RATING WAS ";EF-E5
4060 LOCATE 23,6:PRINT "Do you want another Mission  Y/N  ?"
4070 A$=INKEY$:IF A$="" THEN 4070
4080 IF A$="Y" OR A$="y" THEN RUN
4090 CHAIN"MENU"
4100 FOR I=S1-1 TO S1+1
4110 FOR J=S2-1 TO S2+1
4120 IF I<1 OR I>8 OR J<1 OR J>8 THEN 4160
4130 A$=BA$:Z1=I:Z2=J
4140 GOSUB 5310
4150 IF Z3=1 THEN 4190
4160 NEXT J
4170 NEXT I
4180 D0=0:GOTO  4220
4190 D0=1:C$="DOCKED":E=2200:P=10:S=800
4200 FOR I=1 TO 8:D(I)=0:NEXT
4210 GOTO  4270
4220 IF K3>0 THEN 4250
4230 IF E<E0*.1 THEN 4260
4240 C$="Green":GOTO  4270
4250 C$="RED":GOTO  4270
4260 C$="Yellow"
4270 IF Q1<1 OR Q1>8 OR Q2<1 OR Q2>8 THEN C$="Lost !"
4280 IF D(2)>=0 THEN 4310
4290 GOSUB 5500:LOCATE 15,6:PRINT "Short Range Sensors are out."
4300 GOTO  4520
4310 LOCATE 1,1,0:COLOR 14
4320 PRINT "   1 2 3 4 5 6 7 8"
4330 COLOR 15:PRINT " ����������������Ŀ"
4340 FOR I=0 TO 7
4350 IF C$<>"RED" THEN 4370
4360 SOUND 700,4:SOUND 500,1
4370 COLOR 14:PRINT CHR$(I+49);:COLOR 15:PRINT "�";
4380 FOR J=1 TO 8:CC$=Q$(I*8+J):IF CC$="  " THEN 4390 ELSE COLOR 11
4385 IF CC$="��" OR CC$="��" THEN COLOR 15
4386 IF CC$=" "+CHR$(15) THEN COLOR 14
4390 PRINT CC$;
4400 NEXT J
4410 ON I GOTO 4430,4440,4450,4470,4480,4490,4500
4420 COLOR 15:PRINT "�";:COLOR 14:PRINT "         Stardate        ";:COLOR 10:PRINT T:GOTO  4510
4430 COLOR 15:PRINT "�";:COLOR 14:PRINT "         Condition        ";
4435 IF C$="RED" THEN COLOR 12 ELSE COLOR 10
4436 PRINT C$"   ":GOTO 4510
4440 COLOR 15:PRINT "�";:COLOR 14:PRINT "         Quadrant        ";:COLOR 10:PRINT Q1;:COLOR 14:PRINT ":";:COLOR 10:PRINT Q2:GOTO  4510
4450 COLOR 15:PRINT "�";:COLOR 14:PRINT "         Sector          ";:COLOR 10:PRINT INT(S1*10)/10;:COLOR 14:PRINT ":";:COLOR 10:PRINT INT(S2*10)/10
4460 GOTO  4510
4470 COLOR 15:PRINT "�";:COLOR 14:PRINT "         Total Energy    ";:COLOR 10:PRINT E"   ":GOTO  4510
4480 COLOR 15:PRINT "�";:COLOR 14:PRINT "         Photon Torpedos ";:COLOR 10:PRINT P" ":GOTO  4510
4490 COLOR 15:PRINT "�";:COLOR 14:PRINT "         Shields         ";:COLOR 10:PRINT S"  ":GOTO  4510
4500 COLOR 15:PRINT "�";:COLOR 14:PRINT "         "RH$"'s Left  ";:COLOR 10:PRINT K9" "
4510 NEXT I:COLOR 15:PRINT " ������������������"
4520 LOCATE 15,6:RETURN
4530 GOSUB 5500
4540 SOUND 600,1:LOCATE 15,6
4550 IF D(8)<0 THEN PRINT "Computer disabled.  System Crashed.":GOTO 850
4560 LOCATE 21,6:PRINT "Computer On-Line and,"
4570 LOCATE 23,6:INPUT "Awaiting Command  #  ";A$:A$=LEFT$(A$,1)
4580 IF A$="G" OR A$="g" THEN 4680
4590 IF A$="S" OR A$="s" THEN 4830
4600 IF A$="T" OR A$="t" THEN 4870
4610 IF A$="D" OR A$="d" THEN 4900
4620 LOCATE 14,6:PRINT "Functions available from computer are:-"
4630 LOCATE 16,12:PRINT "G = Cumulative Galaxy Record."
4640 LOCATE ,12:PRINT "S = Status Report."
4650 LOCATE ,12:PRINT "T = Photon Torpedo Direction Calculator."
4660 LOCATE ,12:PRINT "D = Direction-Distance Calculator.":PRINT
4670 GOTO  4560
4680 CLS:LOCATE 1,1,0:PRINT "                             S.P.A.C.E.  T.R.E.K."
4690 LOCATE 3,23:PRINT "Computer Record of Galaxy ("Q1"-"Q2")"
4700 LOCATE 5,15:PRINT "     1     2     3     4     5     6     7     8"
4710 O$="  �����������������������������������������������Ĵ"
4720 LOCATE ,15:PRINT "  �����������������������������������������������Ŀ"
4730 FOR I=1 TO 8:LOCATE ,15:PRINT USING "# _� ";I;
4740 FOR J=1 TO 8:LL=LEN(STR$(Z(I,J)))
4750 IF Z(I,J)=0 THEN PRINT "    � ";:GOTO  4770
4760 PRINT MID$("00",1,4-LL);MID$(STR$(Z(I,J)),2);" � ";
4770 NEXT J:PRINT:LOCATE ,15:PRINT O$:NEXT I
4780 LOCATE 22,15:PRINT "  �������������������������������������������������"
4790 LOCATE 24,15:PRINT "      Press any Key to Return to normal Display.  ";
4800 A$=INKEY$:IF A$="" THEN 4800
4810 CLS:LOCATE 1,1,0:PRINT "                             S.P.A.C.E.  T.R.E.K."
4820 LOCATE ,30:PRINT "��������������������":GOSUB 5500:GOTO 840
4830 GOSUB 5500:LOCATE 15,23:PRINT "Status Report:"
4840 LOCATE 17,19:PRINT USING "### ";K9;:PRINT RH$"s Left"
4850 LOCATE ,19:PRINT USING "### ";T0+T9-T;:PRINT "Stardates remaining"
4860 LOCATE ,19:PRINT USING "### ";B9;:PRINT "Starbases in galaxy":GOTO  850
4870 GOSUB 5500:FOR I=1 TO 4:IF K(I,3)<=0 THEN 5180
4880 C1=S1:A=S2:W1=K(I,1):X=K(I,2)
4890 GOTO  4970
4900 GOSUB 5500:LOCATE 15,6:PRINT "You are at Quadrant ("Q1"-"Q2")"
4910 LOCATE ,6:PRINT "           Sector   ("S1"-"S2")"
4920 C1=Q1:A=Q2
4930 LOCATE 18,6:INPUT "Target Co-Ordinates   ##,## ";Z$,ZZ$:W1=VAL(Z$)
4940 PRINT:X=VAL(ZZ$)
4950 FLAG=1
4960 IF X*W1=0 THEN 4930
4970 X=X-A:A=C1-W1
4980 A6=ABS(A):X6=ABS(X)
4990 IF X<0 THEN 5070
5000 IF A<0 THEN 5110
5010 IF X>0 THEN 5030
5020 IF A=0 THEN 5090
5030 C1=1
5040 IF A6<=X6 THEN 5060
5050 V5=C1+(((A6-X6)+A6)/A6):GOTO  5150
5060 V5=C1+(A6/X6):GOTO  5150
5070 IF A>0 THEN 5100
5080 IF X=0 THEN 5110
5090 C1=5:GOTO  5040
5100 C1=3:GOTO  5120
5110 C1=7
5120 IF A6>=X6 THEN 5140
5130 V5=C1+(((X6-A6)+X6)/X6):GOTO  5150
5140 V5=C1+(X6/A6)
5150 LOCATE ,17:PRINT USING "Direction =##.#";V5
5160 IF FLAG THEN LOCATE ,17:PRINT USING "Warp      =##.#";SQR(X^2+A^2):GOTO 5190
5170 IF FLAG THEN 5190
5180 NEXT I
5190 FLAG=0:GOTO  850
5200 R1=FNR(8):R2=FNR(8):A$="  ":Z1=R1:Z2=R2
5210 GOSUB 5310
5220 IF Z3=0 THEN 5200
5230 RETURN
5240 S8=8*INT(Z1-.5)+INT(Z2+.5)
5250 IF S8>64 THEN S8=64
5260 Q$(S8)=A$:RETURN
5270 S8=ABS(R1*12-11):LOCATE ,6
5280 IF S8<=72 THEN PRINT MID$(D$,S8,12);:GOTO  5300
5290 PRINT MID$(E$,S8-72,12);
5300 RETURN
5310 S8=8*INT(Z1-.5)+INT(Z2+.5)
5320 IF S8>64 THEN S8=64
5330 Z3=0
5340 IF Q$(S8)=A$ THEN Z3=1
5350 RETURN
5360 GOSUB 5500
5370 LOCATE 15,6:PRINT "COLLISION  with Starbase . ."
5380 LOCATE 17,6:PRINT "Prevents Docking for"
5390 LOCATE 19,6:PRINT "the next few Stardates."
5400 A$="��"
5410 GOSUB 5240
5420 GOTO  1820
5430 GOSUB 5500
5440 LOCATE 15,6:PRINT "COLLISION  with "RH$
5450 GOSUB 5460:GOTO 3960
5460 '
5470 IF D(2)<0 THEN RETURN
5480 FOR J=600 TO 200 STEP -10:SOUND J,1:NEXT J
5490 J=CSRLIN:LOCATE X+2,Y*2+1:COLOR 11:PRINT "��":LOCATE J,6:RETURN
5500 LOCATE 12,1,0:COLOR 15
5510 PRINT "���������������������������������������������������������Ŀ"
5520 FOR HM=1 TO 11
5530 PRINT "�                                                         �"
5540 NEXT
5550 LOCATE 24,1:PRINT "�                                                         �";
5560 LOCATE 25,1:PRINT "�����������������������������������������������������������";
5570 LOCATE 15,6,0:RETURN
5580 '
5590 COLOR 15:LOCATE 10,60,0:PRINT "������������������Ŀ"
5600 LOCATE 11,60:PRINT "�                  �"
5610 LOCATE 12,60:PRINT "������������������Ĵ"
5620 FOR HM=1 TO 11
5630 LOCATE 12+HM,60:PRINT "�                  �"
5640 NEXT
5650 LOCATE 23,60:PRINT "�                  �";
5660 LOCATE 24,60:PRINT "�                  �";
5670 LOCATE 25,60:PRINT "��������������������";
5680 LOCATE 15,6:RETURN
5690 KEY OFF:WIDTH 80:SCREEN 0,0,0,0:CLS:SCREEN 0,0,1,0:CLS:LOCATE 6,1
5695 COLOR 15
5700 PRINT "               ������������������������������������������������ͻ"
5710 PRINT "               ������������������������������������������������͹"
5720 PRINT "               � �                                            � �"
5730 PRINT "               � � ";:COLOR 11:PRINT "                SPACE TREK              ";:COLOR 15:PRINT "   � �"
5740 PRINT "               � �                                            � �"
5750 PRINT "               � �   COPYRIGHT (C) 1982  BY ENSIGN SOFTWARE   � �"
5760 PRINT "               � �                                            � �"
5770 PRINT "               � �";:COLOR 12:PRINT "          2312 N. COLE RD, SUITE E      ";:COLOR 15:PRINT "    � �"
5780 PRINT "               � � ";:COLOR 12:PRINT "         BOISE, ID  83704  U.S.A.       ";:COLOR 15:PRINT "   � �"
5790 PRINT "               � �";:COLOR 11:PRINT " DAY (208) 378-8086      EVE (208) 377-1938";:COLOR 15:PRINT " � �"
5800 PRINT "               � �                                            � �"
5810 PRINT "               ������������������������������������������������͹"
5820 PRINT "               ������������������������������������������������ͼ"
5825 DEF SEG=0:POKE &H417,PEEK(&H417) OR &H60
5830 SCREEN 0,0,0,1:FOR I%=1 TO 15000:NEXT:SCREEN 0,0,0,0:RETURN

