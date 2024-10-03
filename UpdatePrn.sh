#!/bin/bash

BKDATE=$(date +"%Y-%m-%d_%H-%M")
PRNNAME=stampaTldOne
BKNAME=$PRNNAME.$BKDATE

echo "Copy BK of PRN : " $BKNAME

expect<<END
 spawn rsync -avr WildflyContainerSrc_thirdtry/$PRNNAME $PRELIVE:/home/teledata/xtcloud-proxy/WildflyContainerSrc_thirdtry/$BKNAME
 expect "password:"
 send "Cremonese60\r"
 expect eof
END


echo "UPDATE " $PRNNAME

expect<<END2
 spawn rsync -avr WildflyContainerSrc_thirdtry/$PRNNAME $PRELIVE:/home/teledata/xtcloud-proxy/WildflyContainerSrc_thirdtry
 expect "password:"
 send "Cremonese60\r"
 expect eof
END2


echo "DONE."


