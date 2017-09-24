########################################################
CC=gcc
CFLAGS= -g -Wall -pedantic
EJS = ocabas
########################################################
OBJECTS = command.o game.o game_loop.o graphic_engine.o screen.o space.o
########################################################

all: $(EJS)

ocabas: $(OBJECTS)
	$(CC) $(CFLAGS) -o ocabas $(OBJECTS) 


game_loop.o: game_loop.c graphic_engine.h
	$(CC) $(CFLAGS) -c game_loop.c

command.o: command.c command.h 
	$(CC) $(CFLAGS) -c command.c

game.o: game.c game.h command.h space.h
	$(CC) $(CFLAGS) -c game.c

graphic_engine.o: graphic_engine.c graphic_engine.h game.h
	$(CC) $(CFLAGS) -c graphic_engine.c

screen.o: screen.c screen.h 
	$(CC) $(CFLAGS) -c screen.c

space.o: space.c space.h types.h
	$(CC) $(CFLAGS) -c space.c


clear:
	rm -rf *.o 
