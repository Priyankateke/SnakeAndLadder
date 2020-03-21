#!/bin/bash -x

echo "Welcome To Snake And Ladder"

#constants
NO_PLAY=0
LADDER=1
SNAKE=2
STARTING_POSITION=0
WINNING_POSITION=100

#variables
playerPosition=0

#Function to set playerPosition according to playing Options like NO_Play or Snake or Ladder
function setPlayerMoves()
{
	dieValue=$(( RANDOM % 6 + 1 ))
	playingOptions=$(( RANDOM % 3 ))
	
	#Move player Position according to playingOptions
	case $playingOptions in
		$NO_PLAY)
			playerPosition=$playerPosition
			;;
		$LADDER)
			playerPosition=$(( playerPosition + dieValue ))
			;;
		$SNAKE)
			playerPosition=$(( playerPosition - dieValue ))
			;;
	esac
	resetingWrongPosition
}

function playUntilWin()
{
	while [ $playerPosition -ne $WINNING_POSITION ]
	do
		setPlayerMoves
	done
}

#Ensures playerPostion is between 0 to 100
function resetingWrongPosition()
{
	if [ $playerPosition -lt $STARTING_POSITION ]; then
		playerPosition=$STARTING_POSITION
	elif [ $playerPosition -gt $WINNING_POSITION ]; then
		playerPosition=$((playerPosition - dieValue))
	fi
}

#Start game
playUntilWin
