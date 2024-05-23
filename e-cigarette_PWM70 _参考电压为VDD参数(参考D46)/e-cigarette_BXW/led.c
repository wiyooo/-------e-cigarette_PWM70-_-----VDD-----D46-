//==============================================================================
//	Include Header Files
//==============================================================================
#include "common.h"


//==============================================================================
//	Macro Definition
//==============================================================================

//#define LED_ON 0
//#define LED_OFF 1

//#define OUT_LED_R 			PORTAbits.PA7
//#define OUT_LED_G 			PORTBbits.PB3
//#define OUT_LED_B 				PORTAbits.PA4
//#define OUT_LED_B 				PORTAbits.PA7

//#define LED_IO 			PORTAbits.PA4
//#define LED_ON 			PORTAbits.PA4 = 0
//#define LED_OFF 			PORTAbits.PA4 = 1

//==============================================================================
//	Variable Definitions
//==============================================================================
u8 ledstatusdata;
__sbit led_r 			= ledstatusdata:0;
__sbit led_g 			= ledstatusdata:1;
__sbit led_b 			= ledstatusdata:2;


u8 led_flash_flag;
u8 led_flash_count;
u8 led_flash_finish_return;
u8 led_delay_keep_time;//
u8 led_on_keep_time;
u8 nowLedMode;
u8 ledRunStep;
u8 ledRunStarStep;
u8 ledRunSup;
//u8 ledRunSupCnt;

u8 GroupColourIndex;
u8 Led_Breathe_count;
u16 Led_Breathe_count_Total;
u8 delay_keep_time;
u8 EnterbatteryLowFlag;
u8 LedPwmDuty;
//LED_STATUS ledStatus;

u8 LedPwmCycleCount;//
u8 LedShowStep;//
u16 LedShowKeepTime;//
//u8 LedShowStep;//

u8 breathingLightLow;
u8 breathingLightReversal;
u16 baseLedCounter;
u8 breathingVar;
u8 BuleLed_delay_keep_time;
u8 TempCount;
u8 StartColourIndex;
u16 temptimecount;

u8 led_mode_flag = 0;
//==============================================================================
//	Function Declaration
//==============================================================================


//==============================================================================
//	Function: led_param_init
//		Input: None
//		Output: None
//==============================================================================
//(红-绿-蓝-蓝绿-粉红-白 各闪烁一次)
/**ledRunStep -> RGB(r,g,b) (1:LED_ON,0:LED_OFF) -> ledStatus.data
 * 0 : [1,0,0] : 0b110---红色
 * 1 : [1,0,1] : 0b010---红蓝色(粉红色)
 * 2 : [0,0,1] : 0b011---蓝色
 * 3 : [0,1,1] : 0b001---绿蓝色(淡蓝色)
 * 4 : [0,1,0] : 0b101---绿色
 * 5 : [1,1,0] : 0b100---红绿色(粉绿色)
 * 6 : [1,1,1] : 0b000---白色
 */
 
 
void SetLedGroup(u8 group,u8 color)
{
	ledRunStep = color;
	if(group == 0)
	{
		if(ledRunStep == 0)//---红色
		{
			ledstatusdata = 0b110;
		}
		else if(ledRunStep == 1)//---绿色
		{
			ledstatusdata = 0b101;
		}
		else if(ledRunStep == 2)//---蓝色
		{
			ledstatusdata = 0b011;
		}	
		else if(ledRunStep == 3)//---绿蓝色(淡蓝色)
		{
			ledstatusdata = 0b001;
		}		
		else if(ledRunStep == 4)//---白色
		{
			ledstatusdata = 0b000;
		}	
		else if(ledRunStep == 5)//---红蓝色(粉红色)
		{
			ledstatusdata = 0b010;//0b100;
		}	
		else if(ledRunStep == 6)//---红绿色(粉绿色)
		{
			ledstatusdata = 0b100;//0b010;
		}		
		/*
		if(ledRunStep == 2)//---红绿色(粉绿色)
		{
			ledstatusdata = 0b100;//0b010;
		}
			
		else if(ledRunStep == 2)//---绿蓝色(淡蓝色)
		{
			ledstatusdata = 0b001;
		}	
		
		else if(ledRunStep == 4)//---红蓝色(粉红色)
		{
			ledstatusdata = 0b010;//0b100;
		}
		*/
		
	}	
	/*
	if(group == 0)
	{
		if(ledRunStep == 0)//---红绿色(粉绿色)
		{
			ledstatusdata = 0b100;//0b010;
		}
		else if(ledRunStep == 1)//---绿色
		{
			ledstatusdata = 0b101;
		}	
		else if(ledRunStep == 2)//---绿蓝色(淡蓝色)
		{
			ledstatusdata = 0b001;
		}	
		else if(ledRunStep == 3)//---蓝色
		{
			ledstatusdata = 0b011;
		}	
		else if(ledRunStep == 4)//---红蓝色(粉红色)
		{
			ledstatusdata = 0b010;//0b100;
		}
		else if(ledRunStep == 5)//---白色
		{
			ledstatusdata = 0b000;
		}	
		else if(ledRunStep == 6)//---红色
		{
			ledstatusdata = 0b110;
		}
	}
	else if(group == 1)
	{
		if(ledRunStep == 0)//---绿色
		{
			ledstatusdata = 0b101;
		}		
		else if(ledRunStep == 1)//---红绿色(粉绿色)
		{
			ledstatusdata = 0b100;//0b010;
		}
		else if(ledRunStep == 2)//---绿蓝色(淡蓝色)
		{
			ledstatusdata = 0b001;
		}	
		else if(ledRunStep == 3)//---蓝色
		{
			ledstatusdata = 0b011;
		}	
		else if(ledRunStep == 4)//---红蓝色(粉红色)
		{
			ledstatusdata = 0b010;//0b100;
		}
		else if(ledRunStep == 5)//---白色
		{
			ledstatusdata = 0b000;
		}	
		else if(ledRunStep == 6)//---红色
		{
			ledstatusdata = 0b110;
		}	
	}
	else if(group == 2)
	{
		if(ledRunStep == 0)//---绿蓝色(淡蓝色)
		{
			ledstatusdata = 0b001;
		}		
		else if(ledRunStep == 1)//---红绿色(粉绿色)
		{
			ledstatusdata = 0b100;//0b010;
		}
		else if(ledRunStep == 2)//---绿色
		{
			ledstatusdata = 0b101;
		}	
		else if(ledRunStep == 3)//---蓝色
		{
			ledstatusdata = 0b011;
		}	
		else if(ledRunStep == 4)//---红蓝色(粉红色)
		{
			ledstatusdata = 0b010;//0b100;
		}
		else if(ledRunStep == 5)//---白色
		{
			ledstatusdata = 0b000;
		}	
		else if(ledRunStep == 6)//---红色
		{
			ledstatusdata = 0b110;
		}	
	}
	*/
}

