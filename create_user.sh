#!/bin/bash



SCRIPT=$0


if [[ "$USER" != "root" ]];then
	echo "Please run this script with sudo privilage";
	exit 2
fi


echo "---- create user ----"
printf "\n"

read -p "Please Enter Username:" username

while [ -z "$username" ];do
	read -p "Please Enter Username:" username
done

printf "\n"

check_create_user (){
 local user=$1       	
 id $1 &> /dev/null

 if [ $? -eq 0 ]; then
	echo "$user is existing";
	exit 0;
 else
	echo "$user is not existing";
	sudo useradd -m -U -s /bin/bash $user
	echo "User $user created successfully"
 fi
}

check_create_user $username
exit 0
