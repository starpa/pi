#!/bin/bash

printf "\n\n\n#######################################################\n\nThis script is to check on the files in each backup location"
printf "\n\nCheck each file by YEAR and MONTH\n"
printf "\nWhat year do you want to check? (eg. 20XX)\n"
read YEAR
printf "\nNow what month of that year? (eg. 01-12)\n"
read MONTH

printf "\n\nFiles on Backblaze: "
rclone ls remote:clone-backup/Public/daslizmeister/${YEAR}_${MONTH} | wc -l
printf "\nFiles on External: "
ls /mnt/external/NAS/NAS/Public/daslizmeister/${YEAR}_${MONTH} | wc -l
printf "\nFiles on NAS: "

df -h | grep /mnt/NAS >/dev/null
if [ $? -eq 0 ]
 then
	ls /mnt/NAS/Public/daslizmeister/${YEAR}_${MONTH} | wc -l
	printf "\n\n\n"

else
	printf "NOT attached\n\n\n"
fi
