//==============================================================================
//	Include Header Files
//==============================================================================
#include "common.h"


//==============================================================================
//	Macro Definition
//==============================================================================


//==============================================================================
//	Variable Definitions
//==============================================================================
u8 sys_flag_0;
u8 sys_flag_1;
u8 sys_flag_2;
u8 sys_flag_3;
//u8 CodeSwitchIndex;
//==============================================================================
//	Function Declaration
//==============================================================================
//==============================================================================
//	Function: common_param_init
//		Input: None
//		Output: None
//==============================================================================
void common_param_init(void)
{
	sys_flag_0 = 0;
	sys_flag_1 = 0;
	sys_flag_2 = 0;
	sys_flag_3 = 0;
	msg = 0;
	b_isPowerOn = 1;
//	isWorking = 1;
//	b_isFirstRun = 1;
//	CodeSwitchIndex = 0;
}
//==============================================================================
//	Function: delay
//		Input: None
//		Output: None
//==============================================================================
void delay(u16 count)
{
	u16 i;	
	for(i=1;i<=count;i++)
		;
}

void Delay_N1ms_16bit(u16 N)		// 经过示波器矫正
{
	u8 i;
	for(;N !=0; N--)
	{
#if USE_CPU_CLOCK == USE_4M_2T	
		for(i=0;i <127 ; i++)
		{
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
		}
#elif USE_CPU_CLOCK == USE_8M_2T
		for(i=0;i <255 ; i++)
		{
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
		}
#endif
	}
}

