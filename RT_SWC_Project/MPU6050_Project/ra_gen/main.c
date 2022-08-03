#include <rtthread.h>
#include <rtdevice.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <onenet.h>
#include <rtdbg.h>
#include <finsh.h>
#include "mpu6xxx.h"
#include "stdio.h"

#define DBG_ENABLE
#define DBG_COLOR
#define DBG_SECTION_NAME    "onenet.sample"
#define PWM_DEV_NAME        "pwm8"  /* PWM设备名称 */
#define PWM_DEV_CHANNEL     0       /* PWM通道 */
#define THREAD_PRIORITY         25
#define THREAD_STACK_SIZE       512
#define THREAD_TIMESLICE        5
#define DBG_TAG  "sensor.cmd"
#define DBG_LVL DBG_INFO
#define MPU6XXX_DEVICE_NAME  "i2c1"

#if ONENET_DEBUG
#define DBG_LEVEL           DBG_LOG
#else
#define DBG_LEVEL           DBG_INFO
#endif /* ONENET_DEBUG */


struct rt_device_pwm *pwm_dev;      /* PWM设备句柄 */
static rt_thread_t tid1 = RT_NULL;
static rt_thread_t tid2 = RT_NULL;
static rt_thread_t tid3 = RT_NULL;
int value , state , m;
float temp , tmp;

int main(int argc, char **argv) {

}


static int pwm_led(int argc, char *argv[])
{
    rt_uint32_t period, pulse, dir;

    period = 100000;     /* 周期为0.5ms，单位为纳秒ns */
    dir = 1;            /* PWM脉冲宽度值的增减方向 */
    pulse = 0;          /* PWM脉冲宽度值，单位为纳秒ns */

    /* 查找设备 */
    pwm_dev = (struct rt_device_pwm *)rt_device_find(PWM_DEV_NAME);
    if (pwm_dev == RT_NULL)
    {
        rt_kprintf("pwm sample run failed! can't find %s device!\n", PWM_DEV_NAME);
        return RT_ERROR;
    }

    /* 设置PWM周期和脉冲宽度默认值 */
    rt_pwm_set(pwm_dev, PWM_DEV_CHANNEL, period, pulse);
    /* 使能设备 */
    rt_pwm_enable(pwm_dev, PWM_DEV_CHANNEL);

    while (1)
    {
        rt_thread_mdelay(50);
        if (dir)
        {
            pulse += value;      /* 从0值开始每次增加value ns */
        }
        else
        {
            pulse -= value;      /* 从最大值开始每次减少value ns */
        }
        if (pulse >= period)
        {
            dir = 0;
        }
        if (0 == pulse)
        {
            dir = 1;
        }

        /* 设置PWM周期和脉冲宽度 */
        rt_pwm_set(pwm_dev, PWM_DEV_CHANNEL, period, pulse);
    }
}

ALIGN(RT_ALIGN_SIZE)

