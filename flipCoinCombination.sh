#!/bin/bash

declare -A singlet_combinations
declare -i total_flips=0

flip_coin() {
    local result=$((RANDOM % 2))

    if ((result == 0)); then
        echo "H"
    else
        echo "T"
    fi
}

read -p "Enter the number of times to flip the coin: " num_flips

for ((i=1; i<=num_flips; i++)); do
    result=$(flip_coin)
    singlet_combinations[$result]=$((singlet_combinations[$result]+1))
    total_flips+=1
done

echo "Singlet Combination Percentage:"

for combination in "${!singlet_combinations[@]}"; do
    count=${singlet_combinations[$combination]}
    percentage=$(bc -l <<< "scale=2; ($count / $total_flips) * 100")
    echo "$combination: $percentage%"
done

