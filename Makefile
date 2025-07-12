CC        = gcc
LIB       = lib/libsilkscreen.a
INCLUDE   = include
OBJ       = lib
SRC       = src

SRCS      += $(shell find $(SRC) -type f -name '*.c')
OBJS      = $(patsubst $(SRC)/%.c,$(OBJ)/%.o,$(SRCS))

WARNFLAGS = -Wall -Wextra -Werror -pedantic
PFLAGS    = -pthread
# LDLIBS    = 

.PHONY: clean format

$(OBJ)/%.o: $(SRC)/%.c
	@mkdir -p "$(@D)"
	@echo "Compiling: $< -> $@"
	$(CC) -c -g $(CFLAGS) -I$(INCLUDE) $< -o $@

$(LIB): $(OBJS)
	@echo "Linking: $@"
	$(CC) $^ $(DYNFLAGS) $(WARNFLAGS) -I$(INCLUDE) -o $@

$(OBJ):
	mkdir -p $@

format: $(SRC)
	clang-format $^ -i

clean:
	rm -rf $(OBJ) $(EXE)
