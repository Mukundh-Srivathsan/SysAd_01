#!/bin/bash

for i in {01..30}
do
	sudo setfacl -m u:Jay_Jay:r /home/sysAd_"$i"
	sudo setfacl -m u:Jay_Jay:r /home/appDev_"$i"
	sudo setfacl -m u:Jay_Jay:r /home/webDev_"$i"
done

sec_per()
{

	if [[ $3 -lt 10 ]]; then
		sudo setfacl -m u:${1}_0${3}:rwx /home/${1}_0${2}
	elif [[ $3 -eq 10 ]]; then
		sudo setfacl -m u:${1}_${3}:rwx /home/${1}_${2}
	elif [[ $2 -eq 10 ]]; then
    	sudo setfacl -m u:${1}_${3}:r /home/${1}_${2}
    else 
		sudo setfacl -m u:${1}_${3}:r /home/${1}_0${2}
	fi		
}

th_fr_per()
{
    if [[ $3 -le 20 ]]; then
    	sudo setfacl -m u:${1}_${3}:rwx /home/${1}_${2}
    else
    	sudo setfacl -m u:${1}_${3}:r /home/${1}_${2}    	
    fi
}

usr_per()
{
	usr=$1
	uno=$2
	
	if [[ $uno -le 10 ]]; then
		sec_per $usr $uno $uno
	elif [[ ($uno -gt 10) && ($uno -le 20) ]]; then
		for i in {1..10}
		do
			sec_per $usr $i $uno
		done
		th_fr_per $usr $uno $uno
	else
		for i in {1..20}
		do
			if [[ i -le 10 ]]
			then
				sec_per $usr $i $uno
			else	
				th_fr_per $usr $i $uno
			fi
		done
	fi
}

for i in {1..30}
	do
		j=$i
		usr_per "sysAd" $j
		usr_per "appDev" $j
		usr_per "webDev" $j
done

for i in {01..30}
	do
		getfacl /home/sysAd_$i
		getfacl /home/appDev_$i
		getfacl /home/webDev_$i
done
