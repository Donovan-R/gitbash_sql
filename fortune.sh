#!/bin/bash
#programme pour dire la bonne aventure
echo -e "\n~~ Diseur de bonne aventure ~~\n"
RESPONSES=("Oui" "Non" "Peut-être" "Bonnes perspectives" "Ne comptez pas dessus" "Redemandez plus tard")
N=$(( RANDOM % 5 + 0 ))

GET_FORTUNE() {
    if [[ ! $1 ]] then
    echo "posez une question oui ou non :"
    else echo "assurez vous de mettre un ? "
    fi
    read question
    }
GET_FORTUNE

until [[ $question =~ \?$ ]];
do  GET_FORTUNE again
done

echo -e "\n ${RESPONSES[$N]} \n";