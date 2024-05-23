//==============================================================================
//	Include Header Files
//==============================================================================
#include "common.h"


//==============================================================================
//	Macro Definition
//==============================================================================

extern void Get_ADC_Value(void);//获取各通道AD值
void Detect_OverCurrent_ByIO(void);//通过IO检测来检测是否过流
//==============================================================================
//	Variable Definitions
//==============================================================================
//u8 usb_in_time_count;//
//u8 usb_out_time_count;//
//u8 usb_flag;//

u8 Chrg_On_time_count;//
u8 Chrg_Off_time_count;//
u8 Heat_On_time_count;//
u8 Heat_Off_time_count;//
//u8 Chrg_full_flag;//
u16 ChrgFullTimeCount;//
//u8 ChrgFullCount;//

//u16 Chrg_9V_delay_TimeCount;

//u8 PowerOnFlag;//开机标志位
u16 TmpAdcDataValue;
u16 gAdcDataValue;
u16 gAdcDataValueBak;
u8 Bat_check_cnt;
u16 Bat_adc_value;
u8 OverCurrent_check_cnt;
u16 OverCurrent_adc_value;
u8 usb_check_ad_time_cnt;
//u8 AdcChannelIndex;

//u16 SmokingNumberCount;//负载输出次数统计
//u8 SmokingNumberCountingKeepTime;//负载输出时间计时
u8 TargetMotorDuty;
//u8 NowMotorDuty;
//u8 MotorDutySet;
//u16 OverCurrentDelayTime;
//u16 OverCurrentCount;
//u16 BatLowCount;
//u8 SaveHeaterIOStatus;
//u8 sleepWakedUpCheckTimeCount;
//u16 OverCurrentCount2;
//u8 VolTypeIndex;//输出电压转换
//u8 BatVolLevel;//电池电量等级
//u8 BatVolLevelTemp;//电池电量等级
//u16 HeatingKeepTime;//加热时长
//static u8 now_ch = C_Quarter_VDD;
u16 SmokingKeepTime;//吸烟时长，主要是为了处理在吸烟前0.3秒是否需要全功率输出的问题
u8 SmokeState;//吸烟状态
u8 HeatCount;
u16 HeatPlugInsertTimeCount;
u8 HeatPlugInsert_flag;
//u8 SmokingLight_flag;
u8 battery_low_cnt;
//u16 tempflagTimeCount;
u8 now_ch = Quarter_VDD;
u8 disp_delay_time_cnt = 0;

#define AD_STABLE_RANGE_AA 50
#define ADC_4V_VAL 2048
#define ADC_3P8V_VAL 1945
#define ADC_3P6V_VAL 1843
#define ADC_3P4V_VAL 1740

#define ADC_3P2V_VAL 1638
#define ADC_2P7V_VAL 1382

#define ADC_VER2V_0P1V 52
#define ADC_VER2V_0P2V 103
#define ADC_VER2V_0P3V 154
#define ADC_VER2V_0P4V 205
#define ADC_VER2V_0P5V 256
#define ADC_VER2V_0P6V 308
#define ADC_OVER_LOAD 73 // 36mv

//static u16 last_bat_data = 0;
//static u8 adc_stable_tk = 0;
//static u8 adc_stable_tk2 = 0;
//u16 bat_adc_data;
//==============================================================================
//	Function: detect_param_init
//		Input: None
//		Output: None
//==============================================================================
void detect_param_init(void)
{
//	PowerOnFlag = 0;//开机标志位
//	usb_in_time_count = 0;//
//	usb_out_time_count	= 0;
//	usb_flag = 0;
	usb_check_ad_time_cnt = 0;
	Chrg_On_time_count = 0;
	//Chrg_Off_time_count = 0;
	Heat_On_time_count = 0;
	Heat_Off_time_count = 0;
	f_charging = 0;
	//Bat_check_cnt = 0;
	//Bat_adc_value = 0;
	OverCurrent_check_cnt = 0;
	//OverCurrent_adc_value = 0;
	f_charge_full = 0;
	b_smoking = 0;
	//AdcChannelIndex = 0;
	ChrgFullTimeCount = 0;
	//TargetMotorDuty = 0;//睡眠唤醒时不清零
	//NowMotorDuty = 0;
	//MotorDutySet = 0;
	//OverCurrentDelayTime = 0; 
	//OverCurrentCount = 0;
	//BatLowCount = 0;
//	OverCurrentFlag = 0;
//	ChrgFullCount = 0;
	GroupColourIndex = 0;
//	b_heater_exist_check = 0;
	
	//OverCurrentCount2 = 0;
	//VolTypeIndex = 0;//输出电压转换(0-1.8V 1-2.5V  2-3.0V  3-3.6V 默认为3V输出档位)
	//Get_Onetime_Bat_ADCValue();//吸烟之前先检测一次电池电压
	//HeatingKeepTime = 0;//加热时长
	b_heating = 0;
	SmokingKeepTime = 0;//吸烟时长，主要是为了处理在吸烟前0.3秒是否需要全功率输出的问题
	//last_bat_data = 0;
	//adc_stable_tk = 0;
	//adc_stable_tk2 = 0;
	//bat_adc_data = 0;
	b_heater_detect_mask = 0;
	SmokeState = 0;
	now_ch = C_Quarter_VDD;
	battery_low_cnt = 0;
	disp_delay_time_cnt = 0;
	//Chrg_9V_delay_TimeCount = 0;
}

