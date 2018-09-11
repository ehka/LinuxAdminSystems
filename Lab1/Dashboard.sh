#!/bin/bash

LoadAverage=$(uptime | awk '{print $10, $11, $12}')
FreeRAM=$(free | awk '{print $4}' | sed -n '2p')
loReceived=$(cat /proc/net/dev | awk '{print $2}' |sed -n '3p')
loTransmitted=$(cat /proc/net/dev | awk '{print $10}' |sed -n '3p')
enp0s3Received=$(cat /proc/net/dev | awk '{print $2}' |sed -n '4p')
enp0s3Transmitted=$(cat /proc/net/dev | awk '{print $10}' |sed -n '4p')
PING= $(ping -c 1 www.google.com >/dev/null 2>&1)
TotalUsers=$(cat /etc/passwd | wc -l)
ActiveUsers=$(users | wc -w)
Shells=$(cat /etc/passwd | cut -d: -f7 | sort | uniq -c | awk ' {print $2, ":", $1; }')
TotalFiles=$(find / -type f -print | wc -l)
TotalDirectories=$(find / -type d -print |wc -l)

echo -e "\n\nCPU AND MEMORY RESOURCES -----"
echo "CPU Load Average: $(uptime | sed 's/.*\: //')	Free RAM: $FreeRAM"

echo -e "\n\nNETWORK CONNECTIONS -----"
echo "lo Bytes Received: $loReceived	Bytes Transmitted: $loTransmitted"
echo "enp0s3 Bytes Received: $enp0s3Received	Bytes Transmitted: $enp0s3Transmitted"

$PING
if [ $? -eq 0 ]; then
	echo "Internet Connectivity: Yes"
else
	echo "Internet Connectivity: No"
fi

echo -e "\n\nACCOUNT INFORMATION -----"
echo "Total Users: $TotalUsers		Number Active: $ActiveUsers"
echo -e "Shells:\n$Shells"

echo -e "\n\nFILESYSTEM INFORMATION -----"
echo "Total Number Files: $TotalFiles"
echo -e "Total Number of Directories: $TotalDirectories\n#end"
