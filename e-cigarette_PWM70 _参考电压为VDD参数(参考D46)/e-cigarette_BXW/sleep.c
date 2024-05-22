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
u16 running_keep_time;
//u8 sys_sleep_flag;
u8 sleep_delay_keep_time;
u8 sleepCnt;
//u8 sleepWakedUpByWDTFlag;
//u8 sleepWakedUpByWDTCount;
//==============================================================================
//	Function Declaration
//==============================================================================


//==============================================================================
//	Function: sleep_param_init
//		Input: None
//		Output: None
//==============================================================================
void sleep_param_init(void)
{
	running_keep_time = RUNNING_KEEP_TIME;
	isSleep = 0;
	sleep_delay_keep_time = 0;
	sleepCnt = 0;
}


//==============================================================================
//	Function: sleep_handle
//		Input: None
//		Output: None
//==============================================================================
void sleep_handle(void)
{
	//u8 temp;
	if(!sleepWakedUpByWDTFlag)
	{
		//if(keyPressStatus||(nowLedMode != 0)||b_batLowShow||b_heater_exist_check||sleepWakedUpCheckTimeCount)
		//if(b_KeyDowm||b_isPowerOn||C_IO_USB_DEC||keyPressStatus||(nowLedMode != 0)||f_charging||led_flash_flag||led_breath_flash_flag||sleepWakedUpCheckTimeCount)
		if((IN_MIC != 0)||keyPressStatus||(nowLedMode != 0)||led_flash_flag||led_breath_flash_flag||C_IO_USB_DEC||f_charging||b_heater_exist_check||disp_delay_time_cnt)
		//if((IN_MIC != 0)||keyPressStatus||(nowLedMode != 0)||led_flash_flag||led_breath_flash_flag||f_charging||b_heater_exist_check)
		{
			sleepCnt = 0;
		}
		if(f_sleep_check)//10ms
		{
			f_sleep_check = 0;
			if(sleepCnt < 100)
			{
				sleepCnt++;
			}
			else 
			{
				sleepCnt = 0;
				isSleep = 1;
			} 		
		}
		if(isSleep == 0)
			return;
    }
	isSleep = 0;
//	SaveHeaterIOStatus = C_IO_HEATER_CHECK_DEC;//进入睡眠前先保存发热丝IO电平状态	
	sleep_init();
//	IOSTA = 0x21;//0x05;
//	PCONbits.PHPA5 = 0;	
//	PORTA = 0xa0;
//	APHCON = 0xff;//0x7f;
	sleepWakedUpByWDTFlag = 0;
	//sleepWakedUpCheckTimeCount = 0;
	UPDATE_REG(PORTA);		//回读PA口状态
	UPDATE_REG(PORTB);		//回读PB口状态	
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	SLEEP();
	NOP();
	NOP();
	NOP();
	gpio_init();
	/*
	if(IN_MIC == 0)//不是抽烟动作的唤醒方式
	{
		gpio_init();
		//NOP();
		//NOP();
		//NOP();
		//NOP();
		//NOP();	
		if(sleepWakedUpByWDTFlag)
		{
			sleepWakedUpByWDTCount++;
			if(sleepWakedUpByWDTCount == 4)
			{		
				sleepWakedUpByWDTCount = 0;
				temp = C_IO_HEATER_CHECK_DEC;
				//if((temp != SaveHeaterIOStatus)||(temp != b_heater_exist_flag))
				if((temp != SaveHeaterIOStatus)||(temp == b_heater_exist_flag))
				{
					sleepWakedUpByWDTFlag = 0;
					sleepWakedUpCheckTimeCount = 100;
				}
			}	
		}
	}
	else
	{
		sleepWakedUpByWDTFlag = 0;
	}
	
	
	if(sleepWakedUpByWDTFlag != 0)
	{
		isSleep = 1;
	}
	else*/
	{
		system_init();	
		//AWUCON = C_PA2_Wakeup|C_PA5_Wakeup;
		isr_param_init();
		key_param_init();
		detect_param_init();
	//	usb_param_init();
	//	charge_param_init();
	//	battery_param_init();
		led_param_init();
		sleep_param_init();
	//	common_param_init();
	}
}




