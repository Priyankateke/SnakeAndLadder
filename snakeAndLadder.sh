#!/bin/bash -x

echo "Welcome To Snake And Ladder"

#constants
NO_PLAY=0
LADDER=1
SNAKE=2
STARTING_POSITION=0
WINNING_POSITION=100

#variables
diceRoll=0
player=2
playerPosition=$STARTING_POSITION
playerOnePosition=$STARTING_POSITION
playerTwoPosition=$STARTING_POSITION

#dictionary
declare -A gameRecords

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
			#Ensures playerPosition is not greater than winning position
			if [ $playerPosition -gt $WINNING_POSITION ]; then
				playerPosition=$((playerPosition - dieValue))
			fi
			;;
		$SNAKE)
			playerPosition=$(( playerPosition - dieValue ))
			#Ensures playerPosition is not less than starting position
			if [ $playerPosition -lt $STARTING_POSITION ]; then
				playerPosition=$STARTING_POSITION
			fi
			;;
	esac
	gameRecords[player:$player]=$playerPosition,$diceRoll
}

function playUntilWin()
{
	while [ $playerPosition -ne $WINNING_POSITION ]
	do
		switchPlayer
	done
	echo "Player: $player won "
}

#setting players turn One bye one
function switchPlayer()
{
	if [ $player -eq 1 ]; then
		player=2
		playerPosition=$playerTwoPosition
		setPlayerMoves
		playerTwoPosition=$playerPosition
	else
		player=1
		((diceRoll++))
		playerPosition=$playerOnePosition
		setPlayerMoves
		playerOnePosition=$playerPosition
	fi
}

#Start game
playUntilWin
