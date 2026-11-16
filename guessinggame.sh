#!/usr/bin/env bash

count_files() {
    find . -maxdepth 1 -type f | wc -l | tr -d " "
}

target=$(count_files)

echo "Welcome to the Guessing Game!"

while true
do
    read -p "Guess the number of files in the current directory: " guess

    if ! [[ "$guess" =~ ^[0-9]+$ ]]
    then
        echo "Please enter a valid number."
    elif [[ $guess -lt $target ]]
    then
        echo "Too low!"
    elif [[ $guess -gt $target ]]
    then
        echo "Too high!"
    else
        echo "Congratulations! Correct guess!"
        break
    fi
done