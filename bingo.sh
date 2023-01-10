#!/bin/bash
#Générateur de numéros de bingo
echo -e "\n~~ Générateur de numéros de bingo ~~\n"
NUMBER=$(( RANDOM % 75 + 1 ))
TEXT="le prochain numéro est "
if (( NUMBER <= 15 )) then
 echo $TEXT "B:" $NUMBER
elif (( NUMBER <= 30 )) then
 echo $TEXT "C:" $NUMBER
elif (( NUMBER <= 45 )) then
 echo $TEXT "D:" $NUMBER
elif (( NUMBER <= 60 )) then
 echo $TEXT "E:" $NUMBER
else echo $TEXT "F:" $NUMBER
fi 