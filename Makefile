ROOTDIR = $(N64_INST)
BUILD_PATH = $(CURDIR)/build
SOURCE_PATH = $(CURDIR)/src
INCLUDE_PATH = $(CURDIR)/include
LIBRARY_NAME = libmain

CFLAGS = -std=gnu99 -O2 -G0 -Wall -Werror -mtune=vr4300 -march=vr4300 -I$(INCLUDE_PATH) -I$(ROOTDIR)/mips64-elf/include
ASFLAGS = -mtune=vr4300 -march=vr4300
N64PREFIX = $(N64_INST)/bin/mips64-elf-
INSTALLDIR = $(N64_INST)
CC = $(N64PREFIX)gcc
AS = $(N64PREFIX)as
LD = $(N64PREFIX)ld
AR = $(N64PREFIX)ar

all: $(LIBRARY_NAME)

$(LIBRARY_NAME): $(BUILD_PATH)/$(LIBRARY_NAME).a

$(BUILD_PATH)/$(LIBRARY_NAME).a: $(BUILD_PATH)/$(LIBRARY_NAME).o
	$(AR) -rcs -o $(BUILD_PATH)/$(LIBRARY_NAME).a $(BUILD_PATH)/$(LIBRARY_NAME).o

$(BUILD_PATH)/$(LIBRARY_NAME).o: $(SOURCE_PATH)/$(LIBRARY_NAME).c
	mkdir -p $(BUILD_PATH)
	$(CC) $(CFLAGS) -c -o $(BUILD_PATH)/$(LIBRARY_NAME).o $(SOURCE_PATH)/$(LIBRARY_NAME).c

install:
	install -m 0644 $(BUILD_PATH)/$(LIBRARY_NAME).a $(INSTALLDIR)/mips64-elf/lib/$(LIBRARY_NAME).a
	install -m 0644 $(INCLUDE_PATH)/$(LIBRARY_NAME).h $(INSTALLDIR)/mips64-elf/include/$(LIBRARY_NAME).h

test:
	make -C test

.PHONY: clean

clean:
	rm -rf $(BUILD_PATH)/*
