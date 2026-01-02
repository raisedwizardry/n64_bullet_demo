ROM_NAME := BulletDemo
N64_EMULATOR := /Applications/ares.app/Contents/MacOS/ares

BUILD_DIR=build

include $(N64_INST)/include/n64.mk
include $(N64_INST)/include/bullet.mk

# add the header files
header = $(wildcard src/*.hpp)

src = $(wildcard src/*.cpp) 

all: $(ROM_NAME).z64

$(BUILD_DIR)/$(ROM_NAME).elf: $(src:%.cpp=$(BUILD_DIR)/%.o)

$(ROM_NAME).z64: N64_ROM_TITLE="$(ROM_NAME)"

run: $(ROM_NAME).z64
	$(N64_EMULATOR) $(ROM_NAME).z64

clean:
	rm -rf $(BUILD_DIR) filesystem $(ROM_NAME).z64

-include $(wildcard $(BUILD_DIR)/*.d)

.PHONY: all clean