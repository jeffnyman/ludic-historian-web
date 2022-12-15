5 RANDOMIZE
10 DIM P(4,2)
20 PRINT "THIS IS A GAME OF HIDE AND SEEK."
30 PRINT
40 PRINT "THE OBJECT OF THE GAME IS TO FIND THE FOUR PLAYERS "
50 PRINT "WHO ARE HIDDEN ON A 10 BY 10 GRID."
60 PRINT
70 PRINT "HOMEBASE WILL BE THE POSITION AT (0,0) AND ANY GUESS "
80 PRINT "YOU MAKE SHOULD CONTAIN TWO NUMBERS.  THE FIRST GIVES"
90 PRINT "THE UNIT DISTANCE RIGHT OF THE HOMEBASE AND THE SECOND"
100 PRINT "IS THE UNIT DISTANCE ABOVE HOMEBASE."
110 PRINT
120 PRINT "YOU WILL HAVE TEN ATTEMPTS TO LOCATE THESE PLAYERS"
130 PRINT "AND WILL BE TOLD HOW CLOSE YOUR GUESS IS"
140 PRINT "TO EACH PLAYER."
150 PRINT
160 PRINT "IF AFTER 10 TRIES YOU ARE UNABLE TO CARRY OUT THIS TASK"
170 PRINT "YOU MAY CONTINUE TO BE 'IT', BUT THE PLAYERS WILL"
180 PRINT "BE PERMITTED TO MOVE TO NEW LOCATIONS."
190 PRINT
200 PRINT
210 PRINT "ARE YOU READY TO BEGIN?"
220 INPUT A$
230 IF A$="N0" GOTO 620
240 GOSUB 1000
250 LET T=0
260 LET T=T+1
270 PRINT
280 PRINT
290 PRINT "TURN NUMBER";T;", WHAT IS YOUR GUESS?"
300 INPUT M,N
310 FOR I=1 TO 4
320 IF P(I,1)=-1 GOTO 400
330 IF P(I,1)<>M GOTO 380
340 IF P(I,2)<>M GOTO 380
350 LET P(I,1)=-1
360 PRINT "YOU HAVE FOUND PLAYER";I
370 GOTO 400
380 LET D=SQR((P(I,1)-M)*2 + P(I,2)-N)+2)
390 PRINT "YOUR DISTANCE FROM PLAYER";I;"IS";INT(D*10);"10;"UNIT(S)."
400 NEXT I
410 FOR J=1 TO 4
420 IF P(J,1)<>-1 GOTO 470
430 NEXT J
440 PRINT
450 PRINT "YOU HAVE FOUND ALL THE PLAYERS IN ";T;" TURNS!"
460 GOTO 580
470 IF T<10 GOTO 260
480 PRINT
490 PRINT "YOU DIDN'T FIND ALL THE PLAYERS IN TEN TRIES."
500 PRINT "DO YOU WANT TO KNOW WHERE THE PLAYERS YOU DIDN'T "
510 PRINT "FIND WERE HIDDEN?"
520 INPUT B$
530 IF B$="NO" GOTO 580
540 FOR I=1 TO 4
550 IF P(I,1)=-1 GOTO 570
560 PRINT "PLAYER";I;" HID AT (";P(I,1);",";P(I,2);")."
570 NEXT I
580 PRINT
590 PRINT "DO YOU WANT TO PLAY AGAIN?"
600 INPUT C$
610 IF C$="YES" GOTO 240
520 PRINT "THEN PLEASE LOGOUT."
630 GOTO 9999
1000 FOR J=1 TO 2
1010 FOR I=1 TO 4
1020 P(I,J)=INT(RND*10)
1030 NEXT I
1040 NEXT J
1050 RETURN
9999 END
