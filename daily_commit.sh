#!/bin/bash

# Optional: Set a default message if you want all commits to look the same

MSG="${1:-very important commit}"

for i in {1..365}; do
    echo "Day $i" > "day.txt"

    git add day.txt
    # Create the commit
    git commit  --date= "$i day ago"  -m "$MSG"|| break
done

git push

echo "Script finished."
