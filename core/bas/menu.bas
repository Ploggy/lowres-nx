MENU:

GOSUB NORMALPAL

PRINT "====================";
PRINT "     LOWRES NX"
PRINT "     MAIN MENU"
PRINT "====================";
PRINT
PRINT "1. LOWRES ADVENTURE"
PRINT "2. MARIO DEMO"
DO
  INPUT ">";A
  IF A=1 THEN GOTO LOWRESADV
  IF A=2 THEN GOTO MARIODEMO
LOOP

MARIODEMO:

CLS
PRINT "   LOWRES NX"
PRINT "         DEMO 0.1"
PRINT
PRINT "   WRITTEN BY"
PRINT "       TIMO KLOSS"
PRINT
PRINT "   PRESENTED BY"
PRINT "         INUTILIS"
PRINT
PRINT "        2017"

REM SCROLL UP TEXT
FOR I=112 TO 240
  POKE $FF44,I MOD 256
  WAIT VBL
NEXT I

WAIT 60

REM RESET SCROLL
POKE $FF44,0

REM COPY CHARACTERS AND MAPS TO VIDEO RAM
COPY START(0),LENGTH(0) TO $8000
COPY START(1),LENGTH(1) TO $9000
COPY START(2),LENGTH(2) TO $9800

ON RASTER GOSUB RASTERFX

TEXT 0,0,"SCORE"

REM INIT SPRITE
POKE $F000,64
POKE $F001,112
POKE $F002,130
POKE $F003,6
POKE $F004,5

JUMP=0

DO
  TICK=TICK+1

  REM SCROLL MAIN PLANE
  POKE $FF41,TICK*2 MOD $FF

  REM ANIMATE SPRITE
  IF JUMP>0 THEN
    POKE $F001,96
    POKE $F002,136
    JUMP=JUMP-1
  ELSE
    POKE $F001,112
    POKE $F002,130 + ((TICK/4) MOD 3) * 2
  END IF

  REM BOTTOM WATER
  WATERY=128+SIN(TICK*0.02)*12

  NUMBER 15,0,TICK/10,5

  REM SPACE KEY TO JUMP
  IF PEEK($FFC4)=32 THEN
    JUMP=15
    POKE $FFC4,0
  END IF
  IF PEEK($FFC4)=ASC("Q") THEN GOTO MENU

  WAIT VBL
LOOP


RASTERFX:
  Y=PEEK($FF45)

  REM 3D SCROLLING
  IF Y<8 THEN
    POKE $FF43,0
  ELSE IF Y<48 THEN
    POKE $FF43,TICK*3/4
  ELSE IF Y<72 THEN
    POKE $FF43,TICK/2
  ELSE IF Y>72+3*8 THEN
    POKE $FF43,TICK*3
  ELSE
    POKE $FF43,TICK*(0.5+(Y-71)/32)
  END IF

  REM BOTTOM WATER
  IF Y=0 THEN GOSUB NORMALPAL
  IF Y=INT(WATERY) THEN GOSUB WATERPAL
RETURN


NORMALPAL:
  COPY START(3),32 TO $F200
RETURN

WATERPAL:
  COPY START(3)+32,32 TO $F200
RETURN


REM ===============================


LOWRESADV:

HEALTH=10
NAME$=""
KEY=0

CLS
PRINT "  -======**======-"
PRINT "  LOWRES ADVENTURE"
PRINT "  -======**======-"
PRINT
WAIT 60
CLS
GOSUB STATUS
PRINT "YOU ARRIVE AT THE"
PRINT "KING'S CASTLE."
PRINT "KING: FINALLY YOU"
PRINT "ARE HERE TO RESCUE"
PRINT "OUR COUNTRY! THE"
PRINT "GHOSTS FROM THE"
PRINT "SHADOW LAND CAME AND";
PRINT "STOLE MY CROWN WHEN"
PRINT "I WAS SLEEPING!"
PRINT "THEY SAY YOU ARE THE";
PRINT "ONLY ONE WHO CAN"
PRINT "HELP US. WHAT IS"
PRINT "YOUR NAME?"
REM REPEAT
INPUT ">";NAME$
REM UNTIL LEN(NAME$)>0