void NOP10_(void)
{
	NOP();NOP();NOP();NOP();NOP();
	NOP();NOP();NOP();NOP();NOP();
}

void ADC_Convert_Pre(void)
{
	for(char i=0; i < 32;i++)
	{
		ADMDbits.START = 1;
		NOP10_();
	}
}

void F_wait_eoc(void)
{
   while(ADMDbits.EOC==0)
   ;
}

u16 getAbs(u16 num_a, u16 num_b)
{
	if (num_a > num_b)
	{
		return num_a - num_b;
	}
	else
	{
		return num_b - num_a;
	}
}

u16 Get_adc_data(u8 ch)
{
	u8 i;
    u16  temp,R_DATA = 0;		

    ADMD = 0x90 | ch;			
    ADC_Convert_Pre();
//	ADMDbits.START = 1;			  
//    F_wait_eoc();
    
//    R_DATA  = (ADD << 4) + ( 0x0F & ADR); 
//每轮采集4次求平均值
//	gAdcDataValue = 0;
	for(i = 0; i < 5; i++)//8
	{	
		ADMDbits.START = 1;
		F_wait_eoc();
   		if(i > 0)
   		{
	   		temp = ADD;
	   		temp <<= 4;
	   		temp += (ADR & 0x0f);  		
	   		R_DATA += temp;
   		}
	}
	
	R_DATA >>= 2;//3; 	
    return R_DATA;
    
}

#if 0
//切换通道舍弃第一次的值
u16 adc_get(u8 ch)
{
	u16 R_DATA_LB = 0;
	u16 R_DATA = 0;
	b_heater_detect_mask = 1;
	b_get_adc_result = 0;
	if(now_ch != ch)
	{
		ADMD = 0x90 | ch;
		/*if(ch == C_Quarter_VDD)
		{
			ADVREFH = C_Vrefh_2V;	//参考电压
		}
		else
		{
			ADVREFH = C_Vrefh_4V;	//参考电压
		}*/
		ADMDbits.START = 1;
		now_ch = ch;
		b_get_adc_result = 0;
		b_heater_detect_mask = 0;
		return 0;
	}

	//for (char i = 0; i < 2; i++)
	for (char i = 0; i < 4; i++)
	{
		ADMDbits.START = 1;
		//F_wait_eoc();
		while(ADMDbits.EOC == 0)
	  			 ;
		R_DATA_LB += (0x0F & ADR);
		R_DATA += ADD;
	}

	R_DATA <<= 4;
	R_DATA_LB &= 0xF0;
	R_DATA += R_DATA_LB;
	//R_DATA >>= 1;
	R_DATA >>= 2;
	b_get_adc_result = 1;
	b_heater_detect_mask = 0;
	return R_DATA;
}
#else
u8 g_u8ReadAdcCount = 0;
u16 g_u16ADCvalue = 0;
static u16 s_u16MostValue = 0;
static u16 s_u16LeastValue = 0;
static u16 s_u16Sum = 0;
u16 adc_get(u8 ch)
{
	u16 l_u16NowValue = 0;
	u16 R_DATA = 0;
	//ch = 0;
	//b_heater_detect_mask = 1;
	b_get_adc_result = 0;
	//f_open_circuit = 0;
	/*
	if(now_ch != ch)
	{
		ADMD = 0x90 | ch;
		ADMDbits.START = 1;
		now_ch = ch;
		b_get_adc_result = 0;
		//b_heater_detect_mask = 0;
		return 0;
	}
	*/
	//第一次读取丢弃
	ADMD = 0x90 | ch;
	ADMDbits.START = 1;
	//F_wait_eoc();
	while(ADMDbits.EOC == 0)
  			 ;
    s_u16Sum = 0;
    s_u16LeastValue = 4096;
    s_u16MostValue = 0;
    //g_u8ReadAdcCount = 0;
	//for (char i = 0; i < 2; i++)
	//for (char i = 0; i < 10; i++)
	for (char i = 0; i < 10; i++)
	{
		//g_u8ReadAdcCount ++;
		ADMDbits.START = 1;
		//F_wait_eoc();
		while(ADMDbits.EOC == 0)
	  			 ;
		//l_u16NowValue = ADD;
   		//l_u16NowValue <<= 4;
   		//l_u16NowValue += (ADR & 0x0f);  
   		l_u16NowValue = (ADD << 4) + ( 0x0F & ADR); 
		//adTemValue = adcDataBuf;
		if(l_u16NowValue > s_u16MostValue)				//取极大值
		{
			s_u16MostValue = l_u16NowValue;
		}
		if(l_u16NowValue < s_u16LeastValue)				//取极小值
		{
			s_u16LeastValue = l_u16NowValue;
		}
		//g_u8ReadAdcCount++;
		s_u16Sum += l_u16NowValue;	//累加
		/*
		if(g_u8ReadAdcCount >= 10)
		{
			//ad_num_cnt = 0;
			s_u16Sum = s_u16Sum - s_u16MostValue - adMinValue;	//累加值-极值（相当于8次adTemValue相加）
			adFinValue = adSumValue >> 3;						//最终值（右移1位相当于除以2）
			adSumValue = 0;
			adMinValue = 4096;									//ADC精度为12位，即4095
			adMaxValue = 0;	
			ad_success_flag = 1;	
		}
		*/
	}
	s_u16Sum -= s_u16MostValue;
	s_u16Sum -= s_u16LeastValue;// - s_u16LeastValue;
    R_DATA = s_u16Sum >> 3;
    //R_DATA = s_u16Sum >> 2;
	b_get_adc_result = 1;
	//b_heater_detect_mask = 0;
	/*
	if(R_DATA > 3000)
	{
		f_open_circuit = 1;
	}
	*/
	return R_DATA;
}
#endif
void AdjustHeatPwm(void)//在打开加热丝时PWM递进方式++
{
	if(b_smoking||b_heating)
	{
		if(f_1ms_TimeOut)
		{
			f_1ms_TimeOut = 0;
			NowMotorDuty++;
			if(NowMotorDuty >= TargetMotorDuty)
			{				
				NowMotorDuty = TargetMotorDuty;
			}
			PWM2DUTY = NowMotorDuty;
		}
	}
}

