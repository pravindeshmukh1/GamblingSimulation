#!/bin/bash -x

echo "Welcome to Gambling Simulation"

STAKE=100
BET=1

function gambler() {
	if [[ $((RANDOM%2)) -eq 1 ]]
	then
		echo "win"
	else
		echo "loose"
	fi
}
gambler
