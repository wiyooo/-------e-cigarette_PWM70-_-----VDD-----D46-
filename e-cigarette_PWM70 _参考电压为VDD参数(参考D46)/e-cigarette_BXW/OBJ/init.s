;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"init.c"
	list	p=NY8B062F,c=on
	#include "ny8b062f.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_led_dis_loop_func
	extern	_led_mode_set
	extern	_charge_check_by_IO
	extern	_ledRun
	extern	_Detect_OverCurrent_ByAD
	extern	_BaseBatSetPWMValue
	extern	_ADC_Convert_Pre
	extern	_Get_Onetime_Bat_ADCValue
	extern	_Ledbreathing
	extern	_LedOff
	extern	_SetLedColorNormallyOn
	extern	_SetLedBreathingParameters2
	extern	_SetLedBreathingParameters
	extern	_SetLedFlashParameters
	extern	_adc_get
	extern	_F_wait_eoc
	extern	_Delay_N1ms_16bit
	extern	_delay
	extern	_sleep_handle
	extern	_sleep_param_init
	extern	_led_handle
	extern	_led_param_init
	extern	_bat_lvd_check
	extern	_battery_check
	extern	_battery_param_init
	extern	_SmokeFun
	extern	_detect_param_init
	extern	_msg_handle
	extern	_MicScan
	extern	_KeyScan
	extern	_key_param_init
	extern	_isr_param_init
	extern	_common_param_init
	extern	_clear_ram
	extern	_multi_16b
	extern	_T0MD
	extern	_PCON1
	extern	_CMPCR
	extern	_BODCON
	extern	_PS0CV
	extern	_APHCON
	extern	_IOSTB
	extern	_IOSTA
	extern	_PWM4DUTY
	extern	_P4CR1
	extern	_BZ3CR
	extern	_PS3CV
	extern	_PWM3DUTY
	extern	_T3CR2
	extern	_T3CR1
	extern	_TMR3
	extern	_OSCCR
	extern	_BZ2CR
	extern	_PS2CV
	extern	_PWM2DUTY
	extern	_T2CR2
	extern	_T2CR1
	extern	_TMR2
	extern	_TBHD
	extern	_TBHP
	extern	_IRCR
	extern	_BZ1CR
	extern	_PS1CV
	extern	_PWM1DUTY
	extern	_T1CR2
	extern	_T1CR1
	extern	_TMR1
	extern	_ADD
	extern	_PCHBUF
	extern	_STATUS
	extern	_PCL
	extern	_TMR0
	extern	_disp_delay_time_cnt
	extern	_usb_check_ad_time_cnt
	extern	_now_ch
	extern	_temptimecount
	extern	_sleep_delay_keep_time
	extern	_running_keep_time
	extern	_battery_low_cnt
	extern	_usb_flag
	extern	_HeatPlugInsert_flag
	extern	_HeatPlugInsertTimeCount
	extern	_HeatCount
	extern	_SmokingKeepTime
	extern	_HeatingKeepTime
	extern	_KeyDowmTimeCount
	extern	_VolTypeIndex
	extern	_SmokeState
	extern	_BatVolLevel
	extern	_led_mode_flag
	extern	_SaveHeaterIOStatus
	extern	_MotorDutySet
	extern	_NowMotorDuty
	extern	_TargetMotorDuty
	extern	_gAdcDataValue
	extern	_OverCurrent_adc_value
	extern	_OverCurrent_check_cnt
	extern	_BuleLed_delay_keep_time
	extern	_OverCurrentCount
	extern	_OverCurrentDelayTime
	extern	_led_delay_keep_time
	extern	_led_flash_count
	extern	_led_flash_flag
	extern	_percent_nun
	extern	_PwmCycleCount
	extern	_sleepCnt
	extern	_Led_Breathe_count
	extern	_LedShowKeepTime
	extern	_LedShowStep
	extern	_GroupColourIndex
	extern	_ledRunStarStep
	extern	_ledRunStep
	extern	_nowLedMode
	extern	_CodeSwitchIndex
	extern	_msg
	extern	_INTE2bits
	extern	_TM3RHbits
	extern	_RFCbits
	extern	_ANAENbits
	extern	_TMRHbits
	extern	_INTEDGbits
	extern	_ADJMDbits
	extern	_PACONbits
	extern	_AWUCONbits
	extern	_ADCRbits
	extern	_ADVREFHbits
	extern	_ADRbits
	extern	_ADMDbits
	extern	_INTFbits
	extern	_INTEbits
	extern	_BPHCONbits
	extern	_ABPLCONbits
	extern	_BWUCONbits
	extern	_PCONbits
	extern	_PORTBbits
	extern	_PORTAbits

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_Set_ADVREFH_2V
	extern	_Set_ADVREFH_5V
	extern	_sys_flag_3
	extern	_sys_flag_2
	extern	_sys_flag_1
	extern	_sys_flag_0
	extern	_INTE2
	extern	_TM3RH
	extern	_RFC
	extern	_ANAEN
	extern	_TMRH
	extern	_INTEDG
	extern	_ADJMD
	extern	_PACON
	extern	_AWUCON
	extern	_ADCR
	extern	_ADVREFH
	extern	_ADR
	extern	_ADMD
	extern	_INTF
	extern	_INTE
	extern	_BPHCON
	extern	_ABPLCON
	extern	_BWUCON
	extern	_PCON
	extern	_PORTB
	extern	_PORTA
	extern	_system_init
	extern	_sleep_init
	extern	_gpio_init
	extern	_timer0_init
	extern	_timer1_init
	extern	_pwm1_init
	extern	_pwm2_init
	extern	_pwm3_init
	extern	_adc_init
	extern	_adc2_init
	extern	_adc3_init
	extern	_adc_init4
	extern	_wdt_init
	extern	_lvd_init
	extern	_lvr_init
	extern	_isr_init

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1007:
	.res	1
