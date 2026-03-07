#!/bin/bash

echo "----- Old Logs Clean up ------"

## check if there files older than 7 days 
## save files for cleanup
## create loop for deletion
## print delete line for each file
## output (date time : deleted file path ) delete log for each file 


old_log_files=$(sudo find /var/log/ -name "*.log" -atime +7)

if [[ -z $old_log_files ]];
then
	echo "$(date '+%F %T') : There are no logs older then 7 days" | sudo tee -a /var/log/cleanup_history.log
	exit 0
fi

for file in $old_log_files
do
	sudo rm $file
	echo "$(date '+%F %T') : Deleted log file $file" | sudo tee -a /var/log/cleanup_history.log
done
exit 0
