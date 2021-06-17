#!/bin/bash


for i in {01..30}
do
    sudo echo -e "Date\t\tTime" > "/home/sysAd_$i/schedule.txt"
    sudo echo -e "Date\t\tTime" > "/home/appDev_$i/schedule.txt"
    sudo echo -e "Date\t\tTime" > "/home/webDev_$i/schedule.txt"
done

File="/home/Jay_Jay/future.txt"

fd=`date +%Y-%m-%d`

sudo echo -e "Date\t\tTime" > "schedule.txt" 

date=`grep fd $File` 

if [[ "$date" != "" ]]; then
    for i in {01..30}
    do
        sudo echo -e "$d\t$t" >> "/home/sysAd_$i/schedule.txt"
        sudo echo -e "$d\t$t" >> "/home/appDev_$i/schedule.txt"
        sudo echo -e "$d\t$t" >> "/home/webDev_$i/schedule.txt"
    done
fi
