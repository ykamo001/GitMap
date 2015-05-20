#include <iostream>
#include <string>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <string.h>
#include <cstring>
#include <wait.h>
#include <vector>
#include <fcntl.h>
#include <cstdlib>
#include <errno.h>
#include <sys/stat.h>
#include <boost/algorithm/string/trim.hpp>
#include <boost/algorithm/string.hpp>

using namespace std;
using namespace boost;

int main()
{
	int savestdout;
	if(-1 == close(1))
	{
		perror("There was an error with close(). ");
	}
	vector<string> branches;
	//call execvp to run git branch
	//take all branch names and put into vector
	//for each branch name, call execvp git checkout branchname
	//then open/create a file called branchname for whatever branch we are on
	//then call execvp git log to have all the output go to file
	//close file
	//reopen stdout
	int pid;
	return 0;
}