PRINT
PRINT "KING: SO, "+NAME$+","
PRINT "I HAVE CHOSEN YOU TO";
PRINT "BRING BACK MY CROWN.";
PRINT "BUT BE CAREFUL, THE"
PRINT "SHADOW LAND IS"
PRINT "DANGEROUS!"
PRINT "ARE YOU READY?"
PRINT "1. YES!"
PRINT "2. NO, THANKS"
DO
INPUT ">";A
IF A=1 THEN GOTO CITY
IF A=2 THEN GOTO CASTLENO
LOOP

CASTLENO:
PRINT
PRINT "KING: WELL OK, I"
PRINT "GUESS IT'S FINE, I"
PRINT "DON'T REALLY NEED MY";
PRINT "CROWN."
GOTO GAMEOVER

CITY:
PRINT
PRINT "YOU ARE IN THE"
PRINT "KING'S CITY. FROM"
PRINT "HERE YOU HAVE"
PRINT "SEVERAL WAYS."
PRINT "1. GO TO SHADOW LAND";
PRINT "2. GO TO RIVER"
DO
INPUT ">";A
IF A=1 THEN GOTO SHADOW
IF A=2 THEN GOTO RIVER
LOOP

SHADOW:
PRINT
PRINT "A DARK AND SCARY"
PRINT "PATH LEADS YOU TO A"
PRINT "GIANT DOOR OF A"
PRINT "BLACK MOUNTAIN."
PRINT "1. OPEN DOOR"
PRINT "2. RETURN TO CITY"
DO
INPUT ">";A
IF A=1 THEN
IF KEY THEN GOTO SHADOWOPEN ELSE GOTO SHADOWLOCKED
END IF
IF A=2 THEN GOTO CITY
LOOP

SHADOWLOCKED:
PRINT
PRINT "THE DOOR IS LOCKED,"
PRINT "YOU NEED A KEY."
PRINT "YOU DECIDE TO RETURN";
PRINT "TO THE CITY."
INPUT "> PRESS ENTER";A
GOTO CITY

SHADOWOPEN:
PRINT
PRINT "YOU OPEN THE DOOR"
PRINT "WITH YOUR KEY AND"
PRINT "ENTER A GIANT CAVE."
PRINT "AT THE END OF THE"
PRINT "CAVE YOU SEE A GHOST";
PRINT "WITH THE CROWN OF"
PRINT "YOUR KING ON HIS"
PRINT "HEAD."
PRINT "1. ATTACK GHOST"
PRINT "2. TALK WITH GHOST"
PRINT "3. RETURN TO CITY"
DO
INPUT ">";A
IF A=1 THEN GOTO GHOSTATTACK
IF A=2 THEN GOTO GHOSTTALK
IF A=3 THEN GOTO CITY
LOOP

GHOSTATTACK:
PRINT
PRINT "THE FINAL FIGHT WITH";
PRINT "THE GHOST OF THE"
PRINT "SHADOW LAND BEGINS."
ENEMYHEALTH=5
GOSUB FIGHT
PRINT
IF ENEMYHEALTH=0 THEN
GOTO GHOSTDEFEATED
ELSE
PRINT "YOU RUN AWAY FROM"
PRINT "THE MOUNTAIN."
INPUT "> PRESS ENTER";A
GOTO CITY
END IF

GHOSTDEFEATED:
PRINT
PRINT "GHOST: OKAY, OKAY,"
PRINT "STOP PLEASE!"
PRINT "WHAT DO YOU WANT?"
PRINT "YOU: THE KING'S"
PRINT "CROWN!"
PRINT "GHOST: AH, WHY"
PRINT "DIDN'T YOU TELL IT"
PRINT "BEFORE?! I DON'T"
PRINT "LIKE IT ANYWAY."
PRINT "HERE, TAKE IT!"
PRINT "YOU: OH, THANKS!"
PRINT "SORRY FOR THAT"
PRINT "LITTLE FIGHT. I"
PRINT "DIDN'T WANT TO"
PRINT "OFFEND YOU."
PRINT "GHOST: DON'T WORRY."
PRINT "SEE YOU SOON."
INPUT "> PRESS ENTER";A
GOTO GAMEEND

