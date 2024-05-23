#ifndef __COMMON_H__
#define __COMMON_H__

//==============================================================================
//	Include Header Files
//==============================================================================
#include <ny8.h>
#include "NY8_constant.h"	


//==============================================================================
//	Macro Definition
//==============================================================================
typedef unsigned char u8; 
typedef unsigned short u16;
typedef unsigned long u32;

#define USE_4M_2T				1
#define USE_8M_2T				2	//加湿器项要产生108K 只能用8M_2T其他不支持

#define TRUE					1
#define FALSE					0

#define __CPU_NY8A054D__		1//
#define __CPU_NY8A062D__		2//
#define USE_MCU				__CPU_NY8A062D__//__CPU_NY8A062D

#define	USE_CPU_CLOCK			USE_8M_2T		// 改变频率时也要在 IED左边 Config Block *.cb重新设置
#define	USE_TIMER0_1K			FALSE			// Timer0使用1K频率
#define	USE_TIMER0_10K			TRUE			// Timer0使用10K频率
#define	USE_TEST				FALSE//TRUE			//test 开关		
//isr.c
#define TIME_BASE_10MS			10
#define TIME_BASE_100MS			10
#define TIME_BASE_250MS			25
#define TIME_BASE_1S			100

//设置CHRG和STDBY,CS
#define	C_IO_CHRG				PORTAbits.PA5
#define	C_IO_USB_DEC			PORTAbits.PA2
#define	C_IO_HEATER_CHECK_DEC	PORTAbits.PA0
#define I0_ADC					PORTAbits.PA0

//AD检测口通道(非VDD通道)
#define Quarter_VDD				1
#define ADC_CHANNEL				2
#define ADC_CHANNEL2			3

//#define ADC_CHANNEL				C_ADC_PA0//C_ADC_PB1

//#define C_IO_OVERCURRENT_CHECK_DEC PORTBbits.PB0//如果过流用的是IO口电平检测则打开这个宏定义

#define	EN_PAUSE_CHRG			PORTAbits.PA4 = 1//充电状态下吸烟时临时关闭充电电流
#define	EN_RESUME_CHRG			PORTAbits.PA4 = 0//充电状态下吸烟停止时恢复充电电流

#define I0_PWM2					PORTBbits.PB2

#define LED_ON 					0
#define LED_OFF 				1

#define OUT_LED_R 				PORTAbits.PA7//------红灯
#define OUT_LED_G 				PORTBbits.PB3//------白灯

#define PIN_LED					PORTBbits.PB3//------白灯
//#define OUT_LED_B 				PORTAbits.PA2
//#define LED_IO 				PORTAbits.PA4
//#define LED_ON 				PORTAbits.PA4 = 0
//#define LED_OFF 				PORTAbits.PA4 = 1


//led.c
//#define RED_LED_ON				PORTBbits.PB2 = 1
//#define RED_LED_OFF				PORTBbits.PB2 = 0
//#define GREEN_LED_ON			PORTBbits.PB2 = 1
//#define GREEN_LED_OFF			PORTBbits.PB2 = 0

//#define TEMP_ON					PWM1DUTY = 199;
//#define TEMP_OFF				PWM1DUTY = 0;
//#define TEMP_ON					PORTBbits.PB3 = 0
//#define TEMP_OFF				PORTBbits.PB3 = 1

//#define MOTOR_ON					PWM1DUTY = 199
//#define MOTOR_OFF					PWM1DUTY = 0
//#define MOTOR_STOP				0
//#define MOTOR_FORWARD_WORKING	1
//#define MOTOR_BACK_WORKING		2

//电机运行状态
//#define MOTOR_STATE_STOP		0
//#define MOTOR_STATE_WORKING		1

#define		C_PWM1_ON		T1CR1 |= C_PWM1_En
#define		C_PWM1_OFF		T1CR1 &= ~C_PWM1_En


#define		C_PWM2_ON		T2CR1 |= C_PWM2_En
#define		C_PWM2_OFF		T2CR1 &= ~C_PWM2_En


//ADC
#define		C_ADC_ON	 \
     	ADMDbits.START = 1
     	
#define		C_ADC_OFF	  \
		ADMDbits.START = 0
		
