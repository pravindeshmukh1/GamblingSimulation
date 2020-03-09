#!/bin/bash -x

echo "Welcome to Gambling Simulation"

#constant
STAKE=100
BET=1
CASH=$STAKE

MAX_STAKE=$((STAKE+STAKE/2))
MIN_STAKE=$((MAX_STAKE-STAKE))
echo $MAX_STAKE $MIN_STAKE

function checkWinLoose() {
	while [[ $CASH -lt $MAX_STAKE  && $CASH -gt $MIN_STAKE ]]
	do
		if [[ $((RANDOM%2)) -eq 1 ]]
		then
				CASH=$((CASH+BET))
		else
				CASH=$((CASH-BET))
		fi
	done
		totalCash=$((CASH-STAKE))
		echo $totalCash
}

function getTotalAmount() {
 	for (( day=1;day<=20;day++ ))
	do
		totalAmount=$((totalAmount + $(checkWinLoose)))
	done

	if [[ $totalAmount -gt 0 ]]
	then
		echo "Total Amount win" $totalAmount
	else
		echo "Total Amount Loose" $totalAmount
	fi
}
getTotalAmount
