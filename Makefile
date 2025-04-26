CC=gcc
CFLAGS=-g -Wall -D_FILE_OFFSET_BITS=64
LDFLAGS=-lfuse

OBJ=fs.o block.o

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

fs: $(OBJ)
	$(CC) $(OBJ) $(LDFLAGS) -o fs -lbsd -lm -lpthread

.PHONY: clean
clean:
	rm -f *.o fs

