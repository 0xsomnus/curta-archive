#!/bin/bash

# Check if the number of deploy scripts is provided as an argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <num_iterations>"
  exit 1
fi

num_iterations=$1

# Loop from 1 to the specified number of scripts
for ((i = 1; i <= num_iterations; i++)); do
  if [ "$i" -eq 5 ]; then
    echo "Puzzle 5 not implemented. See https://www.curta.wtf/puzzle/5 for explanation."
  else
    echo "Running deploy for DeployPuzzle$i.s.sol"
    forge script script/deploy/DeployPuzzle$i.s.sol
  fi
done
