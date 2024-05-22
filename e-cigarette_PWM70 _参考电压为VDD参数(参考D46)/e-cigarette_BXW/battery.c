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
u8 battery_low_cnt;
//u8 low_check_cnt;
//u8 battery_voltage_cnt;
//u16 battery_voltage_filt;
//==============================================================================
//	Function Declaration
//==============================================================================


//==============================================================================
//	Function: battery_param_init
//		Input: None
//		Output: None
//==============================================================================
void battery_param_init(void)
{
	f_battery_check = 0;
//	f_battery_blink = 0;
	
	battery_low_cnt = 0;
//	low_check_cnt = 0;
	
//	battery_voltage_cnt = 0;
//	battery_voltage_filt = 0;
	
	f_battery_low = 0;
	//b_batLowShow = 0;
}

void lvd_3P3V_init(void)
{
	PCON1 &= 0xe3;							// 1100 0011
	PCON1 |= C_LVD_3P3V;					//
	f_battery_low = 0;
	battery_low_cnt = 0;
}
void lvd_3P0V_init(void)
{
	PCON1 &= 0xe3;							// 1100 0011
	PCON1 |= C_LVD_3P0V;					//
	f_battery_low = 0;
	battery_low_cnt = 0;
}
//==============================================================================
//	Function: battery_check
//		Input: None
//		Output: None
//==============================================================================
void battery_check(void)
{
	#if 0
	if(f_charging||b_batLowShow)
	{
		battery_low_cnt = 0;
		f_battery_low = 0;	
		return;
	}
	if(f_battery_check)//10ms
	{
		f_battery_check = 0;
		if(PCON1&C_LVDOUT)
		{
		   /*
			if(f_battery_low)
			{
				battery_low_cnt++;
				if(battery_low_cnt > 30)//300ms
				{
					battery_low_cnt = 0;
					f_battery_low = 0;
				}
			}
			else
			{
				battery_low_cnt = 0;
			}*/
		}
		else
		{
			if(f_battery_low == 0)
			{
				battery_low_cnt++;
				if(battery_low_cnt > 30)//200ms
				{
					battery_low_cnt = 0;
					f_battery_low = 1;
					msg = MSG_LVD;
				}
			}
		}	
		
	}
	#endif
	
}