void SetLedColor(u8 color)
{
	if(color == COLOR_RED_GREEN)//---红绿色(粉绿色)--黄色
	{
		ledstatusdata = 0b100;//0b010;
	}
	else if(color == COLOR_GREEN)
	{
		ledstatusdata = 0b101;//---绿色
	}
	else if(color == COLOR_GREEN_BLUE)//---绿蓝色(淡蓝色)
	{
		ledstatusdata = 0b001;
	}	
	else if(color == COLOR_BLUE)
	{
		ledstatusdata = 0b011;//---蓝色
	}
	else if(color == COLOR_RED_BLUE)//---红蓝色(粉红色)
	{
		ledstatusdata = 0b010;//0b100;
	}
	else if(color == COLOR_WHITE)
	{
		ledstatusdata = 0b000;//---白色
	}
	else if(color == COLOR_RED)
	{
		ledstatusdata = 0b110;//---红色
	}
}

void SetLedFlashParameters(u8 color,u8 count,u8 ledontime,u8 flag)//flag = 1不关机   flag = 2关机  ledontime--点亮时长(单位:10ms)
{
	//b_LedShowing = 0;//关闭吸烟时灯光效果
	led_breath_flash_flag = 0;//停止呼吸效果
	led_flash_flag = 1;
	led_on_keep_time = ledontime; 
	led_delay_keep_time = ledontime;
	led_flash_count = count;
	led_flash_finish_return = flag;
	SetLedColor(color);
	OUT_LED_R = led_r;
	OUT_LED_G = led_g;
	//OUT_LED_B = led_b;
	/*
	ledRunStep = color;
	if(color == COLOR_RED)
	{
		OUT_LED_R = LED_ON;
	}
	else if(color == COLOR_GREEN)
	{
		OUT_LED_G = LED_ON;
	}
	//LED_ON;
	*/
	
}

void SetLedColorNormallyOn(u8 color)//设置颜色常亮
{
	//b_LedShowing = 0;//关闭吸烟时灯光效果
	led_breath_flash_flag = 0;//停止呼吸效果
	led_flash_flag = 0;
	SetLedColor(color);
	OUT_LED_R = led_r;
	OUT_LED_G = led_g;
	//OUT_LED_B = led_b;
	/*
	if(color == COLOR_RED)
	{
		OUT_LED_R = LED_ON;
	}
	else if(color == COLOR_GREEN)
	{
		OUT_LED_G = LED_ON;
	}
	//LED_ON;
	*/
}

void LedOff(void)
//void LedOff(u8 color)
{
	OUT_LED_R = LED_OFF;
	OUT_LED_G = LED_OFF;
	//OUT_LED_B = LED_OFF;
	/*
	if(color == COLOR_RED)
	{
		OUT_LED_R = LED_OFF;
	}
	else if(color == COLOR_GREEN)
	{
		OUT_LED_G = LED_OFF;
	}
	//LED_OFF;
	*/
}

