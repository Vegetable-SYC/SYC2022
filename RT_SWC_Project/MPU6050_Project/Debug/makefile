################################################################################
# 自动生成的文件。不要编辑！
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include rt-thread/src/subdir.mk
-include rt-thread/libcpu/arm/cortex-m4/subdir.mk
-include rt-thread/libcpu/arm/common/subdir.mk
-include rt-thread/components/net/sal/src/subdir.mk
-include rt-thread/components/net/sal/socket/subdir.mk
-include rt-thread/components/net/sal/impl/subdir.mk
-include rt-thread/components/net/sal/dfs_net/subdir.mk
-include rt-thread/components/net/netdev/src/subdir.mk
-include rt-thread/components/net/at/src/subdir.mk
-include rt-thread/components/net/at/at_socket/subdir.mk
-include rt-thread/components/libc/posix/io/poll/subdir.mk
-include rt-thread/components/libc/compilers/newlib/subdir.mk
-include rt-thread/components/libc/compilers/common/subdir.mk
-include rt-thread/components/finsh/subdir.mk
-include rt-thread/components/drivers/serial/subdir.mk
-include rt-thread/components/drivers/sensors/subdir.mk
-include rt-thread/components/drivers/misc/subdir.mk
-include rt-thread/components/drivers/ipc/subdir.mk
-include rt-thread/components/drivers/i2c/subdir.mk
-include rt-thread/components/dfs/src/subdir.mk
-include rt-thread/components/dfs/filesystems/devfs/subdir.mk
-include ra_gen/subdir.mk
-include ra/fsp/src/r_sci_uart/subdir.mk
-include ra/fsp/src/r_ioport/subdir.mk
-include ra/fsp/src/r_icu/subdir.mk
-include ra/fsp/src/r_gpt/subdir.mk
-include ra/fsp/src/bsp/mcu/all/subdir.mk
-include ra/fsp/src/bsp/cmsis/Device/RENESAS/Source/subdir.mk
-include packages/webclient-v2.2.0/src/subdir.mk
-include packages/pahomqtt-latest/MQTTPacket/src/subdir.mk
-include packages/pahomqtt-latest/MQTTClient-RT/subdir.mk
-include packages/onenet-latest/src/subdir.mk
-include packages/onenet-latest/samples/subdir.mk
-include packages/mpu6xxx-latest/src/subdir.mk
-include packages/mpu6xxx-latest/inc/subdir.mk
-include packages/cJSON-latest/subdir.mk
-include packages/at_device-latest/src/subdir.mk
-include packages/at_device-latest/samples/subdir.mk
-include packages/at_device-latest/class/esp8266/subdir.mk
-include libraries/HAL_Drivers/subdir.mk
-include board/ports/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
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
rtthread.hex \

SECONDARY_SIZE += \
rtthread.siz \


# 所有目标
all: rtthread.elf secondary-outputs

# 工具调用
rtthread.elf: $(OBJS) $(USER_OBJS)
	arm-none-eabi-gcc -T "D:\RT-ThreadStudio\workspace\MPU6050_Project\script\fsp.ld" -Xlinker --gc-sections -L"D:\RT-ThreadStudio\workspace\MPU6050_Project\script" -Wl,-Map,"rtthread.map" -Xlinker --cref -mcpu=cortex-m33 -mthumb -mfpu=fpv5-sp-d16 -mfloat-abi=hard -ffunction-sections -fdata-sections -Wl,--gc-sections,-Map=rtthread.map,-cref,-u,Reset_Handler -L script/ -o "rtthread.elf" $(OBJS) $(USER_OBJS) $(LIBS)

rtthread.hex: rtthread.elf
	arm-none-eabi-objcopy -O ihex "rtthread.elf"  "rtthread.hex"

rtthread.siz: rtthread.elf
	arm-none-eabi-size --format=berkeley "rtthread.elf"

# 其他目标
clean:
	-$(RM) $(OBJS)$(SECONDARY_FLASH)$(SECONDARY_SIZE)$(ASM_DEPS)$(S_DEPS)$(S_UPPER_DEPS)$(C_DEPS) rtthread.elf
	-@echo ' '

secondary-outputs: $(SECONDARY_FLASH) $(SECONDARY_SIZE)

.PHONY: all clean dependents

-include ../makefile.targets