.segment "uninit"
r0x1006:
	.res	1
.segment "uninit"
r0x1005:
	.res	1
.segment "uninit"
r0x1004:
	.res	1
.segment "uninit"
r0x1003:
	.res	1
.segment "uninit"
r0x1002:
	.res	1
.segment "uninit"
r0x1001:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
; code_init	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=init, function=_isr_init
	.debuginfo subprogram _isr_init
_isr_init:
; 2 exit points
	.line	830, "init.c"; 	INTEDG = 0x05;//
	MOVIA	0x05
	MOVAR	_INTEDG
	.line	831, "init.c"; 	INTE = 0x03|C_INT_TMR1;//|C_INT_WDT;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	834, "init.c"; 	INTE2 = 0x00;
	CLRR	_INTE2
	.line	835, "init.c"; 	INTF = 0x00;
	CLRR	_INTF
	.line	836, "init.c"; 	}
	RETURN	
; exit point of _isr_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=init, function=_lvr_init
	.debuginfo subprogram _lvr_init
_lvr_init:
; 2 exit points
	.line	819, "init.c"; 	PCONbits.LVREN = 1;	
	BSR	_PCONbits,3
	.line	820, "init.c"; 	}
	RETURN	
; exit point of _lvr_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1001
;; Starting pCode block
.segment "code"; module=init, function=_lvd_init
	.debuginfo subprogram _lvd_init
_lvd_init:
; 2 exit points
	.line	807, "init.c"; 	PCON |= C_LVD_En;						// 使能LVD功能
	BSR	_PCON,5
	.line	808, "init.c"; 	PCON1 &= 0xe3;							// 1110 0011
	IOSTR	_PCON1
	BANKSEL	r0x1001
	MOVAR	r0x1001
	MOVIA	0xe3
	ANDAR	r0x1001,F
	MOVR	r0x1001,W
	IOST	_PCON1
	.line	809, "init.c"; 	PCON1 |= C_LVD_3P3V;					//		
	IOSTR	_PCON1
	MOVAR	r0x1001
	MOVIA	0x14
	IORAR	r0x1001,F
	MOVR	r0x1001,W
	IOST	_PCON1
	.line	810, "init.c"; 	}
	RETURN	
; exit point of _lvd_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=init, function=_wdt_init
	.debuginfo subprogram _wdt_init
_wdt_init:
; 2 exit points
	.line	796, "init.c"; 	PCONbits.WDTEN = 1;			//250ms reset.
	BSR	_PCONbits,7
	.line	797, "init.c"; 	}
	RETURN	
