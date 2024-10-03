#!/bin/bash

BKDATE=$(date +"%Y-%m-%d_%H-%M")
DLLNAME=libTeledataONEcfgIF.so
BKNAME=$DLLNAME.$BKDATE

echo "Copy BK DLL to " $BKNAME

expect<<END
 spawn rsync -avr WildflyContainerSrc_thirdtry/$DLLNAME $PRELIVE:/home/teledata/prelive/WildflyContainerSrc_thirdtry/$BKNAME
 expect "password:"
 send "Cremonese60\r"
 expect eof
END

echo "UPDATE " $DLLNAME

expect<<END2
 spawn rsync -avr WildflyContainerSrc_thirdtry/$DLLNAME $PRELIVE:/home/teledata/xtcloud-proxy/WildflyContainerSrc_thirdtry
 expect "password:"
 send "Cremonese60\r"
 expect eof
END2

echo "DONE."


