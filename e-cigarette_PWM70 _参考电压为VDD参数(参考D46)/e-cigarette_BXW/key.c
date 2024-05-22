//==============================================================================
//	Include Header Files
//==============================================================================
#include "common.h"


//==============================================================================
//	Macro Definition
//==============================================================================
#define SHORT_PRESS_TIME		20//30
#define LONG_PRESS_TIME			1000//1500
//==============================================================================
//	Variable Definitions
//==============================================================================
u8 msg;

u8 keyCnt;
u8 keylowcount;
//u16 gKeyDnCnt;
//u8 KeyDowmTimeCount;//2秒时间统计(单位:10ms)
//u8 ValidKeyCount;//有效按键次数统计
//==============================================================================
//	Function: key_param_init
//		Input: None
//		Output: None
//==============================================================================
void key_param_init(void)
{
	keyCnt = 0;
	keyPressStatus = 0;
	isKeyPressing = 0;
	keylowcount = 0;
	//gKeyDnCnt = 0;
	//b_KeyDowm = 0;
	//keyIsPress = 0;
	//isKey2Pressing = 0;
	//isKeylongoutput = 0;
	//KeyDowmTimeCount = 0;//2秒时间统计(单位:10ms)
	//ValidKeyCount = 0;//有效按键次数统计
	msg = MSG_NULL;
}


//==============================================================================
//	Function: KeyScan
//		Input: None
//		Output: None
//==============================================================================
void MicScan(void)//咪头扫描
{
//	if(!b_isPowerOn)//开机状态下吸烟消息才有效
//		return;
	if(!f_1ms_TimeOut)
		return;
	f_1ms_TimeOut = 0;	
	if(nowLedMode != 1)
    {
		if(IN_MIC == 1)
		{
			keylowcount = 0;
			if(keyCnt < 10)//20
			{
				keyCnt ++;
			}
			else
			{
				isKeyPressing = 1;
			}
		}
		else 
		{
			keylowcount++;
			if(keylowcount > 10)//50
			{
				keylowcount = 0;
				isKeyPressing = 0;
				keyCnt = 0; 
				if(SmokeState == STATE_SMOKING)
				{
					//SmokeState = 0;
					percent_nun = 0;
					//MsgType = 0;
					I0_PWM2 = MT_OF;
				}
			}
		}
	}
	if(keyPressStatus != isKeyPressing)
	{
		keyPressStatus = isKeyPressing;
		if(keyPressStatus)
		{
			msg = MSG_SMOKE_ON;
		}
		else
		{
			/*if(b_smoking)
			{
				b_smoking = 0;
				SmokeState = 0;
				percent_nun = 0;
				I0_PWM2 = MT_OF;
				msg = MSG_SMOKE_OFF;
			}*/
			if(SmokeState == STATE_SMOKING)
			{
				b_smoking = 0;
				msg = MSG_SMOKE_OFF;
			}
		}
	}
}

#if 0
void KeyScan(void)//键盘扫描
{
	if(KEY_PIN == 0)
 	{
 		gKeyDnCnt++;
 		if(!b_KeyDowm)
		{
			if(gKeyDnCnt == 2)
			{
				b_KeyDowm = 1;
				KeyDowmTimeCount = 120;//1.2秒时间统计(单位:10ms)
				ValidKeyCount = 0;//有效按键次数统计
				//msg = KEY1_DOWN;//KEY DOWN键
			}
		}
		if((gKeyDnCnt >= LONG_PRESS_TIME)&&(!isKey2Pressing))
		{
			msg = KEY_LONG;
			isKey2Pressing = 1;
			ValidKeyCount = 0;//有效按键次数统计
		}	
	}
	else
	{
		if(isKey2Pressing)
		{
			isKey2Pressing = 0;
			gKeyDnCnt = 0;
			msg = KEY_UP;
		}
		if(gKeyDnCnt >= SHORT_PRESS_TIME)
		{
			//key = KEY_SHORT;
			ValidKeyCount++;//有效按键次数统计
		}
		gKeyDnCnt = 0;
	}
	
	if(b_KeyDowm)
	{
		if(KeyDowmTimeCount == 0)
		{
			b_KeyDowm  = 0;
			if(ValidKeyCount == 1)//快速按键1次
			{
				msg = KEY_ONE_TIME;
			}
			else if(ValidKeyCount == 3)//快速按键3次，进入预热模式
			{
				msg = MSG_PREHEAT;
			}
			/*
			else if(ValidKeyCount == 4)//快速按键4次后，切换档位
			{
				msg = MSG_MODE_VOL;
			}
			*/
		}
		if(ValidKeyCount >= 5)//连续按键5次开关机
		{
			b_KeyDowm  = 0;
			KeyDowmTimeCount = 0;
			msg = MSG_POWER_ONOFF;
		}
	}
	
	if(!b_isPowerOn)
	{
		if((msg != MSG_POWER_ONOFF)&&(msg != MSG_CHRG)&&(msg != MSG_CHRG_OFF))//关机状态下，只有MSG_POWER_ONOFF消息有效
		{
			msg = MSG_NULL;
		}
	}

}
#endif

