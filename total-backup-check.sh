#!/bin/bash

i=0

printf "\nFILES ON NAS:\n"

while [ $i -lt 3 ]
do

df -h | grep /mnt/NAS>/dev/null

if [ $? -eq 0 ]
	then
	break
else
	printf "Mounting...\n"
	mount -a
	sleep 4
fi
i=$((i+1))
done

cd /mnt/NAS
find -maxdepth 1 -type d | while read -r dir; do printf "%s:\t" "$dir"; find "$dir" -type f | wc -l; done


printf "\n\nFILES ON EXTERNAL:\n"

cd /mnt/external/NAS/NAS/
find -maxdepth 1 -type d | while read -r dir; do printf "%s:\t" "$dir"; find "$dir" -type f | wc -l; done

printf "\n\nFILES ON CLOUD:\n"
rclone size remote:clone-backup
printf "\n\n"
