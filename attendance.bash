#!/bin/bash

abs_bound() {

   abs=("$@")
   check=()
   
   j=0
   for i in {1..30}
   do
        if [[ i -lt 10 ]];then 
            check[j]="sysAd_0$i"
            j=$j+1
            check[j]="appDev_0$i"
            j=$j+1
            check[j]="webDev_0$i"
        else
            check[j]="sysAd_$i"
            j=$j+1
            check[j]="appDev_$i"
            j=$j+1
            check[j]="webDev_$i"
        fi
        j=$j+1
   done
    
        
    for i in "${!abs[@]}"
    do
        for j in {0..89}
        do
            if [[ ${abs[i]} == "${check[$j]}" ]]
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
   abs=("$@")
   check=()
   
   j=0
   for i in {1..30}
   do
        if [[ i -lt 10 ]];then 
            check[j]="sysAd_0$i"
            j=$j+1
            check[j]="appDev_0$i"
            j=$j+1
            check[j]="webDev_0$i"
        else
            check[j]="sysAd_$i"
            j=$j+1
            check[j]="appDev_$i"
            j=$j+1
            check[j]="webDev_$i"
        fi
        j=$j+1
   done
    
        
    for i in "${!abs[@]}"
    do
        for j in {0..89}
        do
            if [[ ${abs[i]} == "${check[$j]}" ]]
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
            today=("$line")
            abs_bound "${today[@]}"
        fi
        
        START=$(date -d "$START +1 day" "+%Y-%m-%d")
    done
else
    START=$(awk 'NR == 1 {print $3}' attendance.log | cut -c 1-10)
    
    END=$(date +%Y-%m-%d)
    
    while [ "$START" != "$(date -d "$END +1 day" "+%Y-%m-%d")" ]
    do
        line=$(grep "$START" attendance.log | awk '{print $1}')
        if [[ $line != "" ]]
        then
            today=("$line")
            abs_today "${today[@]}" "$START"
        fi
        
        START=$(date -d "$START +1 day" "+%Y-%m-%d")
    done

fi

cat temp.txt
rm temp.txt
