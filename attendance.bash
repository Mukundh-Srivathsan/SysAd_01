#!/bin/bash

abs_bound() {

   abs=("$@")
   check=()
   
   j=0
   for i in {01..30}
   do
      check[j]="sysAd_$i"
      j=$j+1
      check[j]="appDev_$i"
      j=$j+1
      check[j]="webDev_$i"
      j=$j+1
   done
    
        
    for i in ${abs[@]}
    do
        for j in {0..89}
        do
            if [[ "$i" == "${check[$j]}" ]]
            then
                check[$j]=""
            fi
        done
    done
    
    for i in "${check[@]}"
    do
        if [[ $i != "" ]] && [[ "$(grep "$i" temp.txt)" == "" ]]
        then
            echo "$i" >> temp.txt
        fi  
    done
}                       

abs_today() {

   date=$2
   abs=("$1")
   check=()
   
   j=0
   for i in {01..30}
   do
      check[j]="sysAd_$i"
      j=$j+1
      check[j]="appDev_$i"
      j=$j+1
      check[j]="webDev_$i"
      j=$j+1
   done
    
        
    for i in ${abs[@]}
    do
        for j in {0..89}
        do
            if [[ "$i" == "${check[$j]}" ]]
            then
                check[$j]=""
            fi
        done
    done
    
    for i in "${check[@]}"
    do
        if [[ $i != "" ]] 
        then
            echo -e "$i\t$date"
        fi  
    done
} 


read -r START
read -r END

touch temp.txt

if [[ $START != "" ]] && [[ $END != "" ]]
then
    while [ "$START" != "$(date -d "$END +1 day" "+%Y-%m-%d")" ]
    do
        line=$(grep "$START" attendance.log | awk '{print $1}')
        if [[ $line != "" ]]
        then
            prs=("$line")
            abs_bound "${prs[@]}"
        fi
        START=$(date -d "$START +1 day" "+%Y-%m-%d")
    done
else
    START=$(awk 'NR == 1 {print $3}' /home/Jay_Jay/attendance.log | cut -c 1-10)
    
    END=$(date +%Y-%m-%d)
    
    while [ "$START" != "$(date -d "$END +1 day" "+%Y-%m-%d")" ]
    do
        line=$(grep "$START" /home/Jay_Jay/attendance.log | awk '{print $1}')
        if [[ $line != "" ]]
        then
            prs=("$line")
            abs_today "${prs[@]}" "$START"
        fi
        START=$(date -d "$START +1 day" "+%Y-%m-%d")
    done

fi

cat temp.txt
rm temp.txt