; exit point of _wdt_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=init, function=_Set_ADVREFH_2V
	.debuginfo subprogram _Set_ADVREFH_2V
_Set_ADVREFH_2V:
; 2 exit points
	.line	782, "init.c"; 	ADVREFH = C_Vrefh_2V;	//参考电压;	//2v
	CLRR	_ADVREFH
	.line	783, "init.c"; 	delay(50);
	MOVIA	0x32
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	786, "init.c"; 	}
	RETURN	
; exit point of _Set_ADVREFH_2V

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=init, function=_Set_ADVREFH_5V
	.debuginfo subprogram _Set_ADVREFH_5V
_Set_ADVREFH_5V:
; 2 exit points
	.line	772, "init.c"; 	ADVREFH = C_Vrefh_VDD;	//参考电压;	//2v
	MOVIA	0x03
	MOVAR	_ADVREFH
	.line	773, "init.c"; 	delay(50);
	MOVIA	0x32
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	776, "init.c"; 	}
	RETURN	
; exit point of _Set_ADVREFH_5V

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1002
;; Starting pCode block
.segment "code"; module=init, function=_adc_init4
	.debuginfo subprogram _adc_init4
;local variable name mapping:
	.debuginfo complex-type (local-sym "_ch" 1 "init.c" 689 (basetype 1 unsigned) split "r0x1002")
	.debuginfo complex-type (local-sym "_i" 1 "init.c" 691 (basetype 1 unsigned) split "r0x1002")
_adc_init4:
; 2 exit points
	.line	689, "init.c"; 	void adc_init4(u8 ch)//
	BANKSEL	r0x1002
	MOVAR	r0x1002
	.line	692, "init.c"; 	now_ch = ch;
	BANKSEL	_now_ch
	MOVAR	_now_ch
	.line	693, "init.c"; 	PACON = C_PA0_AIN0;//通道设置
	MOVIA	0x01
	MOVAR	_PACON
	.line	694, "init.c"; 	if(ch == Quarter_VDD)
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02067_DS_
	.line	696, "init.c"; 	ADVREFH = C_Vrefh_2V;	//参考电压
	CLRR	_ADVREFH
	.line	697, "init.c"; 	ADR	 = C_Ckl_Div8;	//时钟分频
	MOVIA	0x10
	MOVAR	_ADR
	.line	700, "init.c"; 	ADCR  = C_Sample_1clk | C_12BIT;//采样频率和采样位数
	MOVIA	0x03
	MOVAR	_ADCR
	.line	702, "init.c"; 	ADMD  = C_ADC_En | C_ADC_CH_En |C_Quarter_VDD;//C_ADC_CH_Dis
	MOVIA	0x9b
	MOVAR	_ADMD
	MGOTO	_02068_DS_
_02067_DS_:
	.line	704, "init.c"; 	else if(ch == ADC_CHANNEL)
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02064_DS_
	.line	706, "init.c"; 	ADVREFH = C_Vrefh_3V;	//参考电压
	MOVIA	0x01
	MOVAR	_ADVREFH
	.line	707, "init.c"; 	ADR	 = C_Ckl_Div8;	//时钟分频
	MOVIA	0x10
	MOVAR	_ADR
	.line	710, "init.c"; 	ADCR  = C_Sample_1clk | C_12BIT;//采样频率和采样位数
	MOVIA	0x03
	MOVAR	_ADCR
	.line	712, "init.c"; 	ADMD  = C_ADC_En | C_ADC_CH_En |C_ADC_PA0;//C_ADC_CH_Dis
	MOVIA	0x90
	MOVAR	_ADMD
	MGOTO	_02068_DS_
_02064_DS_:
	.line	714, "init.c"; 	else if(ch == ADC_CHANNEL2)
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_02068_DS_
	.line	718, "init.c"; 	ADVREFH = C_Vrefh_VDD;	//参考电压
	MOVIA	0x03
	MOVAR	_ADVREFH
	.line	720, "init.c"; 	ADR	 = C_Ckl_Div2;	//时钟分频
	MOVIA	0x30
	MOVAR	_ADR
	.line	722, "init.c"; 	ADCR  = C_Sample_8clk | C_12BIT;//采样频率和采样位数
	MOVIA	0x0f
	MOVAR	_ADCR
	.line	726, "init.c"; 	ADMD  = C_ADC_En | C_ADC_CH_En |C_ADC_PA0;//C_ADC_CH_Dis
	MOVIA	0x90
	MOVAR	_ADMD
