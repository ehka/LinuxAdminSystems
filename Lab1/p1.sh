#!/bin/bash

HOME=$(df / |awk '{print $5}' | sed -n '2p' | tr --delete %)

BOOT=$(df /boot |awk '{print $5}' | sed -n '2p' | tr --delete %)

if (($HOME > 80)); then
	echo "high cpu in / filesystem" |mail -s "HIGH CPU" root
fi

if (($BOOT > 80)); then
	echo "high cpu in /boot filesystem" |mail -s "HIGH CPU" root
fi
