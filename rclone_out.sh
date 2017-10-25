#!/bin/bash

MONTH=$(date +"%m")
YEAR=$(date +"%Y")
DIR=/root/rclone_log.txt

if [ "$(date +%d)" -gt 107 ]; then
	exit
else
	rclone -v copy /mnt/external/NAS/NAS/ remote:clone-backup>>$DIR
	printf "Completed on: ">>$DIR
	date>>$DIR
	printf "\nFiles on Backblaze: ">>$DIR
	rclone ls remote:clone-backup/Public/daslizmeister/${YEAR}_${MONTH} | wc -l>>$DIR
	printf "\nFiles on External: ">>$DIR
	ls /mnt/external/NAS/NAS/Public/daslizmeister/${YEAR}_${MONTH} | wc -l>>$DIR
	printf "\nFiles on NAS: ">>$DIR

	df -h | grep /mnt/NAS >/dev/null
	if [ $? -eq 0 ]
	then
		ls /mnt/NAS/Public/daslizmeister/${YEAR}_${MONTH} | wc -l>>$DIR
	else 
		printf "NOT ATTACHED">>$DIR
	fi
printf "\n\n#########################\n\n">>$DIR
fi
