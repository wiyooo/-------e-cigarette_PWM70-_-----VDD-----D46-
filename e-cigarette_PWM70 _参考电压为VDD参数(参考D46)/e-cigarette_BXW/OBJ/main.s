;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
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
	extern	_adc_init4
	extern	_adc3_init
	extern	_adc2_init
	extern	_adc_init
	extern	_sleep_handle
	extern	_sleep_param_init
	extern	_led_handle
	extern	_led_param_init
	extern	_bat_lvd_check
	extern	_battery_check
	extern	_battery_param_init
	extern	_SmokeFun
	extern	_detect_param_init
	extern	_MicScan
	extern	_KeyScan
	extern	_key_param_init
	extern	_isr_param_init
	extern	_gpio_init
	extern	_sleep_init
	extern	_system_init
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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_main
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
	extern	_sys_flag_3
	extern	_sys_flag_2
	extern	_sys_flag_1
	extern	_sys_flag_0
	extern	_common_param_init
	extern	_delay
	extern	_Delay_N1ms_16bit
	extern	_msg_handle

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

.segment "share_bank"
PSAVE:
	.res 1
.segment "share_bank"
SSAVE:
	.res 1
.segment "share_bank"
WSAVE:
	.res 1
.segment "share_bank"
STK12:
	.res 1
.segment "share_bank"
STK11:
	.res 1
.segment "share_bank"
STK10:
	.res 1
.segment "share_bank"
STK09:
	.res 1
.segment "share_bank"
STK08:
	.res 1
.segment "share_bank"
STK07:
	.res 1
.segment "share_bank"
STK06:
	.res 1
.segment "share_bank"
STK05:
	.res 1
.segment "share_bank"
STK04:
	.res 1
.segment "share_bank"
STK03:
	.res 1
.segment "share_bank"
STK02:
	.res 1
.segment "share_bank"
STK01:
	.res 1
.segment "share_bank"
STK00:
	.res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_sys_flag_0:
	.res 1
	.debuginfo complex-type (symbol "_sys_flag_0" 1 global "main.c" 15 (basetype 1 unsigned))

.segment "uninit"
_sys_flag_1:
	.res 1
	.debuginfo complex-type (symbol "_sys_flag_1" 1 global "main.c" 16 (basetype 1 unsigned))

.segment "uninit"
_sys_flag_2:
	.res 1
	.debuginfo complex-type (symbol "_sys_flag_2" 1 global "main.c" 17 (basetype 1 unsigned))

.segment "uninit"
_sys_flag_3:
	.res 1
	.debuginfo complex-type (symbol "_sys_flag_3" 1 global "main.c" 18 (basetype 1 unsigned))

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x100D:
	.res	1
.segment "uninit"
r0x100C:
	.res	1
.segment "uninit"
r0x100E:
	.res	1
.segment "uninit"
r0x100F:
	.res	1
.segment "uninit"
r0x100A:
	.res	1
.segment "uninit"
r0x1009:
	.res	1
.segment "uninit"
r0x100B:
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
; reset vector 
;--------------------------------------------------------
ORG	0x0000
	LGOTO	__nyc_ny8_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
; code_main	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _system_init
;   _common_param_init
;   _isr_param_init
;   _key_param_init
;   _led_param_init
;   _sleep_param_init
;   _led_mode_set
;   _MicScan
;   _msg_handle
;   _charge_check_by_IO
;   _SmokeFun
;   _system_init
;   _common_param_init
;   _isr_param_init
;   _key_param_init
;   _led_param_init
;   _sleep_param_init
;   _led_mode_set
;   _MicScan
;   _msg_handle
;   _charge_check_by_IO
;   _SmokeFun
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	97, "main.c"; 	system_init();	
	MCALL	_system_init
	.line	101, "main.c"; 	common_param_init();
	MCALL	_common_param_init
	.line	102, "main.c"; 	isr_param_init();
	MCALL	_isr_param_init
	.line	103, "main.c"; 	key_param_init();
	MCALL	_key_param_init
	.line	104, "main.c"; 	led_param_init();
	MCALL	_led_param_init
	.line	105, "main.c"; 	sleep_param_init();
	MCALL	_sleep_param_init
	.line	106, "main.c"; 	isSleep = 0;//上电默认关机状态
	BANKSEL	_sys_flag_1
	BCR	_sys_flag_1,3
	.line	129, "main.c"; 	led_mode_set(1);
	MOVIA	0x01
	MCALL	_led_mode_set
