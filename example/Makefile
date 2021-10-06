all: example.z64

V=1
BUILD_DIR=build
LDFLAGS += -l$(LIBRARY_NAME)
include $(N64_INST)/include/n64.mk

src = main.c

$(BUILD_DIR)/example.elf: $(src:%.c=$(BUILD_DIR)/%.o) $(N64_INST)/mips64-elf/lib/lib$(LIBRARY_NAME).a

example.z64: N64_ROM_TITLE="Example"

clean:
	rm -rf $(BUILD_DIR) example.z64

.PHONY: all clean

-include $(wildcard $(BUILD_DIR)/*.d)


