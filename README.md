#GitMap (Work in Progress)
##Description
GitMap creates a map of a git repository, showing all the commits of each branch. 
The map will be saved in a plain text file with the name of (TBD). 
The map will show the author, date, and message of each commit. 
The information of each commit is contained within a box. 
Currently, the box will look like 

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_		
Author: Name of Author		
Date: Date of commit    		
Commit Message		
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_		

The commits at the top of the file refer to the most recent commits. 
The box points upward to show the next/more recent commit. 
An arrow pointing to the side from the commit message means the branch has ended.
An example would be

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_		
Author: Timothy Truong		
Date: Wed Jun 10 14:29:09 2015   
Most recent commit -\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\> \(master\)	
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_		

^    
|    
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_		
Author: Timothy Truong		
Date: Wed Jun 10 14:20:28 2015   
Less recent commit    
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_		

The resulting file will be stored in the directory that was passed into the command.


##Warning
Commit all changes to the repository before running this program. 
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
* If `PathToGitMap/GitMap.sh PathToYourGitRepo` is passed in, 
the screen will output 
`bash: PathToGitMap/GitMap.sh: /bin/bash: bad interpreter: Not a directory`
`Path was not specified. Script will execute in current directory` 
will be printed to the screen.
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
* The output file will be placed in the repo that is used to 
run GitMap.sh