#define		C_ADC_ON2	 \
		ADMD  |= C_ADC_En;\
     	ADMDbits.START = 0
     	
#define		C_ADC_OFF2	  \
		ADMD  &= ~C_ADC_En;\
		ADMDbits.START = 0	
//sleep.c
#define UPDATE_REG(x)			__asm__("MOVR _" #x ",F")
#define RUNNING_KEEP_TIME		14400//8小时（8*60*60 = 28800/2=14400）
//===================模拟PWM参数设置区域======================================
//#define DUTY_50   15//61//69
//#define DUTY_ALL  50//DUTY_50 * 2
#define DUTY_ALL  70//DUTY_50 * 2

#define MT_ON   0
#define MT_OF   1

#define MT_IO 	I0_PWM2
//===================按键处理区域======================================
#define IN_MIC 						PORTBbits.PB0
//#define KEY_PIN 					PORTAbits.PA0

#define	MSG_NULL					0x00
#define MSG_SMOKE_ON				1
#define MSG_SMOKE_OFF				2
#define MSG_CHRG					3
#define MSG_CHRG_OFF				4
#define MSG_INSERT_HEATER			5//插入发热丝
#define MSG_PULLOUT_HEATER			6//拔出发热丝
#define MSG_CHRG_FULL				7
//#define MSG_3P3V_LVD				6
//#define MSG_3P0V_LVD				7
#define MSG_LVD						8
#define MSG_CURRENT_OVER			9
#define MSG_SMOKE_TIMEOUT			10
#define	KEY_DOWN					11
#define KEY_LONG   	   	   			12
#define KEY_UP 	   	   	   			13
#define KEY_DB   	   	   			14
#define MSG_PREHEAT   	   	   		15//预热消息
#define MSG_MODE_VOL   	   	   		16//控制输出电压转换2.5V-3V-3.6V
#define MSG_POWER_ONOFF   	   	   	17//开关机
#define KEY_ONE_TIME	   	   	   	18

#define MSG_LONG_TIME_OUTPUT		KEY_LONG

#define COLOR_FIRST_GROUP			0
#define COLOR_SECOND_GROUP			1
#define COLOR_INVALID_GROUP			2//无效组

#define COLOR_RED					0//红色
#define COLOR_RED_GREEN				1//红绿色(粉绿色)--黄色
#define COLOR_GREEN					2//绿色
#define COLOR_GREEN_BLUE			3//---绿蓝色(淡蓝色)
#define COLOR_BLUE					4//蓝色
#define COLOR_RED_BLUE				5//红蓝色(粉红色)
#define COLOR_WHITE					6//白色

