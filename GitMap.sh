#! /bin/bash/

cat masterBranch | sed "s/commit.*//g" | sed "s/Merge:.*//g" | sed 's/<.*>//g' | sed '/^\s*$/d'

echo "Finished Script"