GHOSTTALK:
PRINT
PRINT "GHOST: HELLO "+NAME$+","
PRINT "HOW ARE YOU? I SEE"
PRINT "YOU FOUND THE KEY TO";
PRINT "MY MOUNTAIN, NOT"
PRINT "BAD. WHAT DID YOU"
PRINT "COME FOR?"
PRINT "1. TO DEFEAT YOU!"
PRINT "2. TO ASK FOR THE"
PRINT "   CROWN"
PRINT "3. NOTHING, BYE!"
DO
INPUT ">";A
IF A=1 THEN GOTO GHOSTATTACK
IF A=2 THEN GOTO GHOSTCROWN
IF A=3 THEN GOTO CITY
LOOP

GHOSTCROWN:
PRINT
PRINT "GHOST: YEAH, YOU"
PRINT "KNOW, I FOUND IT"
PRINT "SOMEWHERE ON THE"
PRINT "STREET. IT ACTUALLY"
PRINT "DOESN'T FIT ME VERY"
PRINT "WELL. YOU CAN HAVE"
PRINT "IT, NO PROBLEM."
PRINT "YOU: OH COOL,"
PRINT "THANKS!"
INPUT "> PRESS ENTER";A
GOTO GAMEEND

RIVER:
PRINT
PRINT "YOU ARE AT THE"
PRINT "RIVER. THERE IS A"
PRINT "BIG WATERFALL."
PRINT "1. GO FISHING"
PRINT "2. GO BEHIND"
PRINT "   WATERFALL"
PRINT "3. RETURN TO CITY"
DO
INPUT ">";A
IF A=1 THEN GOTO FISHING
IF A=2 THEN GOTO WATERFALL
IF A=3 THEN GOTO CITY
LOOP

FISHING:
PRINT
R=RND
IF R<0.1 THEN
PRINT "YOU FISH AN OLD"
PRINT "SHOE. JUST IN CASE"
PRINT "YOU LOOK INSIDE AND"
PRINT "YOU FIND A SPECIAL"
PRINT "HEALING POTION!"
HEALTH=HEALTH+4
ELSE IF R<0.6 THEN
PRINT "YOU JUMP INTO THE"
PRINT "WATER AND GRAB A"
PRINT "FISH WITH YOUR"
PRINT "HANDS. IT LOOKS"
PRINT "TASTY AND YOU EAT"
PRINT "IT."
HEALTH=HEALTH+1
ELSE
PRINT "YOU TRY TO CATCH A"
PRINT "FISH BUT IT BITES"
PRINT "YOU IN THE HAND AND"
PRINT "YOU FALL"
PRINT "UNFAVORABLY."
HEALTH=HEALTH-2
END IF
GOSUB STATUS
INPUT "> PRESS ENTER";A
GOTO RIVER

WATERFALL:
PRINT
PRINT "BEHIND THE WATERFALL";
PRINT "YOU FIND THE"
PRINT "ENTRANCE TO A CAVE."
PRINT "FROM INSIDE YOU CAN"
PRINT "HEAR SOME STRANGE"
PRINT "SOUNDS."
PRINT "1. ENTER CAVE"
PRINT "2. RETURN TO RIVER"
DO
INPUT ">";A
IF A=1 THEN GOTO CAVE
IF A=2 THEN GOTO RIVER
LOOP

