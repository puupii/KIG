
#!/bin/bash

set -e

MSG="${1:-Test commit}"
BRANCH=$(git branch --show-current)

if [ -z "$BRANCH" ]; then
    echo "Error: No Git branch checked out."
    exit 1
fi

echo "Generating 365 test commits..."

for i in $(seq 365 -1 1); do
    DATE=$(date -d "$i days ago" +"%Y-%m-%d")

    echo "Test commit for $DATE" > day.txt

    git add day.txt

    GIT_AUTHOR_DATE="$DATE 12:00:00" \
    GIT_COMMITTER_DATE="$DATE 12:00:00" \
    git commit -m "$MSG - $DATE" --allow-empty
done

    DATE=$(date)
    GIT_AUTHOR_DATE="$DATE"  \
    GIT_COMMITTER_DATE="$DATE" \
echo "Finished generating commits."

git push -u origin "$BRANCH"

echo "All done!"

