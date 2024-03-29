TARGET_EXEC ?= fifi

BUILD_DIR ?= ./bin
SRC_DIRS ?= ./src

CC   := gcc
SRCS := $(shell find $(SRC_DIRS) -name *.c)
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

INC_DIRS := ./hdr
INC_DIRS2 := /usr/local/src/libprotopia4c/hdr
INC_DIRS3 := /usr/local/src/tetraring4c/hdr
INC_DIRS4 := /usr/local/src/c-kai/hdr
INC_FLAGS := $(addprefix -I, $(INC_DIRS) $(INC_DIRS2) $(INC_DIRS3) $(INC_DIRS4))

CFLAGS ?= $(INC_FLAGS) -O3 -Wall -Wextra -MMD -MP -lprotopia -ltetraring -lpthread

$(BUILD_DIR)/$(TARGET_EXEC): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ 

# c source
$(BUILD_DIR)/%.c.o: %.c
	$(MKDIR_P) $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean

clean:
	$(RM) -r $(BUILD_DIR)

install:
	cp ./bin/$(TARGET_EXEC) /usr/lib

-include $(DEPS)

MKDIR_P ?= mkdir -p
