#!/bin/bash

datecheck() 
{
    d="$1"
    [[ "$(date "+%Y-%m-%d" -d "$d" 2>/dev/null)" == "$d" ]]
}

echo "Start Date"

read START

echo "End Date"

read END


echo $(datecheck "$START") 
echo $(datecheck "$END")

if [[ $(datecheck "$START") && $(datecheck "$END") ]]; then
   
    while [ ! $START-eq$END ];do 
        grep -R $START /future.txt
        $(date "+%Y-%m-%d" -d "$START" -v +1d) 
    done
    grep -R $END /future.txt
else
    echo ERROR
fi