//吸烟过程中阶段定义
#define STATE_SMOKE_IDLE			0//空闲阶段
#define STATE_SMOKE_INIT			1//准备阶段
#define STATE_SMOKE_CHECK_BAT_LOW	2//吸烟前电量检测
#define STATE_SMOKE_CHECK_OC		3//吸烟前是否开路检测open circuit
#define STATE_SMOKE_PARAM_SET		4//吸烟前参数设置(灯显方式，根据电压设置PWM参数，短路保护参数)
#define STATE_SMOKING				5//吸烟进行
//==============================================================================
//	Variable Definitions
//==============================================================================
//extern u8 PowerOnFlag;//开机标志位
//key.c
extern u8 msg;
extern u8 CodeSwitchIndex;
extern u8 nowLedMode;
extern u8 ledRunStep;
extern u8 ledRunStarStep;
extern u8 GroupColourIndex;
extern u8 LedShowStep;//
extern u16 LedShowKeepTime;
extern u8 Led_Breathe_count;
extern u8 sleepCnt;
extern u8 PwmCycleCount;
extern u8 percent_nun;
//led.c
extern u8 led_flash_flag;
extern u8 led_flash_count;
extern u8 led_delay_keep_time;
extern u16 OverCurrentDelayTime;
extern u16 OverCurrentCount;
extern u8 BuleLed_delay_keep_time;
//extern u16 SmokingNumberCount;//负载输出次数统计
//extern u8 SmokingNumberCountingKeepTime;//负载输出时间计时
//extern u8 AdcChannelIndex;
extern u8 OverCurrent_check_cnt;
extern u16 OverCurrent_adc_value;
extern u16 gAdcDataValue;
extern u8 TargetMotorDuty;
extern u8 NowMotorDuty;
extern u8 MotorDutySet;
extern u8 SaveHeaterIOStatus;
extern u8 led_mode_flag;
//extern u8 sleepWakedUpByWDTFlag;
//extern u8 sleepWakedUpByWDTCount;
//extern u8 sleepWakedUpCheckTimeCount;
/*
extern u8 OverCurrentFlag;//马达过流标志
extern u16 gAdcDataValue;
extern u8 gAdcCount;
extern u8 gAdcCheckCount;//检测AD消抖次数
extern u16 gAdcCheckDelayCount;
extern u8 gAdSampleFinishFlag;
*/
//extern u16 Chrg_9V_delay_TimeCount;
//battery.c
extern u8 BatVolLevel;//电池电量等级
extern u8 SmokeState;//吸烟状态
extern u8 VolTypeIndex;//输出电压转换
extern u8 KeyDowmTimeCount;//2秒时间统计(单位:10ms)
extern u16 HeatingKeepTime;//加热时长
extern u16 SmokingKeepTime;//吸烟时长，主要是为了处理在吸烟前0.3秒是否需要全功率输出的问题
extern u8 HeatCount;
extern u16 HeatPlugInsertTimeCount;
extern u8 HeatPlugInsert_flag;
//extern u8 SmokingLight_flag;
//extern u16 tempflagTimeCount;
//usb.c
extern u8 usb_flag;
//extern u8 Chrg_full_flag;//
extern u8 battery_low_cnt;
//extern u16 ChrgFullTimeCount;//
//extern u8 ChrgFullCount;
//sleep.c
extern u16 running_keep_time;
//extern u8 sys_sleep_flag;
extern u8 sleep_delay_keep_time;
extern u16 temptimecount;
extern u8 now_ch;
extern u8 usb_check_ad_time_cnt;
extern u8 disp_delay_time_cnt;
//common.c
extern u8 sys_flag_0;
extern u8 sys_flag_1;
extern u8 sys_flag_2;
extern u8 sys_flag_3;
//extern u8 WDT_sleep_flag;//由睡眠时看门狗唤醒的标志位

__sbit b_isPowerOn 				= sys_flag_0:0;
//__sbit b_heater_exist_check 	= sys_flag_0:0;
//__sbit b_isFirstRun 			= sys_flag_0:1;
//__sbit b_batLowShow 			= sys_flag_0:1;
//__sbit b_KeyDowm 					= sys_flag_0:1;
__sbit b_smoke_init				= sys_flag_0:1;
//__sbit b_heater_exist_flag 		= sys_flag_0:2;
//__sbit b_SleepTimeOut 			= sys_flag_0:2;
__sbit b_SleepTimeOut 			= sys_flag_0:2;
__sbit f_charge_check			= sys_flag_0:3;
__sbit f_charge_full 			= sys_flag_0:4;
__sbit f_battery_low 			= sys_flag_0:5;
__sbit f_charging 				= sys_flag_0:6;
__sbit AdjustDirectionFlag 		= sys_flag_0:7;


__sbit f_battery_check 			= sys_flag_1:0;
__sbit b_smoking 				= sys_flag_1:1;
__sbit isbreathingFlag 			= sys_flag_1:2;
__sbit isSleep 					= sys_flag_1:3;
__sbit keyPressStatus 			= sys_flag_1:4;
__sbit isKeyPressing 			= sys_flag_1:5;
__sbit f_sleep_check 			= sys_flag_1:6;
//__sbit b_smoke_counting 		= sys_flag_1:7;
//__sbit b_OC_100us_TimeOut 		= sys_flag_1:7;//OC=OverCurrent
//__sbit b_temp_flag 				= sys_flag_1:7;
__sbit b_get_adc_result 		= sys_flag_1:7;

//__sbit OverCurrentFlag			= sys_flag_2:0;
__sbit temp_flag			= sys_flag_2:0;
//__sbit b_status_flag 			= sys_flag_2:1;
//__sbit b_LedShowing				= sys_flag_2:1;
//__sbit b_key_timeout			= sys_flag_2:1;
__sbit b_heater_exist_flag		= sys_flag_2:1;