_02032_DS_:
	.line	132, "main.c"; 	CLRWDT();	
	clrwdt
	.line	133, "main.c"; 	MicScan();//咪头扫描
	MCALL	_MicScan
	.line	134, "main.c"; 	msg_handle();//消息处理
	MCALL	_msg_handle
	.line	137, "main.c"; 	charge_check_by_IO();//充电检测
	MCALL	_charge_check_by_IO
	.line	140, "main.c"; 	SmokeFun();
	MCALL	_SmokeFun
	MGOTO	_02032_DS_
	.line	144, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _led_mode_set
;   _led_mode_set
;   _adc_init4
;   _led_mode_set
;   _led_mode_set
;   _led_mode_set
;   _led_mode_set
;   _led_mode_set
;   _led_mode_set
;   _led_mode_set
;   _adc_init4
;   _led_mode_set
;   _led_mode_set
;   _led_mode_set
;   _led_mode_set
;   _led_mode_set
;; Starting pCode block
.segment "code"; module=main, function=_msg_handle
	.debuginfo subprogram _msg_handle
_msg_handle:
; 2 exit points
	.line	152, "main.c"; 	switch(msg)
	BANKSEL	_msg
	MOVR	_msg,W
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_02037_DS_
	MOVR	_msg,W
	XORIA	0x02
	BTRSC	STATUS,2
	MGOTO	_02039_DS_
	MOVR	_msg,W
	XORIA	0x03
	BTRSC	STATUS,2
	MGOTO	_02040_DS_
	MOVR	_msg,W
	XORIA	0x04
	BTRSC	STATUS,2
	MGOTO	_02042_DS_
	MOVR	_msg,W
	XORIA	0x07
	BTRSC	STATUS,2
	MGOTO	_02041_DS_
	MOVR	_msg,W
	XORIA	0x08
	BTRSC	STATUS,2
	MGOTO	_02043_DS_
	MOVR	_msg,W
	XORIA	0x09
	BTRSC	STATUS,2
	MGOTO	_02044_DS_
	MOVR	_msg,W
	XORIA	0x0a
	BTRSC	STATUS,2
	MGOTO	_02038_DS_
	MGOTO	_02046_DS_
_02037_DS_:
	.line	158, "main.c"; 	msg = MSG_NULL;
	BANKSEL	_msg
	CLRR	_msg
	.line	162, "main.c"; 	SmokeState = STATE_SMOKE_INIT;
	MOVIA	0x01
	BANKSEL	_SmokeState
	MOVAR	_SmokeState
	.line	163, "main.c"; 	b_smoke_init = 1;
	BANKSEL	_sys_flag_0
	BSR	_sys_flag_0,1
	.line	165, "main.c"; 	b_smoking = 0;//清除吸烟开始标志	
	BANKSEL	_sys_flag_1
	BCR	_sys_flag_1,1
	.line	167, "main.c"; 	break;	
	MGOTO	_02046_DS_
