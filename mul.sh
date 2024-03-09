#!/bin/bash

# Function to display the multiplication table
display_table() {
    local start=$1
    local end=$2
    local number=$3

    echo "Multiplication table for $number from $start to $end:"
    for (( i=start; i<=end; i++ )); do
        product=$((number * i))
        printf "%-2d x %-2d = %-3d\n" "$number" "$i" "$product"
    done
}

# Main script
while true; do
    # Prompt the user to enter a number for the multiplication table
    echo "Enter a number for the multiplication table: "
    read user_number

    # Prompt the user if they want a full or partial table
    echo "Do you want a full multiplication table (1-10) or a partial table?"
    echo "Enter 'f' for full table or 'p' for partial table: "
    read table_type

    # Process user's choice
    if [[ "$table_type" == "f" ]]; then
        start=1
        end=10
    elif [[ "$table_type" == "p" ]]; then
        echo "Enter the start of the range: "
        read start
        echo "Enter the end of the range: "
        read end
        if ! [[ "$start" =~ ^[0-9]+$ && "$end" =~ ^[0-9]+$ && "$start" -le "$end" ]]; then
            echo "Error: Invalid range input. Defaulting to full table."
            start=1
            end=10
        fi
    else
        echo "Error: Invalid table type. Defaulting to full table."
        start=1
        end=10
    fi

    # Ask the user if they want to see the table in ascending or descending order
    echo "Do you want to see the table in ascending or descending order?"
    echo "Enter 'ascending' or 'descending':"
    read order_choice

    # Display the multiplication table
    display_table "$start" "$end" "$user_number" "$order_choice"

    # Ask the user if they want to repeat the process for another number
    echo "Do you want to generate a multiplication table for another number? (yes/no)"
    read repeat_choice
    if [[ "$repeat_choice" != "y" ]]; then
        break
    fi
done