u8 LedFlash(void)
{
	if(led_flash_flag)
	{
		if(led_delay_keep_time == 0)
		{
			led_delay_keep_time = led_on_keep_time;
			if(led_flash_count > 0)
			{
				led_flash_count--;
			}
			
			if(led_flash_count == 0)//0
			{
				OUT_LED_R = LED_OFF;
				OUT_LED_G = LED_OFF;
				//OUT_LED_B = LED_OFF;
				/*
				if(ledRunStep == COLOR_RED)
				{
					OUT_LED_R = LED_OFF;
				}
				else if(ledRunStep == COLOR_GREEN)
				{
					OUT_LED_G = LED_OFF;
				}
				LED_OFF;
				*/
				led_flash_flag = 0;
				return led_flash_finish_return;
			}
			if(led_flash_count%2 == 0)
			{
				OUT_LED_R = led_r;
        		OUT_LED_G = led_g;
				//OUT_LED_B = led_b;
				/*
				//LED_ON;
				if(ledRunStep == COLOR_RED)
				{
					OUT_LED_R = LED_ON;
				}
				else if(ledRunStep == COLOR_GREEN)
				{
					OUT_LED_G = LED_ON;
				}
				*/
				
			}
			else
			{
				OUT_LED_R = LED_OFF;
				OUT_LED_G = LED_OFF;
				//OUT_LED_B = LED_OFF;
				/*
				//LED_OFF;
				if(ledRunStep == COLOR_RED)
				{
					OUT_LED_R = LED_OFF;
				}
				else if(ledRunStep == COLOR_GREEN)
				{
					OUT_LED_G = LED_OFF;
				}
				*/
			}	
			/*
			if(led_flash_count == 1)//0
			{
				//OUT_LED_R = LED_OFF;
				//OUT_LED_G = LED_OFF;
				//OUT_LED_B = LED_OFF;
				//LED_OFF;
				if(ledRunStep == COLOR_RED)
				{
					OUT_LED_R = LED_OFF;
				}
				else if(ledRunStep == COLOR_GREEN)
				{
					OUT_LED_G = LED_OFF;
				}
				led_flash_flag = 0;
				return led_flash_finish_return;
			}
			*/
		}			
	}
	return 0;
}

#if 0
void SetLedBreathingParameters2(u8 group,u8 startcoloridex,u16 cycletime)//cycletime--多长时间改变一次占空比(单位：100us)
{
	GroupColourIndex = group;
	//ledRunStep = startcoloridex;
	GroupColourIndex = startcoloridex;
	led_flash_flag = 0;//关闭闪烁效果
	//led_breath_flash_flag = 1;//打开呼吸效果
	Led_Breathe_count = cycletime;//200;
	Led_Breathe_count_Total = cycletime;
	AdjustDirectionFlag = 0;
	LedPwmDuty = 0;
	charging_breath_flash_flag = 1;
}

u8 led2Run(void)
{
	//SetLedGroup(GroupColourIndex,ledRunStep);
	//SetLedGroup(0,1);
	SetLedColor(0);
	LedPwmCycleCount++;
	if(LedPwmCycleCount > 30)//30  64
	{
		LedPwmCycleCount = 1;
	}
	
	if(LedPwmCycleCount <= LedPwmDuty)
	{
		OUT_LED_R = led_r;
        OUT_LED_G = led_g;
		//OUT_LED_B = led_b;
		//LED_ON;
	}
	else
	{
		OUT_LED_R = LED_OFF;
		OUT_LED_G = LED_OFF;
		//OUT_LED_B = LED_OFF;
		//LED_OFF;
	}
	if(Led_Breathe_count)
        Led_Breathe_count--;
	if(Led_Breathe_count == 0)
	{
		Led_Breathe_count = Led_Breathe_count_Total;//200;
		if(AdjustDirectionFlag)
		{
			LedPwmDuty--;
			if(LedPwmDuty == 1)
			{
				AdjustDirectionFlag = 0;
				return 1;
			}
		}
		else
		{
			LedPwmDuty++;
			if(LedPwmDuty >= 30)//64
			{
				AdjustDirectionFlag = 1;
			}
		}
	}
	return 0;
}