__sbit led_breath_flash_flag	= sys_flag_2:2;
__sbit f_100us_TimeOut			= sys_flag_2:3;
__sbit f_1ms_TimeOut			= sys_flag_2:4;
__sbit b_heater_detect_mask		= sys_flag_2:5;
__sbit sleepWakedUpByWDTFlag	= sys_flag_2:6;

//__sbit f_100ms_TimeOut			= sys_flag_2:6;
//__sbit f_1s_TimeOut				= sys_flag_2:7;
//__sbit f_250ms_TimeOut				= sys_flag_2:7;
__sbit b_pause_chrg					= sys_flag_2:7;


//__sbit isKey2Pressing				= sys_flag_3:0;
__sbit b_heater_exist_check			= sys_flag_3:0;
//__sbit isKeylongoutput				= sys_flag_3:1;
__sbit f_heat_check					= sys_flag_3:1;

__sbit b_heating					= sys_flag_3:2;
//__sbit isWorking					= sys_flag_3:3;
__sbit f_10ms_TimeOut				= sys_flag_3:4;
//__sbit b_open_circuit_flag			= sys_flag_3:5;
__sbit f_bat_lvd_check			= sys_flag_3:5;

//__sbit b_LedBreathingUpDown			= sys_flag_3:6;
__sbit charging_breath_flash_flag		= sys_flag_3:6;
//__sbit b_pause_chrg					= sys_flag_3:7;
__sbit f_1s_chrg_TimeOut				= sys_flag_3:7;

/*
	//4.20V电压提示// 4.20V/4/2V*4096 = 2150.4
	//4.19V电压提示// 4.19V/4/2V*4096 = 2145.28
	//4.18V电压提示// 4.18V/4/2V*4096 = 2140.16
	//4.17V电压提示// 4.17V/4/2V*4096 = 2135.04
	//4.16V电压提示// 4.16V/4/2V*4096 = 2129.92
	//4.15V电压提示// 4.15V/4/2V*4096 = 2124.8
//VDD/4
//电池满电4.20V时(4.20V/4/2V*4096 = 2150.4) 
#define		BAT_VOL4P20_ADC_VALUE	2150
#define 	HEAT_VOL4P20_DUTY		152//(73/199 = 58%)
//电池电压4.19V时(4.19V/4/2V*4096 = 2145.28)
#define		BAT_VOL4P19_ADC_VALUE	2145
//电池电压4.18V时(4.18V/4/2V*4096 = 2140.16)
#define		BAT_VOL4P18_ADC_VALUE	2140

//电池电压4.17V时(4.17V/4/2V*4096 = 2135.04)
#define		BAT_VOL4P17_ADC_VALUE	2135

//电池电压4.16V时(4.16V/4/2V*4096 = 2129.92)
#define		BAT_VOL4P16_ADC_VALUE	2130

//电池电压4.15V时(4.15V/4/2V*4096 = 2124.8) 
#define		BAT_VOL4P15_ADC_VALUE	2124
#define 	HEAT_VOL4P15_DUTY		156//(73/199 = 58%)
//电池电压4.10V时(4.10V/4/2V*4096 = 2099.2) 
#define		BAT_VOL4P10_ADC_VALUE	2099
#define 	HEAT_VOL4P10_DUTY		160//(73/199 = 58%)
//电池电压4.00V时(4.00V/4/2V*4096 = 2048) 
#define		BAT_VOL4P00_ADC_VALUE	2048
#define 	HEAT_VOL4P00_DUTY		180//(78/199 = 62%)
//电池电压3.90V时(3.90V/4/2V*4096 = 1996.8) 
#define		BAT_VOL3P90_ADC_VALUE	1996
#define 	HEAT_VOL3P90_DUTY		190//(78/199 = 71%)
//电池电压3.80V时(3.80V/4/2V*4096 = 1945.6) 
#define		BAT_VOL3P80_ADC_VALUE	1945
#define 	HEAT_VOL3P80_DUTY		195//92//(92/199 = 72%)
//电池电压3.70V时(3.70V/4/2V*4096 = 1894.4) 
#define		BAT_VOL3P70_ADC_VALUE	1894
#define 	HEAT_VOL3P70_DUTY		198//94//(94/199 = 74%)
//电池电压3.60V时(3.60V/4/2V*4096 = 1843.2) 
#define		BAT_VOL3P60_ADC_VALUE	1843
#define 	HEAT_VOL3P60_DUTY		198//(94/199 = 74%)
//电池电压3.60V以下() 
#define 	HEAT_LESSTHAN_VOL3P60_DUTY		199//(199/199 = 100%)
*/