/*
void ControlHeatingTime(void)//控制加热丝加热时间
{
	if(b_heating)
	{
		//if((HeatingKeepTime == 0)||(isKeylongoutput&&!isKey2Pressing))
		if(HeatingKeepTime == 0)
		{
			msg = MSG_SMOKE_TIMEOUT;
		}
	}
}
*/
/*
void batDataPrc()
{
	if(!f_charging)
	{
		ChrgFullTimeCount = 0;
	 	return;
	}
//	if(!f_100ms_TimeOut)
//		return;
//	f_100ms_TimeOut = 0;
	
	u16 tmp_bat = 0;
	tmp_bat = adc_get(C_Quarter_VDD);
	if (getAbs(last_bat_data, tmp_bat) < AD_STABLE_RANGE_AA)
	{
		adc_stable_tk++;
		if (adc_stable_tk >= 3)
		{
			adc_stable_tk = 0;

			if (getAbs(bat_adc_data, tmp_bat) > ADC_VER2V_0P1V)
			{
				adc_stable_tk2++;
				if (adc_stable_tk2 > 5)
				{
					bat_adc_data = tmp_bat;
					if (bat_adc_data >= BAT_VOL4P20_ADC_VALUE)
					{
						if(!f_charge_full)
						{
							ChrgFullTimeCount++;
							if(ChrgFullTimeCount == 200)//达到阈值后继续统计
							{
								ChrgFullTimeCount = 0;
								f_charge_full = 1;
								msg = MSG_CHRG_FULL;
								//ChrgFullCount = 0;
								//SetLedColorNormallyOn(COLOR_GREEN);
							}
						}
					}
					else
					{
						ChrgFullTimeCount = 0;
					}
				}
			}
			else
			{
				adc_stable_tk2 = 0;
			}
		}
	}
	else
	{
		adc_stable_tk = 0;
	}
	last_bat_data = tmp_bat;
}
*/

