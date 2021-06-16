#!/bin/bash

setfacl -m g:AlphaQ:--- /home

for i in {01..30}
do
	sudo setfacl -m u:Jay_Jay:w /home/sysAd_"$i"
	sudo setfacl -m u:Jay_Jay:w /home/appDev_"$i"
	sudo setfacl -m u:Jay_Jay:w /home/webDev_"$i"
done

sec_per()
{

	if [[ $3 -le 10 ]]; then
		sudo setfacl -m u:"$1"_0"$3":rw /home/"$1"_"$2"
    	else 
		sudo setfacl -m u:"$1"_"$3":r /home/"$1"_"$2"
	fi		
}

th_fr_per()
{
    if [[ $3 -le 20 ]]; then
    	sudo setfacl -m u:"$1"_"$3":rw /home/"$1"_"$2"
    else
    	sudo setfacl -m u:"$1"_"$3":r /home/"$1"_"$2"
    fi
}

usr_per()
{
	if [[ $2 -le 10 ]]; then
		sec_per "$1" "$2" "$2"
	elif [[ ($2 -gt 10) && ($2 -le 20) ]]; then
		for i in {1..10}
		do
			sec_per "$1" "$i" "$2"
		done
		th_fr_per "$1" "$2" "$2"
	else
		for i in {1..20}
		do
			if [[ i -le 10 ]]
			then
				sec_per "$1" "$i" "$2"
			else	
				th_fr_per "$1" "$i" "$2"
			fi
		done
		th_fr_per "$1" "$2" "$2"
	fi
}

for i in {01..30}
	do
		usr_per sysAd $i
		usr_per appDev $i
		usr_per webDev $i
done