CAVE:
PRINT
PRINT "A CAVE MONSTER"
PRINT "ATTACKS YOU!"
ENEMYHEALTH=3
GOSUB FIGHT
PRINT
IF ENEMYHEALTH=0 THEN
PRINT "THE MONSTER FEELS"
PRINT "QUITE BAD AND"
PRINT "GOES TO SLEEP. YOU"
PRINT "FIND A KEY IN THE"
PRINT "CAVE AND TAKE IT."
KEY=-1
ELSE
PRINT "YOU RUN AWAY FROM"
PRINT "THE CAVE."
END IF
INPUT "> PRESS ENTER";A
GOTO RIVER

GAMEEND:
PRINT
PRINT "YOU RETURN TO THE"
PRINT "KING'S CASTLE AND"
PRINT "GIVE THE CROWN BACK"
PRINT "TO HIM."
PRINT "KING: WELL DONE,"
PRINT NAME$+"!"
PRINT "NOW PEACE AND"
PRINT "HARMONY WILL RETURN"
PRINT "TO OUR LAND."
PRINT "YOU: YEAH, SURE."
PRINT
PRINT "YOU GO HOME AND"
PRINT "WATCH TV."
PRINT
GOSUB STATUS
PRINT
PRINT "THE END"
GOTO RESTART


FIGHT:
DO
PRINT
IF RND<0.5 THEN
PRINT "THE ENEMY HITS YOU!"
HEALTH=HEALTH-1
ELSE
PRINT "YOU AVOID THE"
PRINT "ENEMY'S ATTACK."
END IF
GOSUB STATUS
PRINT "> (A)TTACK OR"
PRINT "  (F)LEE?"
DO
I$=INKEY$
IF I$="A" THEN GOTO ATTACK
IF I$="F" THEN RETURN
WAIT VBL
LOOP
ATTACK:
PRINT
IF RND<0.6 THEN
PRINT "YOU HIT THE ENEMY!"
ENEMYHEALTH=ENEMYHEALTH-1
IF ENEMYHEALTH=0 THEN RETURN
ELSE
PRINT "THE ENEMY AVOIDS"
PRINT "YOUR ATTACK."
END IF
PRINT "-- ENEMY'S H. "+STR$(ENEMYHEALTH)+" --"
LOOP
RETURN


STATUS:
IF HEALTH<0 THEN HEALTH=0
PRINT "-- HEALTH "+STR$(HEALTH)+" --"
IF HEALTH=0 THEN GOTO GAMEOVER
RETURN

GAMEOVER:
PRINT
PRINT "GAME OVER"

RESTART:
PRINT "> RESTART? (Y/N)"
DO
I$=INKEY$
IF I$="Y" THEN GOTO LOWRESADV
IF I$="N" THEN END
WAIT VBL
LOOP



