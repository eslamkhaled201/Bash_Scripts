#!/bin/bash

username=$1
group=$2
pass=$3
useradd -m -U -s /bin/bash -G $group $username
echo "$pass" | passwd --stdin $username

