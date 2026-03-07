#!/bin/bash


script=$0
app=$1

if [ $# -ne 1 ];
then
	echo "Usage : $0 <package name>"
	exit 2
fi

related_packages=$(yum list installed | grep $app | awk -d" " '{ print $1}')

for pack in $related_packages;
do
	
	yum list installed $pack &> /dev/null && sudo dnf remove -y $pack &> /dev/null && echo "$pack removed successfully"	
done