_02068_DS_:
	.line	731, "init.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	732, "init.c"; 	ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
	BCR	_ADRbits,7
	.line	733, "init.c"; 	ADRbits.ADIE = 0;						// Enable adc interrupt bit
	BCR	_ADRbits,6
	.line	734, "init.c"; 	for(i=1;i<= 50;i++)
	MOVIA	0x32
	BANKSEL	r0x1002
	MOVAR	r0x1002
_02072_DS_:
	BANKSEL	r0x1002
	DECRSZ	r0x1002,F
	MGOTO	_02072_DS_
	.line	736, "init.c"; 	ADMDbits.START = 0;	 
	BCR	_ADMDbits,6
	.line	738, "init.c"; 	}
	RETURN	
; exit point of _adc_init4

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1003
;; Starting pCode block
.segment "code"; module=init, function=_adc3_init
	.debuginfo subprogram _adc3_init
;local variable name mapping:
	.debuginfo complex-type (local-sym "_i" 1 "init.c" 657 (basetype 1 unsigned) split "r0x1003")
_adc3_init:
; 2 exit points
	.line	668, "init.c"; 	ADVREFH = C_Vrefh_3V;	//参考电压
	MOVIA	0x01
	MOVAR	_ADVREFH
	.line	671, "init.c"; 	ADR	 = C_Ckl_Div2;	//时钟分频
	MOVIA	0x30
	MOVAR	_ADR
	.line	675, "init.c"; 	ADCR  = C_Sample_2clk | C_12BIT;//采样频率和采样位数
	MOVIA	0x07
	MOVAR	_ADCR
	.line	676, "init.c"; 	PACON = C_PA0_AIN0;//通道设置
	MOVIA	0x01
	MOVAR	_PACON
	.line	677, "init.c"; 	ADMD  = C_ADC_En | C_ADC_CH_En |C_ADC_PA0;//C_ADC_CH_Dis
	MOVIA	0x90
	MOVAR	_ADMD
	.line	678, "init.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	679, "init.c"; 	ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
	BCR	_ADRbits,7
	.line	680, "init.c"; 	ADRbits.ADIE = 0;						// Enable adc interrupt bit
	BCR	_ADRbits,6
	.line	683, "init.c"; 	for(i=1;i<= 50;i++)
	MOVIA	0x32
	BANKSEL	r0x1003
	MOVAR	r0x1003
_02056_DS_:
	BANKSEL	r0x1003
	DECRSZ	r0x1003,F
	MGOTO	_02056_DS_
	.line	685, "init.c"; 	ADMDbits.START = 0;	  
	BCR	_ADMDbits,6
	.line	686, "init.c"; 	CLRWDT();
	clrwdt
	.line	687, "init.c"; 	}
	RETURN	
; exit point of _adc3_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1004
;; Starting pCode block
.segment "code"; module=init, function=_adc2_init
	.debuginfo subprogram _adc2_init
;local variable name mapping:
	.debuginfo complex-type (local-sym "_i" 1 "init.c" 629 (basetype 1 unsigned) split "r0x1004")
_adc2_init:
; 2 exit points
	.line	639, "init.c"; 	ADVREFH = C_Vrefh_2V;	//参考电压
	CLRR	_ADVREFH
	.line	640, "init.c"; 	ADR	 = C_Ckl_Div8;	//时钟分频
	MOVIA	0x10
	MOVAR	_ADR
	.line	641, "init.c"; 	ADCR  = C_Sample_8clk | C_12BIT;//采样频率和采样位数
	MOVIA	0x0f
	MOVAR	_ADCR
	.line	642, "init.c"; 	PACON = C_PA0_AIN0;//通道设置
	MOVIA	0x01
	MOVAR	_PACON
	.line	643, "init.c"; 	ADMD  = C_ADC_En | C_ADC_CH_En |C_Quarter_VDD;//C_ADC_CH_Dis
	MOVIA	0x9b
	MOVAR	_ADMD
	.line	644, "init.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	645, "init.c"; 	ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
	BCR	_ADRbits,7
	.line	646, "init.c"; 	ADRbits.ADIE = 0;						// Enable adc interrupt bit
	BCR	_ADRbits,6
	.line	649, "init.c"; 	for(i=1;i<= 50;i++)
	MOVIA	0x32
	BANKSEL	r0x1004
	MOVAR	r0x1004
