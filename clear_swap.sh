#!/bin/sh

TOTAL_RAM=$(free | grep "Mem:" | awk '{print $2}')
USED_RAM=$(free | grep "Mem:" | awk '{print $3}')
TOTAL_SWAP=$(free | grep "Swap:" | awk '{print $2}')
USED_SWAP=$(free | grep "Swap:" | awk '{print $3}')

echo "RAM: $USED_RAM/$TOTAL_RAM"
echo "SWAP: $USED_SWAP/$TOTAL_SWAP"
TMP=$(($USED_RAM+$USED_SWAP))
if [ $TMP -lt $TOTAL_RAM ]; then
	echo "Starting to erase Swap Memory"
	sudo swapoff -a && sudo swapon -a
else
	echo "Can't clear Swap Memory due to stability reasons."
fi
