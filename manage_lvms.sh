#!/bin/bash
echo "-------- Welcome to LVM storage manager -------"

## script functionlity
## 1- option to all created lvms
## 2- create lvm from volume group
## 3- resize lvm and related file systems
## 4- add check for mounted file systems have 90% usage  

echo "1) list LVMs"
echo "2) create LVM from volume group"
echo -e "\n"
option_num=0
while [[ $option_num -lt 1 || $option_num -gt 4 ]]; do
    read -p "Enter correct option :"  option_num
done

create_lvm(){
    sizeRegx="[1-9][M|G]$"
    size=""
    read -p "Enter lvm name: " lvm
    while [[ ! $size =~ $sizeRegx ]]; do
	    echo -e "Enter LVM size \n Ex: 1G or 2M : "
    	    read size
    done
    read -p "Enter the Volume group name: " vgname    
    sudo lvcreate -L $size -n $lvm $vgname 2> /dev/null

    if [ $? -eq 0 ];then 
        echo "LVM created"
    else
        echo "LVM creation failed"
    fi
}

case $option_num in
    1) sudo lvs;;
    2) create_lvm;;
esac