_02048_DS_:
	BANKSEL	r0x1004
	DECRSZ	r0x1004,F
	MGOTO	_02048_DS_
	.line	651, "init.c"; 	ADMDbits.START = 0;	 
	BCR	_ADMDbits,6
	.line	652, "init.c"; 	CLRWDT();
	clrwdt
	.line	653, "init.c"; 	}
	RETURN	
; exit point of _adc2_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1005
;; Starting pCode block
.segment "code"; module=init, function=_adc_init
	.debuginfo subprogram _adc_init
;local variable name mapping:
	.debuginfo complex-type (local-sym "_i" 1 "init.c" 598 (basetype 1 unsigned) split "r0x1005")
_adc_init:
; 2 exit points
	.line	609, "init.c"; 	ADVREFH = C_Vrefh_VDD;	//参考电压
	MOVIA	0x03
	MOVAR	_ADVREFH
	.line	611, "init.c"; 	ADR	 = C_Ckl_Div2;	//时钟分频
	MOVIA	0x30
	MOVAR	_ADR
	.line	612, "init.c"; 	ADCR  = C_Sample_8clk | C_12BIT;//采样频率和采样位数
	MOVIA	0x0f
	MOVAR	_ADCR
	.line	614, "init.c"; 	PACON = C_PA0_AIN0;//通道设置
	MOVIA	0x01
	MOVAR	_PACON
	.line	615, "init.c"; 	ADMD  = C_ADC_En | C_ADC_CH_En |C_ADC_PA0;//C_ADC_CH_Dis
	MOVIA	0x90
	MOVAR	_ADMD
	.line	616, "init.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	617, "init.c"; 	ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
	BCR	_ADRbits,7
	.line	618, "init.c"; 	ADRbits.ADIE = 0;						// Enable adc interrupt bit
	BCR	_ADRbits,6
	.line	621, "init.c"; 	for(i=1;i<= 50;i++)
	MOVIA	0x32
	BANKSEL	r0x1005
	MOVAR	r0x1005
_02040_DS_:
	BANKSEL	r0x1005
	DECRSZ	r0x1005,F
	MGOTO	_02040_DS_
	.line	623, "init.c"; 	ADMDbits.START = 0;	  
	BCR	_ADMDbits,6
	.line	624, "init.c"; 	CLRWDT();
	clrwdt
	.line	625, "init.c"; 	}
	RETURN	
; exit point of _adc_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=init, function=_pwm3_init
	.debuginfo subprogram _pwm3_init
_pwm3_init:
; 2 exit points
	.line	567, "init.c"; 	T3CR1 = C_PWM3_Active_Hi|C_TMR3_Reload|C_TMR3_En;
	MOVIA	0x03
	SFUN	_T3CR1
	.line	576, "init.c"; 	T3CR2 = C_TMR3_ClkSrc_Inst|C_TMR3_ExtRising|C_PS3_EN|C_PS3_Div32;//0x08;
	MOVIA	0x04
	SFUN	_T3CR2
	.line	579, "init.c"; 	TM3RH = 0x00;
	CLRR	_TM3RH
	.line	584, "init.c"; 	TMR3 = 45;
	MOVIA	0x2d
	SFUN	_TMR3
	.line	587, "init.c"; 	PWM3DUTY = 23;//11;//23;	// = PWM3DUTY = TMR3*50% = 45*50% = 23
	MOVIA	0x17
	SFUN	_PWM3DUTY
	.line	588, "init.c"; 	}
	RETURN	
; exit point of _pwm3_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=init, function=_pwm2_init
	.debuginfo subprogram _pwm2_init
