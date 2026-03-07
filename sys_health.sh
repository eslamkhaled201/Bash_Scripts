#!/bin/bash

echo "--- System Health Check ----"

echo "--- uptime ---"
uptime | sudo tee -a /var/log/sys_health_report.txt

echo""
echo ""
echo "---- Disk usage ----"
df -h | sudo tee -a /var/log/sys_health_report.txt

echo ""
echo ""
echo "---- Memory Usage ----"
free -m | sudo tee -a /var/log/sys_health_report.txt

echo ""
echo ""
echo "---- Top 5 Process %CPU -----"
top -b -o %CPU | head -n 12 

