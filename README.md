#GitMap (Work in Progress)
##Description
GitMap creates a map of a git repository, showing all the commits of each branch. 
The map will be saved in a plain text file with the name of (TBD). 
The map will show the author, date, and message of each commit. 
The information of each commit is contained within a box. 
Currently, the box will look like 
```
_______________________   
Author: Name of Author|		
Date: Date of commit..|    		
Commit Message........|		
_______________________   
```
The commits at the top of the file refer to the most recent commits. 
The box points upward to show the next/more recent commit. 
An arrow pointing to the side from the commit message means the branch has ended.
The long list of periods is to format the box correctly. 
An example would be
```
_______________________________   
Author: Timothy Truong........|		
Date: Wed Jun 10 14:29:09 2015|   
Most recent commit -----------------------------> (master)	
_______________________________

^    
|    
_______________________________   
Author: Timothy Truong........|		
Date: Wed Jun 10 14:20:28 2015|   
Less recent commit............|    
_______________________________
```
The resulting file will be stored in the directory that was passed into the command.


##Warning
Before running this program on a git repository, commit all changes to the repository. 
All uncommited changes will be reverted to the last commit.

##Downloading and Running
To download, run the command:    
```
$ git clone https://github.com/ykamo001/GitMap  
$ . GitMap/GitMap.sh PathToYourGitRepo 
```
If no PathToYourGitRepo is passed in such as
```
$ . PathToGitMap/GitMap.sh
```
The script will run on the current directory.

#Error Messages
* If PathToYourGitRepo is not passed in when running the script,   
`Path was not specified. Script will execute in current directory` 
* If `PathToGitMap/GitMap.sh PathToYourGitRepo` is passed in, 
the screen will output 
`bash: PathToGitMap/GitMap.sh: /bin/bash: bad interpreter: Not a directory`
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
* Boxes aren't fully completed yet
* If the folder isn't a git repository, our script will still try to run and an empty file will be created
* When run, the screen will output 
`Switched to branch \'exampleBranch\'` 
for every branch in the git repository
* If passing in more than one PathToYourGitRep, 
the script will be run only on the first one 
(or third arguement of the command).
* The output file will be placed in the repo that GitMap.sh is ran on
* The box line length may be incorrect 
(Due to outputting an extra box line after merge pull requests)
* The program's runtime is long, about 40 seconds.
