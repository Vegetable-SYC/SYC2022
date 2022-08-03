################################################################################
# 自动生成的文件。不要编辑！
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../rt-thread/src/clock.c \
../rt-thread/src/components.c \
../rt-thread/src/device.c \
../rt-thread/src/idle.c \
../rt-thread/src/ipc.c \
../rt-thread/src/irq.c \
../rt-thread/src/kservice.c \
../rt-thread/src/mem.c \
../rt-thread/src/object.c \
../rt-thread/src/scheduler.c \
../rt-thread/src/thread.c \
../rt-thread/src/timer.c 

OBJS += \
./rt-thread/src/clock.o \
./rt-thread/src/components.o \
./rt-thread/src/device.o \
./rt-thread/src/idle.o \
./rt-thread/src/ipc.o \
./rt-thread/src/irq.o \
./rt-thread/src/kservice.o \
./rt-thread/src/mem.o \
./rt-thread/src/object.o \
./rt-thread/src/scheduler.o \
./rt-thread/src/thread.o \
./rt-thread/src/timer.o 

C_DEPS += \
./rt-thread/src/clock.d \
./rt-thread/src/components.d \
./rt-thread/src/device.d \
./rt-thread/src/idle.d \
./rt-thread/src/ipc.d \
./rt-thread/src/irq.d \
./rt-thread/src/kservice.d \
./rt-thread/src/mem.d \
./rt-thread/src/object.d \
./rt-thread/src/scheduler.d \
./rt-thread/src/thread.d \
./rt-thread/src/timer.d 


# Each subdirectory must supply rules for building sources it contributes
rt-thread/src/%.o: ../rt-thread/src/%.c
	arm-none-eabi-gcc -I"D:\RT-ThreadStudio\workspace\MPU6050_Project" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\board\ports" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\board" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\libraries\HAL_Drivers\config" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\libraries\HAL_Drivers" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\packages\at_device-latest\class\esp8266" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\packages\at_device-latest\inc" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\packages\cJSON-latest" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\packages\mpu6xxx-latest\inc" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\packages\onenet-latest\inc" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\packages\pahomqtt-latest\MQTTClient-RT" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\packages\pahomqtt-latest\MQTTPacket\src" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\packages\webclient-v2.2.0\inc" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\ra\arm\CMSIS_5\CMSIS\Core\Include" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\ra\fsp\inc\api" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\ra\fsp\inc\instances" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\ra\fsp\inc" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\ra_cfg\fsp_cfg\bsp" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\ra_cfg\fsp_cfg" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\ra_gen" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\dfs\filesystems\devfs" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\dfs\include" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\drivers\include" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\drivers\sensors" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\finsh" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\libc\compilers\common" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\libc\compilers\newlib" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\libc\posix\io\poll" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\libc\posix\io\stdio" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\libc\posix\ipc" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\net\at\at_socket" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\net\at\include" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\net\netdev\include" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\net\sal\impl" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\net\sal\include\dfs_net" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\net\sal\include\socket\sys_socket" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\net\sal\include\socket" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\net\sal\include" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\include" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\libcpu\arm\common" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\libcpu\arm\cortex-m4" -include"D:\RT-ThreadStudio\workspace\MPU6050_Project\rtconfig_preinc.h" -std=gnu11 -mcpu=cortex-m33 -mthumb -mfpu=fpv5-sp-d16 -mfloat-abi=hard -ffunction-sections -fdata-sections -Dgcc -O0 -gdwarf-2 -g -Wall -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

