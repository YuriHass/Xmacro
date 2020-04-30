#!/bin/bash

lifeA=0
lifeMax=3
countres=5
countadv=12

hunt()
{
	xmacroplay -d 60 < hunt
	((lifeA=lifeA+1))
	((countres=countres+1))
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
	for i in {1..70}; do
		echo "primeiro ciclo: $i s"
		sleep 1
	done
}

main()
{
	true=1
	while [ $true != "0" ];
	do
		if [ "$countadv" -eq 12 ];
		then
			heal
			adv
			heal
			((countadv=0))
		fi

		if [ "$countres" -eq 5 ];
		then
			pickup
			((countadv=countadv+1))
			((countres=0))
		fi

		if [ "$lifeA" -eq "$lifeMax" ];
		then
			heal
			
		fi

		hunt
	done
}

main
