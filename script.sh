#!/bin/bash

# Get class name from user
read -p "Enter the name of the class: " classname

# Initialize variables
sum=0
count=0

# Loop to get grades from user
while true; do
    read -p "Enter a grade (or q to quit): " grade
    # Check if user wants to quit
    if [ "$grade" == "q" ]; then
        break
    fi
    # Check if input is a number
    if ! [[ "$grade" =~ ^[0-9]+$ ]]; then
        echo "Invalid input. Please enter a number or q to quit."
        continue
    fi
    # Add grade to sum and increment count
    sum=$((sum + grade))
    count=$((count + 1))
done

# Calculate average and store result in file
if [ "$count" -eq 0 ]; then
    echo "No grades entered."
else
    avg=$((sum / count))
    echo "The average grade for $classname is: $avg" > "$classname.txt"
    echo "Result saved in $classname.txt"
fi

