#!/bin/bash

declare -A doublet_combinations
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
    result1=$(flip_coin)
    result2=$(flip_coin)
    doublet="$result1$result2"
    doublet_combinations[$doublet]=$((doublet_combinations[$doublet]+1))
    total_flips+=1
done

echo "Doublet Combination Percentage:"

for combination in HH TT HT TH; do
    count=${doublet_combinations[$combination]}
    percentage=$(bc -l <<< "scale=2; ($count / $total_flips) * 100")
    echo "$combination: $percentage%"
done

