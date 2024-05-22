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
u8 motorstate;//电机状态 0--停止  1--运转
u8 motor_move_direction;//电机移动方向 0--正转  1--反转
u16 motorWorkingTimeCount;
u8 OverCurrentFlag;//马达过流标志
u8 NormalCurrentFlag;//马达工作正常电流标志
u8 OverCurrentTimeCount;//马达过流时间统计
u8 OverCurrentCount;//马达过流5秒统计

u8 motor_over_load_cnt;
u16 motor_over_load_vol;
u8 gAdSampleFinishFlag;
u16 motor_voltage;
u16 gAdcDataValue;
u8 gAdcCheckCount;//检测AD消抖次数
u8 gAdcCount;
u16 gAdcCheckDelayCount;
//==============================================================================
//	Function: motor_param_init
//		Input: None
//		Output: None
//==============================================================================
void motor_param_init(void)
{
	motorstate = MOTOR_STATE_STOP;//电机状态 0--停止  1--动作
	motorWorkingTimeCount = 0;
	motor_move_direction = 0;//电机移动方向 0--正转  1--反转
	OverCurrentFlag = 0;//马达过流标志
	gAdSampleFinishFlag = 0;
	gAdcDataValue = 0;
	gAdcCount = 0;
	gAdcCheckDelayCount = 0;
	motor_over_load_cnt = 0;
	motor_over_load_vol = 0;
	gAdcCheckCount = 0;
}
//==============================================================================
//	Function: motor_handle
//		Input: None
//		Output: None
//==============================================================================
void motor_handle(void)
{
//	unsigned char i;
//	unsigned long int motor_voltage;
//	unsigned int adc_value_tmp;

	if(OverCurrentFlag == 0)
	{
		if(motorstate == MOTOR_STATE_WORKING)
		{
			switch(motor_move_direction)
			{
				case 0://初始化参数
					motorWorkingTimeCount = 600;//100ms*600
					motor_move_direction++;
					MOTOR_FORWARD_WORKING;
					break;		
					
				case 1://揉捏正转1分钟后
					if(motorWorkingTimeCount == 0)
					{
						MOTOR_STOP;
						motor_move_direction++;
						motorWorkingTimeCount = 10;
					}
					break;
					
				case 2://停1秒
					if(motorWorkingTimeCount == 0)
					{
						MOTOR_BACK_WORKING;
						motor_move_direction++;
						motorWorkingTimeCount = 600;//100ms*600
					}					
					break;
					
				case 3://反转1分钟
					if(motorWorkingTimeCount == 0)
					{
						MOTOR_STOP;
						motor_move_direction++;
						motorWorkingTimeCount = 10;
					}				
					break;	
					
				case 4://停1秒
					if(motorWorkingTimeCount == 0)
					{
						motor_move_direction = 0;//继续以此循环
					}				
					break;					
			}
		}
		else
		{
			MOTOR_STOP;
			motor_move_direction = 0;
			motorWorkingTimeCount = 0;
		}
		
	}
	
}


/*
void motor_handle(void)
{
//	unsigned char i;
//	unsigned long int motor_voltage;
//	unsigned int adc_value_tmp;
	if(motor_mode == MOTOR_STOP)
		return;
	
	if(gAdSampleFinishFlag)
	{
		gAdSampleFinishFlag = 0;

		
		if(motor_move_direction == 0)//电机打开中
		{
			if(gAdcDataValue > 0x1ed)//打开到尽头了停止电机并往回闭合
			{
				if(gAdcCheckCount > 3)//消抖3次
				{
					gAdcCheckCount = 0;
					MOTOR_OFF;
					//delay(200);
					MOTOR_ON_CLOSE;//电机开始闭合动作
					motor_move_direction = 1;
					gAdcCheckDelay = 100;//100*10ms 
				}
				else
				{
					gAdcCheckDelay = 10;//10*10ms
					gAdcCheckCount++;
				}
			}
			else
			{
				gAdcCheckCount = 0;
			}
		}
		else//电机闭合中
		{
			if(gAdcDataValue < 0x370)//完全闭合了停止电机
			{		
				MOTOR_OFF;
				motor_move_direction = 0;
				motor_mode = MOTOR_STOP;
			}
		}	
		gAdcDataValue = 0;
		
	}
		


	
	//lock_cnt_true = 0;//大电流计数清零
	
}




void motor_handle(void)
{
	unsigned char i;
	unsigned long int motor_voltage;
	unsigned int adc_value_tmp;
	
	if(motor_mode == MOTOR_STOP)
		return;
	
	//每轮采集4次求平均值
	motor_voltage = 0;
	for(i = 0; i < 4; i++)
	{	
		ADMDbits.START = 1;
		delay(10);
		while(ADMDbits.EOC == 0)
   			;   			
   		adc_value_tmp = ADD;
   		adc_value_tmp <<= 4;
   		adc_value_tmp += (ADR & 0x0f);
   		
   		motor_voltage += adc_value_tmp;
	}
	motor_voltage >>= 2;
 
	if(motor_over_load_cnt == 0)
	{
		motor_over_load_vol = 0;
	}
	motor_over_load_vol += motor_voltage;
	motor_over_load_cnt++;
	if(motor_over_load_cnt>= 4)
	{
		motor_over_load_cnt = 0;
		//过流保护
		motor_over_load_vol = motor_over_load_vol >>2;
		if(motor_move_direction == 0)//电机打开中
		{
			if(motor_over_load_vol > 0x300)//打开到尽头了停止电机并往回闭合
			{
				motor_over_load_vol = 0;
				motor_over_load_cnt = 0;
				MOTOR_OFF;
				delay(200);
				MOTOR_ON_CLOSE;//电机开始闭合动作
				motor_move_direction = 1;
			}
		}
		else//电机闭合中
		{
			if(motor_over_load_vol < 0x30)//完全闭合了停止电机
			{
				motor_over_load_vol = 0;
				motor_over_load_cnt = 0;			
				MOTOR_OFF;
				motor_move_direction = 0;
				motor_mode = MOTOR_STOP;
			}
		}	
		
	}	


	
	//lock_cnt_true = 0;//大电流计数清零
	
}
*/