void Ledbreathing(void)
{
	if(!charging_breath_flash_flag)
		return;
	if(f_charging&&(!f_charge_full))
	{
		if(f_100us_TimeOut)
		{
			f_100us_TimeOut = 0;
			led2Run();
			#if 0
			if(led2Run())
			{
				/*
				if(b_LedShowing)
				{
					ledRunStep ++;
					if(ledRunStep == 6)
					{
						ledRunStep = 0;
						//led_breath_flash_flag = 0;
					}
				}
				else
				{
					ledRunStep = 0;
				}
				*/
				//ledRunStep ++;
				//if(ledRunStep > 6)
				//{
					ledRunStep = 0;
					//led_breath_flash_flag = 0;
				//}
			}
			#endif
			
		}
	}
}
/*
void breathingLedRunOnce_ToUp(void)//渐亮 然后退出
{
	if(led_breath_flash_flag)
	{
		//if((!b_smoking)||b_LedBreathingUpDown)
		if(b_LedBreathingUpDown)
		{
			if(LedShowKeepTime == 0)
			{
				//吸烟工作8秒白灯闪3次,控制板停止输出
				msg = MSG_SMOKE_TIMEOUT;
			}
			return;
		}
		if(f_100us_TimeOut)
		{
			f_100us_TimeOut = 0;			
			if(led2Run() == 2)
			{
				b_LedBreathingUpDown = 1;
				//OUT_LED_R = LED_ON;
				OUT_LED_G = LED_ON;
			}
		}
	}
}

void breathingLedRunOnce_ToDown(void)//渐暗 然后退出
{
	if(led_breath_flash_flag)
	{
		//if(b_smoking||!b_LedBreathingUpDown)
		//	return;
		if(b_smoking)
			return;
		if(f_100us_TimeOut)
		{
			f_100us_TimeOut = 0;			
			if(led2Run() == 1)
			{
				b_LedBreathingUpDown = 0;
				OUT_LED_R = LED_OFF;
				OUT_LED_G = LED_OFF;
				//OUT_LED_B = LED_OFF;
				led_breath_flash_flag = 0;
				nowLedMode = 0;
			}
		}
	}
}
*/
#endif
#if 1
void SetLedBreathingParameters(void)//
{
//	GroupColourIndex = group;
//	ledRunStep = startcoloridex;
	led_flash_flag = 0;//关闭闪烁效果
	led_breath_flash_flag = 1;//打开呼吸效果
	breathingLightLow = 0;
//	StartColourIndex++;
//	if(StartColourIndex > 2)
//		StartColourIndex = 0;
	breathingLightReversal = 0;
	
	ledRunStarStep++;
	if(ledRunStarStep >= 6)
		ledRunStarStep = 0;
	/*
	if(!isbreathingFlag)
	{*/
		ledRunSup = 0;
		ledRunStep = 0;
	/*}
	else
	{
		ledRunSup = 5;
		TempCount = 0;
	}
	*/
}
void SetLedBreathingParameters2(u8 color)//
{
	led_flash_flag = 0;//关闭闪烁效果
	led_breath_flash_flag = 1;//打开呼吸效果
	breathingLightLow = 0;
	breathingLightReversal = 0;	
	SetLedColor(color);
	OUT_LED_R = led_r;
	OUT_LED_G = led_g;
	//OUT_LED_B = led_b;
	if(color == COLOR_GREEN)//白灯
	{
		ledRunSup = 0;
	}
	else if(color == COLOR_RED)//红灯
	{
		ledRunSup = 3;
	}
	/*
	ledRunStarStep++;
	if(ledRunStarStep >= 6)
		ledRunStarStep = 0;
	ledRunSup = 0;
	ledRunStep = 0;	
	*/	
	nowLedMode = 2;
}

u8 ledRunOnce(u16 low,u16 high)
{
    u8 res = 0;
    baseLedCounter++;
    if (baseLedCounter <= high)
    {
		OUT_LED_R = LED_OFF;
		OUT_LED_G = LED_OFF;
		//OUT_LED_B = LED_OFF;
        return 0;
    }
    else if (baseLedCounter <= (high + low))
    {
		OUT_LED_R = led_r;
        OUT_LED_G = led_g;
		//OUT_LED_B = led_b;
        return 0;
    }
    else
    {
        res = 1;
        baseLedCounter = 0;
    }
    return res;
}

u8 res = 0;
u8 breathingLedRunOnce_ToUp(void)//渐亮 然后退出
{

	res = 0;
    baseLedCounter++;
    if (baseLedCounter <=  breathingVar - breathingLightLow)
    {
		OUT_LED_R = LED_OFF;
		OUT_LED_G = LED_OFF;
		//OUT_LED_B = LED_OFF;
        //return 0;
    }
    else if (baseLedCounter <= breathingVar)
    {
		OUT_LED_R = led_r;
        OUT_LED_G = led_g;
		//OUT_LED_B = led_b;
        //return 0;
    }
    else
    {
        //res = 1;
        if (breathingLightLow == breathingVar)
		{
			return 1;
		}
		else
		{
			breathingLightLow++;
		}
        baseLedCounter = 0;
    }

/*
	if (ledRunOnce(breathingLightLow, breathingVar - breathingLightLow))//85
//	if(res)
	{	
		if (breathingLightLow == breathingVar)
		{
			return 1;
		}
		else
		{
			breathingLightLow++;
		}
		
	}*/
	return 0;
}

u8 breathingLedRunOnce_ToDown(void)//渐暗 然后退出
{
	res = 0;
    baseLedCounter++;
    if (baseLedCounter <=  breathingVar - breathingLightLow)
    {
		OUT_LED_R = LED_OFF;
		OUT_LED_G = LED_OFF;
		//OUT_LED_B = LED_OFF;
        //return 0;
    }
    else if (baseLedCounter <= breathingVar)
    {
		OUT_LED_R = led_r;
        OUT_LED_G = led_g;
		//OUT_LED_B = led_b;
        //return 0;
    }
    else
    {
        //res = 1;
        
        if (breathingLightLow == 0)
		{
			return 1;
		}
		else
		{
			breathingLightLow--;
		}
        baseLedCounter = 0;
    }
/*
	if (ledRunOnce(breathingLightLow, breathingVar - breathingLightLow))//85
//	if(res)
	{
		if (breathingLightLow == 0)
		{
			return 1;
		}
		else
		{
			breathingLightLow--;
		}
	}
	*/
	return 0;
}

u8 breathingLedRunOnce_FirstToUp_AfterToDown(void)
{
	if (breathingLightReversal)
	{
		if(breathingLedRunOnce_ToDown())
		{
			breathingLightReversal = 0;
			return 1;
		}
	}
	else
	{
		if(breathingLedRunOnce_ToUp())
		{
			breathingLightReversal = 1;
		}
	}
	return 0;
}