//1.8v/4.2v = 0.86
//2.5v/4.2v = 0.86
//3.0v/4.2v = 0.86
//3.6v/4.2v = 0.86
//电池满电4.20V时(4.30V/4/2V*4096 = 2150.4) 
#define		BAT_VOL4P30_ADC_VALUE	2201

//电池满电4.25V时(4.25V/4/2V*4096 = 2176) 
#define		BAT_VOL4P25_ADC_VALUE	2176

//电池满电4.20V时(4.20V/4/2V*4096 = 2150.4) 
#define		BAT_VOL4P20_ADC_VALUE	2150

//电池电压4.19V时(4.19V/4/2V*4096 = 2145.28)
#define		BAT_VOL4P19_ADC_VALUE	2145

//电池电压4.18V时(4.18V/4/2V*4096 = 2140.16)
#define		BAT_VOL4P18_ADC_VALUE	2140

//电池电压4.17V时(4.17V/4/2V*4096 = 2135.04)
#define		BAT_VOL4P17_ADC_VALUE	2135

//电池电压4.16V时(4.16V/4/2V*4096 = 2129.92)
#define		BAT_VOL4P16_ADC_VALUE	2130

//电池电压4.15V时(4.15V/4/2V*4096 = 2124.8) 
#define		BAT_VOL4P15_ADC_VALUE	2124

//电池电压4.12V时(4.12V/4/2V*4096 = 2,109.44) 
#define		BAT_VOL4P12_ADC_VALUE	2109

//电池电压4.10V时(4.10V/4/2V*4096 = 2099.2) 
#define		BAT_VOL4P10_ADC_VALUE	2099

//电池电压4.08V时(4.08V/4/2V*4096 = 2,088.96) 
#define		BAT_VOL4P08_ADC_VALUE	2089

//电池电压4.05V时(4.05V/4/2V*4096 = 2073.6) 
#define		BAT_VOL4P05_ADC_VALUE	2073

//电池电压4.00V时(4.00V/4/2V*4096 = 2048) 
#define		BAT_VOL4P00_ADC_VALUE	2048

//电池电压3.98V时(3.98V/4/2V*4096 = 2037.76) 
#define		BAT_VOL3P98_ADC_VALUE	2037

//电池电压3.95V时(3.95V/4/2V*4096 = 2022.4) 
#define		BAT_VOL3P95_ADC_VALUE	2022

//电池电压3.90V时(3.90V/4/2V*4096 = 1996.8) 
#define		BAT_VOL3P90_ADC_VALUE	1996

//电池电压3.88V时(3.88V/4/2V*4096 = 1986.56) 
#define		BAT_VOL3P88_ADC_VALUE	1986

//电池电压3.85V时(3.85V/4/2V*4096 = 1971.2) 
#define		BAT_VOL3P85_ADC_VALUE	1971

//电池电压3.80V时(3.80V/4/2V*4096 = 1945.6) 
#define		BAT_VOL3P80_ADC_VALUE	1945

//电池电压3.78V时(3.78V/4/2V*4096 = 1935.36) 
#define		BAT_VOL3P78_ADC_VALUE	1935

//电池电压3.75V时(3.75V/4/2V*4096 = 1920) 
#define		BAT_VOL3P75_ADC_VALUE	1920

//电池电压3.70V时(3.70V/4/2V*4096 = 1894.4) 
#define		BAT_VOL3P70_ADC_VALUE	1894

//电池电压3.68V时(3.68V/4/2V*4096 = 1884.16) 
#define		BAT_VOL3P68_ADC_VALUE	1884

//电池电压3.65V时(3.65V/4/2V*4096 = 1868.8) 
#define		BAT_VOL3P65_ADC_VALUE	1869

