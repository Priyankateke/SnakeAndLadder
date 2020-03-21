#!/bin/bash -x

echo "Welcome To Snake And Ladder"

#constants
NO_PLAY=0
LADDER=1
SNAKE=2
STARTING_POSITION=0
WINNING_POSITION=100

#variables
playerPosition=$STARTING_POSITION
diceRoll=0
player=2

#dictionary
declare -A gameRecords

#Function to set playerPosition according to playing Options like NO_Play or Snake or Ladder
function setPlayerMoves()
{
	dieValue=$(( RANDOM % 6 + 1 ))
	playingOptions=$(( RANDOM % 3 ))
	((diceRoll++))

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
	gameRecords[player:$player]=$playerPosition,$diceRoll
}

function playUntilWin()
{
	while [ $playerPosition -ne $WINNING_POSITION ]
	do
		switchPlayer
		setPlayerMoves
	done
	echo "Player: $player won "
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

#setting players turn One bye one
function switchPlayer()
{
	if [ $player -eq 1 ]; then
		player=2
	else
		player=1
	fi
}

#Start game
playUntilWin
