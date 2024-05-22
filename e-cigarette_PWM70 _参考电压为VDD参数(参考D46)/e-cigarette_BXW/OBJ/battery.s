;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"battery.c"
	list	p=NY8B062E,c=on
	#include "ny8b062e.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_JudgeSmokingLightCountTimeoutOrNot
	extern	_ledRun
	extern	_Detect_OverCurrent_ByAD
	extern	_BaseBatSetPWMValue
	extern	_LedSharpflash
	extern	_ShowLed
	extern	_ShowLedSharpflashParameters
	extern	_ShowLedParameters
	extern	_ADC_Convert_Pre
	extern	_Get_Onetime_Bat_ADCValue
	extern	_Ledbreathing
	extern	_LedOff
	extern	_SetLedColorNormallyOn
	extern	_SetLedBreathingParameters
	extern	_SetLedBreathingParameters2
	extern	_SetLedFlashParameters
	extern	_Set_ADVREFH_2V
	extern	_Set_ADVREFH_5V
	extern	_adc_get
	extern	_F_wait_eoc
	extern	_adc4_init
	extern	_adc3_init
	extern	_adc2_init
	extern	_adc_init
	extern	_Delay_N1ms_16bit
	extern	_delay
	extern	_sleep_handle
	extern	_sleep_param_init
	extern	_led_handle
	extern	_led_param_init
	extern	_detect_handle
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
	extern	_TM3RH
	extern	_TMRH
	extern	_ADD
	extern	_PCHBUF
	extern	_FSR
	extern	_STATUS
	extern	_PCL
	extern	_TMR0
	extern	_INDF
	extern	_temptimecount
	extern	_sleep_delay_keep_time
	extern	_running_keep_time
	extern	_usb_flag
	extern	_HeatPlugInsert_flag
	extern	_HeatPlugInsertTimeCount
	extern	_HeatCount
	extern	_SmokingKeepTime
	extern	_HeatingKeepTime
	extern	_KeyDowmTimeCount
	extern	_VolTypeIndex
	extern	_MsgType
	extern	_SmokeState
	extern	_BatVolLevel
	extern	_SaveHeaterIOStatus
	extern	_MotorDutySet
	extern	_NowMotorDuty
	extern	_TargetMotorDuty
	extern	_gAdcDataValue
	extern	_OverCurrent_adc_value
	extern	_OverCurrent_check_cnt
	extern	_AdcChannelIndex
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
	extern	_RFCbits
	extern	_ANAENbits
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
	extern	_lvd_3P0V_init
	extern	_lvd_3P3V_init
	extern	_sys_flag_3
	extern	_sys_flag_2
	extern	_sys_flag_1
	extern	_sys_flag_0
	extern	_INTE2
	extern	_RFC
	extern	_ANAEN
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
	extern	_battery_low_cnt
	extern	_battery_param_init
	extern	_battery_check

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_battery_low_cnt:
	.res 1
	.debuginfo complex-type (symbol "_battery_low_cnt" 1 global "battery.c" 15 (basetype 1 unsigned))

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
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
; code_battery	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=battery, function=_battery_check
	.debuginfo subprogram _battery_check
_battery_check:
; 2 exit points
	.line	109, "battery.c"; 	}
	RETURN	
; exit point of _battery_check

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1001
;; Starting pCode block
.segment "code"; module=battery, function=_lvd_3P0V_init
	.debuginfo subprogram _lvd_3P0V_init
_lvd_3P0V_init:
; 2 exit points
	.line	53, "battery.c"; 	PCON1 &= 0xe3;							// 1100 0011
	IOSTR	_PCON1
	BANKSEL	r0x1001
	MOVAR	r0x1001
	MOVIA	0xe3
	ANDAR	r0x1001,F
	MOVR	r0x1001,W
	IOST	_PCON1
	.line	54, "battery.c"; 	PCON1 |= C_LVD_3P0V;					//
	IOSTR	_PCON1
	MOVAR	r0x1001
	BSR	r0x1001,4
	MOVR	r0x1001,W
	IOST	_PCON1
	.line	55, "battery.c"; 	f_battery_low = 0;
	BANKSEL	_sys_flag_0
	BCR	_sys_flag_0,5
	.line	56, "battery.c"; 	battery_low_cnt = 0;
	BANKSEL	_battery_low_cnt
	CLRR	_battery_low_cnt
	.line	57, "battery.c"; 	}
	RETURN	
; exit point of _lvd_3P0V_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1002
;; Starting pCode block
.segment "code"; module=battery, function=_lvd_3P3V_init
	.debuginfo subprogram _lvd_3P3V_init
_lvd_3P3V_init:
; 2 exit points
	.line	46, "battery.c"; 	PCON1 &= 0xe3;							// 1100 0011
	IOSTR	_PCON1
	BANKSEL	r0x1002
	MOVAR	r0x1002
	MOVIA	0xe3
	ANDAR	r0x1002,F
	MOVR	r0x1002,W
	IOST	_PCON1
	.line	47, "battery.c"; 	PCON1 |= C_LVD_3P3V;					//
	IOSTR	_PCON1
	MOVAR	r0x1002
	MOVIA	0x14
	IORAR	r0x1002,F
	MOVR	r0x1002,W
	IOST	_PCON1
	.line	48, "battery.c"; 	f_battery_low = 0;
	BANKSEL	_sys_flag_0
	BCR	_sys_flag_0,5
	.line	49, "battery.c"; 	battery_low_cnt = 0;
	BANKSEL	_battery_low_cnt
	CLRR	_battery_low_cnt
	.line	50, "battery.c"; 	}
	RETURN	
; exit point of _lvd_3P3V_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=battery, function=_battery_param_init
	.debuginfo subprogram _battery_param_init
_battery_param_init:
; 2 exit points
	.line	31, "battery.c"; 	f_battery_check = 0;
	BANKSEL	_sys_flag_1
	BCR	_sys_flag_1,0
	.line	34, "battery.c"; 	battery_low_cnt = 0;
	BANKSEL	_battery_low_cnt
	CLRR	_battery_low_cnt
	.line	40, "battery.c"; 	f_battery_low = 0;
	BANKSEL	_sys_flag_0
	BCR	_sys_flag_0,5
	.line	42, "battery.c"; 	}
	RETURN	
; exit point of _battery_param_init


;	code size estimation:
;	   34+    9 =    43 instructions (  104 byte)

	end
