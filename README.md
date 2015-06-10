#GitMap (Work in Progress)
##Description
GitMap creates a map of a git repository, showing all the commits of each branch. 
The map will be saved in a plain text file with the name of (TBD). 
The map will show the author, date, and message of each commit. 
The information of each commit is contained within a box. 
The commits at the top of the file refer to the most recent commits. 
The box points upward to show the next/more recent commit. 
An arrow pointing to the side means the branch has ended.

##Warning
Commit all changes to the repository before running this program. 
All uncommited changes will be reverted to the last commit.

##Downloading and Running
To download, run the command:    
```
$ git clone https://github.com/ykamo001/GitMap  
$ cd GitMap  
$ . ./GitMap.sh PathToYourGitRepo 
```
##Examples


##Bugs and Issues
* Running the program will create a file with a random, 3-lettered name
* Boxes aren't fully completed yet
