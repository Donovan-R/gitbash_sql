#!/bin/bash
#programme qui compte à rebours
echo -e "\n~~ Compte à rebours ~~\n"
# echo $* arg1
# if [[ $1 -gt 0 ]] then
#  for (( i = $1; i >=0; i--)); do
number=$1
while [[ number -ge 0 ]]; do
 echo $number
 (( number-- ))
 sleep 1  
done