u8 breathingLedRunOnce_FirstToUp_AfterToDown2(void)
{
	if (breathingLightReversal == 0)
	{
		if(breathingLedRunOnce_ToUp())
		{
			breathingLightReversal = 1;
			if(ledRunStep < 2)
				BuleLed_delay_keep_time = 27;//35;//4;//20;
			else
				BuleLed_delay_keep_time = 30;//35;//4;//20;
				
		}	
	}
	else if(breathingLightReversal == 1)
	{
		if(BuleLed_delay_keep_time == 0)
		{
			breathingLightReversal = 2;
		}
	}
	else if(breathingLightReversal == 2)
	{
		if(breathingLedRunOnce_ToDown())
		{
			breathingLightReversal = 0;
			return 1;
		}
	}
	return 0;
}

#if 0
void ledRun(void)
{
	if(led_breath_flash_flag)
	{
		//SetLedGroup(GroupColourIndex,ledRunStep);//默认颜色
		//SetLedColor(ledRunStep);
		if(ledRunSup == 0)
		{
			//SetLedColor(ledRunStarStep);
			breathingVar = 85;
			breathingLedRunOnce_ToUp();
			//if(breathingLedRunOnce_ToUp())
			//{
				//ledRunSup = 1;
			//}
			
		//}
		//else if(ledRunSup == 1)
		//{
			//if(!keyPressStatus)
			if(IN_MIC == 0)
			{
				led_breath_flash_flag = 0;
				LedOff(COLOR_GREEN);//绿灯熄灭
				//ledRunSup = 2;
				isbreathingFlag = 0;
				//breathingVar = 45;
				//breathingLightLow = 45;
				
				ledRunSup = 0;
				nowLedMode = 0;
				isbreathingFlag = 0;
				/*
				if(f_charging)//吸完烟后如果当前还在充电状态则需恢复充电的指示灯状态
				{
					if(f_charge_full)
					{
						msg = MSG_CHRG_FULL;	
					}
					else
					{
						//SetLedColorNormallyOn(COLOR_RED);
						msg = MSG_CHRG;
					}
				}
				*/
			}
			else
			{
				if(LedShowKeepTime == 0)
				{
					if(b_smoking)//默认吸烟时间为8S，达到时关闭输出，白灯慢闪3次
					{
						msg = MSG_SMOKE_TIMEOUT;
					}
				}
			}
		}
		else if(ledRunSup == 2)
		{
			//SetLedColor(ledRunStarStep);
			if(breathingLedRunOnce_ToDown())
			{
				//ledRunSup = 3;
				//ledRunStep = 0;
				ledRunSup = 0;
				nowLedMode = 0;
				isbreathingFlag = 0;
				led_breath_flash_flag = 0;
				if(f_charging)//吸完烟后如果当前还在充电状态则需恢复充电的指示灯状态
				{
					if(f_charge_full)
					{
						msg = MSG_CHRG_FULL;	
					}
					else
					{
						//SetLedColorNormallyOn(COLOR_BLUE);
						msg = MSG_CHRG;
					}
				}
				/*
				if(f_charge_full)
				{
					SetLedColorNormallyOn(COLOR_GREEN);
				}*/
			}
		}
		/*else if(ledRunSup == 3)
		{
			SetLedColor(ledRunStep);
			breathingVar = 85;
			if(ledRunStep == 3)
			{
				breathingVar = 75;
				if(breathingLedRunOnce_FirstToUp_AfterToDown2())
				{
					ledRunStep ++;
					if(ledRunStep >= 6)//
					{
						ledRunStep = 1;
						ledRunSup = 4;
						TempCount = 0;
						b_temp_flag = 0;
						b_status_flag = 0;
						temptimecount = 20;
					}
					
				}			
			}
			else
			{
				if(breathingLedRunOnce_FirstToUp_AfterToDown())
				{
					ledRunStep ++;
					if(ledRunStep >= 6)//
					{
						ledRunStep = 0;
						ledRunSup = 4;
						TempCount = 0;
						b_temp_flag = 0;
						b_status_flag = 0;
						temptimecount = 20;
					}
					
				}
			}
		}
		else if(ledRunSup == 4)
		{
			breathingVar = 25;//30;	
			SetLedColor(ledRunStep);
			if(!b_status_flag)
			{
				OUT_LED_R = led_r;
        		OUT_LED_G = led_g;
				//OUT_LED_B = led_b;
				//if(ledRunOnce(1300,1300))//1300,1300
				//(breathingLedRunOnce_FirstToUp_AfterToDown())//35
				if(temptimecount == 0)
				{
					temptimecount = 20;
					ledRunStep ++;
					if(ledRunStep >= 6)
					{
						ledRunStep = 0;
						OUT_LED_R = LED_OFF;
						OUT_LED_G = LED_OFF;
						//OUT_LED_B = LED_OFF;
						if(!b_temp_flag)
						{
							ledRunSup = 0;
							nowLedMode = 0;
							isbreathingFlag = 0;
							led_breath_flash_flag = 0;
						}
						else
						{
							b_status_flag = 1;
						}
					}
				}
				
			}
			if((!keyPressStatus)&&b_temp_flag)
			{
				ledRunSup = 3;
				ledRunStep = 0;
				TempCount = 0;
				breathingLightLow = 0;
				breathingLightReversal = 0;
			}
		}
		else if(ledRunSup == 5)
		{
			breathingVar = 55;
			SetLedColor(ledRunStarStep);
			//if(ledRunOnce(1300,1300))//1300,1300
			if(breathingLedRunOnce_FirstToUp_AfterToDown())//60
			{
				TempCount++;
				if(TempCount >= 6)
				{
					TempCount = 0;
					ledRunSup = 4;
					ledRunStep = 0;
					breathingLightLow = 0;
					b_temp_flag = 1;
					b_status_flag = 0;
					temptimecount = 20;
				}
			}
			if(!keyPressStatus)
			{
				ledRunSup = 3;
				ledRunStep = 0;
				TempCount = 0;
				breathingLightLow = 0;
				breathingLightReversal = 0;
			}
		}
		*/
	}
}
#endif


