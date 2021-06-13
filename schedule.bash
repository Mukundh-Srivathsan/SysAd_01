#!/bin/bash


for i in {1..30}
do
    if [[ $i -lt 10 ]]; then 
        sudo echo -e "Date\t\tTime" > /home/sysAd_0$i/schedule.txt
        sudo echo -e "Date\t\tTime" > /home/appDev_0$i/schedule.txt
        sudo echo -e "Date\t\tTime" > /home/webDev_0$i/schedule.txt
    else
        sudo echo -e "Date\t\tTime" > /home/sysAd_$i/schedule.txt
        sudo echo -e "Date\t\tTime" > /home/appDev_$i/schedule.txt
        sudo echo -e "Date\t\tTime" > /home/webDev_$i/schedule.txt
    fi
done




File="/home/Jay_Jay/future.txt"

fd=`date +%Y-%m-%d`

sudo echo -e "Date\t\tTime" > schedule.txt 

date=`grep fd File` 

if [[ "$date" != "" ]]; then
    for i in {1..30}
    do
        if [[ $i -lt 10 ]]; then 
            sudo echo -e "$d\t$t" >> /home/sysAd_0$i/schedule.txt
            sudo echo -e "$d\t$t" >> /home/appDev_0$i/schedule.txt
            sudo echo -e "$d\t$t" >> /home/webDev_0$i/schedule.txt
        else
            sudo echo -e "$d\t$t" >> /home/sysAd_$i/schedule.txt
            sudo echo -e "$d\t$t" >> /home/appDev_$i/schedule.txt
            sudo echo -e "$d\t$t" >> /home/webDev_$i/schedule.txt
	   fi
    done
fi
        