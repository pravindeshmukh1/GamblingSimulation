#!/bin/bash -x
declare -A totalAmount

echo "Welcome to Gambling Simulation"

#constant
STAKE=100
BET=1
CASH=$STAKE

MAX_STAKE=$((STAKE+STAKE/2))
MIN_STAKE=$((MAX_STAKE-STAKE))


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

		for (( day=1;day<20;day++ ))
		do
			totalAmount=$((totalAmount + $(checkWinLoose)))
			totalAmount[$day]=$totalAmount
		done
			echo "amount " ${totalAmount[@]}
			echo "day " ${!totalAmount[@]}

		if [[ $totalAmount -gt 0 ]]
		then
			echo "Total Amount win" $totalAmount
		else
			echo "Total Amount Loose" $totalAmount
		fi
}
getTotalAmount

function getLuckiestUnluckiestDay() {

	for i in ${!totalAmount[@]}
	do
		echo $i ${totalAmount[$i]}
	done | sort -rn -k2
}
echo "Luckiest Day Win maximum :" $(getLuckiestUnluckiestDay | head -1)
echo "Unlucky Day lost maximum :" $(getLuckiestUnluckiestDay | tail -1)

function checkPlayNextMonth() {

	while [[ ${totalAmount[20]} -gt 0 ]]
	do
		getTotalAmount

		echo "Luckiest Day:" $(getLuckiestUnluckiestDay | head -1)
		echo "Unluckiest Day:" $(getLuckiestUnluckisetDay | tail -1)
	done
	echo "Less Amount Can not Play Game"
}
checkPlayNextMonth
