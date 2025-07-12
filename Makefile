CC := gcc

SRC_DIR := src
INC_DIR := include
OBJ_DIR := build
LIB_BASE_NAME = silkscreen

ifeq ($(OS),Windows_NT)
	LIB_EXT := lib
	RM      := del /Q
	AR      := lib /OUT:
else
	LIB_EXT := a
	RM      := rm -rf
  AR      := ar rcs
endif

SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

CFLAGS  := -I$(INC_DIR) -Wall -Wextra -Werror -pedantic -O3 -std=c11
ARFLAGS := rcs

all: $(OBJ_DIR) $(LIB_BASE_NAME).$(LIB_EXT)

$(OBJ_DIR):
	mkdir $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(LIB_BASE_NAME).$(LIB_EXT): $(OBJS)
ifeq ($(OS),Windows_NT)
	$(AR)$@ $^
else
	$(AR) $@ $^
endif

clean:
	$(RM) $(OBJ_DIR)
	$(RM) $(LIB_BASE_NAME).$(LIB_EXT)

.PHONY: all clean
