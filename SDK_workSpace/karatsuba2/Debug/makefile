################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include src/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
karatsuba2.elf.size \

ELFCHECK += \
karatsuba2.elf.elfcheck \


# All Target
all: karatsuba2.elf secondary-outputs

# Tool invocations
karatsuba2.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo Building target: $@
	@echo Invoking: MicroBlaze gcc linker
	mb-gcc -Wl,-T -Wl,../src/lscript.ld -L../../karatsuba2_bsp/microblaze_0/lib -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.20.a -mno-xl-soft-mul -o"karatsuba2.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo Finished building target: $@
	@echo ' '

karatsuba2.elf.size: karatsuba2.elf
	@echo Invoking: MicroBlaze Print Size
	mb-size karatsuba2.elf  |tee "karatsuba2.elf.size"
	@echo Finished building: $@
	@echo ' '

karatsuba2.elf.elfcheck: karatsuba2.elf
	@echo Invoking: Xilinx ELF Check
	elfcheck karatsuba2.elf -hw ../../Simulation_hw_platform/system.xml -pe microblaze_0  |tee "karatsuba2.elf.elfcheck"
	@echo Finished building: $@
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES)$(ELFSIZE)$(ELFCHECK)$(S_UPPER_DEPS) karatsuba2.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE) $(ELFCHECK)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