void ledRun(void)
{
	if(led_breath_flash_flag)
	{
		if(ledRunSup == 0)
		{
			//SetLedColor(COLOR_BLUE);
			breathingVar = 65;//63;//85;
			if(breathingLedRunOnce_ToUp())
			{
				ledRunSup = 1;
			}
			if(!keyPressStatus)
			{
				ledRunSup = 2;
				isbreathingFlag = 1;
			}
		}
		else if(ledRunSup == 1)
		{
			if(!keyPressStatus)
			{
				ledRunSup = 2;
				isbreathingFlag = 1;
			}
			else
			{
				if(LedShowKeepTime == 0)
				{
					//if(b_smoking)//默认吸烟时间为8S，达到时关闭输出
					{
						msg = MSG_SMOKE_TIMEOUT;
					}
				}
				
			}
		}
		else if(ledRunSup == 2)
		{
			//SetLedColor(COLOR_BLUE);
			if(breathingLedRunOnce_ToDown())
			{
				//ledRunSup = 3;
				ledRunStep = 0;
				
				ledRunSup = 0;
				nowLedMode = 0;
				isbreathingFlag = 0;
				led_breath_flash_flag = 0;
				if(f_charging)//吸完烟后如果当前还在充电状态则需恢复充电的指示灯状态
				{
					if(f_charge_full)
					{
						msg = MSG_CHRG_FULL;	
					}
					else
					{
						//SetLedColorNormallyOn(COLOR_RED);
						msg = MSG_CHRG;
					}
				}
				
				
			}
		}
		
		else if(ledRunSup == 3)
		{
			//SetLedColor(ledRunStep);
			breathingVar = 140;//65;//70;//85;
			/*if(ledRunStep == COLOR_BLUE)
			{
				breathingVar = 66;//75;
				if(breathingLedRunOnce_FirstToUp_AfterToDown2())
				{
					ledRunStep ++;
					if(ledRunStep >= 6)//
					{
						ledRunStep = 0;
						ledRunSup = 4;
						TempCount = 0;
						//b_temp_flag = 0;
						//b_status_flag = 0;
						temptimecount = 278;//29//32;//40
					}
					
				}			
			}
			else*/
			{
				breathingLedRunOnce_FirstToUp_AfterToDown();
				//if(breathingLedRunOnce_FirstToUp_AfterToDown())
				{
					//ledRunStep = ledRunStep;
					/*
					ledRunStep ++;
					if(ledRunStep >= 6)//
					{
						ledRunStep = 0;
						ledRunSup = 4;
						TempCount = 0;
						//b_temp_flag = 0;
						//b_status_flag = 0;
						temptimecount = 278;//29  32;//40
					}
					*/
				}
			}
		}
		#if 0
		else if(ledRunSup == 4)
		{
			if(temptimecount == 0)
			{
				ledRunStep = 0;
				ledRunSup = 5;
				TempCount = 0;
				//b_temp_flag = 0;
				//b_status_flag = 0;
				temptimecount = 260;//270;//275;//276;//40
			}
		}
		else if(ledRunSup == 5)
		{
			SetLedColor(ledRunStep);
			//breathingVar = 25;//30;	
			//if(!b_status_flag)
			{
				if(temptimecount > 130)//138 //20
				{
					//OUT_LED_R = led_r;
	        		//OUT_LED_G = led_g;
					OUT_LED_B = led_b;
				}
				else
				{
					//OUT_LED_R = LED_OFF;
					//OUT_LED_G = LED_OFF;
					OUT_LED_B = LED_OFF;
				}
				
				//if(ledRunOnce(1300,1300))//1300,1300
				//(breathingLedRunOnce_FirstToUp_AfterToDown())//35
				if(temptimecount == 0)
				{
					temptimecount = 260;//270;//275;//276;//40;
					ledRunStep ++;
					if(ledRunStep >= 6)
					{
						ledRunStep = 0;
						//OUT_LED_R = LED_OFF;
						//OUT_LED_G = LED_OFF;
						OUT_LED_B = LED_OFF;
						ledRunSup = 0;
						nowLedMode = 0;
						isbreathingFlag = 0;
						led_breath_flash_flag = 0;
						if(f_charging)//吸完烟后如果当前还在充电状态则需恢复充电的指示灯状态
						{
							if(f_charge_full)
							{
								msg = MSG_CHRG_FULL;	
							}
							else
							{
								//SetLedColorNormallyOn(COLOR_RED);
								msg = MSG_CHRG;
								//SetLedColorNormallyOn(COLOR_BLUE);
							}
						}
					}
				}
				
			}
			/*
			if(!keyPressStatus)
			{
				ledRunSup = 3;
				ledRunStep = 0;
				TempCount = 0;
				breathingLightLow = 0;
				breathingLightReversal = 0;
			}
			*/
		}
		/*
		else if(ledRunSup == 5)
		{
			breathingVar = 55;
			//if(ledRunOnce(1300,1300))//1300,1300
			if(breathingLedRunOnce_FirstToUp_AfterToDown())//60
			{
				TempCount++;
				if(TempCount >= 6)
				{
					TempCount = 0;
					ledRunSup = 4;
					ledRunStep = 0;
					breathingLightLow = 0;
					//b_temp_flag = 1;
					//b_status_flag = 0;
					temptimecount = 20;
				}
			}
			if(!keyPressStatus)
			{
				ledRunSup = 3;
				ledRunStep = 0;
				TempCount = 0;
				breathingLightLow = 0;
				breathingLightReversal = 0;
			}
		}
		*/
		#endif
	}
}




