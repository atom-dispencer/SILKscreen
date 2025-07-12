# Compiler and archiver
CC := gcc
AR := ar

# Project structure
SRC_DIR := src
INC_DIR := include
OBJ_DIR := build

# Output static library
LIB_NAME := silkscreen
LIB_EXT := a
LIB_FILE := $(LIB_NAME).$(LIB_EXT)

# Compiler flags
CFLAGS := -I$(INC_DIR) -Wall -Wextra -Werror -pedantic -O3 -std=c11

# File lists
SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

# Default target
all: $(LIB_FILE)

# Create output directory if it doesn't exist
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

# Compile source files to object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Archive object files into a static library
$(LIB_FILE): $(OBJS)
	$(AR) rcs $@ $^

# Clean up build artifacts
clean:
	rm -rf $(OBJ_DIR)/*.o $(LIB_FILE)

.PHONY: all clean