#0: CHARACTERS
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
AA AA A6 AA AA BA AA AA AA AA BA 9A AA AA AA AE
FF FF FF FF FF FF BF BF AE AE AA AA 6A 6A 59 59
FA AA FE AA FE EA FE EA FE AE FA EA FE AA FA AE
AA A9 AA 69 9A 65 AA 65 AA A5 AA 65 AA A9 A6 A5
00 0F 00 FA 03 A6 0E AA 3A AA 3A 9A EA AA EA AA
6A AA 6A A6 1A AA 1A 6A 06 AA 01 AA 00 5A 00 05
AA AA AA A6 AA AA AA AA A9 AA AA AA AA AA AA AA
AA AA 6A A5 9A 9A A5 6A AA AA 6A A5 9A 9A A5 6A
00 00 C0 0F B0 3A AF EA AA AA 6A A5 9A 9A A5 6A
02 40 02 40 02 40 02 40 A2 4A 6A 65 1A 90 06 40
02 40 02 40 02 48 02 60 02 40 22 40 0A 40 02 40
0F 00 0F C0 0E BF 3A AF FA AC FE B0 03 F0 03 C0
00 00 00 00 00 00 00 00 00 00 03 00 30 30 33 33
3F FC EA A9 EE AD EA A9 EA E9 EA 99 E6 A9 15 54
A9 AA A6 AE AA FA AF EA BF AA FA 9A AA 6A AA AE
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 0F 00 FA 03 AA 0E AA 3A AA 3A AA EA AA EA AA
6A AA 6A AA 1A AA 1A AA 06 AA 01 AA 00 5A 00 05
AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA
AA AA AA AA AA AA AA AA AA AA AA AA AA AA 55 55
00 0F 00 3A 00 3A 03 EA 0E AA 0E AA 3A AA EA AA
40 00 90 00 A5 00 AA 40 AA 90 AA A4 AA A4 AA A9
AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA
AA AA BF A5 AA AA 56 BE AA AA BF AA AA AE A5 6A
AA AA 6A AA AB EA AA AA AA AB AA 5A AE AA AA AA
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 05 00 15 00 17 00 75 01 7F 01 7F 00 1F 00 19
54 00 55 40 DF 00 FF F0 F7 F0 D5 40 FF 00 58 00
00 00 00 05 00 15 00 17 00 75 01 7F 01 7F 00 1F
00 00 54 00 55 40 DF 00 FF F0 F7 F0 D5 40 FF 00
00 00 00 05 00 15 00 17 00 75 01 7F 01 7F 00 1F
00 00 54 00 55 40 DF 00 FF F0 F7 F0 D5 40 FF 00
00 15 00 55 00 5F 01 D7 05 FF 05 FF 00 7F 01 55
50 00 55 00 7C 00 FF C0 DF C0 55 00 FC 00 90 00
00 00 00 15 00 55 00 5F 01 D7 05 FF 05 FF 00 5F
00 FC 53 7C 55 FC 7D 54 FF D4 DF D0 55 50 FD 40
00 00 00 00 00 00 00 00 00 00 00 05 00 15 00 17
00 00 00 00 00 00 00 00 00 00 54 00 55 40 DF 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 59 01 59 01 5E 03 FA 00 FA 00 AA 00 54 01 54
59 00 59 40 AD 50 AB F0 AB C0 2A 80 05 40 05 50
00 55 01 55 0F EA 0F 2A 01 6A 01 6A 01 40 00 50
9B F0 9B F0 EB 40 A5 40 A5 40 85 40 00 00 00 00
00 65 01 A5 02 A5 05 AA 05 AA 05 A0 04 00 00 00
A0 00 53 C0 57 F0 57 F0 68 00 A8 00 15 00 15 40
01 95 02 95 02 AA 00 AA 00 A9 00 19 00 54 00 15
70 00 7C 00 BC 00 A8 00 68 00 50 00 10 00 00 00
05 56 05 D6 07 FA 03 DA 16 96 16 A5 16 A8 10 00
65 00 66 00 EA 04 AA 94 AA 94 6A 94 00 00 00 00
00 75 00 7F 00 5F 01 6F 01 7D 01 FA 00 56 01 54
FF F0 F7 F0 D5 40 FF 50 5D D0 AA F0 A9 50 01 54
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA
55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55

#1: FOREGROUND MAP
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02 01 02 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 03 80 04 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 03 80 04 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 02 01 02 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 03 80 04 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 03 00 04 00 00 00 00 00 02 01 02 01 00 00 00 00 00 00 00 00 0E 00 0E 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 03 80 04 80 00 00 00 00 0E 00 0E 00 0E 00 00 00 00 00
00 00 00 00 03 00 04 00 00 00 00 00 03 80 04 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 03 80 04 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 03 00 04 00 00 00 00 00 03 80 04 80 00 00 0E 00 0E 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 03 80 04 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 03 00 04 00 00 00 00 00 03 80 04 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0C 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 03 80 04 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 03 00 04 00 00 00 00 00 03 80 04 80 00 00 00 00 00 00 00 00 00 00 00 00 0C 00 0B 80 00 00 0C 00 00 00 00 00 00 00 00 00 00 00 03 80 04 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0D 81 0D 81 03 00 04 00 0D 81 0D 81 03 80 04 80 0D 81 0D 81 00 00 0D 81 0D 81 0D 01 0B 00 0B 80 0D 01 0B 00 0D 01 0D 01 0D 01 0D 01 0D 01 03 80 04 80 00 00 0D 81 0D 81 00 00 00 00 00 00 00 00
02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01 02 01
01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00
01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00
01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00
01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00
01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00

