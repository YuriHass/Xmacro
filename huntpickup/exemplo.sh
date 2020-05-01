#!/bin/bash

#1822 1031
#1411 1031

lifeA=0
lifeMax=2
countres=300
countadv=3600
rdm1=0
rdm2=0

hunt()
{
	xmacroplay -d 60 < hunt
	((lifeA=lifeA+1))
	onemin
}

heal()
{
	xmacroplay -d 60 < heal
	((lifeA=0))
}

pickup()
{
	xmacroplay -d 60 < pickup
}

adv()
{
	xmacroplay -d 60 < adv
}

onemin()
{
	time=$((RANDOM%20+1))
	((time=time+60))
	((countres=countres+time))
	((countadv=countadv+time))
	for i in $(seq 1 $time); do
		echo "$i s of $time s"
		sleep 1
	done
}

prof()
{
	((rdm1=$((RANDOM%5+1))))
	((rdm2=$((RANDOM%5+1))))

	if [ "$rdm1" -eq "$rdm2" ];
	then
		xmacroplay -d 60 < prof
	fi
}

cdown()
{
	((rdm1=$((RANDOM%5+1))))
	((rdm2=$((RANDOM%5+1))))

	if [ "$rdm1" -eq "$rdm2" ];
	then
		xmacroplay -d 60 < cdown
	fi
}

dice()
{
	((rdm1=$((RANDOM%10+1))))
	((rdm2=$((RANDOM%10+1))))

	if [ "$rdm1" -eq "$rdm2" ];
	then
		xmacroplay -d 60 < dice
	fi
}

main()
{
	true=1
	while [ $true != "0" ];
	do
		if [ "$countadv" -ge 3600 ];
		then
			heal
			adv
			heal
			((countadv=0))
		fi

		if [ "$countres" -ge 300 ];
		then
			pickup
			((countres=0))
		fi

		if [ "$lifeA" -eq "$lifeMax" ];
		then
			heal
		fi
		prof
		cdown
		dice
		hunt
	done
}

main
