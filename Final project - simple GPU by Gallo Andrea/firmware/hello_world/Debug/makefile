################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf
CC := gcc
PREFIX := riscv-none-elf-
ARCH := rv32ima_zicsr
TARGET := e203_my_periph_demo

# All of the sources participating in the build are defined here
-include sources.mk
-include src/bsp/hbird-e200/stubs/subdir.mk
-include src/bsp/hbird-e200/env/subdir.mk
-include src/bsp/hbird-e200/drivers/plic/subdir.mk
-include src/bsp/hbird-e200/drivers/hclkgen/subdir.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

UNAME := $(shell uname)
ifeq ($(UNAME), Linux)
HEXTOOL = ./makehex64
else
HEXTOOL = .\\makehex64.exe
endif

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
SECONDARY_FLASH += \
$(TARGET).bin \

SECONDARY_SIZE += \
$(TARGET).siz \


# All Target
all: $(TARGET).elf secondary-outputs

# Tool invocations
$(TARGET).elf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GNU RISC-V Cross C Linker'
	-$(PREFIX)$(CC) -march=$(ARCH) -mabi=ilp32 -mcmodel=medlow -msmall-data-limit=8 -mdiv -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common  -g3 -T "../src/bsp/hbird-e200/env/link_itcm.lds" -nostartfiles -Xlinker --gc-sections -Wl,-Map,"$(TARGET).map" --specs=nano.specs -o "$(TARGET).elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

$(TARGET).bin: $(TARGET).elf
	@echo 'Invoking: GNU RISC-V Cross Create Flash Image'
	-$(PREFIX)objcopy -O binary "$(TARGET).elf"  "$(TARGET).bin"
	@echo 'Finished building: $@'
	@echo ' '
	@echo 'Converting bin file to verilog HEX'

	$(HEXTOOL) $(TARGET).bin
	@echo 'RAM.HEX generated.'

$(TARGET).siz: $(TARGET).elf
	@echo 'Invoking: GNU RISC-V Cross Print Size'
	-$(PREFIX)size --format=berkeley "$(TARGET).elf"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(SECONDARY_FLASH)$(SECONDARY_SIZE)$(ASM_DEPS)$(S_UPPER_DEPS)$(C_DEPS) $(TARGET).elf
	-@echo ' '

secondary-outputs: $(SECONDARY_FLASH) $(SECONDARY_SIZE)

.PHONY: all clean dependents

-include ../makefile.targets