#2: BACKGROUND MAP
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 40 03 40 23 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 40 03 42 03 40 23 00 00 00 00 00 00 00 00 00 00 00 00 40 03 42 03 42 03 40 23 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 40 03 42 03 42 03 42 03 42 03 40 23 00 00 00 00 00 00 00 00 41 03 43 03 43 03 41 23 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 41 03 43 03 43 03 43 03 43 03 41 23 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 40 03 42 03 40 23 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 40 03 42 03 40 23 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 40 03 42 03 42 03 42 03 40 23 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 40 03 42 03 42 03 42 03 40 23 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 41 03 43 03 43 03 43 03 41 23 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 41 03 43 03 43 03 43 03 41 23 00 00 00 00 00 00 00 00 00 00 00 00 00 00
47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02 47 02
48 02 48 02 48 02 48 02 48 02 48 02 48 02 48 02 48 02 48 02 47 02 48 02 46 02 48 02 48 02 47 02 46 02 48 02 48 02 48 02 47 02 48 02 48 02 48 02 48 02 48 02 48 02 48 02 48 02 48 02 48 02 48 02
48 02 47 02 48 02 46 02 48 02 48 02 47 02 46 02 48 02 48 02 48 02 47 02 48 02 48 02 48 02 46 02 47 02 47 02 48 02 46 02 48 02 48 02 47 02 48 02 46 02 47 02 48 02 48 02 47 02 48 02 46 02 48 02
46 02 47 02 47 02 48 02 46 02 48 02 48 02 47 02 48 02 46 02 47 02 48 02 48 02 47 02 48 02 46 02 48 02 48 02 47 02 48 02 46 02 48 02 48 02 47 02 46 02 48 02 48 02 48 02 47 02 48 02 48 02 48 02
48 02 47 02 48 02 46 02 48 02 48 02 47 02 46 02 48 02 48 02 48 02 47 02 48 02 48 02 48 02 46 02 47 02 47 02 48 02 46 02 48 02 48 02 47 02 48 02 46 02 47 02 48 02 48 02 47 02 48 02 46 02 48 02
46 02 46 02 46 02 02 81 02 81 46 02 46 02 46 02 46 02 46 02 46 02 46 02 46 02 46 02 46 02 46 02 46 02 46 02 46 02 46 02 46 02 46 02 46 02 46 02 46 02 02 81 02 81 46 02 46 02 46 02 46 02 46 02
46 02 46 02 46 02 03 80 04 80 46 02 46 02 46 02 46 02 02 81 02 81 46 02 46 02 46 02 46 02 46 02 02 81 02 81 46 02 46 02 46 02 46 02 46 02 46 02 46 02 03 80 04 80 46 02 46 02 46 02 46 02 46 02
46 02 46 02 46 02 03 80 04 80 46 02 46 02 46 02 46 02 03 80 04 80 46 02 46 02 46 02 46 02 46 02 03 80 04 80 46 02 46 02 46 02 02 81 02 81 46 02 46 02 03 80 04 80 46 02 46 02 46 02 46 02 46 02
46 02 46 02 46 02 03 80 04 80 46 02 46 02 46 02 46 02 03 80 04 80 46 02 46 02 46 02 46 02 46 02 03 80 04 80 46 02 46 02 46 02 03 80 04 80 46 02 46 02 03 80 04 80 46 02 46 02 46 02 46 02 46 02

#3: COLOR PALETTES
07 10 24 38 00 04 08 0C 00 07 0B 0F 00 1B 2F 3F 00 34 38 3C 00 10 20 30 00 10 30 39 00 00 15 3F
07 07 0B 0F 00 0B 0F 0F 00 0B 0F 0F 00 0F 0F 0F 00 0B 0F 0F 00 07 07 07 00 00 00 00 00 00 00 00
