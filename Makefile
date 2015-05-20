FLAGS =  -std=c++11 -g -Wall -Werror -pedantic  

all: map bin
	
map: bin src/GitMap.cpp
	g++ $(FLAGS) src/GitMap.cpp -o bin/GitMap

bin: 
	mkdir bin