#endif
/*
void ShowLedParameters(u8 group,u8 startcoloridex,u16 cycletime)//cycletime--多长时间改变一次占空比(单位：10ms)
{
	GroupColourIndex = group;
	ledRunStep = startcoloridex;
	led_flash_flag = 0;//关闭闪烁效果
	led_breath_flash_flag = 1;//打开呼吸效果
	Led_Breathe_count = cycletime;//200;
	Led_Breathe_count_Total = cycletime;
	//SetLedGroup(GroupColourIndex,ledRunStep);//默认颜色
	//OUT_LED_R = led_r;
	//OUT_LED_G = led_g;
	//OUT_LED_B = led_b;
	LED_ON;
	led_delay_keep_time = 0;
}

void ShowLed(void)
{
	if(led_breath_flash_flag)
	{
		if(Led_Breathe_count)
	        Led_Breathe_count--;
		if(Led_Breathe_count == 0)
		{
			Led_Breathe_count = Led_Breathe_count_Total;//200;	
			ledRunStep ++;
			if(ledRunStep == 7)
			{
				ledRunStep = 0;
			}
			//SetLedGroup(GroupColourIndex,ledRunStep);//默认颜色
			OUT_LED_R = led_r;
			OUT_LED_G = led_g;
			OUT_LED_B = led_b;
			//LED_ON;
		}
	}
}
*/
/*
void ShowLedSharpflashParameters(u8 group,u8 startcoloridex,u16 cycletime)//cycletime--多长时间改变一次占空比(单位：10ms)
{
	GroupColourIndex = group;
	ledRunStep = startcoloridex;
	led_flash_flag = 0;//关闭闪烁效果
	led_breath_flash_flag = 1;//打开呼吸效果
	Led_Breathe_count = cycletime;//200;
	Led_Breathe_count_Total = cycletime;
	//SetLedGroup(GroupColourIndex,ledRunStep);//默认颜色
	//OUT_LED_R = led_r;
	//OUT_LED_G = led_g;
	//OUT_LED_B = led_b;
	led_delay_keep_time = 0;
	led_flash_count = 0;
}
void LedSharpflash(void)//灯光爆闪效果
{
	if(led_breath_flash_flag)
	{
		SetLedGroup(GroupColourIndex,ledRunStep);//默认颜色
		if(led_delay_keep_time == 0)
		{
			led_delay_keep_time = 8;//11;//15
			if(led_flash_count%2 == 0)
			{
				//OUT_LED_R = led_r;
	    		//OUT_LED_G = led_g;
				//OUT_LED_B = led_b;
				LED_ON;
			}
			else
			{
				//OUT_LED_R = LED_OFF;
				//OUT_LED_G = LED_OFF;
				//OUT_LED_B = LED_OFF;
				LED_OFF;
			}	
			led_flash_count++;
			if(led_flash_count > 1) 
				led_flash_count = 0;
			ledRunStep++;
			if(ledRunStep > 6)
				ledRunStep = 0;
		}
		
		if(LedShowKeepTime == 0)
		{
			led_breath_flash_flag = 0;
			if(!b_smoking)//3个RGB同步爆闪,停止吸烟后再爆闪10秒
			{
				
				nowLedMode = 0;
				//OUT_LED_R = LED_OFF;
				//OUT_LED_G = LED_OFF;
				//OUT_LED_B = LED_OFF;
				LED_OFF;
			}
			else//默认吸烟时间为10S，达到时关闭输出，蓝灯闪2次
			{
				msg = MSG_SMOKE_TIMEOUT;
			}
		}
	}
}
*/
void led_param_init(void)
{
	led_flash_flag = 0;
	led_flash_count = 0;
	led_delay_keep_time = 0;
	led_on_keep_time = 0;
	nowLedMode = 0;
	ledRunStep = 0;
	ledRunSup = 0;
//	ledRunSupCnt = 0;
	
//	StartColourIndex = 0;
//	breathingVar = 0;
//	breathingLightLow = 0;
//	breathingLightReversal = 0;
//	sleepCnt = 0;
//	battery_low_cnt = 0;
	led_flash_count = 0;//变量公用方式
	
	delay_keep_time = 0;
	EnterbatteryLowFlag = 0;
//	temptimecount = 0;	
	
	
	nowLedMode = 0;
//	SingleLedPwmCycleCount = 0;
	LedPwmDuty = 0;
	Led_Breathe_count = 0;
	LedShowStep = 0;
//	AdjustDirectionFlag = 0;
	LedPwmCycleCount = 0;
	led_breath_flash_flag = 0;
	//b_batLowShow = 0;
//	b_status_flag = 0;
}

