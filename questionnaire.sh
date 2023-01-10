#!/bin/bash
echo -e "\n ~~ Questionnaire ~~\n"
question1="comment t'appelles-tu ?"
question2="d'où venez-vous ?"
question3="quel est votre site web de codage préféré ?"
echo $question1
read name
echo $question2
read location
echo $question3
read website
echo -e "\n bonjour $name de $location. J'ai appris que votre site Web de codage préféré est $website!\n" 
