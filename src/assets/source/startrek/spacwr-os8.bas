100     REM *** PROGRAM SIMULATES TV PROGRAM STARTREK
110     REM *** WRITTEN BY MIKE MAYFIELD, CENTERLINE ENGINEERING
150 REMARKABLY TRANSLATED TO OS8 BASIC BY KAY R. FISHER ...DEC
151 PRINT PNT(0);PNT(0);PNT(0);PNT(29);PNT(0);
152 PRINT PNT(0);PNT(0);PNT(0);PNT(31);PNT(0);
180     PRINT "                  * * *  STAR TREK  * * *"\PRINT
200 PRINT "DO YOU WANT INSTRUCTIONS (THEY ARE LONG!)";\INPUT A$
205 RANDOMIZE
210 IF A$<>"YES" THEN 235
230 CHAIN "DTA1:SPACWR.IN"
235 DIM Z$(72),R$(72),Q$(72),S$(48),A$(3),O1$(24),D$(72)
236 DIM E$(20)
240 Q$="                                                  "
245 Q$=Q$&"                      "
250 Z$=Q$\R$=Q$\S$=SEG$(Q$,1,48)
260DIM G(8,8),C(9,2),K(3,3),N(3),Z(8,8)
290 T=INT(RND(1)*20+20)*100\T0=T
300 T9=30\D0=0\E=3000\P=10\S9=200\S=0\H8=0\E0=3000\P0=10
360 DEF FND(D)=SQR((K(I,1)-S1)**2+(K(I,2)-S2)**2)
370Q1=INT(RND(1)*8+1)
380Q2=INT(RND(1)*8+1)
390S1=INT(RND(1)*8+1)
400S2=INT(RND(1)*8+1)
420 C(2,1)=-1\C(3,1)=-1\C(4,1)=-1\C(4,2)=-1\C(5,2)=-1\C(6,2)=-1
430 C(1,1)=0\C(3,2)=0\C(5,1)=0\C(7,2)=0\C(9,1)=0
440 C(1,2)=1\C(2,2)=1\C(6,1)=1\C(7,1)=1\C(8,1)=1\C(8,2)=1\C(9,2)=1
460D$="WARP ENGINESS.R. SENSORSL.R. SENSORSPHASER CNTRL"
470 D$=D$&"PHOTON TUBESDAMAGE CNTRL"
480E$="SHIELD CNTRLCOMPUTER"
490 K9=0\B9=0
491REM *** SETS UP WHAT EXISTS IN GALAXY
500FOR I=1TO8
510FOR J=1TO8
520R1=RND(1)
530IF R1>.98 THEN 580
540IF R1>.95 THEN 610
550IF R1>.8 THEN 640
560K3=0\GOTO 660
580K3=3\K9=K9+3\GOTO 660
610K3=2\K9=K9+2\GOTO 660
640K3=1\K9=K9+1
660R1=RND(1)
670IF R1>.96 THEN 700
680B3=0\GOTO 720
700B3=1\B9=B9+1
720S3=INT(RND(1)*8+1)
730G(I,J)=K3*100+B3*10+S3
740Z(I,J)=0
750NEXT J
760NEXT I
770K7=K9
775PRINT\PRINT
776 IF B9>0 GOTO 780
777 G(6,3)=G(6,3)+10
778 B9=1
780 PRINT "YOU MUST DESTROY";K9;"KLINGONS IN";T9;
800 PRINT "STARDATES WITH";B9;"STARBASES"
810 S3=0\K3=0\B3=0
820 IF Q1<1 GOTO 920\IF Q1>8 GOTO 920\IF Q2<1 GOTO 920\IF Q2>8 GOTO 920
830X=G(Q1,Q2)*.01
840K3=INT(X)
850B3=INT((X-K3)*10)
860S3=G(Q1,Q2)-INT(G(Q1,Q2)*.1)*10
870 IF K3=0 THEN920
880 IF S>200 THEN 900
890 PRINT "   SHIELDS DANGEROUSLY LOW"
900 PRINT "COMBAT AREA      CONDITION RED"
920FOR I=1TO3
930K(I,3)=0
940NEXT I
950 Q$=Z$\R$=Z$
970 S$=SEG$(Z$,1,48)
971REM *** PUT ENTERPRISE SOMEWHERE
980 A$="<*>"
990Z1=S1
1000Z2=S2
1010GOSUB 5510
1020FOR I=1TOK3
1030 GOSUB 5380
1031REM *** PUT KLINGONS SOMEWHERE
1040A$="+++"
1050Z1=R1
1060Z2=R2
1070GOSUB 5510
1080K(I,1)=R1\ K(I,2)=R2\ K(I,3)=S9
1110NEXT I
1120FOR I=1TOB3
1130GOSUB 5380
1131REM *** PUT STARBASE(S) SOMEWHERE
1140A$=">!<"\ Z1=R1\ Z2=R2
1170GOSUB 5510
1180NEXT I
1190FOR I=1TOS3
1200GOSUB 5380
1201REM *** PUT STARS SOMEWHERE
1210A$=" * "\ Z1=R1\ Z2=R2
1240GOSUB 5510
1250NEXT I
1260GOSUB 4120
1270 PRINT "COMMAND:";\INPUT A
1290IF A=0 GOTO 1410
1291IF A=1 GOTO 1260
1292IF A=2 GOTO 2330
1293IF A=3 GOTO 2530
1294IF A=4 GOTO 2800
1295IF A=5 GOTO 3460
1296IF A=6 GOTO 3560
1297IF A=7 GOTO 4630
1298 IF A=8 GOTO 180
1310PRINT\PRINT"   0 = SET COURSE"
1320PRINT"   1 = SHORT RANGE SENSOR SCAN"
1330PRINT"   2 = LONG RANGE SENSOR SCAN"
1340PRINT"   3 = FIRE PHASERS"
1350PRINT"   4 = FIRE PHOTON TORPEDOES"
1360PRINT"   5 = SHIELD CONTROL"
1370PRINT"   6 = DAMAGE CONTROL REPORT"
1380PRINT"   7 = CALL ON LIBRARY COMPUTER"
1390PRINT"   8 = BEGIN NEW CONTEST"\PRINT
1400GOTO 1270
1401REM *** COURSE CONTROL CODE BEGINS HERE
1410 PRINT "COURSE (1-9):";\INPUT C1
1430IF C1=0 THEN 1270
1440 IF C1<1 GOTO 1410\IF C1=>9 GOTO 1410
1450 PRINT "WARP FACTOR (0-8):";\INPUT W1
1470 IF W1<=0 GOTO 1410\IF W1<=.2 GOTO 1510
1480 IF D(1)>=0 GOTO 1510\IF W1<=.2 GOTO 1510
1490 PRINT "WARP DRIVE IS DISABLED!"\PRINT "IMPULSE ENGINES ACTIVATED."
1495 PRINT "MAXIMUM SPEED = WARP .2"
1500GOTO 1410
1510IF K3<=0 THEN 1560
1520GOSUB 3790
1530IF K3<=0 THEN 1560
1540IF S<0 THEN 4000
1550GOTO 1610
1560    IF E>0 THEN 1610
1570    IF S<1 THEN 3920
1580 PRINT "YOU HAVE";E;"UNITS OF ENERGY"
1590 PRINT "SUGGEST YOU GET SOME FROM YOUR SHIELDS WHICH HAVE";S;"UNITS LEFT"
1600 GOTO 1270
1610FOR I=1TO8\ IF D(I)>=0 THEN 1640
1611REM *** FIX ANY DAMAGED DEVICE
1630D(I)=D(I)+1
1640NEXT I
1650IF RND(1)>.2 THEN 1810
1660R1=INT(RND(1)*8+1)
1670IF RND(1)>= .5 THEN 1750
1680D(R1)=D(R1)-(RND(1)*5+1)
1690 PRINT\PRINT "DAMAGE CONTROL REPORT:";
1710GOSUB 5610
1720PRINT" DAMAGED"\PRINT\GOTO 1810
1750D(R1)=D(R1)+(RND(1)*5+1)
1760 PRINT\PRINT "DAMAGE CONTROL REPORT:";
1780GOSUB 5610
1790PRINT" STATE OF REPAIR IMPROVED"\PRINT
1810 N=INT((W1+.0625)*8)\A$="   "\Z1=S1\Z2=S2
1850GOSUB 5510
1870X=S1\Y=S2
1890X1=C(C1,1)+(C(C1+1,1)-C(C1,1))*(C1-INT(C1))
1900X2=C(C1,2)+(C(C1+1,2)-C(C1,2))*(C1-INT(C1))
1910FOR I=1TON\S1=S1+X1\S2=S2+X2
1940 IF S1<1 GOTO 2170\IF S1>=9 GOTO 2170\IF S2<1 GOTO 2170\IF S2>=9 GOTO 2170
1950S8=S1*24+S2*3-26\ IF S8>72 THEN 1990
1970 IF SEG$(Q$,S8,S8+2)="   " GOTO 2070
1980GOTO 2030
1990IF S8>144 THEN 2020
2000 IF SEG$(R$,S8-72,S8-70)="   " GOTO 2070
2010GOTO 2030
2020 IF SEG$(S$,S8-144,S8-142)="   " GOTO 2070
2030 S1=INT(S1-X1)\S2=INT(S2-X2)\PRINT "WARP ENGINES SHUTDOWN AT SECTOR";
2035 PRINT S1;",";S2;"DUE TO BAD NAVAGATION"
2040 GOTO 2080
2070NEXT I
2075 S1=INT(S1)\S2=INT(S2)
2080A$="<*>"\Z1=S1\Z2=S2
2110GOSUB 5510
2120 E=E-N+5\T=(INT(10*T+1.1))/10\IF W1<1 THEN 2150
2140 T=(INT(10*T+9))/10
2150IF T>T0+T9 THEN 3970
2160GOTO 1260
2170X=Q1*8+X+X1*N\Y=Q2*8+Y+X2*N
2190Q1=INT(X/8)\Q2=INT(Y/8)\S1=INT(X-Q1*8)\S2=INT(Y-Q2*8)
2230IF S1<>0 THEN 2260
2240Q1=Q1-1\S1=8
2260IF S2<>0 THEN 2290
2270Q2=Q2-1\S2=8
2290T=T+1\E=E-N+5
2310IF T>T0 + T9 THEN 3970
2320GOTO 810
2321REM *** LONG RANGE SENSON SCAN CODE BEGINS HERE
2330IF D(3)>=0 THEN 2370
2340PRINT "LONG RANGE SENSORS ARE INOPERABLE"
2360GOTO 1270
2370 PRINT "LONG RANGE SENSOR SCAN FOR QUADRANT";Q1;",";Q2
2380PRINT"-------------------"
2390FOR I=Q1-1 TO Q1+1
2410FOR J=Q2-1 TO Q2+1
2420 IF I<1 GOTO 2500\IF I>8 GOTO 2500\IF J<1 GOTO 2500\IF J>8 GOTO 2500
2430N(J-Q2+2)=G(I,J)
2440 IF D(8)<0 THEN 2460
2450Z(I,J)=G(I,J)
2460NEXT J
2470 PRINT ":";N(1);TAB(7);":";N(2);TAB(13);":";N(3);TAB(19);":"
2480PRINT"-------------------"
2490NEXT I
2495 GOTO 1270
2500 N(J-Q2+2)=0\GOTO 2460
2501REM *** PHASER CONTROL CODE BEGINS HERE
2530IF K3<=0 THEN 3670
2540IF D(4)>=0 THEN 2570
2550 PRINT "PHASERS NOT OPERATIONAL"
2560GOTO 1270
2570 IF D(8)>=0 THEN 2590
2580PRINT " COMPUTER FAILURE HAMPERS ACCURACY"
2590 PRINT "PHASERS LOCKED ON TARGET.  ENERGY AVAILABLE =";E
2600 PRINT "NUMBER OF UNITS TO FIRE:";\INPUT X
2620IF X<=0 THEN 1270
2630 IF E-X<0 THEN 2590
2640E=E-X
2650GOSUB 3790
2660IF D(7)>=0 THEN 2680
2670X=X*RND(1)
2680FOR I=1TO3
2690IF K(I,3)<=0 THEN 2770
2700H=INT((X/K3/FND(0))*(2*RND(1)))
2710K(I,3)=K(I,3)-H
2720 PRINT H;" UNIT HIT ON KLINGON AT SECTOR";K(I,1);",";K(I,2);
2721 PRINT "     (";K(I,3);" LEFT)"
2740IF K(I,3)>0 THEN 2770
2750GOSUB 3690
2760IF K9<=0 THEN 4040
2770NEXT I
2780IF E<0 THEN 4000
2790GOTO 1270
2791REM *** PHOTON TORPEDO CODE BEGINS HERE
2800IF D(5)>=0 THEN 2830
2810PRINT "PHOTON TUBES ARE NOT OPERATIONAL"
2820GOTO 1270
2830IF P>0 THEN 2860
2840PRINT "ALL PHOTON TORPEDOES EXPENDED"
2850GOTO 1270
2860 PRINT "TORPEDO COURSE (1-9):";\INPUT C1
2880IF C1=0 THEN 1270
2890 IF C1<1 GOTO 2860\IF C1>=9 GOTO 2860
2900X1=C(C1,1)+(C(C1+1,1)-C(C1,1))*(C1-INT(C1))
2910X2=C(C1,2)+(C(C1+1,2)-C(C1,2))*(C1-INT(C1))
2920X=S1\Y=S2\P=P-1
2950 PRINT "TORPEDO TRACK:"
2960X=X+X1\Y=Y+X2
2980 IF X<1 GOTO 3420\IF X>=9 GOTO 3420\IF Y<1 GOTO 3420\IF Y>=9 GOTO3420
2990 PRINT "               ";X;",";Y
2992 IF INT(X+.25)<>INT(X+.75) GOTO 2960
2994 IF INT(Y+.25)<>INT(Y+.75) GOTO 2960
3000 Z1=INT(X+.5)\Z2=INT(Y+.5)
3010 A$="   "
3040GOSUB 5680
3050IF Z3=0 THEN 3070
3060GOTO 2960
3070 A$="+++"
3100GOSUB 5680
3110IF Z3=0 THEN 3220
3120PRINT "*** KLINGON DESTROYED ***"
3130K3=K3-1\K9=K9-1
3150IF K9<=0 THEN 4040
3160FOR I=1TO3\IF INT(X)<>K(I,1) THEN 3190
3180IF INT(Y)=K(I,2) THEN 3200
3190NEXT I
3200K(I,3)=0\GOTO 3360
3220 A$=" * "
3250GOSUB 5680
3260IF Z3=0 THEN 3290
3270PRINT "YOU CAN'T DESTROY STARS, SILLY"
3280GOTO 3420
3290 A$=">!<"
3320GOSUB 5680
3330IF Z3=0 THEN 2960
3340PRINT "*** STAR BASE DESTROYED *** .......CONGRATULATIONS"
3350B3=B3-1
3360 A$="   "
3390GOSUB 5510
3400G(Q1,Q2)=K3*100+B3*10+S3
3405 IF Z(Q1,Q2)<1 GOTO 3410\Z(Q1,Q2)=G(Q1,Q2)
3410GOTO 3430
3420PRINT "TORPEDO MISSED"
3430GOSUB 3790
3440IF E<0 THEN 4000
3450GOTO 1270
3451REM *** SHIELD CONTROL CODE BEGINS HERE
3460IF D(7)>=0 THEN 3490
3470PRINT "SHIELD CONTROL IS NON-OPERATIONAL"
3480GOTO 1270
3490 PRINT "ENERGY AVAILABLE =";E+S
3500 PRINT "   NUMBER OF UNITS TO SHIELDS:";\INPUT X
3510 IF X<0 GOTO 1270
3520IF E+S-X<0 THEN 3490
3530E=E+S-X\S=X
3550GOTO 1270
3551REM *** DAMAGE CONTROL REPORT CODE BEGINS HERE
3560IF D(6)>=0 THEN 3590
3570PRINT "DAMAGE CONTROL REPORT IS NOT AVAILABLE"
3580GOTO 1270
3590PRINT\PRINT "DEVICE        STATE OF REPAIR"
3610FOR R1=1TO8
3620GOSUB 5610
3630PRINTD(R1)
3640NEXT R1\PRINT
3660GOTO 1270
3670PRINT"SHORT RANGE SENSORS REPORT NO KLINGONS IN THIS QUADRANT"
3680GOTO 1270
3690 PRINT "KLINGON AT SECTOR ";K(I,1);",";K(I,2);"DESTROYED ***"
3710K3=K3-1\K9=K9-1\A$="   "\Z1=K(I,1)\Z2=K(I,2)
3760GOSUB 5510
3770G(Q1,Q2)=K3*100+B3*10+S3
3775 IF Z(Q1,Q2) <1 GOTO 3780\Z(Q1,Q2)=G(Q1,Q2)
3780RETURN
3790IF C$<>"DOCKED" THEN 3820
3800PRINT "STAR BASE SHIELDS PROTECT THE ENTERPRISE"
3810RETURN
3820    IF K3<=0 THEN 3910
3830FOR I=1TO3\IF K(I,3)<=0 THEN 3900
3850H=INT((K(I,3)/FND(0))*(2+RND(1)))\S=S-H
3860 PRINT "KLINGON ATTACK"
3870 PRINT H;" UNIT HIT ON ENTERPRISE FROM SECTOR ";K(I,1);",";K(I,2);
3871 PRINT "     (";S;" LEFT)"
3890IF S<0 THEN 4000
3900NEXT I
3910RETURN
3920PRINT "THE ENTERPRISE IS DEAD IN SPACE.  IF YOU SURVIVE ALL IMPENDING"
3930PRINT "ATTACKS YOU WILL BE DEMOTED TO THE RANK OF PRIVATE"
3940IF K3<=0 THEN 4020
3950GOSUB 3790
3960GOTO 3940
3970 PRINT\PRINT "IT IS STARDATE";T
3990GOTO 4020
3991REM *** NO ENERGY LEFT
4000PRINT\PRINT"THE ENTERPRISE HAS BEEN DESTROYED.  THE FEDERATION WILL BE CONQUERED"
4020 PRINT "THERE ARE STILL ";K9;" KLINGON BATTLE CRUISERS"
4030 PRINT\PRINT\PRINT\PRINT "YOU GET ANOTHER CHANCE...."\GOTO 180
4040PRINT\PRINT"THE LAST KLINGON BATTLE CRUISER IN THE GALAXY HAS BEEN DESTROYED"
4050PRINT"THE FEDERATION HAS BEEN SAVED!!!!!"\PRINT
4075E5=((K7/(T-T0))*1000)
4080 PRINT "YOUR EFFICIENCY RATING =";E5
4100 PRINT "YOUR ACTUAL TIME OF MISSION =";
4101 PRINT (INT((T-T0)*10))/10;"STARDATES"
4105PRINT\PRINT\PRINT
4106 PRINT "DO YOU WANT TO TRY AGAIN";\INPUT R$
4107 IF R$="YES" THEN 180
4110  GOTO 5820
4111REM *** SHORT RANGE SENSOR SCAN AND STARTING POINT CODE
4120FOR I=S1-1TO S1+1
4130FOR J=S2-1TO S2+1
4140 IF I<1 GOTO 4200\IF I>8 GOTO 4200\IF J<1 GOTO 4200\IF J>8 GOTO 4200
4150A$=">!<"\Z1=I\Z2=J
4180GOSUB 5680
4190IF Z3=1 THEN 4240
4200NEXT J
4210NEXT I
4220D0=0\GOTO 4310
4240D0=1\C$="DOCKED"\E=3000\P=10
4280PRINT "SHIELDS DROPPED FOR DOCKING PURPOSES"
4281 REMEMBER TO GET REPAIRS
4282 FOR I=1 TO 8
4284 IF D(I)=>0 GOTO 4288
4286 D(I)=0
4288 NEXT I
4290S=0\GOTO 4380
4310IF K3>0 THEN 4350
4320IF E<E0 *.1 THEN 4370
4330C$="GREEN"
4340GOTO 4380
4350C$="RED"\GOTO 4380
4370C$="YELLOW"
4380IF D(2)>=0 THEN 4430
4390PRINT\PRINT"*** SHORT RANGE SENSORS ARE OUT ***"\PRINT
4420GOTO 4530
4430 O1$="------------------------"
4435 PRINT\PRINT O1$
4445 PRINT SEG$(Q$,1,24)
4455 PRINT SEG$(Q$,25,48);TAB(41);"STARDATE";TAB(57);T
4465 PRINT SEG$(Q$,49,72);TAB(41);"CONDITION";TAB(58);C$
4475 PRINT SEG$(R$,1,24);TAB(41);"QUADRANT";TAB(57);Q1;",";Q2
4485 PRINT SEG$(R$,25,48);TAB(41);"SECTOR";TAB(57);S1;",";S2
4495 PRINT SEG$(R$,49,72);TAB(41);"TOTAL ENERGY";TAB(57);E
4505 PRINT SEG$(S$,1,24);TAB(41);"PHOTON TORPEDOES";TAB(57);P
4515 PRINT SEG$(S$,25,48);TAB(41);"SHIELDS";TAB(57);S
4520 PRINT O1$\PRINT
4530RETURN
4620REM *** LIBRARY COMPUTER CODE BEGINS HERE
4630IF D(8)>=0 THEN 4660
4640PRINT "COMPUTER DISABLED"\GOTO 1270
4660 PRINT "COMPUTER ACTIVE AND AWAITING COMMAND:";\INPUT A
4680IF A=0 GOTO 4740
4681IF A=1 GOTO 4830
4682IF A=2 GOTO 4880
4690PRINT "FUNCTIONS AVAILABLE FROM COMPUTER"
4700PRINT "   0 = CUMULATIVE GALACTIC RECORD"
4710PRINT "   1 = STATUS REPORT"
4720PRINT "   2 = PHOTON TORPEDO DATA"
4730GOTO 4660
4731REM *** CUMULATIVE GALACTIC RECORD CODE BEGINS HERE
4740 PRINT "COMPUTER RECORD OF GALAXY FOR ALL LONG RANGE SENSOR SCANS"
4760PRINT"     1     2     3     4     5     6     7     8"
4770PRINT"   ----- ----- ----- ----- ----- ----- ----- -----"
4780FOR I=1TO8
4795 PRINT I;TAB(5);Z(I,1);TAB(11);Z(I,2);TAB(17);Z(I,3);TAB(23);Z(I,4);
4796 PRINT TAB(29);Z(I,5);TAB(35);Z(I,6);TAB(41);Z(I,7);TAB(47);Z(I,8)
4800PRINT"   ----- ----- ----- ----- ----- ----- ----- -----"
4810NEXT I
4820GOTO 1270
4821REM *** STATUS REPORT CODE BEGINS HERE
4830PRINT "   STATUS REPORT"
4840 PRINT "NUMBER OF KLINGONS LEFT =";K9
4850 V5=(INT(((T0+T9)-T)*10))/10
4851PRINT "NUMBER OF STARDATES LEFT =";V5
4860 PRINT "NUMBER OF STARBASES LEFT =";B9
4870GOTO 3560
4880PRINT\H8=0
4881REM *** PHOTON TORPEDO DATA CODE BEGINS HERE
4900FOR I=1TO3
4910IF K(I,3)<=0 THEN 5260
4920C1=S1\A=S2\W1=K(I,1)\X=K(I,2)
4960GOTO 5010
4970 PRINT "YOU ARE AT QUADRANT ( ";Q1;",";Q2;" ) SECTOR ( ";S1;",";S2;" )"
4990 PRINT "SHIP AND TARGET COORDINATES ARE:";\INPUT C1,A,W1,X
5010X=X-A\A=C1-W1
5030IF X<0 THEN 5130
5031IF A<0 THEN 5190
5050IF X>0 THEN 5070
5051IF A=0 THEN 5150
5070C1=1
5080IF ABS(A) <= ABS(X) THEN 5110
5085V5=C1+(((ABS(A)-ABS(X))+ABS(A))/ABS(A))
5090 PRINT "DIRECTION =";V5
5100GOTO 5240
5110 PRINT "DIRECTION =";C1+(ABS(A)/ABS(X))
5120GOTO 5240
5130IF A>0 THEN 5170
5140IF X=0 THEN 5190
5150C1=5\GOTO 5080
5170C1=3\GOTO5200
5190C1=7
5200IF ABS(A)>=ABS(X) THEN 5230
5210 PRINT "DIRECTION =";C1+(((ABS(X)-ABS(A))+ABS(X))/ABS(X))
5220GOTO 5240
5230 PRINT "DIRECTION =";C1+(ABS(X)/ABS(A))
5240 PRINT "DISTANCE =";SQR(X**2+A**2)
5250IF H8=1 THEN 5320
5260NEXT I
5270H8=0
5280 PRINT "DO YOU WANT TO USE THE CALCULATOR";\INPUT A$
5300IF A$="YES" THEN 4970
5310IF A$<>"NO" THEN 5280
5320GOTO 1270
5321REM *** END OF LIBRARY COMPUTER CODE
5380R1=INT(RND(1)*8+1)\R2=INT(RND(1)*8+1)\A$="   "\Z1=R1\Z2=R2
5430GOSUB 5680
5440IF Z3=0 THEN 5380
5450RETURN
5510REM *** INSERTION IN STRING ARRAY FOR QUADRANT ***
5520S8=Z1*24+Z2*3-26\IF S8>72 THEN 5560
5540 Q$=SEG$(Q$,1,S8-1)&A$&SEG$(Q$,S8+3,72)
5550GOTO 5600
5560IF S8>144 THEN 5590
5570  R$=SEG$(R$,1,S8-73)&A$&SEG$(R$,S8-69,72)
5580GOTO 5600
5590 S$=SEG$(S$,1,S8-145)&A$&SEG$(S$,S8-141,72)
5600RETURN
5610REM *** PRINTS DEVICE NAME FROM ARRAY***
5620S8=R1*12-11\IF S8>72 THEN 5660
5640 PRINT SEG$(D$,S8,S8+11);\GOTO 5670
5660 PRINT SEG$(E$,S8-72,S8-61);
5670RETURN
5680REM ***STRING COMPARISON IN QUADRANT ARRAY***
5690S8=Z1*24+Z2*3-26\Z3=0\IF S8>72 THEN 5750
5720 IF SEG$(Q$,S8,S8+2)<>A$ THEN 5810
5730Z3=1\GOTO 5810
5750IF S8>144 THEN 5790
5760 IF SEG$(R$,S8-72,S8-70)<>A$ THEN 5810
5770Z3=1\GOTO 5810
5790 IF SEG$(S$,S8-144,S8-142)<>A$ THEN 5810
5800Z3=1
5810RETURN
5820 END
