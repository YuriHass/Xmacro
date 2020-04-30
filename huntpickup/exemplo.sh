#!/bin/bash


hunt()
{
	xmacroplay -d 60 < hunt
	onemin
}

hunt-heal()
{
	xmacroplay -d 60 < hunt_heal
	onemin
}

pickup()
{
	xmacroplay -d 60 < pickup
}

onemin()
{
	for i in {1..70}; do
		echo "primeiro ciclo: $i s"
		sleep 1
	done
}

5min1()
{
	pickup
	hunt
	hunt-heal
	hunt
	hunt-heal
	hunt
}

5min2()
{
	pickup
	hunt-heal
	hunt
	hunt-heal
	hunt
	hunt-heal
}

1hour()
{
	for i in {1..70}; do
		5min1
		5min2
	done
}

