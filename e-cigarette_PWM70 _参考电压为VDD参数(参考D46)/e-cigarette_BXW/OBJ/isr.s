;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"isr.c"
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
	extern	_MicScan
	extern	_KeyScan
	extern	_key_param_init
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
	extern	_isr
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
	extern	_ad_start_flg
	extern	_adc_value_tmp
	extern	_percent_nun
	extern	_PwmCycleCount
	extern	_temp
	extern	_time_base
	extern	_time_base_1s
	extern	_time_base_250ms
	extern	_time_base_100ms
	extern	_time_base_100us
	extern	_isr_param_init

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_time_base_100us:
	.res 1
	.debuginfo complex-type (symbol "_time_base_100us" 1 global "isr.c" 15 (basetype 1 unsigned))

.segment "uninit"
_time_base_100ms:
	.res 1
	.debuginfo complex-type (symbol "_time_base_100ms" 1 global "isr.c" 17 (basetype 1 unsigned))

.segment "uninit"
_time_base_250ms:
	.res 1
	.debuginfo complex-type (symbol "_time_base_250ms" 1 global "isr.c" 18 (basetype 1 unsigned))

.segment "uninit"
_time_base_1s:
	.res 1
	.debuginfo complex-type (symbol "_time_base_1s" 1 global "isr.c" 19 (basetype 1 unsigned))

.segment "uninit"
_time_base:
	.res 1
	.debuginfo complex-type (symbol "_time_base" 1 global "isr.c" 20 (basetype 1 unsigned))

.segment "uninit"
_temp:
	.res 1
	.debuginfo complex-type (symbol "_temp" 1 global "isr.c" 21 (basetype 1 unsigned))

.segment "uninit"
_PwmCycleCount:
	.res 1
	.debuginfo complex-type (symbol "_PwmCycleCount" 1 global "isr.c" 22 (basetype 1 unsigned))

.segment "uninit"
_percent_nun:
	.res 1
	.debuginfo complex-type (symbol "_percent_nun" 1 global "isr.c" 23 (basetype 1 unsigned))

