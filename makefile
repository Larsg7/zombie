jaogll: JAOGLL/*.h JAOGLL/src/*.cpp JAOGLL/external/*
	g++ -c JAOGLL/src/*.cpp JAOGLL/external/*.cpp -fpic -std=c++0x
	g++ --shared -o libjaogll.so *.o -lSDL2 -lGL -lGLEW -std=c++0x

all: jaogll test

test: main.cpp main_game.cpp main_game.h
	g++ -o test main.cpp main_game.cpp main_game.h ./libjaogll.so

clean:
	rm *.o libjaogll.so test JAOGLL/*.gch JAOGLL/external/*.gch