_02038_DS_:
	.line	170, "main.c"; 	msg = MSG_NULL;
	BANKSEL	_msg
	CLRR	_msg
	.line	171, "main.c"; 	SmokeState = STATE_SMOKE_IDLE;
	BANKSEL	_SmokeState
	CLRR	_SmokeState
	.line	172, "main.c"; 	b_smoking = 0;//清吸烟开始标志
	BANKSEL	_sys_flag_1
	BCR	_sys_flag_1,1
	.line	174, "main.c"; 	charging_breath_flash_flag = 0;
	BANKSEL	_sys_flag_3
	BCR	_sys_flag_3,6
	.line	175, "main.c"; 	led_breath_flash_flag = 0;
	BANKSEL	_sys_flag_2
	BCR	_sys_flag_2,2
	.line	176, "main.c"; 	led_flash_flag = 0;
	BANKSEL	_led_flash_flag
	CLRR	_led_flash_flag
	.line	177, "main.c"; 	led_mode_set(4);
	MOVIA	0x04
	MCALL	_led_mode_set
	.line	180, "main.c"; 	disp_delay_time_cnt = 150;
	MOVIA	0x96
	BANKSEL	_disp_delay_time_cnt
	MOVAR	_disp_delay_time_cnt
	.line	181, "main.c"; 	break;
	MGOTO	_02046_DS_
_02039_DS_:
	.line	184, "main.c"; 	msg = MSG_NULL;
	BANKSEL	_msg
	CLRR	_msg
	.line	185, "main.c"; 	SmokeState = STATE_SMOKE_IDLE;
	BANKSEL	_SmokeState
	CLRR	_SmokeState
	.line	186, "main.c"; 	b_smoking = 0;//清吸烟开始标志			
	BANKSEL	_sys_flag_1
	BCR	_sys_flag_1,1
	.line	188, "main.c"; 	led_flash_flag = 0;
	BANKSEL	_led_flash_flag
	CLRR	_led_flash_flag
	.line	189, "main.c"; 	disp_delay_time_cnt = 150;//吸烟后1,5秒才检测低电
	MOVIA	0x96
	BANKSEL	_disp_delay_time_cnt
	MOVAR	_disp_delay_time_cnt
	.line	190, "main.c"; 	led_mode_set(3);
	MOVIA	0x03
	MCALL	_led_mode_set
	.line	217, "main.c"; 	break;
	MGOTO	_02046_DS_
_02040_DS_:
	.line	220, "main.c"; 	msg = MSG_NULL;
	BANKSEL	_msg
	CLRR	_msg
	.line	221, "main.c"; 	SmokeState = STATE_SMOKE_IDLE;
	BANKSEL	_SmokeState
	CLRR	_SmokeState
	.line	222, "main.c"; 	b_smoking = 0;//清吸烟开始标志
	BANKSEL	_sys_flag_1
	BCR	_sys_flag_1,1
	.line	224, "main.c"; 	f_charging = 1;
	BANKSEL	_sys_flag_0
	BSR	_sys_flag_0,6
	.line	225, "main.c"; 	f_charge_full = 0;
	BCR	_sys_flag_0,4
	.line	226, "main.c"; 	temp_flag = 0;
	BANKSEL	_sys_flag_2
	BCR	_sys_flag_2,0
	.line	228, "main.c"; 	led_breath_flash_flag = 0;//停止呼吸效果
	BCR	_sys_flag_2,2
	.line	229, "main.c"; 	led_flash_flag = 0;
	BANKSEL	_led_flash_flag
	CLRR	_led_flash_flag
	.line	230, "main.c"; 	usb_check_ad_time_cnt = 0;
	BANKSEL	_usb_check_ad_time_cnt
	CLRR	_usb_check_ad_time_cnt
	.line	231, "main.c"; 	f_battery_low = 0;
	BANKSEL	_sys_flag_0
	BCR	_sys_flag_0,5
	.line	232, "main.c"; 	adc_init4(Quarter_VDD);
	MOVIA	0x01
	MCALL	_adc_init4
	.line	233, "main.c"; 	led_mode_set(7);
	MOVIA	0x07
	MCALL	_led_mode_set
	.line	238, "main.c"; 	break;
	MGOTO	_02046_DS_
