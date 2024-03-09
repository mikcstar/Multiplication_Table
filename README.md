**Title:** Generating Multiplication using bash script

**Project Description:** This project helps you generates a multiplication table for a number entered, this project will also help you practice using loops, handling user input and applying conditional logic in Bash scripting.

**Project description:** This script prompts the user to enter a number and then ask if they prefer to see a multiplication table from 1-10 or a partial table within a specified range. Based on the user's choice, the script will display the corresponding multiplication table.


**Table of Contents**
1. User Input for number
- This script must first as user to input a number for which a multiplication table will be generated.

2. choice of table range: 
- Ask the user if they want a full multiplication table (1-10) or a partial table. if they choose partial, prompt them for the start and the end of the range.

3. Use of Loops:
- Implement the logic to generate the multiplication table using loops. You may use either the list form or C-style for loop based on what's appropraite.
  Conditional Logic:
- Use if-else statements to handle the logic based on the user's choice (full vs. partial table and valid range input)
  Input validation:
- Ensure that the user enters the valid numbers for the multiplication table and the specified range. Provide feedback for invalid inputs and default to a full table if the range is incorrect.

4. Readable output
- Display the multiplication table in a clear and readable format, adhering to the user's choice of range.

5. Table display option
- Ask the user if they want to see the table in ascending or descending order

6. Ask to continue or end process
- Ask the user if they want to repeat the process for another number

**Bonus**: Challenges faced


**Tasks**
Firstly, we have to write a function to display a multiplication.
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

1) Prompt the user to enter a number for the multiplication table
# Prompt User input number script

              while true; do
                  # Prompt the user to enter a number for the multiplication table
                  echo "Enter a number for the multiplication table: "
                  read user_number

2) choice of table range
# Prompt the user if they want a full or partial table

        echo "Do you want a full multiplication table (1-10) or a partial table?"
        echo "Enter 'f' for full table or 'p' for partial table: "
        read table_type

2b) prompt for the start and the end of the range
# Process user's choice

              if [[ "$table_type" == "f" ]]; then
                  start=1
                  end=10
              elif [[ "$table_type" == "p" ]]; then
                  echo "Enter the start of the range: "
                  read start
                  echo "Enter the end of the range: "
                  read end

3) Use of Loops and conditional logic
# Implement the logic to generate the multiplication table using loops    
 
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

4) Table display option
# Ask the user if they want to see the table in ascending or descending order

          echo "Do you want to see the table in ascending or descending order?"
          echo "Enter 'ascending' or 'descending':"
          read order_choice

5) Readable output 
# Display the multiplication table
     
          display_table "$start" "$end" "$user_number" "$order_choice"
          
6) Ask to continue or end process
# Ask the user if they want to repeat the process for another number

          echo "Do you want to generate a multiplication table for another number? (yes/no)"
          read repeat_choice
          if [[ "$repeat_choice" != "y" ]]; then
              break
          fi
      done

BONUS: Challenged faced includes familiarity with the syntax.
