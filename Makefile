LIBRARY_NAME = main

FULL_LIBRARY_NAME = lib$(LIBRARY_NAME)
all: $(FULL_LIBRARY_NAME)

V = 1
SOURCE_DIR = src
BUILD_DIR = build
include $(N64_INST)/include/n64.mk

# Activate N64 toolchain
$(FULL_LIBRARY_NAME): CC=$(N64_CC)
$(FULL_LIBRARY_NAME): AS=$(N64_AS)
$(FULL_LIBRARY_NAME): LD=$(N64_LD)
$(FULL_LIBRARY_NAME): CFLAGS+=$(N64_CFLAGS) -I$(CURDIR)/include
$(FULL_LIBRARY_NAME): ASFLAGS+=$(N64_ASFLAGS) -I$(CURDIR)/include
$(FULL_LIBRARY_NAME): LDFLAGS+=$(N64_LDFLAGS)
$(FULL_LIBRARY_NAME): $(BUILD_DIR)/lib$(LIBRARY_NAME).a

$(BUILD_DIR)/$(FULL_LIBRARY_NAME).a: $(BUILD_DIR)/$(FULL_LIBRARY_NAME).o
	$(AR) -rcs -o $@ $^

install: $(FULL_LIBRARY_NAME)
	install -Cv -m 0644 $(BUILD_DIR)/$^.a $(N64_INST)/mips64-elf/lib/$^.a
	install -Cv -m 0644 include/$^.h $(N64_INST)/mips64-elf/include/$^.h

example: install
	$(MAKE) -C example LIBRARY_NAME=$(LIBRARY_NAME)

.PHONY: clean install $(FULL_LIBRARY_NAME)

clean:
	$(MAKE) -C example clean
	rm -rf $(BUILD_DIR)/*

-include $(wildcard $(BUILD_DIR)/*.d)