static int onenet_temp(void *parameter)
{
        int i=0;
        struct mpu6xxx_device *dev;
        struct mpu6xxx_3axes accel, gyro;
        double aacx_g, aacy_g, aacz_g,gyrox_g, gyroy_g, gyroz_g;
        /* Initialize mpu6xxx, The parameter is RT_NULL, means auto probing for i2c*/
        dev = mpu6xxx_init(MPU6XXX_DEVICE_NAME, RT_NULL);
        if (dev == RT_NULL)
        {
            rt_kprintf("mpu6xxx init failed\n");
            return -1;
        }
        rt_kprintf("mpu6xxx init succeed\n");
        while (1)
        {
            i++;
            mpu6xxx_get_accel(dev, &accel);
            mpu6xxx_get_gyro(dev, &gyro);
            mpu6xxx_get_temp(dev, &temp);

            tmp = temp;

            aacx_g=accel.x/500.0;//计算各方向加速度
            rt_thread_mdelay(30);
            aacy_g=accel.y/500.0;
            rt_thread_mdelay(30);
            aacz_g=accel.z/500.0;
            rt_thread_mdelay(30);

            gyrox_g=gyro.x/500.0;//计算各方向角加速度
            rt_thread_mdelay(30);
            gyroy_g=gyro.y/500.0;
            rt_thread_mdelay(30);
            gyroz_g=gyro.z/500.0;
            rt_thread_mdelay(30);

            if( temp < 23 )//判断MPU6050模块是否正常运行
            {
                m = 0;
                onenet_mqtt_upload_string("mpu6050_state", "low");
                rt_thread_mdelay(10);
            }
            if(( temp >23 && temp <32 ))
            {
                m = 1;
                onenet_mqtt_upload_string("mpu6050_state", "good");
                rt_thread_mdelay(10);
            }
            if( temp > 32 )
            {
                m = 2;
                onenet_mqtt_upload_string("mpu6050_state", "high");
                rt_thread_mdelay(10);
            }

            onenet_mqtt_upload_digit("mpu6050_temp" , temp);//各数据上云
            rt_thread_mdelay(50);
            onenet_mqtt_upload_digit("aacx_g" , aacx_g);
            rt_thread_mdelay(30);
            onenet_mqtt_upload_digit("aacy_g" , aacy_g);
            rt_thread_mdelay(30);
            onenet_mqtt_upload_digit("aacz_g" , aacz_g);
            rt_thread_mdelay(30);
            onenet_mqtt_upload_digit("gyrox_g" , gyrox_g);
            rt_thread_mdelay(30);
            onenet_mqtt_upload_digit("gyroy_g" , gyroy_g);
            rt_thread_mdelay(30);
            onenet_mqtt_upload_digit("gyroz_g" , gyroz_g);
            rt_thread_mdelay(30);

            printf("--*---------------**----------------*--\n");//在串口七输出各数据的值
            printf("num:%d\n",i);
            rt_thread_mdelay(20);
            printf("temp:%d.%d\n", (int)(temp * 100) / 100, (int)(temp * 100) % 100 );
            rt_thread_mdelay(20);
            printf("acceg.x = %f, acceg.y = %f, acceg.z = %f\n", aacx_g , aacy_g , aacz_g );
            rt_thread_mdelay(20);
            printf("gyrog.x = %f, gyrog.y = %f, gyrog.z = %f\n", gyrox_g, gyroy_g, gyroz_g);
            printf("--*---------------**----------------*--\n\n");
            rt_thread_mdelay(2000);
        }
}

ALIGN(RT_ALIGN_SIZE)

static void temp_pattern(void *parameter)//调整呼吸灯的频率
{
    switch(m)
    {
        case 0:
            value = 3000;
            break;
        case 1:
            value = 5000;
            break;
        case 2:
            value = 7000;
            break;
    }
}
int mpu6050_state(void)//线程启动
{
    /* 创建线程 1，名称是 thread1，入口是 thread1_entry*/
    tid1 = rt_thread_create("pwm_led",
                            pwm_led, RT_NULL,
                            THREAD_STACK_SIZE,
                            THREAD_PRIORITY, THREAD_TIMESLICE);

    /* 如果获得线程控制块，*/
    if (tid1 != RT_NULL)
        rt_thread_startup(tid1);

    /* 初始化线程 2，名称是 thread2，入口是 thread2_entry */
    tid2 = rt_thread_create("onenet_send",
                            onenet_temp,
                           RT_NULL,
                           2 * 1024,
                           RT_THREAD_PRIORITY_MAX / 3 - 1,
                           5);

    /* 如果获得线程控制块，启动这个线程 */
    if (tid2 != RT_NULL)
        rt_thread_startup(tid2);

    tid3 = rt_thread_create("pwm_change",
                            temp_pattern, RT_NULL,
                            THREAD_STACK_SIZE,
                            THREAD_PRIORITY, THREAD_TIMESLICE);

    /* 如果获得线程控制块，启动这个线程 */
    if (tid3 != RT_NULL)
        rt_thread_startup(tid3);

    return 0;
}

/* 导出到 msh 命令列表中 */
MSH_CMD_EXPORT(mpu6050_state, mpu6050 project);
