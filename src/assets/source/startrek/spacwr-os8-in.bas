5801 PRINT"INSTRUCTIONS TO TTY (1) OR LPT (0) ";
5802 INPUT A1
5803 IF A1=0 GOTO 5806
5804 FILEV #1:"TTY:"
5805 GOTO 5810
5806 FILEV #1:"LPT:"
5810 PRINT #1:"                     INSTRUCTIONS FOR SPACWR"
5815 PRINT #1:
5820 PRINT #1:
5821 PRINT #1:"THE GALAXY IS DIVIDED INTO AN 8,8 QUADRANT GRID"
5822 PRINT #1:"WHICH IS IN TURN DIVIDED INTO AN 8,8 SECTOR GRID."
5823 PRINT #1:
5824 PRINT #1:"THE CAST OF CHARACTERS IS AS FOLLOWS:"
5830 PRINT #1:"<*> = ENTERPRISE"
5840 PRINT #1:"+++ = KLINGON"
5850 PRINT#1:">!<=STARBASE"
5851 PRINT#1:" * =STAR"
5852 PRINT #1:
5853 PRINT #1:
5854 PRINT #1:
5870 PRINT #1:"COMMAND 0 = WARP ENGINE CONTROL:"
5880 PRINT #1:"  COURSE IS IN A CIRCULAR NUMERICAL      4  3  2"
5890 PRINT #1:"  VECTOR ARRANGEMENT AS SHOWN.            ";
5895 PRINT #1:CHR$(28);" ^ /"
5900 PRINT #1:"  INTEGER AND READ VALUES MAY BE           ";
5905 PRINT #1:CHR$(28);"^/"
5910 PRINT #1:"  USED.  THEREFORE COURSE 1.5 IS        5 ----- 1"
5920 PRINT #1:"  HALF WAY BETWEEN 1 AND 2.                ";
5925 PRINT #1:"/!";CHR$(28)
5930 PRINT #1:"                                          ";
5935 PRINT #1:"/ ! ";CHR$(28)
5940 PRINT #1:"  A VECTOR OF 9 IS UNDEFINED, BUT        6  7  8"
5950 PRINT #1:"  VALUES MAY APPROACH 9."
5960 PRINT #1:"    COURSE"
5970 PRINT #1:"  ONE WARP FACTOR IS THE SIZE OF"
5980 PRINT #1:"  ONE QUADRANT.  THEREFORE TO GET"
5990 PRINT #1:"  FROM QUADRANT 6,5 TO 5,5 YOU WOULD"
6000 PRINT #1:"  USE COURSE 3. WARP FACTOR 1"
6003 PRINT #1:
6004 PRINT #1:
6005 PRINT #1:
6010 PRINT #1:"COMMAND 1 = SHORT RANGE SENSOR SCAN"
6020 PRINT #1:"  PRINT THE QUADRANT YOU ARE CURRENTLY IN.  INCLUDING"
6030 PRINT #1:"  STARS, KLINGONS, STARBASES, AND THE ENTERPRISE, ALONG"
6040 PRINT #1:"  WITH OTHER PERTINATE INFORMATION."
6041 PRINT #1:
6042 PRINT #1:
6043 PRINT #1:
6045 PRINT #1:"COMMAND 2 = LONG RANGE SENSOR SCAN"
6060 PRINT #1:"  SHOWS CONDITIONS IN SPACE FOR ONE QUADRANT ON EACH SIDE"
6070 PRINT #1:"  OF THE ENTERPRISE IN THE MIDDLE OF THE SCAN. THE SCAN"
6080 PRINT #1:"  IS CODED IN THE FORM XXX, WHERE THE UNITS DIGIT IS THE "
6090 PRINT #1:"  NUMBER OF STARS, THE TENS DIGIT IS THE NUMBER OF STAR-"
6100 PRINT #1:"  BASES.  THE HUNDREDS DIGIT IS THE NUMBER OF KLINGONS."
6103 PRINT #1:
6104 PRINT #1:
6105 PRINT #1:
6110 PRINT #1:"COMMAND 3 = PHASER CONTROL"
6120 PRINT #1:"  ALLOWS YOU TO DESTROY THE KLINGONS BY HITTING HIM WITH"
6130 PRINT #1:"  SUITABLY LARGE NUMBERS OF ENERGY UNITS TO DEPLETE HIS "
6140 PRINT #1:"  SHIELD POWER.  KEEP IN MIND THAT WHEN YOU SHOOT AT HIM,"
6150 PRINT #1:"  HE GONNA SHOOT AT YOU, TOO!"
6151 PRINT #1:
6152 PRINT #1:
6155 PRINT #1:
6160 PRINT #1:"COMMAND 4 = PHOTON TORPEDO CONTROL"
6170 PRINT #1:"  COURSE IS THE SAME AS USED IN WARP ENGINE CONTROL"
6180 PRINT #1:"  IF YOU HIT THE KLINGON, HE IS DESTROYED AND CANNOT FIRE"
6190 PRINT #1:"  BACK AT YOU.  IF YOU MISS, YOU ARE SUBJECT TO HIS "
6200 PRINT #1:"  PHASER FIRE."
6205 PRINT #1:
6210 PRINT #1:"  NOTE:  THE LIBRARY COMPUTER (COMMAND 7) HAS AN OPTION"
6220 PRINT #1:"  TO COMPUTE TORPEDO TRAJECTORY FOR YOU (OPTION 2)."
6224 PRINT #1:PNT(12)
6225 PRINT #1:
6226 PRINT #1:
6227 PRINT #1:
6230 PRINT #1:"COMMAND 5 = SHIELD CONTROL"
6240 PRINT #1:"  DEFINES NUMBER OF ENERGY UNITS TO BE ASSIGNED TO SHIELDS"
6250 PRINT #1:"  ENERGY IS TAKEN FROM TOTAL SHIP'S ENERGY."
6251 PRINT #1:"  NOTE THAT TOTAL ENERY INCLUDES SHIELD ENERGY."
6252 PRINT #1:
6253 PRINT #1:
6254 PRINT #1:
6260 PRINT #1:"COMMAND 6 = DAMAGE CONTROL REPORT"
6270 PRINT #1:"  GIVES STATE OF REPAIRS OF ALL DEVICES.  A STATE OF REPAIR"
6280 PRINT #1:"  LESS THAN ZERO SHOWS THAT THE DEVICE IS TEMPORARALY"
6290 PRINT #1:"  DAMAGED."
6296 PRINT #1:
6297 PRINT #1:
6298 PRINT #1:
6300 PRINT #1:"COMMAND 7 = LIBRARY COMPUTER"
6310 PRINT #1:"  THE LIBRARY COMPUTER CONTAINS THREE OPTIONS:"
6320 PRINT #1:"    OPTION 0 = CUMULATIVE GALACTIC RECORD"
6330 PRINT #1:"WHICH SHOWS COMPUTER MEMORY OF THE RESULTS"
6340 PRINT #1:"OF ALL PREVIOUS LONG RANGE SENSOR SCANS"
6350 PRINT #1:"    OPTION 1 = STATUS REPORT"
6360 PRINT #1:"WHICH SHOWS NUMBER OF KLINGONS, STARDATES,"
6370 PRINT #1:"AND STARBASES LEFT."
6380 PRINT #1:"    OPTION 2 = PHOTON TORPEDO DATA"
6390 PRINT #1:"GIVES TRAJECTORY AND DISTANCE BETWEEN THE"
6400 PRINT #1:"ENTERPRISE AND ALL KLINGONS IN YOUR QUADRANT"
6401 PRINT #1:
6402 PRINT #1:
6405 PRINT #1:
6410 PRINT #1:"COMMAND 8 = BEGIN NEW CONTEST (WITH NEW GALAXY LAYOUT)."
6500 PRINT #1:
6505 PRINT #1:
6506 CLOSE #1
6508 CHAIN "DTA1:SPACWR.BA"
6510 END
