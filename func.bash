#!/bin/bash

START="2019-09-27"

line=$(grep "$START" attendance.log | awk '{print $1}')
if [[ $line != "" ]]
then
	touch tmp.txt
	prs=("$line")            
	printf "%s\n" "${prs[@]}" > tmp.txt
	usr=$(grep "_0" tmp.txt | tail -1)
	
	touch /home/$usr/$START_mom.txt
	echo "This meeting we discussed about blah blah" >> /home/$usr/$START_mom.txt
	echo "." >> /home/$usr/$START_mom.txt
	echo "End of meet" >> /home/$usr/$START_mom.txt
	
	rm tmp.txt	
fi
