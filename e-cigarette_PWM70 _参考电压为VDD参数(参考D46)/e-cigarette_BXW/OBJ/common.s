;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"common.c"
	list	p=NY8B062F,c=on
	#include "ny8b062f.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_charge_check_by_IO
	extern	_ledRun
	extern	_Detect_OverCurrent_ByAD
	extern	_BaseBatSetPWMValue
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
	extern	_adc3_init
	extern	_adc2_init
	extern	_adc_init
	extern	_sleep_handle
	extern	_sleep_param_init
	extern	_led_handle
	extern	_led_param_init
	extern	_battery_check
	extern	_battery_param_init
	extern	_SmokeFun
	extern	_detect_param_init
	extern	_msg_handle
	extern	_MicScan
	extern	_KeyScan
	extern	_key_param_init
	extern	_isr_param_init
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
	extern	_CodeSwitchIndex
	extern	_sys_flag_3
	extern	_sys_flag_2
	extern	_sys_flag_1
	extern	_sys_flag_0
	extern	_common_param_init
	extern	_delay
	extern	_Delay_N1ms_16bit

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_sys_flag_0:
	.res 1
	.debuginfo complex-type (symbol "_sys_flag_0" 1 global "common.c" 15 (basetype 1 unsigned))

.segment "uninit"
_sys_flag_1:
	.res 1
	.debuginfo complex-type (symbol "_sys_flag_1" 1 global "common.c" 16 (basetype 1 unsigned))

.segment "uninit"
_sys_flag_2:
	.res 1
	.debuginfo complex-type (symbol "_sys_flag_2" 1 global "common.c" 17 (basetype 1 unsigned))

.segment "uninit"
_sys_flag_3:
	.res 1
	.debuginfo complex-type (symbol "_sys_flag_3" 1 global "common.c" 18 (basetype 1 unsigned))

.segment "uninit"
_CodeSwitchIndex:
	.res 1
	.debuginfo complex-type (symbol "_CodeSwitchIndex" 1 global "common.c" 19 (basetype 1 unsigned))

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x100A:
	.res	1
.segment "uninit"
r0x1009:
	.res	1
.segment "uninit"
r0x100B:
	.res	1
.segment "uninit"
r0x100C:
	.res	1
.segment "uninit"
r0x1007:
	.res	1
.segment "uninit"
r0x1006:
	.res	1
.segment "uninit"
r0x1008:
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
; code_common	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;4 compiler assigned registers:
;   r0x1006
;   STK00
;   r0x1007
;   r0x1008
;; Starting pCode block
.segment "code"; module=common, function=_Delay_N1ms_16bit
	.debuginfo subprogram _Delay_N1ms_16bit
;local variable name mapping:
	.debuginfo complex-type (local-sym "_i" 1 "common.c" 55 (basetype 1 unsigned) split "r0x1008")
_Delay_N1ms_16bit:
; 2 exit points
	.line	53, "common.c"; 	void Delay_N1ms_16bit(u16 N)		// 经过示波器矫正
	BANKSEL	r0x1006
	MOVAR	r0x1006
	MOVR	STK00,W
	BANKSEL	r0x1007
	MOVAR	r0x1007
_00124_DS_:
	.line	56, "common.c"; 	for(;N !=0; N--)
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	BANKSEL	r0x1007
	IORAR	r0x1007,W
	BTRSC	STATUS,2
	MGOTO	_00126_DS_
	.line	72, "common.c"; 	for(i=0;i <255 ; i++)
	MOVIA	0xff
	BANKSEL	r0x1008
	MOVAR	r0x1008
_00122_DS_:
	.line	74, "common.c"; 	NOP();
	nop
	.line	75, "common.c"; 	NOP();
	nop
	.line	76, "common.c"; 	NOP();
	nop
	.line	77, "common.c"; 	NOP();
	nop
	.line	78, "common.c"; 	NOP();
	nop
	.line	79, "common.c"; 	NOP();
	nop
	.line	80, "common.c"; 	NOP();
	nop
	.line	81, "common.c"; 	NOP();
	nop
	.line	82, "common.c"; 	NOP();
	nop
	BANKSEL	r0x1008
	DECRSZ	r0x1008,F
	.line	72, "common.c"; 	for(i=0;i <255 ; i++)
	MGOTO	_00122_DS_
	.line	56, "common.c"; 	for(;N !=0; N--)
	MOVIA	0xff
	BANKSEL	r0x1007
	ADDAR	r0x1007,F
	MOVIA	0xff
	BANKSEL	r0x1006
	ADCAR	r0x1006,F
	.line	56, "common.c"; 	{
	MGOTO	_00124_DS_
_00126_DS_:
	.line	86, "common.c"; 	}
	RETURN	
; exit point of _Delay_N1ms_16bit

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1009
;   STK00
;   r0x100A
;   r0x100B
;   r0x100C
;; Starting pCode block
.segment "code"; module=common, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo complex-type (local-sym "_count" 2 "common.c" 46 (basetype 2 unsigned) split "r0x100A" "r0x1009")
	.debuginfo complex-type (local-sym "_i" 2 "common.c" 48 (basetype 2 unsigned) split "r0x100B" "r0x100C")
_delay:
; 2 exit points
	.line	46, "common.c"; 	void delay(u16 count)
	BANKSEL	r0x1009
	MOVAR	r0x1009
	MOVR	STK00,W
	BANKSEL	r0x100A
	MOVAR	r0x100A
	.line	49, "common.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x100B
	MOVAR	r0x100B
	BANKSEL	r0x100C
	CLRR	r0x100C
_00111_DS_:
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	BANKSEL	r0x100A
	SUBAR	r0x100A,W
	BANKSEL	r0x100C
	MOVR	r0x100C,W
	BANKSEL	r0x1009
	SBCAR	r0x1009,W
	BTRSS	STATUS,0
	MGOTO	_00113_DS_
	BANKSEL	r0x100B
	INCR	r0x100B,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x100C
	INCR	r0x100C,F
_00001_DS_:
	MGOTO	_00111_DS_
_00113_DS_:
	.line	51, "common.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=common, function=_common_param_init
	.debuginfo subprogram _common_param_init
_common_param_init:
; 2 exit points
	.line	31, "common.c"; 	sys_flag_0 = 0;
	BANKSEL	_sys_flag_0
	CLRR	_sys_flag_0
	.line	32, "common.c"; 	sys_flag_1 = 0;
	BANKSEL	_sys_flag_1
	CLRR	_sys_flag_1
	.line	33, "common.c"; 	sys_flag_2 = 0;
	BANKSEL	_sys_flag_2
	CLRR	_sys_flag_2
	.line	34, "common.c"; 	sys_flag_3 = 0;
	BANKSEL	_sys_flag_3
	CLRR	_sys_flag_3
	.line	35, "common.c"; 	msg = 0;
	BANKSEL	_msg
	CLRR	_msg
	.line	36, "common.c"; 	b_isPowerOn = 1;
	BANKSEL	_sys_flag_0
	BSR	_sys_flag_0,0
	.line	39, "common.c"; 	CodeSwitchIndex = 0;
	BANKSEL	_CodeSwitchIndex
	CLRR	_CodeSwitchIndex
	.line	40, "common.c"; 	}
	RETURN	
; exit point of _common_param_init


;	code size estimation:
;	   43+   25 =    68 instructions (  186 byte)

	end