.segment "uninit"
_adc_value_tmp:
	.res 2
	.debuginfo complex-type (symbol "_adc_value_tmp" 2 global "isr.c" 24 (basetype 2 unsigned))

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
_isr_sTime1MS_65536_44:
	.res	1
	.debuginfo complex-type (symbol "_isr_sTime1MS_65536_44" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
___sdcc_saved_fsr:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_fsr" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
___sdcc_saved_stk00:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_stk00" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
___sdcc_saved_stk01:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_stk01" 1 global "" 0 (basetype 1 unsigned))
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_ad_start_flg:
	.debuginfo complex-type (symbol "_ad_start_flg" 1 global "isr.c" 25 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_isr_sTime10ms_65536_44:
	.debuginfo complex-type (symbol "_isr_sTime10ms_65536_44" 1 local "isr.c" 57 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_isr_sTime100ms_65536_44:
	.debuginfo complex-type (symbol "_isr_sTime100ms_65536_44" 1 local "isr.c" 58 (basetype 1 unsigned))

	dw	0x00	; 0

;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
ORG 0x0008
	MGOTO	__sdcc_interrupt

.segment "code"
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;functions called:
;   _ledRun
;   _F_wait_eoc
;   _F_wait_eoc
;   _ledRun
;   _F_wait_eoc
;   _F_wait_eoc
;5 compiler assigned registers:
;   STK00
;   STK01
;   r0x1018
;   r0x1019
;   r0x101A
;; Starting pCode block
_isr:
; 0 exit points
	.line	53, "isr.c"; 	void isr(void) __interrupt(0)
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	BANKSEL	___sdcc_saved_fsr
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	BANKSEL	___sdcc_saved_stk00
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	BANKSEL	___sdcc_saved_stk01
	MOVAR	___sdcc_saved_stk01
	.line	60, "isr.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_02026_DS_
	.line	62, "isr.c"; 	INTFbits.T0IF = 0;
	MOVIA	0xfe
	MOVAR	(_INTFbits + 0)
	.line	66, "isr.c"; 	TMR0 = 163;	//156;			// 156是计算值，163是用示波器矫正值
	MOVIA	0xa3
	MOVAR	_TMR0
	.line	73, "isr.c"; 	ledRun();
	MCALL	_ledRun
	.line	74, "isr.c"; 	sTime1MS++;
	BANKSEL	_isr_sTime1MS_65536_44
	INCR	_isr_sTime1MS_65536_44,F
;;unsigned compare: left < lit(0xA=10), size=1
	.line	75, "isr.c"; 	if(sTime1MS >= 10)//1MS
	MOVIA	0x0a
	SUBAR	_isr_sTime1MS_65536_44,W
	BTRSS	STATUS,0
	MGOTO	_02026_DS_
	.line	78, "isr.c"; 	sTime1MS = 0;
	CLRR	_isr_sTime1MS_65536_44
	.line	79, "isr.c"; 	f_1ms_TimeOut = 1;
	BANKSEL	_sys_flag_2
	BSR	_sys_flag_2,4
	.line	82, "isr.c"; 	if(temptimecount)
	BANKSEL	_temptimecount
	MOVR	(_temptimecount + 1),W
	IORAR	_temptimecount,W
	BTRSC	STATUS,2
	MGOTO	_02010_DS_
	.line	83, "isr.c"; 	temptimecount--;
	MOVIA	0xff
	ADDAR	_temptimecount,F
	MOVIA	0xff
	ADCAR	(_temptimecount + 1),F
_02010_DS_:
	.line	84, "isr.c"; 	if(SmokingKeepTime)
	BANKSEL	_SmokingKeepTime
	MOVR	(_SmokingKeepTime + 1),W
	IORAR	_SmokingKeepTime,W
	BTRSC	STATUS,2
	MGOTO	_02012_DS_
	.line	85, "isr.c"; 	SmokingKeepTime--;
	MOVIA	0xff
	ADDAR	_SmokingKeepTime,F
	MOVIA	0xff
	ADCAR	(_SmokingKeepTime + 1),F
_02012_DS_:
	.line	101, "isr.c"; 	sTime10ms++;
	BANKSEL	_isr_sTime10ms_65536_44
	INCR	_isr_sTime10ms_65536_44,F
;;unsigned compare: left < lit(0x9=9), size=1
	.line	102, "isr.c"; 	if(sTime10ms >= 9)//10ms
	MOVIA	0x09
	SUBAR	_isr_sTime10ms_65536_44,W
	BTRSS	STATUS,0
	MGOTO	_02026_DS_
	.line	104, "isr.c"; 	sTime10ms = 0;
	CLRR	_isr_sTime10ms_65536_44
	.line	109, "isr.c"; 	f_10ms_TimeOut = 1;
	BANKSEL	_sys_flag_3
	BSR	_sys_flag_3,4
	.line	110, "isr.c"; 	f_charge_check = 1;
	BANKSEL	_sys_flag_0
	BSR	_sys_flag_0,3
	.line	111, "isr.c"; 	f_bat_lvd_check = 1;
	BANKSEL	_sys_flag_3
	BSR	_sys_flag_3,5
	.line	112, "isr.c"; 	f_heat_check = 1;
	BSR	_sys_flag_3,1
	.line	113, "isr.c"; 	f_sleep_check = 1;
	BANKSEL	_sys_flag_1
	BSR	_sys_flag_1,6
	.line	114, "isr.c"; 	f_battery_check = 1;
	BSR	_sys_flag_1,0
	.line	126, "isr.c"; 	if(LedShowKeepTime)
	BANKSEL	_LedShowKeepTime
	MOVR	(_LedShowKeepTime + 1),W
	IORAR	_LedShowKeepTime,W
	BTRSC	STATUS,2
	MGOTO	_02014_DS_
	.line	127, "isr.c"; 	--LedShowKeepTime;	
	MOVIA	0xff
	ADDAR	_LedShowKeepTime,F
	MOVIA	0xff
	ADCAR	(_LedShowKeepTime + 1),F
_02014_DS_:
	.line	129, "isr.c"; 	if(disp_delay_time_cnt)
	BANKSEL	_disp_delay_time_cnt
	MOVR	_disp_delay_time_cnt,W
	BTRSS	STATUS,2
	.line	130, "isr.c"; 	disp_delay_time_cnt--;
	DECR	_disp_delay_time_cnt,F
	.line	134, "isr.c"; 	if(led_delay_keep_time)
	BANKSEL	_led_delay_keep_time
	MOVR	_led_delay_keep_time,W
	BTRSS	STATUS,2
	.line	135, "isr.c"; 	--led_delay_keep_time;	
	DECR	_led_delay_keep_time,F
	.line	137, "isr.c"; 	sTime100ms++;
	BANKSEL	_isr_sTime100ms_65536_44
	INCR	_isr_sTime100ms_65536_44,F
	.line	138, "isr.c"; 	if(sTime100ms >= 10)//100ms
	MOVIA	0x0a
	SUBAR	_isr_sTime100ms_65536_44,W
	BTRSS	STATUS,0
	MGOTO	_02026_DS_
	.line	140, "isr.c"; 	sTime100ms = 0;
	CLRR	_isr_sTime100ms_65536_44
	.line	142, "isr.c"; 	f_1s_chrg_TimeOut = 1;
	BANKSEL	_sys_flag_3
	BSR	_sys_flag_3,7
_02026_DS_:
	.line	203, "isr.c"; 	if(INTFbits.T1IF)//25us
	BTRSS	_INTFbits,3
	MGOTO	_02039_DS_
	.line	205, "isr.c"; 	INTFbits.T1IF = 0;
	MOVIA	0xf7
	MOVAR	(_INTFbits + 0)
	.line	207, "isr.c"; 	if(SmokeState == STATE_SMOKING)//4
	BANKSEL	_SmokeState
	MOVR	_SmokeState,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_02035_DS_
	.line	209, "isr.c"; 	PwmCycleCount++;
	BANKSEL	_PwmCycleCount
	INCR	_PwmCycleCount,F
;;unsigned compare: left < lit(0x46=70), size=1
	.line	210, "isr.c"; 	if(PwmCycleCount>= DUTY_ALL) 
	MOVIA	0x46
	SUBAR	_PwmCycleCount,W
	BTRSC	STATUS,0
	.line	212, "isr.c"; 	PwmCycleCount = 0;
	CLRR	_PwmCycleCount
	.line	214, "isr.c"; 	if(PwmCycleCount < percent_nun)
	BANKSEL	_percent_nun
	MOVR	_percent_nun,W
	BANKSEL	_PwmCycleCount
	SUBAR	_PwmCycleCount,W
	BTRSC	STATUS,0
	MGOTO	_02032_DS_
	.line	216, "isr.c"; 	I0_PWM2 = MT_ON;
	BCR	_PORTBbits,2
	.line	270, "isr.c"; 	ADMDbits.START = 1;
	BSR	_ADMDbits,6
	.line	271, "isr.c"; 	F_wait_eoc();
	MCALL	_F_wait_eoc
	.line	272, "isr.c"; 	ADMDbits.START = 1;
	BSR	_ADMDbits,6
	.line	273, "isr.c"; 	F_wait_eoc();
	MCALL	_F_wait_eoc
	.line	274, "isr.c"; 	adc_value_tmp = ADD;		//Store AIN4's ADC data bit 11~4
	MOVR	_ADD,W
	BANKSEL	_adc_value_tmp
	MOVAR	_adc_value_tmp
	CLRR	(_adc_value_tmp + 1)
	.line	275, "isr.c"; 	adc_value_tmp = adc_value_tmp << 4;
	SWAPR	(_adc_value_tmp + 1),W
	ANDIA	0xf0
	MOVAR	(_adc_value_tmp + 1)
	SWAPR	_adc_value_tmp,W
	MOVAR	_adc_value_tmp
	ANDIA	0x0f
	IORAR	(_adc_value_tmp + 1),F
	XORAR	_adc_value_tmp,F
	.line	276, "isr.c"; 	adc_value_tmp |= (0x0F & ADR);//得到12bit ADC值	
	MOVIA	0x0f
	ANDAR	_ADR,W
;;1	MOVAR	r0x1018
;;1	MOVAR	r0x1019
	IORAR	_adc_value_tmp,F
	MOVIA	0x00
	IORAR	(_adc_value_tmp + 1),F
;;unsigned compare: left < lit(0xED8=3800), size=2
	.line	277, "isr.c"; 	if(adc_value_tmp < 3800)//3820//3600//3700
	MOVIA	0xd8
	SUBAR	_adc_value_tmp,W
	MOVIA	0x0e
	SBCAR	(_adc_value_tmp + 1),W
	BTRSC	STATUS,0
	MGOTO	_02039_DS_
	.line	280, "isr.c"; 	I0_PWM2 = MT_OF;
	BSR	_PORTBbits,2
	.line	281, "isr.c"; 	percent_nun = 0;
	BANKSEL	_percent_nun
	CLRR	_percent_nun
	.line	283, "isr.c"; 	msg = MSG_CURRENT_OVER;
	MOVIA	0x09
	BANKSEL	_msg
	MOVAR	_msg
	.line	284, "isr.c"; 	SmokeState = STATE_SMOKE_IDLE;
	BANKSEL	_SmokeState
	CLRR	_SmokeState
	MGOTO	_02039_DS_
_02032_DS_:
	.line	291, "isr.c"; 	I0_PWM2 = MT_OF;
	BSR	_PORTBbits,2
	.line	292, "isr.c"; 	ad_start_flg = 0;
	BANKSEL	_ad_start_flg
	CLRR	_ad_start_flg
	MGOTO	_02039_DS_
_02035_DS_:
	.line	299, "isr.c"; 	percent_nun = 0;
	BANKSEL	_percent_nun
	CLRR	_percent_nun
	.line	300, "isr.c"; 	I0_PWM2 = MT_OF;
	BSR	_PORTBbits,2
	.line	301, "isr.c"; 	ad_start_flg = 0;
	BANKSEL	_ad_start_flg
	CLRR	_ad_start_flg
_02039_DS_:
	.line	346, "isr.c"; 	}
	BANKSEL	___sdcc_saved_stk01
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	BANKSEL	___sdcc_saved_stk00
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
	BANKSEL	___sdcc_saved_fsr
	MOVR	___sdcc_saved_fsr,W
	MOVAR	FSR
	MOVR	PSAVE,W
	MOVAR	PCHBUF
	CLRR	STATUS
	SWAPR	SSAVE,W
	MOVAR	STATUS
	SWAPR	WSAVE,F
	SWAPR	WSAVE,W
END_OF_INTERRUPT:
	RETIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
; code_isr	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=isr, function=_isr_param_init
	.debuginfo subprogram _isr_param_init
_isr_param_init:
; 2 exit points
	.line	40, "isr.c"; 	time_base_250ms = TIME_BASE_250MS;
	MOVIA	0x19
	BANKSEL	_time_base_250ms
	MOVAR	_time_base_250ms
	.line	41, "isr.c"; 	time_base_1s = TIME_BASE_1S;
	MOVIA	0x64
	BANKSEL	_time_base_1s
	MOVAR	_time_base_1s
	.line	42, "isr.c"; 	time_base = 0;
	BANKSEL	_time_base
	CLRR	_time_base
	.line	43, "isr.c"; 	PwmCycleCount = 0;
	BANKSEL	_PwmCycleCount
	CLRR	_PwmCycleCount
	.line	44, "isr.c"; 	percent_nun = 0;
	BANKSEL	_percent_nun
	CLRR	_percent_nun
	.line	46, "isr.c"; 	ad_start_flg = 0;
	BANKSEL	_ad_start_flg
	CLRR	_ad_start_flg
	.line	47, "isr.c"; 	}
	RETURN	
; exit point of _isr_param_init


;	code size estimation:
;	  155+   37 =   192 instructions (  458 byte)

	end
