################################################################################
# 自动生成的文件。不要编辑！
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ra_gen/common_data.c \
../ra_gen/hal_data.c \
../ra_gen/main.c \
../ra_gen/pin_data.c \
../ra_gen/vector_data.c 

OBJS += \
./ra_gen/common_data.o \
./ra_gen/hal_data.o \
./ra_gen/main.o \
./ra_gen/pin_data.o \
./ra_gen/vector_data.o 

C_DEPS += \
./ra_gen/common_data.d \
./ra_gen/hal_data.d \
./ra_gen/main.d \
./ra_gen/pin_data.d \
./ra_gen/vector_data.d 


# Each subdirectory must supply rules for building sources it contributes
ra_gen/%.o: ../ra_gen/%.c
	arm-none-eabi-gcc -I"D:\RT-ThreadStudio\workspace\MPU6050_Project" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\board\ports" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\board" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\libraries\HAL_Drivers\config" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\libraries\HAL_Drivers" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\packages\at_device-latest\class\esp8266" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\packages\at_device-latest\inc" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\packages\cJSON-latest" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\packages\mpu6xxx-latest\inc" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\packages\onenet-latest\inc" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\packages\pahomqtt-latest\MQTTClient-RT" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\packages\pahomqtt-latest\MQTTPacket\src" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\packages\webclient-v2.2.0\inc" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\ra\arm\CMSIS_5\CMSIS\Core\Include" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\ra\fsp\inc\api" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\ra\fsp\inc\instances" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\ra\fsp\inc" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\ra_cfg\fsp_cfg\bsp" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\ra_cfg\fsp_cfg" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\ra_gen" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\dfs\filesystems\devfs" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\dfs\include" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\drivers\include" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\drivers\sensors" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\finsh" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\libc\compilers\common" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\libc\compilers\newlib" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\libc\posix\io\poll" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\libc\posix\io\stdio" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\libc\posix\ipc" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\net\at\at_socket" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\net\at\include" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\net\netdev\include" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\net\sal\impl" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\net\sal\include\dfs_net" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\net\sal\include\socket\sys_socket" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\net\sal\include\socket" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\components\net\sal\include" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\include" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\libcpu\arm\common" -I"D:\RT-ThreadStudio\workspace\MPU6050_Project\rt-thread\libcpu\arm\cortex-m4" -include"D:\RT-ThreadStudio\workspace\MPU6050_Project\rtconfig_preinc.h" -std=gnu11 -mcpu=cortex-m33 -mthumb -mfpu=fpv5-sp-d16 -mfloat-abi=hard -ffunction-sections -fdata-sections -Dgcc -O0 -gdwarf-2 -g -Wall -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