_pwm2_init:
; 2 exit points
	.line	469, "init.c"; 	T2CR1 = 0x82;
	MOVIA	0x82
	SFUN	_T2CR1
	.line	480, "init.c"; 	T2CR1 = C_PWM2_En|C_PWM2_Active_Lo|C_TMR2_Reload|C_TMR2_En;//0x83;	
	MOVIA	0xc3
	SFUN	_T2CR1
	.line	491, "init.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst|C_TMR2_ExtRising|C_PS2_EN|C_PS2_Div2;//0x08;
	CLRA	
	SFUN	_T2CR2
	.line	496, "init.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	502, "init.c"; 	TMR2 = 99;
	MOVIA	0x63
	SFUN	_TMR2
	.line	505, "init.c"; 	PWM2DUTY = 0;
	CLRA	
	SFUN	_PWM2DUTY
	.line	506, "init.c"; 	}
	RETURN	
; exit point of _pwm2_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=init, function=_pwm1_init
	.debuginfo subprogram _pwm1_init
_pwm1_init:
; 2 exit points
	.line	402, "init.c"; 	T1CR1 = C_PWM1_En|C_PWM1_Active_Lo|C_TMR1_Reload|C_TMR1_En;//0x83;	
	MOVIA	0xc3
	SFUN	_T1CR1
	.line	412, "init.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst|C_TMR1_ExtRising|C_PS1_EN|C_PS1_Div2;//0x08;
	CLRA	
	SFUN	_T1CR2
	.line	416, "init.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	422, "init.c"; 	TMR1 = 99;
	MOVIA	0x63
	SFUN	_TMR1
	.line	425, "init.c"; 	PWM1DUTY = 0;//PWM1DUTY = TMR1*70%=139
	CLRA	
	SFUN	_PWM1DUTY
	.line	426, "init.c"; 	}
	RETURN	
; exit point of _pwm1_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=init, function=_timer1_init
	.debuginfo subprogram _timer1_init
_timer1_init:
; 2 exit points
	.line	373, "init.c"; 	T1CR1 = C_TMR1_Dis; // Disable Timer1
	CLRA	
	SFUN	_T1CR1
	.line	374, "init.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst|C_TMR1_ExtRising|C_PS1_Dis;//|C_PS1_EN| C_PS1_Div2;//|C_PS1_Dis
	MOVIA	0x08
	SFUN	_T1CR2
	.line	376, "init.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	379, "init.c"; 	TMR1 = 49;
	MOVIA	0x31
	SFUN	_TMR1
	.line	380, "init.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	381, "init.c"; 	INTE |= C_INT_TMR1;
	BSR	_INTE,3
	.line	382, "init.c"; 	}
	RETURN	
; exit point of _timer1_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1006
;; Starting pCode block
.segment "code"; module=init, function=_timer0_init
	.debuginfo subprogram _timer0_init
_timer0_init:
; 2 exit points
	.line	241, "init.c"; 	PCON1 &= ~0x01;						//disable timer0
	IOSTR	_PCON1
	BANKSEL	r0x1006
	MOVAR	r0x1006
	BCR	r0x1006,0
	MOVR	r0x1006,W
	IOST	_PCON1
	.line	278, "init.c"; 	TMR0 = 163;//156;			// (256-X)/(4MM/4) = 1/10K -> (256-X)/1KK = 1/10K -> X = 256-100 = 156;
	MOVIA	0xa3
	MOVAR	_TMR0
	.line	294, "init.c"; 	T0MD = C_PS0_TMR0 | C_PS0_Div2 ;
	CLRA	
	T0MD	
	.line	299, "init.c"; 	PCON1 |= 0x01;						//enable timer0.
	IOSTR	_PCON1
	MOVAR	r0x1006
	BSR	r0x1006,0
	MOVR	r0x1006,W
	IOST	_PCON1
	.line	300, "init.c"; 	}
	RETURN	
; exit point of _timer0_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=init, function=_gpio_init
	.debuginfo subprogram _gpio_init
