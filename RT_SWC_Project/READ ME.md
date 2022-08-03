# **READ ME**

## author：Eason shen         MCU：瑞萨RA6M4

### 项目介绍：

​		本项目旨在读取mpu6050传感器的数据并解算原始数据得到各方向的加速度和角加速度，同时还可以监测环境温度确保硬件处于适合的工作环境，我使用的mpu6050传感器的量程是1000，加速度是+-2g。

​		由于个人考虑不周到，我在项目开发的时候没有定义宏定义，这也导致如果使用的mpu6050模块不同时的代码修改工程量巨大。开发该项目的时候使用软件包和修改sample实例里的代码即可，上手简单，都是一些简单的调用，我们只需要编写逻辑即可。

​		本项目一共有三个线程,分别是实现PWM呼吸灯效果、上云平台及采集解析数据、更改呼吸灯的频率。

### 使用方法：

​		编译下载之后使用xshell连接MCU,先使用onenet_mqtt_init初始化连接上云平台，然后直接运行指令MPU6050_state即可，会输出是第几波数据，温度以及各方向的加速度和角加速度，云平台上获得的数据同理，云平台上还有一个温度状态的显示，正常输出good，较低输出low，较高输出high，这些都可以在main.c函数中修改。