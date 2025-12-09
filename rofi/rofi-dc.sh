#!/bin/bash

# Set the precision
precision=20

# Prompt for a calculation using rofi
calculation=$(echo | rofi -dmenu -p "calc: ")

# If the user entered a calculation
if [ ! -z "$calculation" ]; then
    # Pass the calculation to dc to evaluate
    result=$(dc <<< "${precision}k $calculation f")
    
    # Display the result in a rofi dialog
    echo "$result" | rofi -dmenu -p "result: "
fi
