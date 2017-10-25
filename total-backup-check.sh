#!/bin/bash


printf "\nFILES ON NAS:\n"

df -h | grep /mnt/NAS>/dev/null
if [ $? -eq 0 ]
then
	cd /mnt/NAS
	find -maxdepth 1 -type d | while read -r dir; do printf "%s:\t" "$dir"; find "$dir" -type f | wc -l; done

else
	printf "NOT ATTACHED"
fi

printf "\n\nFILES ON EXTERNAL:\n"

cd /mnt/external/NAS/NAS/
find -maxdepth 1 -type d | while read -r dir; do printf "%s:\t" "$dir"; find "$dir" -type f | wc -l; done

printf "\n\nFILES ON CLOUD:\n"
rclone size remote:clone-backup
