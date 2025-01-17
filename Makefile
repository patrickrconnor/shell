CFLAGS = -g3 -Wall -Wextra -Wconversion -Wcast-qual -Wcast-align -g
CFLAGS += -Winline -Wfloat-equal -Wnested-externs
CFLAGS += -pedantic -std=gnu99 -Werror -D_GNU_SOURCE
CC = gcc
EXECS = 33sh 33noprompt
SOURCE = sh.c jobs.c jobs.h
PROMPT = -DPROMPT

.PHONY: all clean

all: $(EXECS)

jobs: jobs.h
	$(CC) $(CFLAGS) $^ -o $@
33sh: $(SOURCE)
	$(CC) $(CFLAGS) $(SOURCE) $(PROMPT) -o $@
33noprompt: $(SOURCE)
	$(CC) $(CFLAGS) $(SOURCE) -o $@
clean:
	rm -f $(EXECS)