//==============================================================================
//	Function: led_handle
//		Input: None
//		Output: None
//==============================================================================
void led_handle(void)
{
	u8 flashresult;
	#if 1
	switch(nowLedMode)
	{
		case 1://
			if(LedShowKeepTime > 50)
			{
				//LedOff();//灯熄灭
				SetLedColorNormallyOn(COLOR_RED);//红色
			}
			else if(LedShowKeepTime > 0)
			{
				SetLedColorNormallyOn(COLOR_GREEN);
			}
			else if(LedShowKeepTime == 0)
			{
				// LedOff();//灯熄灭
				nowLedMode = 0;
			}
			break;
	}
	#endif
	flashresult = LedFlash();
	if(flashresult == 2)
	{
		if(f_charging)
		{
			if(f_charge_full)
			{
				//msg = MSG_CHRG_FULL;
				nowLedMode = 0;
				//SetLedColorNormallyOn(COLOR_GREEN);
				msg = MSG_CHRG_FULL;
			}
			else
			{
				//SetLedColorNormallyOn(COLOR_BLUE);
				msg = MSG_CHRG;
				
			}
		}
		else
		{
			nowLedMode = 0;
		}
		
		//b_batLowShow = 0;
		//OverCurrentFlag = 0;
		//b_heater_exist_check = 0;
	}
	
	if(flashresult == 1)
	{
		if(f_charging)//
		{
			if(f_charge_full)
			{
				msg = MSG_CHRG_FULL;
				//nowLedMode = 0;
				//msg = MSG_CHRG_FULL;
			}
			else
			{
				//SetLedColorNormallyOn(COLOR_BLUE);
				msg = MSG_CHRG;
			}
		}
		/*
		if((b_smoking||b_heating)&&f_battery_low)//电池电压3.5V的时候吸烟先亮当前档位灯，在亮红灯提示电量低
		{
			SetLedColorNormallyOn(COLOR_RED);
		}
		*/
	}
	flashresult = 0;
}

u16 led_dis_cnt = 0;	//用于统计led显示计时的cnt
u8  led_flash_cnt = 0; 	//led闪烁次数

//10ms loop 
void led_dis_loop_func(void)
{
	switch (led_mode_flag)
	{
	case 1: //上电闪一下
		if(led_dis_cnt)
		{
			PIN_LED = LED_ON;
			if(--led_dis_cnt == 0)
			{
				PIN_LED = LED_OFF;
				led_mode_flag = 0;
			}
		}
		break;
	case 4:		//超时
	case 5:		//低压
	case 10:		//空载
		led_dis_cnt--;
		if (led_dis_cnt >= 25)
		{
			PIN_LED = LED_OFF;
		}
		else if (led_dis_cnt > 0)
		{
			PIN_LED = LED_ON;
		}
		else if(led_dis_cnt == 0)
		{
			if(led_flash_cnt)
			{
				led_flash_cnt--;
				if(led_flash_cnt != 0)
				{
					led_dis_cnt = 50;
				}
				else if(led_flash_cnt == 0)
				{
					led_dis_cnt = 0;
					PIN_LED = LED_OFF;
					led_mode_flag = 0;
				}
			}
		}
		break;

	default:
		break;
	}

}

void led_mode_set(u8 mode)
{
	switch (mode)
	{
	case 1:  //上电
		//上电闪一下
		led_mode_flag = mode;
		led_dis_cnt = 100;
		break;
	case 2:  //抽烟
		led_mode_flag = mode;
		PIN_LED = LED_ON;
		break;
	case 3:	 //抽烟结束
		led_mode_flag = mode;
		PIN_LED = LED_OFF;
		break;
	case 4:  //吸烟超时
		led_mode_flag = mode;
		led_dis_cnt = 50;
		led_flash_cnt = 2;
		break;
	case 5:	//低压
		led_mode_flag = mode;
		led_dis_cnt = 50;
		led_flash_cnt = 10;
		break;
	case 6:  //	吸烟超时
		led_mode_flag = mode;
		led_dis_cnt = 50;
		led_flash_cnt = 2;
		break;
	case 7:  //	充电
		led_mode_flag = mode;
		PIN_LED = LED_ON;
		break;
	case 8:  //	充电满
		led_mode_flag = mode;
		PIN_LED = LED_OFF;
		break;
	case 9:  //	充电拔出
		led_mode_flag = mode;
		PIN_LED = LED_OFF;
		break;
	case 10:  //空载
		led_mode_flag = mode;
		led_dis_cnt = 50;
		led_flash_cnt = 5;
		break;
	default:
		led_mode_flag = 0;
		PIN_LED = LED_OFF;
		break;
	}	
}