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
#include <fstream>
#include <sys/stat.h>
#include <boost/algorithm/string/trim.hpp>
#include <boost/algorithm/string.hpp>

using namespace std;
using namespace boost;

void execfunction(char **argv, string command)
{
	int pid = fork();
	if(-1 == pid)
	{
		perror("There was an error with fork(). ");
	}
	else if(pid == 0)
	{
		if(-1 == execvp(command.c_str(), argv))
		{
			perror("There was an error with execvp() ");
			exit(1);
		}
		_exit(0);
	}
	else
	{
		int status;
		wait(&status);
		if(-1 == status)
		{
			perror("There was an error with wait(). ");
		}
	}
}

int main()
{
	int savestdout;
	if(-1 == (savestdout = dup(1)))
	{
		perror("There was an error with dup(). ");
	}
	if(-1 == close(1))
	{
		perror("There was an error with close(). ");
	}
	vector<string> branches;
	//call execvp to run git branch
	char file_name[7] = {'X','X','X','X','X','X',0}; 
	int write_to;
	char **argv = new char*[3];
	argv[0] = const_cast<char*>("git");
	argv[1] = const_cast<char*>("branch");
	argv[2] = 0;
	if(-1 == (write_to = mkstemp(file_name))) {
		perror("There was an error with mkstemp(). ");
		exit(1);
	}

	execfunction(argv, "git");
	delete []argv;
	if(-1 == close(write_to))
	{
		perror("There was an error with close(). ");
	}
	if(-1 == dup2(savestdout, 1))
	{
		perror("There was an error with dup2(). ");
	}
	/*int read_from;
	if(-1 == (read_from = open(file_name, O_RDONLY)))
	{
		perror("There was an error with open(). ");
	}
	int size;
	char c[BUFSIZ];
	if(-1 == (size = read(read_from, &c, BUFSIZ))) 
	{
		perror("There was an error with read(). ");
	}
	while(size > 0)
	{
		branches.push_back(string(c));
		if(-1 == (size = read(read_from, &c, BUFSIZ))) 
		{
			perror("There was an error with read(). ");
		}
	}
	if(-1 == close(read_from))
	{
		perror("There was an error with close(). ");
	}*/
	string line;
	ifstream myfile(file_name);
	while(myfile.good())
	{
		getline(myfile, line);
		branches.push_back(line);
	}
	myfile.close();
	//take all branch names and put into vector
	//for each branch name, call execvp git checkout branchname
	string currBranch;
	string temp;
	for(unsigned int i = 0; i < branches.size(); ++i)
	{
		temp = branches.at(i);
		if(temp.at(0) == '*')
		{
			currBranch = (temp).substr(2, temp.size()-2);
			branches.at(i) = currBranch;
		}
		else
		{
			branches.at(i) = (temp).substr(2, temp.size()-2);
		}
		cout << branches.at(i) << endl;
	}
	argv = new char*[3];
	argv[0] = const_cast<char*>("rm");
	argv[1] = const_cast<char*>(file_name);
	argv[2] = 0;
	execfunction(argv, "rm");
	delete []argv;
	//then open/create a file called branchname for whatever branch we are on
	if(-1 == (savestdout = dup(1)))
	{
		perror("There was an error with dup(). ");
	}
	if(-1 == close(1))
	{
		perror("There was an error with close(). ");
	}
	int changed = 0;
	for(unsigned int i = 0; i < branches.size(); ++i)
	{
		if(currBranch != branches.at(i))
		{
			argv = new char*[4];
			argv[0] = const_cast<char*>("git");
			argv[1] = const_cast<char*>("checkout");
			argv[2] = const_cast<char*>((branches.at(i)).c_str());
			argv[3] = 0;
			execfunction(argv, "git");
			delete []argv;
			changed++;
		}
		string name = branches.at(i);
		name += "Branch";
		if(-1 == (write_to = open(name.c_str() , O_CREAT | O_WRONLY | O_APPEND | O_TRUNC, S_IRUSR | S_IWUSR)))
		{
			perror("There was an error with open(). ");
			exit(1);
		}
		argv = new char*[3];
		argv[0] = const_cast<char*>("git");
		argv[1] = const_cast<char*>("log");
		argv[2] = 0;
		execfunction(argv, "git");
		delete []argv;
		if(-1 == close(write_to))
		{
			perror("There was an error with close(). ");
		}
	}
	if(-1 == dup2(savestdout, 1))
	{
		perror("There was an error with dup2(). ");
	}
	if(changed > 0)
	{
		argv = new char*[4];
		argv[0] = const_cast<char*>("git");
		argv[1] = const_cast<char*>("checkout");
		argv[2] = const_cast<char*>(currBranch.c_str());
		argv[3] = 0;
		execfunction(argv, "git");
		delete []argv;
	}
	//then call execvp git log to have all the output go to file
	//close file
	return 0;
}