void Get_Bat_ChrgBat_ADCValue(void)//获取充电时的电压
{
	u8 i;
	if(!f_charging)
	{
		ChrgFullTimeCount = 0;
	 	return;
	}
	if(!f_10ms_TimeOut)
		return;
	f_10ms_TimeOut = 0;
	//if(AdcChannelIndex != 1)
	{
	//	AdcChannelIndex = 1;
		ADMD &= 0xf0;
		ADMD |= C_Quarter_VDD;
		//延时等待稳定
		//delay(10);	
		ADC_Convert_Pre();
	}
	//每轮采集4次求平均值
//	PORTBbits.PB4 = 1;
//	PORTBbits.PB5 = 0;
	gAdcDataValue = 0;
	for(i = 0; i < 5; i++)
	{	
		ADMDbits.START = 1;
		F_wait_eoc();
		//while(ADMDbits.EOC == 0)
   		//	;
   		if(i > 0)
   		{
	   		TmpAdcDataValue = ADD;
	   		TmpAdcDataValue <<= 4;
	   		TmpAdcDataValue += (ADR & 0x0f);  		
	   		gAdcDataValue += TmpAdcDataValue;
   		}
	}
//	PORTBbits.PB4 = 0;
//	PORTBbits.PB5 = 1;

	//4.20V电压提示// 4.20V/4/2V*4096 = 2150.4
	//4.19V电压提示// 4.19V/4/2V*4096 = 2145.28
	//4.18V电压提示// 4.18V/4/2V*4096 = 2140.16
	//4.17V电压提示// 4.17V/4/2V*4096 = 2135.04
	//4.16V电压提示// 4.16V/4/2V*4096 = 2129.92
	//4.15V电压提示// 4.15V/4/2V*4096 = 2124.8

	gAdcDataValue >>= 2;
	if(Bat_check_cnt == 0)
	{
		Bat_adc_value = 0;
	}
	Bat_adc_value += gAdcDataValue;
	Bat_check_cnt++;
	if(Bat_check_cnt>= 4)
	{
		Bat_check_cnt = 0;
		Bat_adc_value = Bat_adc_value >> 2;
		/*
		if(Bat_adc_value >= BAT_VOL4P20_ADC_VALUE)
		{
			//TargetMotorDuty = HEAT_VOL4P20_DUTY;
			BatLowCount = 0;
		}
		else if(Bat_adc_value >= BAT_VOL4P16_ADC_VALUE)
		{
			//TargetMotorDuty = HEAT_VOL4P15_DUTY;
			//ChrgFullTimeCount = 0;
			BatLowCount = 0;
		}
		else if(Bat_adc_value >= BAT_VOL4P15_ADC_VALUE)
		{
			//TargetMotorDuty = HEAT_VOL4P15_DUTY;
			//ChrgFullTimeCount = 0;
			BatLowCount = 0;
		}
		else if(Bat_adc_value >= BAT_VOL4P10_ADC_VALUE)
		{
			//TargetMotorDuty = HEAT_VOL4P10_DUTY;
			//ChrgFullTimeCount = 0;
			BatLowCount = 0;
		}
		else if(Bat_adc_value >= BAT_VOL4P00_ADC_VALUE)
		{
			//TargetMotorDuty = HEAT_VOL4P00_DUTY;
			//ChrgFullTimeCount = 0;
			BatLowCount = 0;
		}
		else if(Bat_adc_value >= BAT_VOL3P90_ADC_VALUE)
		{
			//TargetMotorDuty = HEAT_VOL3P90_DUTY;
			//ChrgFullTimeCount = 0;
			BatLowCount = 0;
		}
		else if(Bat_adc_value >= BAT_VOL3P80_ADC_VALUE)
		{
			//TargetMotorDuty = HEAT_VOL3P80_DUTY;
			//ChrgFullTimeCount = 0;
			BatLowCount = 0;
		}
		else if(Bat_adc_value >= BAT_VOL3P70_ADC_VALUE)
		{
			//TargetMotorDuty = HEAT_VOL3P70_DUTY;
			//ChrgFullTimeCount = 0;
			BatLowCount = 0;
		}
		else if(Bat_adc_value > BAT_VOL3P60_ADC_VALUE)
		{
			//TargetMotorDuty = HEAT_VOL3P60_DUTY;
			//ChrgFullTimeCount = 0;
			BatLowCount = 0;
		}
		else if(Bat_adc_value > BAT_VOL3P45_ADC_VALUE)
		{
			BatLowCount = 0;
			//ChrgFullTimeCount = 0;
		}
		else
		{
			//TargetMotorDuty = HEAT_LESSTHAN_VOL3P60_DUTY;
			if(!f_charging)//在非充电过程中
			{
				if(f_battery_low == 0)
				{
					BatLowCount++;
					if(BatLowCount > 10)
					{
						BatLowCount = 0;
						f_battery_low = 1;
						msg = MSG_LVD;
					}
				}
			}
			else
			{
				BatLowCount = 0;
				f_battery_low = 0;
			}
		}*/
		//if(f_charging)//在充电过程中
		{
			if(Bat_adc_value >= BAT_VOL4P20_ADC_VALUE)//BAT_VOL4P17_ADC_VALUE达到了满电了
			{
				if(!f_charge_full)
				{
					ChrgFullTimeCount++;
					if(ChrgFullTimeCount == 20)//达到阈值后继续统计
					{
						ChrgFullTimeCount = 0;
						f_charge_full = 1;
						msg = MSG_CHRG_FULL;
					}
				}
			}
			else
			{
				
			}
		}
	}
}

