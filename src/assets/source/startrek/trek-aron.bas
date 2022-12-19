2R(DlLd||p@p
BD||ll0($ 1000 !   TREK.BAS   27-JUL-73   ARON K. INSINGA   PROJECT DELTA
1060 DIM R(9%),D$(6%),D%(6%),G%(8%,8%),Q%(8%,8%),K%(9%,3%)
1070 MAT READ D$,R:MAT D%=ZER:RANDOMIZE
1080 DATA "WARP ENGINES", "S.R. SENSORS", "L.R. SENSORS"
1090 DATA "PHASER CNTRL", "PHOTON TUBES", "DAMAGE CNTRL"
1100 DATA .0001, .01, .03, .08, .28, 1.28, 3.28, 6.28,  13.28
1110 T%,T0%=INT(RND*20+20)*100%:T9%=40%:E%,E0%=3000%:P%,P0%=10%:S9%=200%
1130 DEF FND=SQR((K%(I%,1%)-S1%)^2%+(K%(I%,2%)-S2%)^2%)
1140 DEF FNR%=INT(RND*8+1)
1145 DEF FNW%(I%,J%)
1146 IF I%<1% OR I%>8% OR J%<1% OR J%>8% THEN FNW%=0% ELSE FNW%=-1%
1147 FNEND
1150 Q1%=FNR%:Q2%=FNR%:S1%=FNR%:S2%=FNR%
1160 !   SET UP GALAXY
1170 B9%,K9%=0%:FOR I%=1% TO 8%:FOR J%=1% TO 8%:K3%=0%
1180 C1=RND*64:K3%=K3%+1% IF C1<R(K0%) FOR K0%=1% TO 9%
1200 K9%=K9%+K3%:IF RND>.90 THEN B3%=1 ELSE B3%=0
1210 B9%=B9%+B3%:G%(I%,J%)=K3%*100%+B3%*10%+FNR%:NEXT J%:NEXT I%
1220 K0%=K9%
1230 IF B9%=0% THEN I%=FNR%:J%=FNR%:G%(I%,J%)=G%(I%,J%)+10%:B9%=1%
1240 &CHR$(11%);"ORDERS:   STARDATE =";T%;CHR$(10%)
1250 &"AS COMMANDER OF THE UNITED STARSHIP ENTERPRISE, YOUR MISSION"
1260 &"IS TO RID THE GALAXY OF THE DEADLY KLINGON MENACE.   TO DO THIS,"
1270 &"YOU MUST DESTROY THE KLINGON INVASION FORCE OF";K9%;"BATTLE"
1280 &"CRUISERS.   YOU HAVE";T9%;"SOLAR YEARS TO COMPLETE YOUR MISSION."
1290 &"( I.E. UNTIL STARDATE";T0%+T9%;")";CHR$(10%)
1300 &"GIVE COMMAND 'END' TO STOP THE GAME EARLY."
1310 INPUT "DO YOU REQUIRE FURTHER INSTRUCTIONS";A$
1320 GOTO 1360 UNLESS ASCII(A$)=89%:ON ERROR GOTO 1350
1330 OPEN "TREK.DOC" FOR  INPUT AS FILE 1%
1340 INPUT LINE #1%,A$:&A$;:GOTO 1340
1350 CLOSE 1%:A$=SYS(CHR$(0%)):RESUME 1360
1360 ON ERROR GOTO 2565:A$=SYS(CHR$(6%)+CHR$(-7%))
1370 &:INPUT "DO YOU WANT A CHART";A$:IF ASCII(A$)=78% GOTO 1420
1380 &CHR$(12%);"   ";:&" ";I%; FOR I%=1% TO 8%:&
1390 &"   ";:&"-"; FOR I%=1% TO 33%:&
1400 FOR I%=1% TO 8%:&I%;:&":   "; FOR J%=1% TO 8%:&":"
1410 &"   ";:&"-"; FOR J%=1% TO 33%:&:NEXT I%
1420 &CHR$(12%)"YOU ARE CURRENTLY IN QUADRANT";Q2%;"-";Q1%
1430 !   SET UP QUADRANT
1440 K3%,B3%,S3%=0%:IF NOT FNW%(Q1%,Q2%) GOTO 1460 ELSE MAT K=ZER
1450 X=G%(Q1%,Q2%):K3%=INT(X/100):B3%=INT(X/10)-10*K3%:S3%=X-INT(X/10)*10
1460 MAT Q%=ZER:Q%(S1%,S2%)=1%:FOR I%=1% TO K3%:GOSUB 2560
1470 Q%(R1%,R2%)=2%:K%(I%,1%)=R1%:K%(I%,2%)=R2%:K%(I%,3%)=S9%:NEXT I%
1480 FOR I%=1% TO B3%:GOSUB 2560:Q%(R1%,R2%)=3%:NEXT I%
1490 FOR I%=1% TO S3%:GOSUB 2560:Q%(R1%,R2%)=4%:NEXT I%
1500 A%=0%
1510 !   SHORT RANGE SENSOR SCAN
1520 IF E%>E0%/10% THEN C$="GREEN" ELSE C$="YELLOW":GOTO 1530
1521 FOR I%=Q1%-1% TO Q1%+1%:FOR J%=Q2%-1% TO Q2%+1%
1522 IF FNW%(I%,J%) THEN IF G%(I%,J%)>99% THEN C$="YELLOW":I%,J%=10%
1525 NEXT J%:NEXT I%
1530 FORI%=S1%-1TOS1%+1:FORJ%=S2%-1TOS2%+1:IFI%<1ORI%>8ORJ%<1ORJ%>8GOTO1560
1540 IF Q%(I%,J%)=3% THEN C$="DOCKED":E%=E0%:P%=P0%:GOTO 1570
1560 NEXT J%:NEXT I%:C$="RED" IF K3%:GOSUB 2370 UNLESS A%
1570 IF D%(2%) THEN &"SHORT RANGE SENSORS ARE INOPERABLE":GOTO1650
1580 &CHR$(10%);CHR$(10%);"---------------":FOR I%=1% TO 8%
1590 &MID(".EKB*",Q%(I%,J%)+1%,1%);" "; FOR J%=1% TO 8%:&
1600 NEXT I%:&"---------------";CHR$(10%)
1610 &"STARDATE:";T%;TAB(25%);"CONDITION: ";C$
1620 &"QUADRANT:";Q2%;"-";Q1%;TAB(25%);"SECTOR:";S2%;"-";S1%
1630 &"ENERGY:";E%;TAB(25%);"PHOTON TORPEDOS:";P%
1640 &"KLINGONS:";K9%
1650 !   COMMAND
1660 A$=SYS(CHR$(0%)):&
1670 INPUT"COMMAND";A$:A%=INSTR(1%,"CSLPTDE",LEFT(A$,1%))
1680 IF A% THEN ON A% GOTO 1700, 1510, 1960, 2040, 2140, 2310, 2570
1690 &"COMMANDS: C, S, L, P, T, D, E.":GOTO 1670
1700 !   WARP DRIVE
1710 INPUT "COURSE (1-8.99999)";C1;"WARP FACTOR (0-12)";W1
1720 IF W1*C1=0 GOTO 1650 ELSE IF C1<1ORC1>=9ORW1<0ORW1>12 GOTO 1710
1730 IF W1>.2 AND D%(1%)<0 THEN &"WARP ENGINES ARE DAMAGED, ";
     "MAXIMUM SPEED = WARP .2":GOTO 1710
1740 IF K3%>0 THEN GOSUB 2370
1750 D%(I%)=D%(I%)+1% IF D%(I%)<0% FOR I%=1% TO 6%:IF RND>.20 GOTO 1830
1760 IF RND>.5 GOTO 1790 ELSE I%=INT(RND*6+1)
1770 &"*** SPACE STORM, ";D$(I%);" DAMAGED ***"
1780 D%(I%)=D%(I%)-INT(RND*5+1):GOTO 1830
1790 GOTO 1810 IF D%(I%) FOR I%=1% TO 6% :GOTO 1830
1810 D%(I%)=D%(I%)-FIX(RND*D%(I%)-1):IF D%(I%)>0% THEN D%(I%)=0%
1820 &"*** TRUCE, ";D$(I%);" STATE OF REPAIR IMPROVED ***"
1830 T%=T%+1%:N%=INT(W1*8%):E%=E%-N%:GOTO 2450 IF E%<=0% OR T%>T0%+T9%
1840 Q%(S1%,S2%)=0%:X=S1%:Y=S2%:GOSUB 2300
1860 FOR I%=1% TO N%:X=X+X1:Y=Y+X2:Z1%=X+.5:Z2%=Y+.5
1870 GOTO 1920 IF NOT FNW%(Z1%,Z2%):GOTO 1880 IF Q%(Z1%,Z2%):NEXT I%
1875 S1%=X+.5:S2%=Y+.5:Q%(S1%,S2%)=1%
1876 IF S1%<1% THEN S1%=1% ELSE IF S1%>8% THEN S1%=8%
1877 IF S2%<1% THEN S2%=1% ELSE IF S2%>8% THEN S2%=8%
1879 GOTO 1510
1880 &"ENTERPRISE BLOCKED BY OBJECT AT SECTOR";Z2%;"-";Z1%
1885 X=X-X1:Y=Y-X2:GOTO 1875
1920 X=Q1%+W1*X1+(S1%-.5)/8:Y=Q2%+W1*X2+(S2%-.5)/8
1925 Z1%=X:Z2%=Y:S1%=8*(X-Z1%)+.5:Y=8*(Y-Z2%)+.5
1930 IF Z1%>8% THEN Q1%=8% ELSE IF Z1%<1% THEN Q1%=1% ELSE Q1%=Z1%
1940 IF Z2%>8% THEN Q2%=8% ELSE IF Z2%<1% THEN Q2%=1% ELSE Q2%=Z2%
1950 GOTO 1430
1960 !   LONG RANGE SENSOR SCAN
1970 IF D%(3%) THEN &"LONG RANGE SENSORS ARE INOPERABLE":GOTO 1650
1980 &"LONG RANGE SENSOR SCAN FOR QUADRANT";Q2%;"-";Q1%
1990 &CHR$(10%):FOR I%=Q1%-1% TO Q1%+1%:FOR J%=Q2%-1% TO Q2%+1%:&"  ";
2000 IF NOT FNW%(I%,J%) THEN &"000";:GOTO 2030
2010 A$=NUM$(G%(I%,J%)):A$=MID(A$,2%,LEN(A$)-2%)
2020 &RIGHT("00",LEN(A$));A$;
2030 NEXT J%:&:NEXT I%:GOTO 1650
2040 !   PHASER CONTROL
2050 IF D%(4%) THEN &"PHASER CONTROL IS DISABLED":GOTO 1650
2060 &"PHASERS LOCKED IN ON TARGET.  ENERGY AVAILABLE =";E%
2070 INPUT "NUMBER OF UNITS TO FIRE";X%
2080 IF X%<=0% GOTO 1650 ELSE IF X%>E% GOTO 2060 ELSE E%=E%-X%
2090 FOR I%=1% TO 9%:IF K%(I%,3%)<=0% GOTO 2130
2100 H%=INT(X%/FND*(2+RND)):K%(I%,3%)=K%(I%,3%)-H%
2110 &H%;"UNIT HIT ON KLINGON AT SECTOR";K%(I%,2%);"-";K%(I%,1%)
2120 IF K%(I%,3%)>0% THEN &"   (";K%(I%,3%);"LEFT)":GOTO 2130
2124 &"KLINGON AT SECTOR";K%(I%,2%);"-";K%(I%,1%);"DESTROYED!"
2126 K3%=K3%-1%:K9%=K9%-1%:Q%(K%(I%,1%),K%(I%,2%))=0%
2128 G%(Q1%,Q2%)=G%(Q1%,Q2%)-100%:GOTO 2500 IF K9%<=0%
2130 NEXT I%:GOSUB 2370:GOTO 1650
2140 !   PHOTON TORPEDOS
2150 IF D%(5%) THEN &"PHOTON TUBES ARE NOT OPERATIONAL":GOTO 1650
2160 IF P%<-0% THEN &"ALL PHOTON TORPEDOS EXPENDED":GOTO 1650
2170 INPUT "TORPEDO COURSE (1-8.99999)";C1
2180 IF C1=0 GOTO 1650 ELSE IF C1<1 OR C1>=9 GOTO 2170 ELSE GOSUB 2300
2190 X=S1%:Y=S2%:P%=P%-1%:&CHR$(10%);"TORPEDO TRACK:"
2200 X=X+X1:Y=Y+X2:Z1%=INT(X+.5):Z2%=INT(Y+.5)
2210 IF NOT FNW%(Z1%,Z2%) THEN &"MISSED":GOTO 2290
2220 & USING " #.# ! #.#",Y,"-",X:IF Q%(Z1%,Z2%)=0% GOTO 2200
2230 IF Q%(Z1%,Z2%)<>2% GOTO 2260 ELSE &"*** KLINGON DESTROYED ***"
2240 K%(I%,3%)=0% IF K%(I%,1%)=Z1% AND K%(I%,2%)=Z2% FOR I%=1% TO 9%
2250 K3%=K3%-1%:K9%=K9%-1%:IF K9%<=0% GOTO 2500 ELSE 2280
2260 IF Q%(Z1%,Z2%)=4% THEN &"STAR DESTROYED":S3%=S3%-1%:GOTO 2280
2270 &"*** STARBASE DESTROYED... CONGRATULATIONS ***":B3%=B3%-1%
2280 Q%(Z1%,Z2%)=0%:G%(Q1%,Q2%)=K3%*100%+B3%*10%+S3%
2290 GOSUB 2370:GOTO 1650
2300 X1=-SIN((C1-1)*.785398):X2=COS((C1-1)*.785398):RETURN
2310 !   DAMAGE CONTROL REPORT
2320 IF D%(6%) GOTO 1650 ELSE &CHR$(10%);"DEVICE","STATE";CHR$(10%)
2330 &D$(I%),D%(I%) FOR I%=1% TO 6%:GOTO 1650
2370 !   KLINGON ATTACK
2380 IF K3%=0% THEN RETURN
2390 IF C$="DOCKED" THEN &"STARBASE SHIELDS PROTECT ENTERPRISE":RETURN
2400 &:FOR I%=1% TO 9%:IF K%(I%,3%)<=0% GOTO 2440
2410 H%=INT((K%(I%,3%)/FND)*(2+RND))+1%:E%=E%-H%
2420 &H%;"UNIT HIT FROM KLINGON AT SECTOR";K%(I%,2%);"-";K%(I%,1%)
2430 &"   (";E%;"UNITS LEFT)"
2440 NEXT I%:IF E%>0% THEN RETURN
2450 &CHR$(11%);"IT IS STARDATE";T%;CHR$(10%)
2460 &"THE ENTERPRISE HAS BEEN DESTROYED."
2470 &"THE FEDERATION WILL BE CONQUERED."
2480 &"THERE ARE STILL";K9%;"KLINGON BATTLE CRUISERS."
2490 &"YOU ARE DEAD.":GOTO 2570
2500 &CHR$(11%);"IT IS STARDATE";T%;CHR$(10%)
2510 &"THE LAST KLINGON BATTLE CRUISER IN THE GALAXY HAS BEEN DESTROYED."
2520 &"THE FEDERATION HAS BEEN SAVED."
2530 &"YOU HAVE BEEN PROMOTED TO ADMIRAL."
2540 &K0%;"KLINGONS IN";T%-T0%;"YEARS.  RATING =";INT(K0%/(T%-T0%)*1000%)
2550 GOTO 2570
2560 R1%=FNR%:R2%=FNR%:IF Q%(R1%,R2%) GOTO 2560 ELSE RETURN
2565 IF ERR<>28% THEN &"ERROR";ERR;"AT LINE";ERL
2570 END
KEY
8
