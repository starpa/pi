#!/bin/bash

DIR=/root/rclone_log.txt

if [ "$(date +%d)" -gt 7 ]; then
	exit
else
	rclone -v copy /mnt/external/NAS/NAS/ remote:clone-backup>>$DIR
	if [ $? -eq 0 ]
	then
		printf "Completed on: ">>$DIR
		date>>$DIR
	else 
		printf "FAILED!!!">>$DIR
	fi
printf "\n\n#########################\n\n">>$DIR
fi