#if 0
void Get_Onetime_Bat_ADCValue(void)//获取电池电压
{
	u8 i;
	//if(AdcChannelIndex != 1)
	{
	//	AdcChannelIndex = 1;
		ADMD &= 0xf0;
		ADMD |= C_Quarter_VDD;
		//延时等待稳定
		//delay(10);	
		ADC_Convert_Pre();
	}
	//每轮采集4次求平均值
//	PORTBbits.PB4 = 1;
//	PORTBbits.PB5 = 0;
	gAdcDataValue = 0;
	for(i = 0; i < 5; i++)
	{	
		ADMDbits.START = 1;
		F_wait_eoc();
   		if(i > 0)
   		{
	   		TmpAdcDataValue = ADD;
	   		TmpAdcDataValue <<= 4;
	   		TmpAdcDataValue += (ADR & 0x0f);  		
	   		gAdcDataValue += TmpAdcDataValue;
   		}
	}
//	PORTBbits.PB4 = 0;
//	PORTBbits.PB5 = 1;
/*
	//4.20V电压提示// 4.20V/4/2V*4096 = 2150.4
	//4.19V电压提示// 4.19V/4/2V*4096 = 2145.28
	//4.18V电压提示// 4.18V/4/2V*4096 = 2140.16
	//4.17V电压提示// 4.17V/4/2V*4096 = 2135.04
	//4.16V电压提示// 4.16V/4/2V*4096 = 2129.92
	//4.15V电压提示// 4.15V/4/2V*4096 = 2124.8
	
	//4.10V电压提示// 4.15V/4/2V*4096 = 2124.8
	//4.00V电压提示// 4.15V/4/2V*4096 = 2124.8
	
*/	
	gAdcDataValue >>= 2;
	if(gAdcDataValue >= BAT_VOL4P20_ADC_VALUE)
	{
		TargetMotorDuty = HEAT_VOL4P20_DUTY;
	}
	else if(gAdcDataValue >= BAT_VOL4P15_ADC_VALUE)
	{
		TargetMotorDuty = HEAT_VOL4P15_DUTY;
	}
	else if(gAdcDataValue >= BAT_VOL4P10_ADC_VALUE)
	{
		TargetMotorDuty = HEAT_VOL4P10_DUTY;
	}
	else if(gAdcDataValue >= BAT_VOL4P00_ADC_VALUE)
	{
		TargetMotorDuty = HEAT_VOL4P00_DUTY;
	}
	else if(gAdcDataValue >= BAT_VOL3P90_ADC_VALUE)
	{
		TargetMotorDuty = HEAT_VOL3P90_DUTY;
	}
	else if(gAdcDataValue >= BAT_VOL3P80_ADC_VALUE)
	{
		TargetMotorDuty = HEAT_VOL3P80_DUTY;
	}
	else if(gAdcDataValue >= BAT_VOL3P70_ADC_VALUE)
	{
		TargetMotorDuty = HEAT_VOL3P70_DUTY;
	}
	else if(gAdcDataValue > BAT_VOL3P60_ADC_VALUE)
	{
		TargetMotorDuty = HEAT_VOL3P60_DUTY;
	}
	else if(gAdcDataValue > BAT_VOL3P20_ADC_VALUE)
	{
		TargetMotorDuty = HEAT_VOL3P50_DUTY;
	}
	else//小于等于3.2V
	{
		TargetMotorDuty = HEAT_LESSTHAN_VOL3P50_DUTY;
		f_battery_low = 1;
		/*if(gAdcDataValue <= BAT_VOL3P45_ADC_VALUE)
		{
			if(!f_charging)
			{
				f_battery_low = 1;
			}
		}*/
	}
}
#endif

