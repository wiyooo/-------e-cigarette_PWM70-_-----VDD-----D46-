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
u8 time_base_100us;
//u8 time_base_10ms;
u8 time_base_100ms;
u8 time_base_250ms;
u8 time_base_1s;
u8 time_base;
u8 temp;
u8 PwmCycleCount;
u8 percent_nun;
u16 adc_value_tmp;
u8 ad_start_flg = 0;
//==============================================================================
//	Function Declaration
//==============================================================================


//==============================================================================
//	Function: isr_param_init
//		Input: None
//		Output: None
//==============================================================================
void isr_param_init(void)
{
	//time_base_10ms = TIME_BASE_10MS;
	//time_base_100ms = TIME_BASE_100MS;
	time_base_250ms = TIME_BASE_250MS;
	time_base_1s = TIME_BASE_1S;
	time_base = 0;
	PwmCycleCount = 0;
	percent_nun = 0;
	//adc_value_tmp = 0;
	ad_start_flg = 0;
}
//==============================================================================
//	Function: isr
//		Input: None
//		Output: None
//==============================================================================
void isr(void) __interrupt(0)
{
	//u16 adc_value_tmp;
	static u8 sTime1MS;
	static u8 sTime10ms = 0;
	static u8 sTime100ms = 0;
//	static unsigned char sTime400us = 0;
	if(INTFbits.T0IF)
	{ 
		INTFbits.T0IF = 0;
//#if USE_TIMER0_1K
//		TMR0 = 6; 					// 设置TIMER0的初始值
//#elif USE_TIMER0_10K		
		TMR0 = 163;	//156;			// 156是计算值，163是用示波器矫正值
		//TMR0 = 6;
		//TMR0 = 131;	//156;
//#endif
		//f_100us_TimeOut = 1;
		//b_OC_100us_TimeOut = 1;
		//Ledbreathing();
		ledRun();
		sTime1MS++;
		if(sTime1MS >= 10)//1MS
		//if(sTime1MS >= 4)//1MS
		{
			sTime1MS = 0;
			f_1ms_TimeOut = 1;
			//b_OC_100us_TimeOut = 1;
			//PORTAbits.PA6 ^= 1;
			if(temptimecount)
				temptimecount--;
			if(SmokingKeepTime)
				SmokingKeepTime--;
			//if(BuleLed_delay_keep_time)
			//		--BuleLed_delay_keep_time;
					
			//if(tempflagTimeCount)
			//	tempflagTimeCount--;
			//------------------------------------------------------
			//	1ms
			//------------------------------------------------------
			//KeyScan();//键盘扫描
			//MicScan();
			//msg_handle();//消息处理
			//f_fan_1_check = 1;
			
			//if(OverCurrentDelayTime)
			//	OverCurrentDelayTime--;
			sTime10ms++;
			if(sTime10ms >= 9)//10ms
			{
				sTime10ms = 0;
				//PORTAbits.PA6 ^= 1;
				//------------------------------------------------------
				//	10ms
				//------------------------------------------------------
				f_10ms_TimeOut = 1;
				f_charge_check = 1;
				f_bat_lvd_check = 1;
				f_heat_check = 1;
				f_sleep_check = 1;
				f_battery_check = 1;
				//PORTAbits.PA6 ^= 1;
				//b_key_timeout = 1;
				//ShowLed();
				//LedSharpflash();
				//f_usb_check = 1;
				//if(temptimecount)
				//	temptimecount--;
				//if(BuleLed_delay_keep_time)
				//	--BuleLed_delay_keep_time;
				//if(gAdcCheckDelayCount)
				//	--gAdcCheckDelayCount;
				if(LedShowKeepTime)
					--LedShowKeepTime;	
				
				if(disp_delay_time_cnt)
					disp_delay_time_cnt--;
				//if(KeyDowmTimeCount)
				//	KeyDowmTimeCount--;
					
				if(led_delay_keep_time)
					--led_delay_keep_time;	
					
				sTime100ms++;
				if(sTime100ms >= 10)//100ms
				{
					sTime100ms = 0;
					//f_1s_TimeOut = 1;
					f_1s_chrg_TimeOut = 1;
				}
				//if(LedShowKeepTime)
				//	--LedShowKeepTime;	
				//if(sleepWakedUpCheckTimeCount)
				//{
				//	--sleepWakedUpCheckTimeCount;
				//}
				//if(running_keep_time > 0)
				//	--running_keep_time;
				/*
				--time_base_100ms;
				if(time_base_100ms == 0)
				{
					time_base_100ms = TIME_BASE_100MS;
					//f_100ms_TimeOut = 1;
					//b_SleepTimeOut = 1;
					
					//if(HeatingKeepTime)
					//--HeatingKeepTime;	
					//if(SmokingNumberCountingKeepTime)
					//	SmokingNumberCountingKeepTime--;
					//------------------------------------------------------
					//	100ms
					//------------------------------------------------------
								
					//if(battery_low_cnt > 0)
					//	--battery_low_cnt;
				}	
				*/
				/*
				--time_base_250ms;
				if(time_base_250ms == 0)
				{
					time_base_250ms = TIME_BASE_250MS;
					//f_250ms_TimeOut = 1;
					JudgeSmokingLightCountTimeoutOrNot();//判断吸烟灯光开关计时是否超时
					//------------------------------------------------------
					//	250ms
					//------------------------------------------------------
					//if(battery_low_cnt > 0)
					//	--battery_low_cnt;
				}
				*/
		/*
				--time_base_1s;
				if(time_base_1s == 0)
				{
					time_base_1s = TIME_BASE_1S;
					f_1s_TimeOut = 1;
					b_SleepTimeOut = 1;
					if(running_keep_time > 0)
					--running_keep_time;
					//------------------------------------------------------
					//	500ms
					//------------------------------------------------------
				}*/
			}//end of if(sTime1MS==10)//1MS
		}
	}
	
	if(INTFbits.T1IF)//25us
	{ 
		INTFbits.T1IF = 0;
		//f_100us_TimeOut = 1;
		if(SmokeState == STATE_SMOKING)//4
		{
			PwmCycleCount++;
			if(PwmCycleCount>= DUTY_ALL) 
			{
				PwmCycleCount = 0;
			}
			if(PwmCycleCount < percent_nun)
			{
				I0_PWM2 = MT_ON;
				#if 0
				//if(ad_start_flg <= 0)//2
				if(ad_start_flg <= 0)//
				{
					ad_start_flg++;
					/*
					ADMDbits.START = 1;
					F_wait_eoc();
					//if(ADD > 180)
					//if(ADD > 200)
					if(ADD > 230)
					{
						ad_start_flg = 200;
					}
					*/
					ADMDbits.START = 1;
				}
				else
				{
					ADMDbits.START = 1;
					F_wait_eoc();
					#if 0
					if(ADD < 220)//OverCurrent_adc_value的值根据
					{
						#if 1
						I0_PWM2 = MT_OF;
						percent_nun = 0;
						TargetMotorDuty = 0;
						msg = MSG_CURRENT_OVER;
						SmokeState = STATE_SMOKE_IDLE;
						#endif
					}
					#else
					ADMDbits.START = 1;
					F_wait_eoc();
					adc_value_tmp = ADD;		//Store AIN4's ADC data bit 11~4
					adc_value_tmp = adc_value_tmp << 4;
					adc_value_tmp |= (0x0F & ADR);//得到12bit ADC值	
					if(adc_value_tmp < 3420)//3820//3600//3700
					{
						#if 1
						I0_PWM2 = MT_OF;
						percent_nun = 0;
						//TargetMotorDuty = 0;
						msg = MSG_CURRENT_OVER;
						SmokeState = STATE_SMOKE_IDLE;
						#endif
					}
					#endif
				}
				#else
				//ADMDbits.START = 1;
				//F_wait_eoc();
				ADMDbits.START = 1;
				F_wait_eoc();
				ADMDbits.START = 1;
				F_wait_eoc();
				adc_value_tmp = ADD;		//Store AIN4's ADC data bit 11~4
				adc_value_tmp = adc_value_tmp << 4;
				adc_value_tmp |= (0x0F & ADR);//得到12bit ADC值	
				if(adc_value_tmp < 3800)//3820//3600//3700
				{
					#if 1
					I0_PWM2 = MT_OF;
					percent_nun = 0;
					//TargetMotorDuty = 0;
					msg = MSG_CURRENT_OVER;
					SmokeState = STATE_SMOKE_IDLE;
					#endif
				}
				#endif
			}
			else
			{
				I0_PWM2 = MT_OF;
				ad_start_flg = 0;
			}
			
			
		}
		else
		{
			percent_nun = 0;
			I0_PWM2 = MT_OF;
			ad_start_flg = 0;
		}

	}
	/*
	if(INTFbits.WDTIF)//watchdog  250ms	
	{ 
		INTFbits.WDTIF = 0;	
		sleepWakedUpByWDTFlag = 1;
	}
	*/
/*		
#if USE_MCU == __CPU_NY8A062D__
	if(ADRbits.ADIF)
	{
		ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
		//if(gAdcCheckDelayCount == 0)//
		if(b_smoking)
		{
			adc_value_tmp = ADD;		//Store AIN4's ADC data bit 11~4
			adc_value_tmp = adc_value_tmp << 4;
			adc_value_tmp |= (0x0F & ADR);//得到12bit ADC值	
			OverCurrent_adc_value += adc_value_tmp;
			OverCurrent_check_cnt++;
			if(OverCurrent_check_cnt == 4)
			{
				OverCurrent_check_cnt = 0;
				OverCurrent_adc_value = OverCurrent_adc_value >> 2;//求平均值
				//gAdSampleFinishFlag = 1;
				PORTBbits.PB4 = 1;
				PORTBbits.PB5 = 0;
				if(OverCurrent_adc_value > 300)//过流了直接关掉
				{
					b_smoking = 0;
					PWM2DUTY = 0;//
					msg = MSG_CURRENT_OVER;
				}
			}
		}
		ADMDbits.START = 1;
	}
#endif	
*/
//	INTF = 0x00;
//	INTE2 = 0x00;
}