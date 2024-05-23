;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"sleep.c"
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
	extern	_Delay_N1ms_16bit
	extern	_delay
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
	extern	_sleepCnt
	extern	_sleep_delay_keep_time
	extern	_running_keep_time
	extern	_sleep_param_init
	extern	_sleep_handle

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_running_keep_time:
	.res 2
	.debuginfo complex-type (symbol "_running_keep_time" 2 global "sleep.c" 15 (basetype 2 unsigned))

.segment "uninit"
_sleep_delay_keep_time:
	.res 1
	.debuginfo complex-type (symbol "_sleep_delay_keep_time" 1 global "sleep.c" 17 (basetype 1 unsigned))

.segment "uninit"
_sleepCnt:
	.res 1
	.debuginfo complex-type (symbol "_sleepCnt" 1 global "sleep.c" 18 (basetype 1 unsigned))

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
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
; code_sleep	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _sleep_init
;   _gpio_init
;   _system_init
;   _isr_param_init
;   _key_param_init
;   _detect_param_init
;   _led_param_init
;   _sleep_param_init
;   _sleep_init
;   _gpio_init
;   _system_init
;   _isr_param_init
;   _key_param_init
;   _detect_param_init
;   _led_param_init
;   _sleep_param_init
;; Starting pCode block
.segment "code"; module=sleep, function=_sleep_handle
	.debuginfo subprogram _sleep_handle
_sleep_handle:
; 2 exit points
	.line	48, "sleep.c"; 	if(!sleepWakedUpByWDTFlag)
	BANKSEL	_sys_flag_2
	BTRSC	_sys_flag_2,6
	MGOTO	_02027_DS_
	.line	52, "sleep.c"; 	if((IN_MIC != 0)||keyPressStatus||(nowLedMode != 0)||led_flash_flag||led_breath_flash_flag||C_IO_USB_DEC||f_charging||b_heater_exist_check||disp_delay_time_cnt)
	BTRSC	_PORTBbits,0
	MGOTO	_02009_DS_
	BANKSEL	_sys_flag_1
	BTRSC	_sys_flag_1,4
	MGOTO	_02009_DS_
	BANKSEL	_nowLedMode
	MOVR	_nowLedMode,W
	BTRSS	STATUS,2
	MGOTO	_02009_DS_
	BANKSEL	_led_flash_flag
	MOVR	_led_flash_flag,W
	BTRSS	STATUS,2
	MGOTO	_02009_DS_
	BANKSEL	_sys_flag_2
	BTRSC	_sys_flag_2,2
	MGOTO	_02009_DS_
	BTRSC	_PORTAbits,2
	MGOTO	_02009_DS_
	BANKSEL	_sys_flag_0
	BTRSC	_sys_flag_0,6
	MGOTO	_02009_DS_
	BANKSEL	_sys_flag_3
	BTRSC	_sys_flag_3,0
	MGOTO	_02009_DS_
	BANKSEL	_disp_delay_time_cnt
	MOVR	_disp_delay_time_cnt,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
_02009_DS_:
	.line	55, "sleep.c"; 	sleepCnt = 0;
	BANKSEL	_sleepCnt
	CLRR	_sleepCnt
_00001_DS_:
	.line	57, "sleep.c"; 	if(f_sleep_check)//10ms
	BANKSEL	_sys_flag_1
	BTRSS	_sys_flag_1,6
	MGOTO	_02023_DS_
	.line	59, "sleep.c"; 	f_sleep_check = 0;
	BCR	_sys_flag_1,6
;;unsigned compare: left < lit(0x64=100), size=1
	.line	60, "sleep.c"; 	if(sleepCnt < 100)
	MOVIA	0x64
	BANKSEL	_sleepCnt
	SUBAR	_sleepCnt,W
	BTRSC	STATUS,0
	MGOTO	_02020_DS_
	.line	62, "sleep.c"; 	sleepCnt++;
	INCR	_sleepCnt,F
	MGOTO	_02023_DS_
_02020_DS_:
	.line	66, "sleep.c"; 	sleepCnt = 0;
	BANKSEL	_sleepCnt
	CLRR	_sleepCnt
	.line	67, "sleep.c"; 	isSleep = 1;
	BANKSEL	_sys_flag_1
	BSR	_sys_flag_1,3
_02023_DS_:
	.line	70, "sleep.c"; 	if(isSleep == 0)
	BANKSEL	_sys_flag_1
	BTRSS	_sys_flag_1,3
	.line	71, "sleep.c"; 	return;
	MGOTO	_02028_DS_
_02027_DS_:
	.line	73, "sleep.c"; 	isSleep = 0;
	BANKSEL	_sys_flag_1
	BCR	_sys_flag_1,3
	.line	75, "sleep.c"; 	sleep_init();
	MCALL	_sleep_init
	.line	80, "sleep.c"; 	sleepWakedUpByWDTFlag = 0;
	BANKSEL	_sys_flag_2
	BCR	_sys_flag_2,6
	.line	82, "sleep.c"; 	UPDATE_REG(PORTA);		//回读PA口状态
	MOVR	_PORTA,F
	.line	83, "sleep.c"; 	UPDATE_REG(PORTB);		//回读PB口状态	
	MOVR	_PORTB,F
	.line	84, "sleep.c"; 	NOP();
	nop
	.line	85, "sleep.c"; 	NOP();
	nop
	.line	86, "sleep.c"; 	NOP();
	nop
	.line	87, "sleep.c"; 	NOP();
	nop
	.line	88, "sleep.c"; 	NOP();
	nop
	.line	89, "sleep.c"; 	SLEEP();
	sleep
	.line	90, "sleep.c"; 	NOP();
	nop
	.line	91, "sleep.c"; 	NOP();
	nop
	.line	92, "sleep.c"; 	NOP();
	nop
	.line	93, "sleep.c"; 	gpio_init();
	MCALL	_gpio_init
	.line	131, "sleep.c"; 	system_init();	
	MCALL	_system_init
	.line	133, "sleep.c"; 	isr_param_init();
	MCALL	_isr_param_init
	.line	134, "sleep.c"; 	key_param_init();
	MCALL	_key_param_init
	.line	135, "sleep.c"; 	detect_param_init();
	MCALL	_detect_param_init
	.line	139, "sleep.c"; 	led_param_init();
	MCALL	_led_param_init
	.line	140, "sleep.c"; 	sleep_param_init();
	MCALL	_sleep_param_init
_02028_DS_:
	.line	143, "sleep.c"; 	}
	RETURN	
; exit point of _sleep_handle

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=sleep, function=_sleep_param_init
	.debuginfo subprogram _sleep_param_init
_sleep_param_init:
; 2 exit points
	.line	33, "sleep.c"; 	running_keep_time = RUNNING_KEEP_TIME;
	MOVIA	0x40
	BANKSEL	_running_keep_time
	MOVAR	_running_keep_time
	MOVIA	0x38
	MOVAR	(_running_keep_time + 1)
	.line	34, "sleep.c"; 	isSleep = 0;
	BANKSEL	_sys_flag_1
	BCR	_sys_flag_1,3
	.line	35, "sleep.c"; 	sleep_delay_keep_time = 0;
	BANKSEL	_sleep_delay_keep_time
	CLRR	_sleep_delay_keep_time
	.line	36, "sleep.c"; 	sleepCnt = 0;
	BANKSEL	_sleepCnt
	CLRR	_sleepCnt
	.line	37, "sleep.c"; 	}
	RETURN	
; exit point of _sleep_param_init


;	code size estimation:
;	   56+   20 =    76 instructions (  192 byte)

	end
