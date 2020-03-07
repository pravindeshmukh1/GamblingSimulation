#!/bin/bash -x

echo "Welcome to Gambling Simulation"

STAKE=100
BET=1
CASH=$STAKE
MAX_STAKE=$((STAKE+STAKE/2))
MIN_STAKE=$((MAX_STAKE-STAKE))
echo $MAX_STAKE $MIN_STAKE

function gambler() {
	while [[ $CASH -lt $MAX_STAKE  && $CASH -gt $MIX_STAKE ]]
	do
		if [[ $((RANDOM%2)) -eq 1 ]]
		then
			echo "win"
				CASH=$((CASH+BET))
		else
			echo "loose"
				CASH=$((CASH-BET))
		fi
	done
}
gambler
echo "$CASH"
