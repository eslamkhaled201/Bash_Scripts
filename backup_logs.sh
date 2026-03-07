#!/bin/bash

if [[ "$USER" != "root" ]];then
        echo "Please run this script with sudo privilage";
        exit 2
fi



today=$(date '+%F')

if [ -d "/backup" ];then
	echo "backup dir exists" > /dev/null
else
	echo "creating /backup directory"
	sudo mkdir /backup
fi

backupname="logs-$today.tar.gz"
sudo tar -czf "/backup/$backupname" /var/log/* &> /var/log/backup_script.log

if [ $? -eq 0 ];
then

	backupsize=$(ls -lhs -t /backup | grep "logs" | awk '{printf $6}')
	echo "Backup name: $backupname  size:$backupsize"
	exit 0
else
	echo "backup failed"
	exit 1
fi