void BaseBatSetPWMValue(void)//根据电量设置PWM输出
{
	if(gAdcDataValueBak >= BAT_VOL4P18_ADC_VALUE)//BAT_VOL4P20_ADC_VALUE
	{
		if(SmokingKeepTime)//3.9v/4.2v = 0.928
			TargetMotorDuty = 66;//
		else//3.4v/4.2v = 0.81
			TargetMotorDuty = 57;//57;//42;//43;//
	}
	else if(gAdcDataValueBak >= BAT_VOL4P08_ADC_VALUE)
	{
		if(SmokingKeepTime)//3.9v/4.2v = 0.928
			TargetMotorDuty = 66;//
		else//3.4v/4.2v = 0.81
			TargetMotorDuty = 59;//59;//57;//42;//43;//
	}
	else if(gAdcDataValueBak >= BAT_VOL3P98_ADC_VALUE)
	{
		if(SmokingKeepTime)//3.9v/4.2v = 0.928
			TargetMotorDuty = 69;//
		else//3.4v/4.2v = 0.81
			TargetMotorDuty = 63;//61;//62;//43;//45;//
	}
	else if(gAdcDataValueBak >= BAT_VOL3P88_ADC_VALUE)
	{
		if(SmokingKeepTime)//3.9v/4.2v = 0.928
			TargetMotorDuty = DUTY_ALL;//
		else//3.4v/4.2v = 0.81
			TargetMotorDuty = 68;//49;//48;//46;//
	}
	#if 0
	else if(gAdcDataValueBak >= BAT_VOL3P80_ADC_VALUE)
	{
		if(SmokingKeepTime)//3.9v/4.2v = 0.928
			TargetMotorDuty = DUTY_ALL;//
		else//
			TargetMotorDuty = 47;//
	}
	else if(gAdcDataValueBak >= BAT_VOL3P70_ADC_VALUE)
	{
		if(SmokingKeepTime)//3.9v/4.2v = 0.928
			TargetMotorDuty = DUTY_ALL;//
		else//
			TargetMotorDuty = 48;//
	}
	else if(gAdcDataValueBak > BAT_VOL3P60_ADC_VALUE)
	{
		if(SmokingKeepTime)//3.9v/4.2v = 0.928
			TargetMotorDuty = DUTY_ALL;//
		else//
			TargetMotorDuty = 49;//
	}
	#endif
	else //if(gAdcDataValueBak > BAT_VOL3P50_ADC_VALUE)
	{
		TargetMotorDuty = DUTY_ALL;//
	}
	#if 0
	else if(gAdcDataValueBak > BAT_VOL3P40_ADC_VALUE)
	{
		TargetMotorDuty = 99;//全开
	}
	else if(gAdcDataValueBak > BAT_VOL3P30_ADC_VALUE)
	{
		TargetMotorDuty = 99;//全开
	}
	else if(gAdcDataValueBak > BAT_VOL3P20_ADC_VALUE)
	{
		TargetMotorDuty = 99;//全开
	}
	else//小于等于3.2V
	{
		TargetMotorDuty = 99;//全开
		//f_battery_low = 1;
	}
	#endif
}
/*
void JudgeSmokingLightCountTimeoutOrNot(void)//判断吸烟灯光开关计时是否超时
{
	if(HeatPlugInsert_flag)
	{
		HeatPlugInsertTimeCount++;
		if(HeatPlugInsertTimeCount > 14)//250ms*12 = 3000ms(3秒时间到了，判断)
		{
			HeatPlugInsertTimeCount = 0;
			if(HeatCount < 3)
			{
				HeatPlugInsert_flag = 0;
				HeatCount = 0;
			}	
		}
	}
}
*/
void HeaterExistdetect(void)//加热丝插拔检测
{
	if((nowLedMode == 1)||b_smoke_init||b_smoking||(IN_MIC == 1)||b_heater_detect_mask)//在加热时不检测发热丝的插拔
		return;
	C_ADC_OFF2;
	PACON = 0;//C_PA0_AIN0;
	if(f_heat_check)//10ms
	{
		f_heat_check = 0;
		if(C_IO_HEATER_CHECK_DEC == 0)//发热丝是否存在检测
		{
			Heat_On_time_count = 0;
			if(!b_heater_exist_flag)
			{
				Heat_Off_time_count++;
				if(Heat_Off_time_count > 5)//70 Chrg_Off_time_count*10ms
				{
					Heat_Off_time_count = 0;
					b_heater_exist_flag = 1;
					msg = MSG_INSERT_HEATER;//插入发热丝
				}
			}
			
		}
		else
		{
			Heat_Off_time_count = 0;
			if(b_heater_exist_flag)
			{
				//sleepCnt = 0;
				Heat_On_time_count++;
				if(Heat_On_time_count > 5)//70 Chrg_On_time_count*10ms
				{
					Heat_On_time_count = 0;
					b_heater_exist_flag = 0;
					msg = MSG_PULLOUT_HEATER; //拔出发热丝
				}
			}			
		}
	}
	if((b_heater_exist_flag&&C_IO_HEATER_CHECK_DEC)||(!b_heater_exist_flag&&!C_IO_HEATER_CHECK_DEC))//主要是在检测过程中不能中途进入睡眠中
	{
		b_heater_exist_check = 1;
	}
	else
	{
		b_heater_exist_check = 0;
	}
	C_ADC_ON2;
	PACON = C_PA0_AIN0;
}

