;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"key.c"
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
	extern	_KeyScan
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
	extern	_CodeSwitchIndex
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
	extern	_keylowcount
	extern	_keyCnt
	extern	_msg
	extern	_key_param_init
	extern	_MicScan

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_msg:
	.res 1
	.debuginfo complex-type (symbol "_msg" 1 global "key.c" 15 (basetype 1 unsigned))

.segment "uninit"
_keyCnt:
	.res 1
	.debuginfo complex-type (symbol "_keyCnt" 1 global "key.c" 17 (basetype 1 unsigned))

.segment "uninit"
_keylowcount:
	.res 1
	.debuginfo complex-type (symbol "_keylowcount" 1 global "key.c" 18 (basetype 1 unsigned))

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1006:
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
; code_key	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1006
;   r0x1007
;; Starting pCode block
.segment "code"; module=key, function=_MicScan
	.debuginfo subprogram _MicScan
_MicScan:
; 2 exit points
	.line	53, "key.c"; 	if(!f_1ms_TimeOut)
	BANKSEL	_sys_flag_2
	BTRSS	_sys_flag_2,4
	.line	54, "key.c"; 	return;
	MGOTO	_02030_DS_
_02010_DS_:
	.line	55, "key.c"; 	f_1ms_TimeOut = 0;	
	BANKSEL	_sys_flag_2
	BCR	_sys_flag_2,4
	.line	56, "key.c"; 	if(nowLedMode != 1)
	BANKSEL	_nowLedMode
	MOVR	_nowLedMode,W
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_02022_DS_
	.line	58, "key.c"; 	if(IN_MIC == 1)
	BANKSEL	r0x1006
	CLRR	r0x1006
	BTRSC	_PORTBbits,0
	INCR	r0x1006,F
	MOVR	r0x1006,W
;;1	MOVAR	r0x1007
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02019_DS_
	.line	60, "key.c"; 	keylowcount = 0;
	BANKSEL	_keylowcount
	CLRR	_keylowcount
;;unsigned compare: left < lit(0xA=10), size=1
	.line	61, "key.c"; 	if(keyCnt < 10)//20
	MOVIA	0x0a
	BANKSEL	_keyCnt
	SUBAR	_keyCnt,W
	BTRSC	STATUS,0
	MGOTO	_02012_DS_
	.line	63, "key.c"; 	keyCnt ++;
	INCR	_keyCnt,F
	MGOTO	_02022_DS_
_02012_DS_:
	.line	67, "key.c"; 	isKeyPressing = 1;
	BANKSEL	_sys_flag_1
	BSR	_sys_flag_1,5
	MGOTO	_02022_DS_
_02019_DS_:
	.line	72, "key.c"; 	keylowcount++;
	BANKSEL	_keylowcount
	INCR	_keylowcount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0xB=11), size=1
	.line	73, "key.c"; 	if(keylowcount > 10)//50
	MOVIA	0x0b
	SUBAR	_keylowcount,W
	BTRSS	STATUS,0
	MGOTO	_02022_DS_
	.line	75, "key.c"; 	keylowcount = 0;
	CLRR	_keylowcount
	.line	76, "key.c"; 	isKeyPressing = 0;
	BANKSEL	_sys_flag_1
	BCR	_sys_flag_1,5
	.line	77, "key.c"; 	keyCnt = 0; 
	BANKSEL	_keyCnt
	CLRR	_keyCnt
	.line	78, "key.c"; 	if(SmokeState == STATE_SMOKING)
	BANKSEL	_SmokeState
	MOVR	_SmokeState,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_02022_DS_
	.line	81, "key.c"; 	percent_nun = 0;
	BANKSEL	_percent_nun
	CLRR	_percent_nun
	.line	83, "key.c"; 	I0_PWM2 = MT_OF;
	BSR	_PORTBbits,2
_02022_DS_:
	.line	88, "key.c"; 	if(keyPressStatus != isKeyPressing)
	CLRA	
	BANKSEL	_sys_flag_1
	BTRSC	_sys_flag_1,4
	ADDIA	0x80
	BTRSC	_sys_flag_1,5
	ADDIA	0x80
	BTRSC	STATUS,2
	MGOTO	_02030_DS_
	.line	90, "key.c"; 	keyPressStatus = isKeyPressing;
	BTRSS	_sys_flag_1,5
	BCR	_sys_flag_1,4
	BTRSC	_sys_flag_1,5
	BSR	_sys_flag_1,4
	.line	91, "key.c"; 	if(keyPressStatus)
	BTRSS	_sys_flag_1,4
	MGOTO	_02026_DS_
	.line	93, "key.c"; 	msg = MSG_SMOKE_ON;
	MOVIA	0x01
	BANKSEL	_msg
	MOVAR	_msg
	.line	93, "key.c"; 	}
	MGOTO	_02030_DS_
_02026_DS_:
	.line	105, "key.c"; 	if(SmokeState == STATE_SMOKING)
	BANKSEL	_SmokeState
	MOVR	_SmokeState,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_02030_DS_
	.line	107, "key.c"; 	b_smoking = 0;
	BANKSEL	_sys_flag_1
	BCR	_sys_flag_1,1
	.line	108, "key.c"; 	msg = MSG_SMOKE_OFF;
	MOVIA	0x02
	BANKSEL	_msg
	MOVAR	_msg
_02030_DS_:
	.line	112, "key.c"; 	}
	RETURN	
; exit point of _MicScan

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=key, function=_key_param_init
	.debuginfo subprogram _key_param_init
_key_param_init:
; 2 exit points
	.line	29, "key.c"; 	keyCnt = 0;
	BANKSEL	_keyCnt
	CLRR	_keyCnt
	.line	30, "key.c"; 	keyPressStatus = 0;
	BANKSEL	_sys_flag_1
	BCR	_sys_flag_1,4
	.line	31, "key.c"; 	isKeyPressing = 0;
	BCR	_sys_flag_1,5
	.line	32, "key.c"; 	keylowcount = 0;
	BANKSEL	_keylowcount
	CLRR	_keylowcount
	.line	40, "key.c"; 	msg = MSG_NULL;
	BANKSEL	_msg
	CLRR	_msg
	.line	41, "key.c"; 	}
	RETURN	
; exit point of _key_param_init


;	code size estimation:
;	   67+   21 =    88 instructions (  218 byte)

	end