_02041_DS_:
	.line	241, "main.c"; 	msg = MSG_NULL;		
	BANKSEL	_msg
	CLRR	_msg
	.line	243, "main.c"; 	f_charge_full = 1;
	BANKSEL	_sys_flag_0
	BSR	_sys_flag_0,4
	.line	244, "main.c"; 	led_mode_set(8);
	MOVIA	0x08
	MCALL	_led_mode_set
	.line	252, "main.c"; 	break;	
	MGOTO	_02046_DS_
_02042_DS_:
	.line	255, "main.c"; 	msg = MSG_NULL;
	BANKSEL	_msg
	CLRR	_msg
	.line	256, "main.c"; 	led_flash_flag = 0;
	BANKSEL	_led_flash_flag
	CLRR	_led_flash_flag
	.line	264, "main.c"; 	led_mode_set(9);
	MOVIA	0x09
	MCALL	_led_mode_set
	.line	268, "main.c"; 	f_charging = 0;
	BANKSEL	_sys_flag_0
	BCR	_sys_flag_0,6
	.line	269, "main.c"; 	f_charge_full = 0;
	BCR	_sys_flag_0,4
	.line	270, "main.c"; 	break;	
	MGOTO	_02046_DS_
_02043_DS_:
	.line	273, "main.c"; 	msg = MSG_NULL;
	BANKSEL	_msg
	CLRR	_msg
	.line	274, "main.c"; 	SmokeState = STATE_SMOKE_IDLE;
	BANKSEL	_SmokeState
	CLRR	_SmokeState
	.line	275, "main.c"; 	b_smoking = 0;//清吸烟开始标志
	BANKSEL	_sys_flag_1
	BCR	_sys_flag_1,1
	.line	277, "main.c"; 	f_battery_low = 1;
	BANKSEL	_sys_flag_0
	BSR	_sys_flag_0,5
	.line	279, "main.c"; 	led_mode_set(5);
	MOVIA	0x05
	MCALL	_led_mode_set
	.line	280, "main.c"; 	break;
	MGOTO	_02046_DS_
_02044_DS_:
	.line	284, "main.c"; 	msg = MSG_NULL;
	BANKSEL	_msg
	CLRR	_msg
	.line	285, "main.c"; 	SmokeState = STATE_SMOKE_IDLE;
	BANKSEL	_SmokeState
	CLRR	_SmokeState
	.line	287, "main.c"; 	b_smoking = 0;//清吸烟开始标志
	BANKSEL	_sys_flag_1
	BCR	_sys_flag_1,1
	.line	288, "main.c"; 	led_breath_flash_flag = 0;
	BANKSEL	_sys_flag_2
	BCR	_sys_flag_2,2
	.line	291, "main.c"; 	b_heater_detect_mask = 0;
	BCR	_sys_flag_2,5
	.line	292, "main.c"; 	led_mode_set(10);
	MOVIA	0x0a
	MCALL	_led_mode_set
_02046_DS_:
	.line	307, "main.c"; 	}
	RETURN	
; exit point of _msg_handle

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;4 compiler assigned registers:
;   r0x1009
;   STK00
;   r0x100A
;   r0x100B
;; Starting pCode block
.segment "code"; module=main, function=_Delay_N1ms_16bit
	.debuginfo subprogram _Delay_N1ms_16bit
;local variable name mapping:
	.debuginfo complex-type (local-sym "_i" 1 "main.c" 54 (basetype 1 unsigned) split "r0x100B")
_Delay_N1ms_16bit:
; 2 exit points
	.line	52, "main.c"; 	void Delay_N1ms_16bit(u16 N)		// 经过示波器矫正
	BANKSEL	r0x1009
	MOVAR	r0x1009
	MOVR	STK00,W
	BANKSEL	r0x100A
	MOVAR	r0x100A