void charge_check_by_IO(void)//充电检测
{
	if((nowLedMode == 1)||b_pause_chrg)//吸烟时不检测USB插拔和充满检测
		return;
	if(f_charge_check)//10ms
	{
		f_charge_check = 0;
		if(C_IO_USB_DEC)//USB检测
		{
			if(!f_charging)
			{
				if(Chrg_On_time_count < 20)
				{
					Chrg_On_time_count++;
				}
				else
				{
					//f_charging = 1;
					ChrgFullTimeCount = 0;
					msg = MSG_CHRG;//插入USB充电
				}
			}
			
		}
		else
		{
			if(f_charging)
			{
				if(Chrg_On_time_count > 0)
				{
					Chrg_On_time_count--;
				}
				else
				{
					//f_charging = 0;
					msg = MSG_CHRG_OFF; //拔出USB
				}
			}			
		}
		#if 0
		if(f_charging)
		{
			if(C_IO_CHRG)//充电检测
			{
				if(!f_charge_full)
				{
					if(ChrgFullTimeCount < 30)//80
					{
						ChrgFullTimeCount++;
					}
					else
					{
						//ChrgFullTimeCount = 0;
						//f_charge_full = 1;
						msg = MSG_CHRG_FULL; //充满电
					}
				}
			}
			else
			{
				if(ChrgFullTimeCount > 0)
				{
					ChrgFullTimeCount--;
				}
				else
				{
					if(f_charge_full)
					{
						f_charge_full = 0;
						msg = MSG_CHRG;//插入USB充电
					}
				}
				
			}
		}
		else
		{
			ChrgFullTimeCount = 0;
		}
		#endif
	}
}