//电池电压3.60V时(3.60V/4/2V*4096 = 1843.2) 
#define		BAT_VOL3P60_ADC_VALUE	1843

//电池电压3.55V时(3.55V/4/2V*4096 = 1817.6) 
#define		BAT_VOL3P55_ADC_VALUE	1818

//电池电压3.50V时(3.50V/4/2V*4096 = 1792) 
#define		BAT_VOL3P50_ADC_VALUE	1792

//电池电压3.45V时(3.45V/4/2V*4096 = 1766.4) 
#define		BAT_VOL3P45_ADC_VALUE	1766

//电池电压3.40V时(3.40V/4/2V*4096 = 1740.8) 
#define		BAT_VOL3P40_ADC_VALUE	1740


//电池电压3.35V时(3.35V/4/2V*4096 = 1715.2) 
#define		BAT_VOL3P35_ADC_VALUE	1715

//电池电压3.30V时(3.30V/4/2V*4096 = 1689.6) 
#define		BAT_VOL3P30_ADC_VALUE	1689

//电池电压3.25V时(3.25V/4/2V*4096 = 1664) 
#define		BAT_VOL3P25_ADC_VALUE	1664

//电池电压3.20V时(3.20V/4/2V*4096 = 1638.4) 
#define		BAT_VOL3P20_ADC_VALUE	1638

//电池电压3.18V时(3.18V/4/2V*4096 = 1628) 
#define		BAT_VOL3P18_ADC_VALUE	1628

//电池电压3.15V时(3.15V/4/2V*4096 = 1612.8) 
#define		BAT_VOL3P15_ADC_VALUE	1613

//电池电压3.10V时(3.10V/4/2V*4096 = 1587.2) 
#define		BAT_VOL3P10_ADC_VALUE	1587
//==============================================================================
//	Function Declaration
//==============================================================================
void system_init(void);
void sleep_init(void);
void gpio_init(void);

void common_param_init(void);

void isr_param_init(void);

void key_param_init(void);
void KeyScan(void);//键盘扫描
void MicScan(void);//咪头扫描
void msg_handle(void);

void detect_param_init(void);
//void detect_handle(void);
void SmokeFun(void);
//void charge_param_init(void);
//void charge_check(void);

//void motor_param_init(void);
//void motor_handle(void);

void battery_param_init(void);
void battery_check(void);
void bat_lvd_check(void);//只在吸烟中检测(吸烟中：电量低于2.9V（±0.1V），停止输出，红灯闪5次)

void led_param_init(void);
void led_handle(void);

void sleep_param_init(void);
void sleep_handle(void);

void delay(u16 count);
void Delay_N1ms_16bit(u16 N);		// 经过示波器矫正
void adc_init(void);
void adc2_init(void);
void adc3_init(void);
void adc_init4(u8 ch);//
//void adc4_init(void);
void F_wait_eoc(void);
//u16 adc_get(u8 ch,u8 count);
u16 adc_get(u8 ch);

void SetLedFlashParameters(u8 color,u8 count,u8 ledontime,u8 flag);//flag = 1不关机   flag = 2关机
//void SetLedBreathingParameters2(u8 group,u8 startcoloridex,u16 cycletime);
void SetLedBreathingParameters(void);
void SetLedBreathingParameters2(u8 color);
void SetLedColorNormallyOn(u8 color);
void LedOff(void);
//void LedOff(u8 color);
void Ledbreathing(void);

void Get_Onetime_Bat_ADCValue(void);//获取电池电压
void ADC_Convert_Pre(void);
//void LedSharpflash(void);//灯光爆闪效果
void BaseBatSetPWMValue(void);//根据电量设置PWM输出
void Detect_OverCurrent_ByAD(void);//通过AD检测来检测是否过流
void ledRun(void);
void charge_check_by_IO(void);//充电检测
//void breathingLedRunOnce_ToUp(void);//渐亮 然后退出
//void breathingLedRunOnce_ToDown(void);//渐暗 然后退出
//void JudgeSmokingLightCountTimeoutOrNot(void);//判断吸烟灯光开关计时是否超时

void led_mode_set(u8 mode);
void led_dis_loop_func(void);
#endif