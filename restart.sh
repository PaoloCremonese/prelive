#!/bin/bash

# Restert PRELIVE script

echo "Restart PRELIVE containers"

# 1.  stop containers
echo "Stop containers"
cd /home/teledata/prelive
docker compose down

# 2.  supposing all the files has been placed in the right place, build the container
# echo "Build Wildfly"
# cd /home/teledata/prelive/WildflyContainerSrc_thirdtry
# docker build --tag paolocremonese/wf-9.0.2.final:thirdtry .

echo "Wait 1 second ..."
sleep 1

# 3.  start the container again
echo "Start containers again"
cd /home/teledata/prelive
docker compose up --detach

echo "PRELIVE RESTARTED !!!"



