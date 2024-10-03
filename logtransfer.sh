#!/bin/sh

YDATE=$(date -d "yesterday" +"%Y-%m-%d")
RMDATE=$(date -d "15 day ago" +"%Y-%m-%d")
FNAME=server.log.$YDATE
RMNAME=server.log.$RMDATE

echo "Copy Log " $FNAME
echo "Remove Log " $RMNAME

docker cp prelive:/opt/jboss/wildfly/standalone/log/$FNAME /home/teledata/prelive/Wildfly_Logs
rm /home/teledata/prelive/Wildfly_Logs/$RMNAME
ls -la /home/teledata/prelive/Wildfly_Logs

echo "DONE."


