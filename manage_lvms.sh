#!/bin/bash
echo "-------- Welcome to LVM storage manager -------"

## script functionlity
## 1- option to all created lvms
## 2- create lvm from volume group
## 3- resize lvm and related file systems
## 4- add check for mounted file systems have 90% usage  

option_num=0
while [[ $option_num -lt 1 || $option_num -gt 4 ]]; do
    read -p "Enter correct option :"  option_num
done

create_lvm(){
    read -p "Enter lvm name: " lvm
    read -p "Enter the LVM size: " size
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