void bat_lvd_check(void)//只在吸烟中检测(吸烟中：电量低于2.9V（±0.1V），停止输出，红灯闪5次)
{	
	if(SmokeState != STATE_SMOKING)
		return;
	if(!f_bat_lvd_check)
		return;
	f_bat_lvd_check = 0;	
	if(PCON1&C_LVDOUT)
	{
		/*if(b_batteryLow_flag != 0)
		{
			battery_low_cnt++;
			if(battery_low_cnt > 254)//200ms
			{
				b_batteryLow_flag = 0;
				battery_low_cnt = 0;
			}
		}
		else
		{
			battery_low_cnt = 0;
			b_batteryLow_flag = 0;
		}*/
		battery_low_cnt = 0;
	}
	else
	{
		battery_low_cnt++;
		if(battery_low_cnt > 50)//500ms
		{
			battery_low_cnt = 0;
			//if(!b_batteryLow_flag)
			//{
			//	b_batteryLow_flag = 1;
			//	key = MSG_LVD;
			//}
			I0_PWM2 = MT_OF;
			percent_nun = 0;
			msg = MSG_LVD;
		}
	}
	
}
/*
void Detect_OverCurrent_ByIO(void)//通过IO检测来检测是否过流
{
	if(C_IO_OVERCURRENT_CHECK_DEC&&b_smoking)//
	{
		//if(b_OC_100us_TimeOut)//100us
		{
		//	b_OC_100us_TimeOut = 0;
			OverCurrentCount++;
			if(OverCurrentCount > 1)
			{
				OverCurrentCount = 0;
				b_smoking = 0;
				PWM2DUTY = 0;//
				msg = MSG_CURRENT_OVER;
			}
		}
		
	}
	else
	{
		OverCurrentCount = 0;
	}
}
*/
//==============================================================================
//	Function: SmokeFun
//		Input: None
//		Output: None
//==============================================================================
void SmokeFun(void)
{
	switch(SmokeState)
	{
		case STATE_SMOKE_IDLE:
			if(b_pause_chrg)
			{
				b_pause_chrg = 0;
				EN_RESUME_CHRG;//充电状态下吸烟停止时恢复充电电流
			}
			if(b_smoking)
			 	break;
			if(f_charging)
			{
				f_battery_low = 0;
				//if(f_charge_full||overvoltage_flag)
				if(f_charge_full)
				{
					break;
				}
				if(f_1s_chrg_TimeOut)//100ms
				{
					f_1s_chrg_TimeOut = 0;
					if(now_ch != Quarter_VDD)
					{
						adc_init4(ADC_CHANNEL2);
					}
					gAdcDataValueBak = adc_get(C_Quarter_VDD);
					//gAdcDataValueBak = gAdcDataValueBak + 20;
					if(gAdcDataValueBak >= BAT_VOL4P12_ADC_VALUE)//BAT_VOL4P18_ADC_VALUE
					{
						usb_check_ad_time_cnt = 0;
						ChrgFullTimeCount++;
						if(ChrgFullTimeCount >= 20)//达到阈值后继续统计
						{
							ChrgFullTimeCount = 0;
							f_charge_full = 1;
							msg = MSG_CHRG_FULL;
						}
					}
					else
					{
						ChrgFullTimeCount = 0;
						usb_check_ad_time_cnt++;
						if(usb_check_ad_time_cnt > 20)
						{
							usb_check_ad_time_cnt = 0;
							if(f_charge_full)
							{
								f_charge_full = 0;
								msg = MSG_CHRG;//插入USB充电
							}
						}
					}
					
				}
			}
			break;
			
		case STATE_SMOKE_INIT://AD检测配置
			b_heater_detect_mask = 1;
			//adc2_init();
			adc_init4(Quarter_VDD);
			SmokeState = STATE_SMOKE_CHECK_BAT_LOW;
			break;
			
		case STATE_SMOKE_CHECK_BAT_LOW://吸烟前检测电池电量(吸烟前：电量低于3.2V（±0.1V），停止输出，红灯闪5次)
			if(disp_delay_time_cnt < 20)
			{
				gAdcDataValueBak = adc_get(C_Quarter_VDD);
				gAdcDataValueBak = gAdcDataValueBak + 20;
			}
			if(f_charging)
			{
				SmokeState = STATE_SMOKE_CHECK_OC;
				break;
			}
			//b_heater_detect_mask = 0;
			//gAdcDataValueBak = BAT_VOL3P20_ADC_VALUE - 200;//for test
			//if(b_get_adc_result)
			{
				if((gAdcDataValueBak < BAT_VOL3P45_ADC_VALUE)||f_battery_low)//BAT_VOL3P40_ADC_VALUE
				{
					//f_battery_low = 1;
					msg = MSG_LVD;
					//SetLedFlashParameters(COLOR_BLUE,20,25,2);//电池电压低于3.2V时候吸烟不输出，红灯闪烁5次，停止输出
					b_smoke_init = 0;
				}
				else
				{
					//adc_init4(ADC_CHANNEL);
					SmokeState = STATE_SMOKE_CHECK_OC;
					//SmokeState = STATE_SMOKE_PARAM_SET;
					
				}
			}
			break;
	
		case STATE_SMOKE_CHECK_OC://吸烟前检测发热丝是否开路
			b_heater_detect_mask = 1;
			gAdcDataValue = adc_get(C_ADC_PA0);
			b_heater_detect_mask = 0;
			//if(b_get_adc_result)
			{
				// if(gAdcDataValue >= 3000)//4000
				// {
				// 	//SetLedFlashParameters(COLOR_GREEN,2,25,2);//吸烟中或前发热丝开路，短路，红灯快闪2次
				// 	//SetLedFlashParameters(COLOR_RED,6,20,2);//吸烟中或前发热丝开路，短路，红灯闪3次
				// 	msg = MSG_CURRENT_OVER;
				// 	b_smoke_init = 0;
				// }
				// else
				{
					SmokeState = STATE_SMOKE_PARAM_SET;
				}
				
			}
			
			break;
		

		case STATE_SMOKE_PARAM_SET://吸烟前参数设置(灯显方式，根据电压设置PWM参数，短路保护参数)
			//adc3_init();
			//adc_get(ADC_CHANNEL);
			adc_init4(ADC_CHANNEL2);
			adc_get(C_ADC_PA0);
			b_smoke_init = 0;//初始化结束	
			b_smoking = 1;//设置吸烟开始标志
			//LedShowKeepTime = 960;////默认吸烟时间为10S，达到时关闭输出，蓝灯闪3次(单位10ms)
			LedShowKeepTime = 795;//765//720;//760;////默认吸烟时间为10S，达到时关闭输出，蓝灯闪3次(单位10ms)
			SmokingKeepTime = 245;//单位1ms 吸烟时长，主要是为了处理在吸烟前0.3秒是否需要全功率输出的问题
			BaseBatSetPWMValue();
			//SetLedBreathingParameters();//开始呼吸效果
			// SetLedBreathingParameters2(COLOR_GREEN);//开始白灯呼吸效果
			// LedOff();	
			PwmCycleCount = 0;
			if(f_charging||(C_IO_CHRG == 0)||C_IO_USB_DEC)
			{
				b_pause_chrg = 1;
				EN_PAUSE_CHRG;//充电状态下吸烟时临时关闭充电电流
			}
			//PORTAbits.PA6 = 1;//for test
			SmokeState = STATE_SMOKING;
			//输出前0.3S为全功率输出(当电池电压高于3.9V时，输出提升为恒有效3.9V，电池电压低于3.9V，全功率输出) 后转为恒RMS3.4V
			if(gAdcDataValueBak >= BAT_VOL3P90_ADC_VALUE)
			{
				percent_nun = TargetMotorDuty;
			}
			else
			{
				percent_nun = DUTY_ALL;
			}
			temp_flag = 0;
			break;
			
		case STATE_SMOKING:
			if(b_smoking)
			{
				if((SmokingKeepTime == 0)&&!temp_flag)
				{
					//PORTAbits.PA6 = 0;//for test
					temp_flag = 1;
					BaseBatSetPWMValue();
					percent_nun = TargetMotorDuty;
				}
			}
			led_mode_set(2);
			break;

	}
}