_02024_DS_:
	.line	55, "main.c"; 	for(;N !=0; N--)
	BANKSEL	r0x1009
	MOVR	r0x1009,W
	BANKSEL	r0x100A
	IORAR	r0x100A,W
	BTRSC	STATUS,2
	MGOTO	_02026_DS_
	.line	71, "main.c"; 	for(i=0;i <255 ; i++)
	MOVIA	0xff
	BANKSEL	r0x100B
	MOVAR	r0x100B
_02022_DS_:
	.line	73, "main.c"; 	NOP();
	nop
	.line	74, "main.c"; 	NOP();
	nop
	.line	75, "main.c"; 	NOP();
	nop
	.line	76, "main.c"; 	NOP();
	nop
	.line	77, "main.c"; 	NOP();
	nop
	.line	78, "main.c"; 	NOP();
	nop
	.line	79, "main.c"; 	NOP();
	nop
	.line	80, "main.c"; 	NOP();
	nop
	.line	81, "main.c"; 	NOP();
	nop
	BANKSEL	r0x100B
	DECRSZ	r0x100B,F
	.line	71, "main.c"; 	for(i=0;i <255 ; i++)
	MGOTO	_02022_DS_
	.line	55, "main.c"; 	for(;N !=0; N--)
	MOVIA	0xff
	BANKSEL	r0x100A
	ADDAR	r0x100A,F
	MOVIA	0xff
	BANKSEL	r0x1009
	ADCAR	r0x1009,F
	.line	55, "main.c"; 	{
	MGOTO	_02024_DS_
_02026_DS_:
	.line	85, "main.c"; 	}
	RETURN	
; exit point of _Delay_N1ms_16bit

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x100C
;   STK00
;   r0x100D
;   r0x100E
;   r0x100F
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo complex-type (local-sym "_count" 2 "main.c" 45 (basetype 2 unsigned) split "r0x100D" "r0x100C")
	.debuginfo complex-type (local-sym "_i" 2 "main.c" 47 (basetype 2 unsigned) split "r0x100E" "r0x100F")
_delay:
; 2 exit points
	.line	45, "main.c"; 	void delay(u16 count)
	BANKSEL	r0x100C
	MOVAR	r0x100C
	MOVR	STK00,W
	BANKSEL	r0x100D
	MOVAR	r0x100D
	.line	48, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x100E
	MOVAR	r0x100E
	BANKSEL	r0x100F
	CLRR	r0x100F
_02011_DS_:
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	BANKSEL	r0x100D
	SUBAR	r0x100D,W
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	BANKSEL	r0x100C
	SBCAR	r0x100C,W
	BTRSS	STATUS,0
	MGOTO	_02013_DS_
	BANKSEL	r0x100E
	INCR	r0x100E,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x100F
	INCR	r0x100F,F
_00001_DS_:
	MGOTO	_02011_DS_
_02013_DS_:
	.line	50, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_common_param_init
	.debuginfo subprogram _common_param_init
_common_param_init:
; 2 exit points
	.line	30, "main.c"; 	sys_flag_0 = 0;
	BANKSEL	_sys_flag_0
	CLRR	_sys_flag_0
	.line	31, "main.c"; 	sys_flag_1 = 0;
	BANKSEL	_sys_flag_1
	CLRR	_sys_flag_1
	.line	32, "main.c"; 	sys_flag_2 = 0;
	BANKSEL	_sys_flag_2
	CLRR	_sys_flag_2
	.line	33, "main.c"; 	sys_flag_3 = 0;
	BANKSEL	_sys_flag_3
	CLRR	_sys_flag_3
	.line	34, "main.c"; 	msg = 0;
	BANKSEL	_msg
	CLRR	_msg
	.line	35, "main.c"; 	b_isPowerOn = 1;
	BANKSEL	_sys_flag_0
	BSR	_sys_flag_0,0
	.line	39, "main.c"; 	}
	RETURN	
; exit point of _common_param_init


;	code size estimation:
;	  158+   63 =   221 instructions (  568 byte)

	end
