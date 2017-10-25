#!/bin/bash
mount -a
sleep 20
DIR="/root/rsync_log.txt"
MONTH=$(date +"%m")
YEAR=$(date +"%Y")

rsync -avr /mnt/NAS /mnt/external/NAS >> $DIR
printf "\nFiles in Liz External: " >> $DIR
ls -l /mnt/external/NAS/NAS/Public/daslizmeister/${YEAR}_${MONTH} | wc -l >> $DIR
printf "\nFiles in Liz NAS: " >> $DIR
ls -l /mnt/NAS/Public/daslizmeister/${YEAR}_${MONTH} | wc -l >> $DIR
printf "\nCompleted On: ">> $DIR
date >> $DIR
printf "\n\n">> $DIR
echo "#######################################################" >> $DIR
printf "\n\n">> $DIR



