#!/bin/bash

	echo  "===========The hyrule of Castle====="
	echo "Salutation aventurier, bienvenue dans The hyrule of Castle comment te nommes tu ?"
		read -p 'Entrez votre pseudo : ' pseudo
	echo "Bienvenue $pseudo"

	echo "voici la liste des personnages"
while IFS=',' read -r id name hp mp str int def res spd luck race class rarity; do
	echo "-$id $name $hp $mp $str"
done < players.csv

	choix=0
	echo "Quel personnage souhaite tu choisir ?"
		read -r choix

	first_line=0
	pv=0
while IFS=',' read -r id name hp mp str int def res spd luck race class rarity; do

if [ $first_line -ne 0 ]; then
	if [ $id = $choix ]; then
		echo "Excellent vous avez choisit $name"
		pv=$hp
		force=$str
		echo "$pv hp $force force"
	fi
fi
		first_line=1
done < players.csv

hp_enemy=30
str_enemy=5
tour=1
etage=1
i=1
str_ganon=20
boss_hp=150
while [ $etage -eq 1 ]; do

	if [ $hp_enemy -lt 0 ]; then

	hp_enemy=0

	fi
	if [ $hp_enemy -eq 0 ]; then
		echo  "\n"
		echo  "étage suivant"
		echo  "\n"
		i=$(($i+1))
		hp_enemy=30
	fi
        	echo "==== Fight $i ===="
		echo "\n"
                echo "Boboklin a $hp_enemy hp"
		echo "\n"
        	echo "Tu as $pv hp"
		echo "\n"
        	echo "============ Choix ============"
		echo "\n"
        	echo "1. Attack 2. Heal"
read -r choix
pv=$(($pv - $str_enemy))

if [ $choix -eq 1 ]; then
	hp_enemy=$(($hp_enemy - $force))
fi
	if [ $choix -eq 2 ]; then
		if [ $pv -lt 30 ]; then
			pv=$(($pv+30))
				else

				echo "Impossible vous êtes en bonne santé"
		fi
	fi

	if [ $i -eq 9 ]; then
		etage=0
	fi
	if [ $pv -eq 0 ]; then
                        echo "====Game Over====="
               	 exit
	fi
done
	echo "Salle du boss"

while [ $boss_hp -gt 0 ]; do

	echo "=======Boss room======="
	echo "GANON !"
        echo " $Ganon"
        echo "$name"
        echo  " $pv "
        echo "=====Options======"
        echo "1. Attack 2. Heal"
         read -r choix_boss
pv=$(($pv - $str_ganon))

	if [ $choix_boss -eq 2 ]; then
		if [ $pv -lt 30 ];then
			pv=$(($pv + 30))
				else
					echo "Impossible vous êtes en bonne santé"
		fi
	fi

	if [ $choix_boss -eq 1 ]; then

		boss_hp=$(($boss_hp-$force))
	fi

	if [ $pv -lt 0 ]; then

	pv=0
	echo "====Game Over====="
exit
	fi
done
	echo "Félicitation tu as vaincu Ganon et sauvé la princesse\nTout le village te remercie!"
exit

