#!/bin/bash/

#Beginning comment
path=$1
currDir=`pwd`

if [ -z "$path" ]
then
	echo "Path was not specified. Script will execute in current directory"
	path='.'
fi

cd $path

#make temporary files that will assure us that no file of that name exists
temp_file="$(mktemp)"
temp_file2="$(mktemp)"
temp_file3="$(mktemp)"
tempDir="$(mktemp -d XXX --tmpdir='.')"
lsInfo="$(mktemp XXX --tmpdir='.')"
map="$(mktemp XXX --tmpdir='.')"

#create file to get all branch names
git branch > $temp_file	

#filter out the branch we are currently in
cat $temp_file | grep '\*' > $temp_file2
currBranch=`cat $temp_file2 | awk '{print $2;}'`

#find how many times we need to loop, so how many branches there are
branches=`wc -l $temp_file | awk '{print $1;}'`

#this will let us traverse all our branches as if they were in a vector of string
count=1
changed=0
fileEnd2="Branch2"
#fileEnd="Branch"
while [ $count -le $branches ]
do
	sed -n ''$count'p' < $temp_file | awk '{print $1;}' > $temp_file3
	atBranch=`cat $temp_file3`
	totalBranch2=$atBranch$fileEnd2
	totalBranch=$atBranch
	if [ "$atBranch" != "*" ]
		then
			git checkout $atBranch
			((changed++))
	else
			totalBranch2=$currBranch$fileEnd2
			totalBranch=$currBranch
			git checkout $currBranch
	fi
	git log > $totalBranch2
	cat $totalBranch2 | sed "s/commit.*//g" | sed "s/Merge:.*//g" | sed 's/<.*>//g' | sed 's/-0700//g' | sed '/^\s*$/d' > $tempDir\/$totalBranch
	echo $totalBranch >> $lsInfo
	rm $totalBranch2
	((count++))
done

if [ $changed -gt 0 ]
then
	git checkout $currBranch
fi

rm $temp_file
rm $temp_file2
rm $temp_file3

#init for boxes
function findLength {
	length=0
	lineNum=$1
	lineNumCond=$1
	lineNumCond=$((lineNumCond+3))
	lineCnt=0
	while [ $lineCnt -ne $lineNumCond ]
	do
		read -r lengthLine
		if [ $lineCnt -ge $lineNum ]
		then
			currLength=`echo $lengthLine | wc -L`
			if [ $currLength -gt $length ]
			then
				length=$currLength
			fi
		fi
		((lineCnt++))
	done <$2

	boxCnt=0
	boxLength="_"
	lineSeg="_"

	while [ $boxCnt -ne $length ]
	do
		boxLength=$boxLength$lineSeg
		((boxCnt++))
	done
}

count=0
while read -r line
do
	#find proper length
	if [ $(($count%3)) == 0 ]
	then
		findLength $count "$tempDir/master"
	fi

	outputLine=1
	firstSegLine=`echo $line | awk '{print $1;}'`

	if [ "$firstSegLine" = "Author:" ]
		then
		if [ $count -ne 0 ]
		then
			echo ^ >> $map; echo \| >> $map
			echo $boxLength >> $map
			echo "" >> $map
			echo $line >> $map
			outputLine=0
		else
			echo $boxLength >> $map
			echo "" >> $map
			echo $line >> $map
			outputLine=0
		fi
	fi

	if [ "$firstSegLine" = "Date:" ]
		then
			echo $line >> $map
			outputLine=0
	fi

	if [ "$firstSegLine" != "Author:" -a "$firstSegLine" != "Date:" ]
	then
		while read -r fileName
		do
			fileNamePlain=$fileName
			fileName=$tempDir\/$fileName
			#if [ "$fileNamePlain" != "master" ]
			#then
			#find third line
			count2=0
			while [ $count2 -ne 3 ]
			do
				read -r thirdLine	

				if [ $count2 -eq 2 ]
				then
					if [ "$thirdLine" = "$line" ]
					then
						label=$line" -----------------------------> ("$fileNamePlain")"
						echo $label >> $map
						echo $boxLength >> $map
						echo "" >> $map
						outputLine=0
					fi
				fi

				((count2++))
			done <$fileName
			#fi
		done <$lsInfo
	fi

	if [ $outputLine -ne 0 ]
	then
		echo $line >> $map
		echo $boxLength >> $map
		echo "" >> $map
	fi
		
	((count++))
done <$tempDir\/master

rm $lsInfo
rm -rf $tempDir

cd $currDir
