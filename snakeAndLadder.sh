#!/bin/bash -x

echo "Welcome To Snake And Ladder"

#constants
NO_PLAY=0
LADDER=1
SNAKE=2

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
}

#Start game
setPlayerMoves
