#!/bin/bash

posX=0
posY=0

row1=""
row2=""
row3=""

echo "#------------------"
echo "|     Waiting     |"
echo "-------------------"
posX=1
sleep .1
while true
do
	if [ "$posY" == "0" ]; then
		for tmpX in {0..18}
		do
			if [ "$tmpX" == "$posX" ]; then
				row1+="#"
			else
				row1+="-"
			fi
		done	
		row2="|     Waiting     |"
		row3="-------------------"
		if [ "$posX" == "18" ]; then
			posY=1
		else
			posX=$(( $posX + 1))
		fi
	elif [ "$posY" == "1" ]; then
		if [ "$posX" == "0" ]; then
			row2="#     Waiting     |"
		elif [ "$posX" == "18" ]; then
			row2="|     Waiting     #"
		fi
		row1="-------------------"
		row3="-------------------"
		if [ "$posX" == "0" ]; then
			posY=0
		else
			posY=2
		fi
	elif [ "$posY" == "2" ]; then
		for tmpX in {0..18}
		do
			if [ "$tmpX" == "$posX" ]; then
				row3+="#"
			else
				row3+="-"
			fi
		done	
		row2="|     Waiting     |"
		row1="-------------------"
		if [ "$posX" == "0" ]; then
			posY=1
		else
			posX=$(( $posX - 1))
		fi
	else
		break
	fi
	IFS=';' read -sdR -p $'\E[6n' ROW COL;
	curX=$(echo "${ROW#*[}")
	curY=$(echo "${COL}")
	curX=$(( $curX - 4 ))
	tput cup $curX 0
	echo -e "\r${row1}\n${row2}\n${row3}"
	row1=""
	row2=""
	row3=""
	sleep .1
done
