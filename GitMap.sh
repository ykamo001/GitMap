#! /bin/bash/

temp_file="$(mktemp)"
git branch > $temp_file
cat $temp_file
#currGit=`cat $temp_file | grep '*'`
#branches=`wc -l $temp_file`
#echo $branches
#echo $currGit
rm $temp_file
#cat masterBranch | sed "s/commit.*//g" | sed "s/Merge:.*//g" | sed 's/<.*>//g' | sed '/^\s*$/d'

echo "Finished Script"
