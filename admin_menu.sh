#!/bin/bash

echo "------ Admin Utilities Menu --------"

option_num=0

echo "1. View System Info"
echo "2. Check Disk Usage"
echo "3. List Active Users"
echo "4. Check Nignx Service"
echo "5. Exit"

echo " "
echo " "
while [[ $option_num -lt 1 || $option_num -gt 5 ]]
do
	read -p "Please enter option number : " option_num
done

echo " "
echo " "

view_systemInfo() {
   cat /etc/os-release
} 

check_diskUS() {
  df -h | sort -k 5
}

list_active_user() {
  who | awk -d '{print $1}' | sort -u
}

check_service() {
  service=$1
  if $(systemctl -q is-active $service);
  then
	 echo "$service is running"
  else 
	 echo "$service is not running"
  fi 
}

case $option_num in
	1) view_systemInfo ;;
	2) check_diskUS ;;
	3) list_active_user ;;
	4) check_service "nginx" ;;
	5) exit 0 ;;
esac
