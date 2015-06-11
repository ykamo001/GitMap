#GitMap 
##Description
GitMap creates a map of a git repository, showing all the commits of each branch. 
The map will be saved in a plain text file with the name of Mike_Izbicki's_Treasure_Map. 
Currently, the script will only work if every branch is derived from the same head branch.    
The map will show the author, date, and message of each commit. 
The information of each commit is contained within a box. 
Currently, the box will look like 
```
.______________________   
|......................|
|Author: Name of Author|		
|Date: Date of commit..|    		
|Commit Message........|		
|______________________|   
```
The commits at the top of the file refer to the most recent commits. 
The box points upward to show the next/more recent commit. 
An arrow pointing to the side from the commit message means the branch has ended.
The long list of periods is to format the box correctly. 
An example would be
```
.______________________________   
|..............................|
|Author: Timothy Truong........|		
|Date: Wed Jun 10 14:29:09 2015|   
|Most recent commit............| -----> (master)	
|______________________________|

^    
|    
.______________________________   
|..............................|
|Author: Timothy Truong........|		
|Date: Wed Jun 10 14:20:28 2015|   
|Less recent commit............|    
|______________________________|
```
The program's run time will depend upon the amount of branches and commits that your git repository contains, as the greater the
number of commits and branches there are, the longer it will take for the program to finish executing.
For a place of comparison, a git repository with only the `master` branch, and 100 commits, will take about 40 seconds to run.
The resulting file will be stored in the directory that was passed into the command.
The state of your git repo is very important - you should know what's going on in it, and what's happened to it,
especially when you're working on a project with multiple people contributing to it.
Git has a particular command that let's you see all the commits made so far in the current branch, `git log`, 
but it's not that clean to read, and it doesn't show you where each branch in your entire repository started and ended. 
A map let's you track your route on a journey, from starting to end, 
and even allows you to see the other routes and events that contributed to your journey. 
`GitMap` creates that map for you, allowing you to see how you ended up in the position you are in now. 
It allows you to see what people have contributed to it, what the contributions are, when it was made, and to what branch it was made to. 
This allows you to stay up-to-date with your repository, and informed of it's current status, 
because if something goes wrong all of a sudden, you can easily trace the steps of your journey. 
And when other people contribute to your journey, it's important that you be able to contact whoever is necessary to fix that problem 
so you can once again continue on the path to your destination.

##Warning
Before running this program on a git repository, commit all changes to the repository. 
All uncommited changes will be reverted to the last commit.

##Downloading and Running
To download, run the command:    
```
$ git clone https://github.com/ykamo001/GitMap  
$ . PathToGitMap/src/GitMap.sh PathToYourGitRepo 
```
If no PathToYourGitRepo is passed in such as
```
$ . PathToGitMap/src/GitMap.sh
```
The script will run on the current directory.

#Error Messages
* If PathToYourGitRepo is not passed in when running the script,   
`Path was not specified. Script will execute in current directory` 
* If `PathToGitMap/src/GitMap.sh PathToYourGitRepo` is passed in, 
the screen will output 
`bash: PathToGitMap/src/GitMap.sh: /bin/bash: bad interpreter: Not a directory`
* When run on a directory that is not a git repository, 
the screen will output 
```
fatal: Not a git repository (or any parent up to mount point /homeDirectory)    
Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).   
wc: ./RandomTempFileName/master: No such file or directory    
bash: [: 0: unary operator expected
bash: ./RandomTempFileName/master: Nosuch file or directory
```

##Examples


##Bugs and Issues
* Running the program will create a file with a random, 3-lettered name
* If the folder isn't a git repository, our script will still try to run and an empty file will be created
* When run, the screen will output 
`Switched to branch \'exampleBranch\'` 
for every branch in the git repository
* If passing in more than one PathToYourGitRep, 
the script will be run only on the first one 
(or third arguement of the command).
* The output file will be placed in the repository that GitMap.sh is ran on
* The program's runtime is long, and depends solely upon the amount of branches and commits in the git repository.
* If two branches end on the same commit, only one is shown.
* Only works if all branches are from the same head branch

