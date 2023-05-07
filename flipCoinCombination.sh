


declare -A singlet_combinations doublet_combinations triplet_combinations
declare -a sorted_singlet_combinations sorted_doublet_combinations sorted_triplet_combinations
declare -A triplet_combinations

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
    result3=$(flip_coin)

    singlet_combinations[$result1]=$((singlet_combinations[$result1]+1))
    doublet_combinations["$result1$result2"]=$((doublet_combinations["$result1$result2"]+1))
    triplet_combinations["$result1$result2$result3"]=$((triplet_combinations["$result1$result2$result3"]+1))
    total_flips+=1
done

sorted_singlet_combinations=($(echo "${!singlet_combinations[@]}" | tr ' ' '\n' | sort -n))
sorted_doublet_combinations=($(echo "${!doublet_combinations[@]}" | tr ' ' '\n' | sort -n))
sorted_triplet_combinations=($(echo "${!triplet_combinations[@]}" | tr ' ' '\n' | sort -n))

echo "Winning Singlet Combination: ${sorted_singlet_combinations[-1]}"
echo "Winning Doublet Combination: ${sorted_doublet_combinations[-1]}"
echo "Winning Triplet Combination: ${sorted_triplet_combinations[-1]}"

    triplet="$result1$result2$result3"
    triplet_combinations[$triplet]=$((triplet_combinations[$triplet]+1))
    total_flips+=1
done

echo "Triplet Combination Percentage:"

for combination in HHH HHT HTH THH TTH THT HTT TTT; do
    count=${triplet_combinations[$combination]}
    percentage=$(bc -l <<< "scale=2; ($count / $total_flips) * 100")
    echo "$combination: $percentage%"
done

