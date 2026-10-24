#!/bin/bash
# simple-interest.sh
# Calculates simple interest: SI = (Principal * Rate * Time) / 100

read -p "Enter the principal amount: " principal
read -p "Enter the rate of interest (% per year): " rate
read -p "Enter the time period (in years): " time

# Validate that all inputs are non-negative numbers
num_re='^[0-9]+([.][0-9]+)?$'
for value in "$principal" "$rate" "$time"; do
  if ! [[ $value =~ $num_re ]]; then
    echo "Error: please enter valid non-negative numbers only." >&2
    exit 1
  fi
done

interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)
total=$(echo "scale=2; $principal + $interest" | bc)

echo "Simple Interest = $interest"
echo "Total Amount    = $total"
