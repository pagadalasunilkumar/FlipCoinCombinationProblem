
flip_coin() {
    local result=$((RANDOM % 2))

    if ((result == 0)); then
        echo "Heads"
    else
        echo "Tails"
    fi
}

result=$(flip_coin)

echo "The result is: $result"
