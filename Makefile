PROJ_DIR = .
INCLUDE_DIR     = $(PROJ_DIR)/include
SRC_DIR         = $(PROJ_DIR)/src
OBJ_DIR         = $(PROJ_DIR)/obj

INCLUDE = -I $(INCLUDE_DIR)
CFLAGS  = -march=x86-64 -fno-builtin -c -Wall $(INCLUDE)
CC      = /usr/bin/gcc
BIN	= main

SRC =	$(SRC_DIR)/main.c	\
	$(SRC_DIR)/config.c		\
		$(SRC_DIR)/atree.c  \
		$(SRC_DIR)/llist.c  \
		 $(SRC_DIR)/zmem.c 

#OBJ =   ${SRC:%.c=%.o}
OBJ =	$(OBJ_DIR)/main.o	\
	$(OBJ_DIR)/config.o		\
		$(OBJ_DIR)/atree.o	\
		 $(OBJ_DIR)/llist.o  \
		  $(OBJ_DIR)/zmem.o
#---make targets
all:	$(BIN)
#%.o:	%.c
#	$(CC) $(CFLAGS) -c $< -o $(OBJ_DIR)/$@
			#
$(OBJ_DIR)/main.o: $(SRC_DIR)/main.c
	$(CC) -c $(CFLAGS) $< -o $@
$(OBJ_DIR)/config.o: $(SRC_DIR)/config.c
	$(CC) -c $(CFLAGS) $< -o $@
$(OBJ_DIR)/atree.o:	$(SRC_DIR)/atree.c
	$(CC) -c $(CFLAGS) $< -o $@
$(OBJ_DIR)/llist.o: $(SRC_DIR)/llist.c
	$(CC) -c $(CFLAGS) $< -o $@
$(OBJ_DIR)/zmem.o: $(SRC_DIR)/zmem.c
	$(CC) -c $(CFLAGS) $< -o $@

main: $(OBJ)
	$(CC) -o $(OBJ_DIR)/$(BIN) $(OBJ) 
			#
.PHONY : clean
clean:	
	rm -f $(OBJ_DIR)/*.o
	rm -f $(OBJ_DIR)/main