//==============================================================================
//	Function: main
//		Input: None
//		Output: None
//==============================================================================
void main(void)
{
	//------------------------------------------------------
	//	initialize
	//------------------------------------------------------
	system_init();	
	//------------------------------------------------------
	//	parameter init
	//------------------------------------------------------
	common_param_init();
	isr_param_init();
	key_param_init();
	led_param_init();
	sleep_param_init();
	isSleep = 0;//上电默认关机状态
	// nowLedMode = 1;//第一次上电红白灯交替闪三次，进入低功耗
	//ledRunStep = COLOR_RED;
	// SetLedColorNormallyOn(COLOR_RED);//红色
	// LedShowKeepTime = 100;//单位：10ms
	//ledRunStarStep = 0xff;
	//sleepWakedUpByWDTFlag = 0;
	//sleepWakedUpByWDTCount = 0;
	//sleepWakedUpCheckTimeCount = 0;
	//SetLedFlashParameters(COLOR_BLUE,2,30,2);//上电蓝灯闪烁一次， 无操作进入低功耗。
	/*
	if(C_IO_HEATER_CHECK_DEC)
	{
		b_heater_exist_flag = 0;
	}
	else
	{
		b_heater_exist_flag = 1;
	}
	*/
	//------------------------------------------------------
	//	main loop
	//------------------------------------------------------
	led_mode_set(1);
	while(1)
	{	
		CLRWDT();	
		MicScan();//咪头扫描
		msg_handle();//消息处理
		// led_handle();
		// //HeaterExistdetect();//加热丝插拔检测
		charge_check_by_IO();//充电检测
		// //charge_check_by_AD();//充电检测	
		// bat_lvd_check();//只在吸烟中检测(吸烟中：电量低于2.9V（±0.1V），停止输出，红灯闪5次)
		SmokeFun();
		// sleep_handle();
			
	}
}
//==============================================================================
//	Function: msg_handle
//		Input: None
//		Output: None
//==============================================================================
void msg_handle(void)
{	
	switch(msg)
	{
		//case MSG_NULL:
		//	break;
			
		case MSG_SMOKE_ON://开始吸烟(吸烟状态:3个RGB同步爆闪,停止吸烟后再爆闪10秒)
			msg = MSG_NULL;
			//if(f_charging)
			//	break;	
			// nowLedMode = 2;
			SmokeState = STATE_SMOKE_INIT;
			b_smoke_init = 1;
			//b_heater_detect_mask = 1;
			b_smoking = 0;//清除吸烟开始标志	
			
			break;	
			
		case MSG_SMOKE_TIMEOUT://单次吸烟持续时间超过8s后，控制板关闭输出白灯慢闪3次(亮500ms灭500ms) 后常灭
			msg = MSG_NULL;
			SmokeState = STATE_SMOKE_IDLE;
			b_smoking = 0;//清吸烟开始标志
			//b_heating = 0;//清吸加热标志
			charging_breath_flash_flag = 0;
			led_breath_flash_flag = 0;
			led_flash_flag = 0;
			led_mode_set(4);
			//LedOff();			
			// SetLedFlashParameters(COLOR_GREEN,8,50,2);
			disp_delay_time_cnt = 150;
			break;

		case MSG_SMOKE_OFF://吸烟停止
			msg = MSG_NULL;
			SmokeState = STATE_SMOKE_IDLE;
			b_smoking = 0;//清吸烟开始标志			
			//led_breath_flash_flag = 0;//停止白灯呼吸效果
			led_flash_flag = 0;
			disp_delay_time_cnt = 150;//吸烟后1,5秒才检测低电
			led_mode_set(3);
			//LedOff();
			//SetLedColorNormallyOn(COLOR_GREEN);
			//SetLedFlashParameters(COLOR_GREEN,2,100,2);//停止时为绿灯常亮1秒
			/*
			if(!b_SmokingLight_flag)//在没有打开吸烟效果灯开关时，如果是充电状态则继续充电的状态
			{
				led_breath_flash_flag = 0;
				if(f_charging)//吸完烟后如果当前还在充电状态则需恢复充电的指示灯状态
				{
					if(f_charge_full)
					{
						msg = MSG_CHRG_FULL;	
					}
					else
					{
						SetLedColorNormallyOn(COLOR_BLUE);
						//msg = MSG_CHRG;
					}
				}
				else
				{
					LedOff();//关闭灯光
					nowLedMode = 0;
				}
			}
			*/
			break;
		
		case MSG_CHRG://开始充电(充电接入：蓝灯常亮。)
			msg = MSG_NULL;
			SmokeState = STATE_SMOKE_IDLE;
			b_smoking = 0;//清吸烟开始标志
			//b_heating = 0;
			f_charging = 1;
			f_charge_full = 0;
			temp_flag = 0;
			//b_pause_chrg = 0;
			led_breath_flash_flag = 0;//停止呼吸效果
			led_flash_flag = 0;
			usb_check_ad_time_cnt = 0;
			f_battery_low = 0;
			adc_init4(Quarter_VDD);
			led_mode_set(7);
			//SetLedFlashParameters(COLOR_BLUE,4,25,1);//插入蓝灯闪烁2次
			//LedOff();
			//SetLedColorNormallyOn(COLOR_BLUE);
			// SetLedBreathingParameters2(COLOR_RED);//开始红灯呼吸效果
			break;
		
		case MSG_CHRG_FULL://充满电后白灯常亮
			msg = MSG_NULL;		
			//ChrgFullCount = 0;
			f_charge_full = 1;
			led_mode_set(8);
			//led_breath_flash_flag = 0;//停止呼吸效果
			// if((nowLedMode == 1)||(nowLedMode == 3))
			// 	break;
			//LedOff(COLOR_RED);
			//LedOff();
			// SetLedColorNormallyOn(COLOR_GREEN);//充满电后白灯常亮
			//SetLedFlashParameters(COLOR_GREEN,40,30,2);//绿灯后闪烁20次灭
			break;	
			
		case MSG_CHRG_OFF://停止充电(拔出白灯闪烁3次)
			msg = MSG_NULL;
			led_flash_flag = 0;
			
			// if(f_charge_full)
			// 	SetLedFlashParameters(COLOR_GREEN,8,20,2);
			// else
			// {
			// 	SetLedFlashParameters(COLOR_GREEN,6,20,2);
			// }
			led_mode_set(9);
			
			//SetLedFlashParameters(COLOR_GREEN,6,20,2);
			//LedOff();
			f_charging = 0;
			f_charge_full = 0;
			break;	
		
		case MSG_LVD://低电压提醒
			msg = MSG_NULL;
			SmokeState = STATE_SMOKE_IDLE;
			b_smoking = 0;//清吸烟开始标志
			// led_breath_flash_flag = 0;
			f_battery_low = 1;
			// SetLedFlashParameters(COLOR_RED,10,20,2);//当吸烟前电池电压低于3.4V（±0.1V）时，或吸烟中低于3.2V（±0.1V），红灯快闪5次提示低电压，并停止输出电压。
			led_mode_set(5);
			break;
		
		#if 1
		case MSG_CURRENT_OVER://输出过流触发了
			msg = MSG_NULL;
			SmokeState = STATE_SMOKE_IDLE;
			//b_heating = 0;//清吸加热标志
			b_smoking = 0;//清吸烟开始标志
			led_breath_flash_flag = 0;
			//HeatingKeepTime = 0;
			//OverCurrentFlag = 0;
			b_heater_detect_mask = 0;
			led_mode_set(10);
			// LedOff();
			//SetLedFlashParameters(COLOR_BLUE,4,30,2);//吸烟前或吸烟中发热丝短路时，蓝灯闪烁2次，停止输出
			// SetLedFlashParameters(COLOR_RED,6,20,2);//吸烟中或前发热丝开路，短路，红灯快闪3次
			//SetLedFlashParameters(COLOR_BLUE,2,200,2);//吸烟前或吸烟中发热丝短路时，蓝灯常亮2S，停止输出
			break;
		#endif
		/*	
		default:
			msg = MSG_NULL;
			break;
		*/	
			
	}
	
}