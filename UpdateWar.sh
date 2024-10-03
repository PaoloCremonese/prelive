#!/bin/bash

BKDATE=$(date +"%Y-%m-%d_%H-%M")
BKNAME=TeleCloudONE.war.$BKDATE
WARNAME=TeleCloudONE.war

echo "Copy BK WAR to " $BKNAME

expect<<END
 spawn rsync -avr WildflyContainerSrc_thirdtry/$WARNAME $PRELIVE:/home/teledata/xtcloud-proxy/WildflyContainerSrc_thirdtry/$BKNAME
 expect "password:"
 send "Cremonese60\r"
 expect eof
END

echo "UPDATE " $WARNAME

expect<<END2
 spawn rsync -avr WildflyContainerSrc_thirdtry/$WARNAME $PRELIVE:/home/teledata/xtcloud-proxy/WildflyContainerSrc_thirdtry
 expect "password:"
 send "Cremonese60\r"
 expect eof
END2


echo "DONE."


