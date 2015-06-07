#! /bin/bash/

#make temporary files that will assure us that no file of that name exists
temp_file="$(mktemp)"
temp_file2="$(mktemp)"

#create file to get all branch names
git branch > $temp_file	

#filter out the branch we are currently in
cat $temp_file | grep '\*' > $temp_file2
currBranch=`cat $temp_file2 | awk '{print $2;}'`

#find how many times we need to loop, so how many branches there are
branches=`wc -l $temp_file | awk '{print $1;}'`

echo $branches
echo $currBranch
rm $temp_file
rm $temp_file2
#cat masterBranch | sed "s/commit.*//g" | sed "s/Merge:.*//g" | sed 's/<.*>//g' | sed '/^\s*$/d'

echo "Finished Script"
