#!/bin/bash

START=$(awk 'NR == 1 {print $3}' attendance.log | cut -c 1-10)
END=$(tail -1 attendance.log | awk '{print $2}'| cut -c 1-10)

if [[ $START != "" ]] && [[ $END != "" ]]
then
    while [ "$START" != "$(date -d "$END +1 day" "+%Y-%m-%d")" ]
    do
        line=$(grep "$START" attendance.log | awk '{print $1}')
		touch tmp.txt	
		if [[ $line != "" ]]
		then
			prs=("$line")            
			printf "%s\n" "${prs[@]}" > tmp.txt
			usr=$(grep "_0" tmp.txt | tail -1)
			
			touch /home/$usr/${START}_mom.txt
			echo "This meeting we discussed about blah blah" >> /home/$usr/${START}_mom.txt
			echo "." >> /home/$usr/${START}_mom.txt
			echo "End of meet" >> /home/$usr/${START}_mom.txt
		fi
		
		rm tmp.txt
		
		START=$(date -d "$START +1 day" "+%Y-%m-%d")
     done	
fi
