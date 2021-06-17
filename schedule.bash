#!/bin/bash


for i in {01..30}
do
	if [[ ! -f "/home/sysAd_$i/schedule.txt" ]]; then
    	sudo echo -e "Date\t\tTime" > "/home/sysAd_$i/schedule.txt"
    fi
    
    if [[ ! -f "/home/appDev_$i/schedule.txt" ]]; then
    	sudo echo -e "Date\t\tTime" > "/home/appDev_$i/schedule.txt"
    fi
    
    if [[ ! -f "/home/webDev_$i/schedule.txt" ]]; then
    	sudo echo -e "Date\t\tTime" > "/home/webDev_$i/schedule.txt"
	fi
done

File="future.txt"

fd=`date +%Y-%m-%d`

date=`grep fd $File` 

if [[ "$date" != "" ]]; then
    for i in {01..30}
    do
    	t=$(grep fd $File | awk '{print $2}')
        sudo echo -e "$fd\t$t" >> "/home/sysAd_$i/schedule.txt"
        sudo echo -e "$fd\t$t" >> "/home/appDev_$i/schedule.txt"
        sudo echo -e "$fd\t$t" >> "/home/webDev_$i/schedule.txt"
    done
fi
