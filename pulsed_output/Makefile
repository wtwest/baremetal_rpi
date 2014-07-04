# The cross tools to use
CROSS = arm-none-linux-gnueabi

# Build directory
BUILD = ./build/

# Source directory
SOURCE = ./source/

# Assembly source and object files
ASM_SOURCE := $(wildcard $(SOURCE)*.s)
ASM_OBJECTS := $(patsubst $(SOURCE)%.s, $(BUILD)%.o, $(wildcard $(SOURCE)*.s))

# C source and object files
C_SOURCE := $(wildcard $(SOURCE)*.c)
C_OBJECTS := $(patsubst $(SOURCE)%.c, $(BUILD)%.o, $(wildcard $(SOURCE)*.c))

# C compiler flag settings
C_FLAGS = -O2 -mfpu=vfp -mfloat-abi=softfp -march=armv6zk -mtune=arm1176jzf-s

# Executable to generate
TARGET = kernel.img

# Assembly listing to generate
LIST = kernel.list

# MAP file to generate
MAP = kernel.map

# Linker script
LD_SCRIPT = kernel.ld

all: $(TARGET) $(LIST)

# Rule to clean up the build
clean:
		-rm -rf $(BUILD)
		-rm -f $(TARGET)
		-rm -f $(LIST)
		-rm -f $(MAP)

# Rule to create the Build directory
$(BUILD):
		mkdir $@

# Rule to make the listing file
$(LIST): $(BUILD)output.elf
		$(CROSS)-objdump -d $(BUILD)output.elf > $(LIST)

# Rule to make the image file
$(TARGET): $(BUILD)output.elf
		$(CROSS)-objcopy $(BUILD)output.elf -O binary $(TARGET)

# Rule to make the elf file
$(BUILD)output.elf: $(C_OBJECTS) $(ASM_OBJECTS)
		$(CROSS)-ld --no-undefined $(C_OBJECTS) $(ASM_OBJECTS) -Map $(MAP) -o $(BUILD)output.elf -T $(LD_SCRIPT)


# Rule to create objects from assembly code
$(ASM_OBJECTS): $(ASM_SOURCE) $(BUILD) 
		$(CROSS)-as -I $(SOURCE) $< -o $@

# Rule to create objects from C code
$(C_OBJECTS): $(C_SOURCE) $(BUILD) 
		$(CROSS)-gcc $(C_FLAGS) -I $(SOURCE) -c $< -o $@



