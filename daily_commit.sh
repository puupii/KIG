#!/bin/bash

# Optional: Set a default message if you want all commits to look the same
MSG="${1:-'very important commit ${2:-$(date +\%Y-\%m-\%d)}']}"

for i in {1..365}; do
    # Generate a filename with a zero-padded day number (01, 02, ...)
    DAY=$(printf "%02d" $i)

    # Create a file called "${DAY}.txt" containing the day number.
    # If you don't want to create files this way, replace this line with your own logic
    # (e.g., `git add <your-change-file>`), ensuring a change exists for each iteration.
    echo "Day $i" > "day.txt"

    git add day.txt
    # Create the commit
    git commit -m "$MSG" --date="$(date -d "+$((i*24)) hours" '+%a %b %e %H:%M') ${DAY} 00:00" || break
done

echo "Script finished."