_gpio_init:
; 2 exit points
	.line	113, "init.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	122, "init.c"; 	PORTB = 0x0c;
	MOVIA	0x0c
	MOVAR	_PORTB
	.line	135, "init.c"; 	IOSTA = 0x25;
	MOVIA	0x25
	IOST	_IOSTA
	.line	144, "init.c"; 	IOSTB = 0x01;
	MOVIA	0x01
	IOST	_IOSTB
	.line	157, "init.c"; 	APHCON = 0xdf;
	MOVIA	0xdf
	IOST	_APHCON
	.line	170, "init.c"; 	BPHCON = 0x3F;
	MOVIA	0x3f
	MOVAR	_BPHCON
	.line	184, "init.c"; 	ABPLCON = 0xff;			//warming mic GPIO ni pull_dowm
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	196, "init.c"; 	AWUCON = C_PA2_Wakeup;//C_PA0_Wakeup|C_PA2_Wakeup|C_PA5_Wakeup;
	MOVIA	0x04
	MOVAR	_AWUCON
	.line	205, "init.c"; 	BWUCON = C_PB0_Wakeup;
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	218, "init.c"; 	PACON = 0;//C_PA0_AIN0;
	CLRR	_PACON
	.line	220, "init.c"; 	ADCRbits.PBCON5 = 0; 
	BCR	_ADCRbits,6
	.line	222, "init.c"; 	ADCRbits.PBCON4 = 0;
	BCR	_ADCRbits,5
	.line	224, "init.c"; 	ADCRbits.PBCON3 = 0;
	BCR	_ADCRbits,4
	.line	230, "init.c"; 	BODCON = 0x00;
	CLRA	
	IOST	_BODCON
	.line	231, "init.c"; 	}
	RETURN	
; exit point of _gpio_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _gpio_init
;   _gpio_init
;1 compiler assigned register :
;   r0x1007
;; Starting pCode block
.segment "code"; module=init, function=_sleep_init
	.debuginfo subprogram _sleep_init
_sleep_init:
; 2 exit points
	.line	73, "init.c"; 	DISI();
	DISI
	.line	75, "init.c"; 	gpio_init();
	MCALL	_gpio_init
	.line	76, "init.c"; 	PCON1 &= ~0x01;			//disable timer0
	IOSTR	_PCON1
	BANKSEL	r0x1007
	MOVAR	r0x1007
	BCR	r0x1007,0
	MOVR	r0x1007,W
	IOST	_PCON1
	.line	81, "init.c"; 	ADMD = 0x00;			//disable adc
	CLRR	_ADMD
	.line	83, "init.c"; 	PCONbits.WDTEN = 0;		//enable watchdog
	BCR	_PCONbits,7
	.line	85, "init.c"; 	PCONbits.LVREN = 1;		//enable lvr
	BSR	_PCONbits,3
	.line	87, "init.c"; 	INTE = C_INT_PABKey;//0x42;//0100 0010b -bit1-C_INT_PABKey bit6-C_INT_WDT
	MOVIA	0x02
	MOVAR	_INTE
	.line	88, "init.c"; 	INTF = 0x00;
	CLRR	_INTF
	.line	91, "init.c"; 	ENI();
	ENI
	.line	92, "init.c"; 	}
	RETURN	
; exit point of _sleep_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _gpio_init
;   _timer0_init
;   _timer1_init
;   _wdt_init
;   _lvd_init
;   _lvr_init
;   _isr_init
;   _gpio_init
;   _timer0_init
;   _timer1_init
;   _wdt_init
;   _lvd_init
;   _lvr_init
;   _isr_init
;; Starting pCode block
.segment "code"; module=init, function=_system_init
	.debuginfo subprogram _system_init
_system_init:
; 2 exit points
	.line	44, "init.c"; 	DISI();
	DISI
	.line	46, "init.c"; 	gpio_init();
	MCALL	_gpio_init
	.line	47, "init.c"; 	timer0_init();
	MCALL	_timer0_init
	.line	48, "init.c"; 	timer1_init();
	MCALL	_timer1_init
	.line	55, "init.c"; 	wdt_init();
	MCALL	_wdt_init
	.line	56, "init.c"; 	lvd_init();
	MCALL	_lvd_init
	.line	57, "init.c"; 	lvr_init();
	MCALL	_lvr_init
	.line	58, "init.c"; 	isr_init();
	MCALL	_isr_init
	.line	61, "init.c"; 	ENI();
	ENI
	.line	62, "init.c"; 	}
	RETURN	
; exit point of _system_init


;	code size estimation:
;	  247+   16 =   263 instructions (  558 byte)

	end
