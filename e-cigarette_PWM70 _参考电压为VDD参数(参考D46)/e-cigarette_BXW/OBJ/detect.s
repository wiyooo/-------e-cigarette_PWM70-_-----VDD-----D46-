;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"detect.c"
	list	p=NY8B062F,c=on
	#include "ny8b062f.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_Detect_OverCurrent_ByIO
	extern	_Get_ADC_Value
	extern	_ledRun
	extern	_Detect_OverCurrent_ByAD
	extern	_Get_Onetime_Bat_ADCValue
	extern	_Ledbreathing
	extern	_LedOff
	extern	_SetLedColorNormallyOn
	extern	_SetLedBreathingParameters2
	extern	_SetLedBreathingParameters
	extern	_SetLedFlashParameters
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
	extern	_battery_check
	extern	_battery_param_init
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
	extern	_temptimecount
	extern	_sleep_delay_keep_time
	extern	_running_keep_time
	extern	_usb_flag
	extern	_HeatingKeepTime
	extern	_KeyDowmTimeCount
	extern	_VolTypeIndex
	extern	_BatVolLevel
	extern	_SaveHeaterIOStatus
	extern	_MotorDutySet
	extern	_NowMotorDuty
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
	extern	_HeaterExistdetect
	extern	_Get_Bat_ChrgBat_ADCValue
	extern	_AdjustHeatPwm
	extern	_Get_adc_data
	extern	_getAbs
	extern	_NOP10_
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
	extern	_g_u16ADCvalue
	extern	_g_u8ReadAdcCount
	extern	_disp_delay_time_cnt
	extern	_now_ch
	extern	_battery_low_cnt
	extern	_HeatPlugInsert_flag
	extern	_HeatPlugInsertTimeCount
	extern	_HeatCount
	extern	_SmokeState
	extern	_SmokingKeepTime
	extern	_TargetMotorDuty
	extern	_usb_check_ad_time_cnt
	extern	_OverCurrent_adc_value
	extern	_OverCurrent_check_cnt
	extern	_Bat_adc_value
	extern	_Bat_check_cnt
	extern	_gAdcDataValueBak
	extern	_gAdcDataValue
	extern	_TmpAdcDataValue
	extern	_ChrgFullTimeCount
	extern	_Heat_Off_time_count
	extern	_Heat_On_time_count
	extern	_Chrg_Off_time_count
	extern	_Chrg_On_time_count
	extern	_detect_param_init
	extern	_ADC_Convert_Pre
	extern	_F_wait_eoc
	extern	_adc_get
	extern	_BaseBatSetPWMValue
	extern	_charge_check_by_IO
	extern	_bat_lvd_check
	extern	_SmokeFun

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_Chrg_On_time_count:
	.res 1
	.debuginfo complex-type (symbol "_Chrg_On_time_count" 1 global "detect.c" 20 (basetype 1 unsigned))

.segment "uninit"
_Chrg_Off_time_count:
	.res 1
	.debuginfo complex-type (symbol "_Chrg_Off_time_count" 1 global "detect.c" 21 (basetype 1 unsigned))

.segment "uninit"
_Heat_On_time_count:
	.res 1
	.debuginfo complex-type (symbol "_Heat_On_time_count" 1 global "detect.c" 22 (basetype 1 unsigned))

.segment "uninit"
_Heat_Off_time_count:
	.res 1
	.debuginfo complex-type (symbol "_Heat_Off_time_count" 1 global "detect.c" 23 (basetype 1 unsigned))

.segment "uninit"
_ChrgFullTimeCount:
	.res 2
	.debuginfo complex-type (symbol "_ChrgFullTimeCount" 2 global "detect.c" 25 (basetype 2 unsigned))

.segment "uninit"
_TmpAdcDataValue:
	.res 2
	.debuginfo complex-type (symbol "_TmpAdcDataValue" 2 global "detect.c" 31 (basetype 2 unsigned))

.segment "uninit"
_gAdcDataValue:
	.res 2
	.debuginfo complex-type (symbol "_gAdcDataValue" 2 global "detect.c" 32 (basetype 2 unsigned))

.segment "uninit"
_gAdcDataValueBak:
	.res 2
	.debuginfo complex-type (symbol "_gAdcDataValueBak" 2 global "detect.c" 33 (basetype 2 unsigned))

.segment "uninit"
_Bat_check_cnt:
	.res 1
	.debuginfo complex-type (symbol "_Bat_check_cnt" 1 global "detect.c" 34 (basetype 1 unsigned))

.segment "uninit"
_Bat_adc_value:
	.res 2
	.debuginfo complex-type (symbol "_Bat_adc_value" 2 global "detect.c" 35 (basetype 2 unsigned))

.segment "uninit"
_OverCurrent_check_cnt:
	.res 1
	.debuginfo complex-type (symbol "_OverCurrent_check_cnt" 1 global "detect.c" 36 (basetype 1 unsigned))

.segment "uninit"
_OverCurrent_adc_value:
	.res 2
	.debuginfo complex-type (symbol "_OverCurrent_adc_value" 2 global "detect.c" 37 (basetype 2 unsigned))

.segment "uninit"
_usb_check_ad_time_cnt:
	.res 1
	.debuginfo complex-type (symbol "_usb_check_ad_time_cnt" 1 global "detect.c" 38 (basetype 1 unsigned))

.segment "uninit"
_TargetMotorDuty:
	.res 1
	.debuginfo complex-type (symbol "_TargetMotorDuty" 1 global "detect.c" 43 (basetype 1 unsigned))

.segment "uninit"
_SmokingKeepTime:
	.res 2
	.debuginfo complex-type (symbol "_SmokingKeepTime" 2 global "detect.c" 57 (basetype 2 unsigned))

.segment "uninit"
_SmokeState:
	.res 1
	.debuginfo complex-type (symbol "_SmokeState" 1 global "detect.c" 58 (basetype 1 unsigned))

.segment "uninit"
_HeatCount:
	.res 1
	.debuginfo complex-type (symbol "_HeatCount" 1 global "detect.c" 59 (basetype 1 unsigned))

.segment "uninit"
_HeatPlugInsertTimeCount:
	.res 2
	.debuginfo complex-type (symbol "_HeatPlugInsertTimeCount" 2 global "detect.c" 60 (basetype 2 unsigned))

.segment "uninit"
_HeatPlugInsert_flag:
	.res 1
	.debuginfo complex-type (symbol "_HeatPlugInsert_flag" 1 global "detect.c" 61 (basetype 1 unsigned))

.segment "uninit"
_battery_low_cnt:
	.res 1
	.debuginfo complex-type (symbol "_battery_low_cnt" 1 global "detect.c" 63 (basetype 1 unsigned))

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x1040:
	.res	1
.segment "uninit"
r0x103F:
	.res	1
.segment "uninit"
r0x1041:
	.res	1
.segment "uninit"
r0x1042:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_now_ch:
	.debuginfo complex-type (symbol "_now_ch" 1 global "detect.c" 65 (basetype 1 unsigned))

	dw	0x01	; 1


.segment "idata"
_disp_delay_time_cnt:
	.debuginfo complex-type (symbol "_disp_delay_time_cnt" 1 global "detect.c" 66 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_g_u8ReadAdcCount:
	.debuginfo complex-type (symbol "_g_u8ReadAdcCount" 1 global "detect.c" 254 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_g_u16ADCvalue:
	.debuginfo complex-type (symbol "_g_u16ADCvalue" 2 global "detect.c" 255 (basetype 2 unsigned))

	dw	0x00, 0x00	; 0


.segment "idata"
_s_u16MostValue:
	.debuginfo complex-type (symbol "_s_u16MostValue" 2 local "detect.c" 256 (basetype 2 unsigned))

	dw	0x00, 0x00	; 0


.segment "idata"
_s_u16LeastValue:
	.debuginfo complex-type (symbol "_s_u16LeastValue" 2 local "detect.c" 257 (basetype 2 unsigned))

	dw	0x00, 0x00	; 0


.segment "idata"
_s_u16Sum:
	.debuginfo complex-type (symbol "_s_u16Sum" 2 local "detect.c" 258 (basetype 2 unsigned))

	dw	0x00, 0x00	; 0

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
; code_detect	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _adc_init4
;   _adc_get
;   _adc_init4
;   _adc_get
;   _adc_get
;   _adc_init4
;   _adc_get
;   _BaseBatSetPWMValue
;   _SetLedBreathingParameters2
;   _LedOff
;   _BaseBatSetPWMValue
;   _adc_init4
;   _adc_get
;   _adc_init4
;   _adc_get
;   _adc_get
;   _adc_init4
;   _adc_get
;   _BaseBatSetPWMValue
;   _SetLedBreathingParameters2
;   _LedOff
;   _BaseBatSetPWMValue
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=detect, function=_SmokeFun
	.debuginfo subprogram _SmokeFun
_SmokeFun:
; 2 exit points
	.line	995, "detect.c"; 	switch(SmokeState)
	BANKSEL	_SmokeState
	MOVR	_SmokeState,W
	BTRSC	STATUS,2
	MGOTO	_02292_DS_
	MOVR	_SmokeState,W
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_02314_DS_
	MOVR	_SmokeState,W
	XORIA	0x02
	BTRSC	STATUS,2
	MGOTO	_02315_DS_
	MOVR	_SmokeState,W
	XORIA	0x03
	BTRSC	STATUS,2
	MGOTO	_02324_DS_
	MOVR	_SmokeState,W
	XORIA	0x04
	BTRSC	STATUS,2
	MGOTO	_02328_DS_
	MOVR	_SmokeState,W
	XORIA	0x05
	BTRSC	STATUS,2
	MGOTO	_02336_DS_
	MGOTO	_02343_DS_
_02292_DS_:
	.line	998, "detect.c"; 	if(b_pause_chrg)
	BANKSEL	_sys_flag_2
	BTRSS	_sys_flag_2,7
	MGOTO	_02294_DS_
	.line	1000, "detect.c"; 	b_pause_chrg = 0;
	BCR	_sys_flag_2,7
	.line	1001, "detect.c"; 	EN_RESUME_CHRG;//充电状态下吸烟停止时恢复充电电流
	BCR	_PORTAbits,5
_02294_DS_:
	.line	1003, "detect.c"; 	if(b_smoking)
	BANKSEL	_sys_flag_1
	BTRSC	_sys_flag_1,1
	MGOTO	_02343_DS_
	.line	1005, "detect.c"; 	if(f_charging)
	BANKSEL	_sys_flag_0
	BTRSS	_sys_flag_0,6
	MGOTO	_02343_DS_
	.line	1007, "detect.c"; 	f_battery_low = 0;
	BCR	_sys_flag_0,5
	.line	1009, "detect.c"; 	if(f_charge_full)
	BTRSC	_sys_flag_0,4
	MGOTO	_02343_DS_
	.line	1013, "detect.c"; 	if(f_1s_chrg_TimeOut)//100ms
	BANKSEL	_sys_flag_3
	BTRSS	_sys_flag_3,7
	MGOTO	_02343_DS_
	.line	1015, "detect.c"; 	f_1s_chrg_TimeOut = 0;
	BCR	_sys_flag_3,7
	.line	1016, "detect.c"; 	if(now_ch != Quarter_VDD)
	BANKSEL	_now_ch
	MOVR	_now_ch,W
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_02300_DS_
	.line	1018, "detect.c"; 	adc_init4(ADC_CHANNEL2);
	MOVIA	0x03
	MCALL	_adc_init4
_02300_DS_:
	.line	1020, "detect.c"; 	gAdcDataValueBak = adc_get(C_Quarter_VDD);
	MOVIA	0x0b
	MCALL	_adc_get
	BANKSEL	_gAdcDataValueBak
	MOVAR	(_gAdcDataValueBak + 1)
	MOVR	STK00,W
	MOVAR	_gAdcDataValueBak
;;unsigned compare: left < lit(0x83D=2109), size=2
	.line	1022, "detect.c"; 	if(gAdcDataValueBak >= BAT_VOL4P12_ADC_VALUE)//BAT_VOL4P18_ADC_VALUE
	MOVIA	0x3d
	SUBAR	_gAdcDataValueBak,W
	MOVIA	0x08
	SBCAR	(_gAdcDataValueBak + 1),W
	BTRSS	STATUS,0
	MGOTO	_02308_DS_
	.line	1024, "detect.c"; 	usb_check_ad_time_cnt = 0;
	BANKSEL	_usb_check_ad_time_cnt
	CLRR	_usb_check_ad_time_cnt
	.line	1025, "detect.c"; 	ChrgFullTimeCount++;
	BANKSEL	_ChrgFullTimeCount
	INCR	_ChrgFullTimeCount,F
	BTRSC	STATUS,2
	INCR	(_ChrgFullTimeCount + 1),F
;;unsigned compare: left < lit(0x14=20), size=2
	.line	1026, "detect.c"; 	if(ChrgFullTimeCount >= 20)//达到阈值后继续统计
	MOVIA	0x14
	SUBAR	_ChrgFullTimeCount,W
	MOVIA	0x00
	SBCAR	(_ChrgFullTimeCount + 1),W
	BTRSS	STATUS,0
	MGOTO	_02343_DS_
	.line	1028, "detect.c"; 	ChrgFullTimeCount = 0;
	CLRR	_ChrgFullTimeCount
	CLRR	(_ChrgFullTimeCount + 1)
	.line	1029, "detect.c"; 	f_charge_full = 1;
	BANKSEL	_sys_flag_0
	BSR	_sys_flag_0,4
	.line	1030, "detect.c"; 	msg = MSG_CHRG_FULL;
	MOVIA	0x07
	BANKSEL	_msg
	MOVAR	_msg
	MGOTO	_02343_DS_
_02308_DS_:
	.line	1035, "detect.c"; 	ChrgFullTimeCount = 0;
	BANKSEL	_ChrgFullTimeCount
	CLRR	_ChrgFullTimeCount
	CLRR	(_ChrgFullTimeCount + 1)
	.line	1036, "detect.c"; 	usb_check_ad_time_cnt++;
	BANKSEL	_usb_check_ad_time_cnt
	INCR	_usb_check_ad_time_cnt,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x15=21), size=1
	.line	1037, "detect.c"; 	if(usb_check_ad_time_cnt > 20)
	MOVIA	0x15
	SUBAR	_usb_check_ad_time_cnt,W
	BTRSS	STATUS,0
	MGOTO	_02343_DS_
	.line	1039, "detect.c"; 	usb_check_ad_time_cnt = 0;
	CLRR	_usb_check_ad_time_cnt
	.line	1040, "detect.c"; 	if(f_charge_full)
	BANKSEL	_sys_flag_0
	BTRSS	_sys_flag_0,4
	MGOTO	_02343_DS_
	.line	1042, "detect.c"; 	f_charge_full = 0;
	BCR	_sys_flag_0,4
	.line	1043, "detect.c"; 	msg = MSG_CHRG;//插入USB充电
	MOVIA	0x03
	BANKSEL	_msg
	MOVAR	_msg
	.line	1050, "detect.c"; 	break;
	MGOTO	_02343_DS_
_02314_DS_:
	.line	1053, "detect.c"; 	b_heater_detect_mask = 1;
	BANKSEL	_sys_flag_2
	BSR	_sys_flag_2,5
	.line	1055, "detect.c"; 	adc_init4(Quarter_VDD);
	MOVIA	0x01
	MCALL	_adc_init4
	.line	1056, "detect.c"; 	SmokeState = STATE_SMOKE_CHECK_BAT_LOW;
	MOVIA	0x02
	BANKSEL	_SmokeState
	MOVAR	_SmokeState
	.line	1057, "detect.c"; 	break;
	MGOTO	_02343_DS_
;;unsigned compare: left < lit(0x14=20), size=1
_02315_DS_:
	.line	1060, "detect.c"; 	if(disp_delay_time_cnt < 20)
	MOVIA	0x14
	BANKSEL	_disp_delay_time_cnt
	SUBAR	_disp_delay_time_cnt,W
	BTRSC	STATUS,0
	MGOTO	_02317_DS_
	.line	1062, "detect.c"; 	gAdcDataValueBak = adc_get(C_Quarter_VDD);
	MOVIA	0x0b
	MCALL	_adc_get
	BANKSEL	_gAdcDataValueBak
	MOVAR	(_gAdcDataValueBak + 1)
	MOVR	STK00,W
	MOVAR	_gAdcDataValueBak
	.line	1063, "detect.c"; 	gAdcDataValueBak = gAdcDataValueBak + 20;
	MOVIA	0x14
	ADDAR	_gAdcDataValueBak,F
	MOVIA	0x00
	ADCAR	(_gAdcDataValueBak + 1),F
_02317_DS_:
	.line	1065, "detect.c"; 	if(f_charging)
	BANKSEL	_sys_flag_0
	BTRSS	_sys_flag_0,6
	MGOTO	_02319_DS_
	.line	1067, "detect.c"; 	SmokeState = STATE_SMOKE_CHECK_OC;
	MOVIA	0x03
	BANKSEL	_SmokeState
	MOVAR	_SmokeState
	.line	1068, "detect.c"; 	break;
	MGOTO	_02343_DS_
;;unsigned compare: left < lit(0x6E6=1766), size=2
_02319_DS_:
	.line	1074, "detect.c"; 	if((gAdcDataValueBak < BAT_VOL3P45_ADC_VALUE)||f_battery_low)//BAT_VOL3P40_ADC_VALUE
	MOVIA	0xe6
	BANKSEL	_gAdcDataValueBak
	SUBAR	_gAdcDataValueBak,W
	MOVIA	0x06
	SBCAR	(_gAdcDataValueBak + 1),W
	BTRSS	STATUS,0
	MGOTO	_02320_DS_
	BANKSEL	_sys_flag_0
	BTRSS	_sys_flag_0,5
	MGOTO	_02321_DS_
_02320_DS_:
	.line	1077, "detect.c"; 	msg = MSG_LVD;
	MOVIA	0x08
	BANKSEL	_msg
	MOVAR	_msg
	.line	1079, "detect.c"; 	b_smoke_init = 0;
	BANKSEL	_sys_flag_0
	BCR	_sys_flag_0,1
	MGOTO	_02343_DS_
_02321_DS_:
	.line	1084, "detect.c"; 	SmokeState = STATE_SMOKE_CHECK_OC;
	MOVIA	0x03
	BANKSEL	_SmokeState
	MOVAR	_SmokeState
	.line	1089, "detect.c"; 	break;
	MGOTO	_02343_DS_
_02324_DS_:
	.line	1092, "detect.c"; 	b_heater_detect_mask = 1;
	BANKSEL	_sys_flag_2
	BSR	_sys_flag_2,5
	.line	1093, "detect.c"; 	gAdcDataValue = adc_get(C_ADC_PA0);
	MOVIA	0x00
	MCALL	_adc_get
	BANKSEL	_gAdcDataValue
	MOVAR	(_gAdcDataValue + 1)
	MOVR	STK00,W
	MOVAR	_gAdcDataValue
	.line	1094, "detect.c"; 	b_heater_detect_mask = 0;
	BANKSEL	_sys_flag_2
	BCR	_sys_flag_2,5
;;unsigned compare: left < lit(0xBB8=3000), size=2
	.line	1097, "detect.c"; 	if(gAdcDataValue >= 3000)//4000
	MOVIA	0xb8
	BANKSEL	_gAdcDataValue
	SUBAR	_gAdcDataValue,W
	MOVIA	0x0b
	SBCAR	(_gAdcDataValue + 1),W
	BTRSS	STATUS,0
	MGOTO	_02326_DS_
	.line	1101, "detect.c"; 	msg = MSG_CURRENT_OVER;
	MOVIA	0x09
	BANKSEL	_msg
	MOVAR	_msg
	.line	1102, "detect.c"; 	b_smoke_init = 0;
	BANKSEL	_sys_flag_0
	BCR	_sys_flag_0,1
	MGOTO	_02343_DS_
_02326_DS_:
	.line	1106, "detect.c"; 	SmokeState = STATE_SMOKE_PARAM_SET;
	MOVIA	0x04
	BANKSEL	_SmokeState
	MOVAR	_SmokeState
	.line	1111, "detect.c"; 	break;
	MGOTO	_02343_DS_
_02328_DS_:
	.line	1117, "detect.c"; 	adc_init4(ADC_CHANNEL2);
	MOVIA	0x03
	MCALL	_adc_init4
	.line	1118, "detect.c"; 	adc_get(C_ADC_PA0);
	MOVIA	0x00
	MCALL	_adc_get
	.line	1119, "detect.c"; 	b_smoke_init = 0;//初始化结束	
	BANKSEL	_sys_flag_0
	BCR	_sys_flag_0,1
	.line	1120, "detect.c"; 	b_smoking = 1;//设置吸烟开始标志
	BANKSEL	_sys_flag_1
	BSR	_sys_flag_1,1
	.line	1122, "detect.c"; 	LedShowKeepTime = 795;//765//720;//760;////默认吸烟时间为10S，达到时关闭输出，蓝灯闪3次(单位10ms)
	MOVIA	0x1b
	BANKSEL	_LedShowKeepTime
	MOVAR	_LedShowKeepTime
	MOVIA	0x03
	MOVAR	(_LedShowKeepTime + 1)
	.line	1123, "detect.c"; 	SmokingKeepTime = 245;//单位1ms 吸烟时长，主要是为了处理在吸烟前0.3秒是否需要全功率输出的问题
	MOVIA	0xf5
	BANKSEL	_SmokingKeepTime
	MOVAR	_SmokingKeepTime
	CLRR	(_SmokingKeepTime + 1)
	.line	1124, "detect.c"; 	BaseBatSetPWMValue();
	MCALL	_BaseBatSetPWMValue
	.line	1126, "detect.c"; 	SetLedBreathingParameters2(COLOR_GREEN);//开始白灯呼吸效果
	MOVIA	0x02
	MCALL	_SetLedBreathingParameters2
	.line	1127, "detect.c"; 	LedOff();	
	MCALL	_LedOff
	.line	1128, "detect.c"; 	PwmCycleCount = 0;
	BANKSEL	_PwmCycleCount
	CLRR	_PwmCycleCount
	.line	1129, "detect.c"; 	if(f_charging||(C_IO_CHRG == 0)||C_IO_USB_DEC)
	BANKSEL	_sys_flag_0
	BTRSC	_sys_flag_0,6
	MGOTO	_02329_DS_
	BTRSS	_PORTAbits,2
	MGOTO	_02329_DS_
	BTRSS	_PORTAbits,4
	MGOTO	_02330_DS_
_02329_DS_:
	.line	1131, "detect.c"; 	b_pause_chrg = 1;
	BANKSEL	_sys_flag_2
	BSR	_sys_flag_2,7
	.line	1132, "detect.c"; 	EN_PAUSE_CHRG;//充电状态下吸烟时临时关闭充电电流
	BSR	_PORTAbits,5
_02330_DS_:
	.line	1135, "detect.c"; 	SmokeState = STATE_SMOKING;
	MOVIA	0x05
	BANKSEL	_SmokeState
	MOVAR	_SmokeState
;;unsigned compare: left < lit(0x7CC=1996), size=2
	.line	1137, "detect.c"; 	if(gAdcDataValueBak >= BAT_VOL3P90_ADC_VALUE)
	MOVIA	0xcc
	BANKSEL	_gAdcDataValueBak
	SUBAR	_gAdcDataValueBak,W
	MOVIA	0x07
	SBCAR	(_gAdcDataValueBak + 1),W
	BTRSS	STATUS,0
	MGOTO	_02334_DS_
	.line	1139, "detect.c"; 	percent_nun = TargetMotorDuty;
	BANKSEL	_TargetMotorDuty
	MOVR	_TargetMotorDuty,W
	BANKSEL	_percent_nun
	MOVAR	_percent_nun
	MGOTO	_02335_DS_
_02334_DS_:
	.line	1143, "detect.c"; 	percent_nun = DUTY_ALL;
	MOVIA	0x46
	BANKSEL	_percent_nun
	MOVAR	_percent_nun
_02335_DS_:
	.line	1145, "detect.c"; 	temp_flag = 0;
	BANKSEL	_sys_flag_2
	BCR	_sys_flag_2,0
	.line	1146, "detect.c"; 	break;
	MGOTO	_02343_DS_
_02336_DS_:
	.line	1149, "detect.c"; 	if(b_smoking)
	BANKSEL	_sys_flag_1
	BTRSS	_sys_flag_1,1
	MGOTO	_02343_DS_
	.line	1151, "detect.c"; 	if((SmokingKeepTime == 0)&&!temp_flag)
	BANKSEL	_SmokingKeepTime
	MOVR	(_SmokingKeepTime + 1),W
	IORAR	_SmokingKeepTime,W
	BTRSS	STATUS,2
	MGOTO	_02343_DS_
	BANKSEL	_sys_flag_2
	BTRSC	_sys_flag_2,0
	MGOTO	_02343_DS_
	.line	1154, "detect.c"; 	temp_flag = 1;
	BSR	_sys_flag_2,0
	.line	1155, "detect.c"; 	BaseBatSetPWMValue();
	MCALL	_BaseBatSetPWMValue
	.line	1156, "detect.c"; 	percent_nun = TargetMotorDuty;
	BANKSEL	_TargetMotorDuty
	MOVR	_TargetMotorDuty,W
	BANKSEL	_percent_nun
	MOVAR	_percent_nun
_02343_DS_:
	.line	1162, "detect.c"; 	}
	RETURN	
; exit point of _SmokeFun

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x102B
;; Starting pCode block
.segment "code"; module=detect, function=_bat_lvd_check
	.debuginfo subprogram _bat_lvd_check
_bat_lvd_check:
; 2 exit points
	.line	922, "detect.c"; 	if(SmokeState != STATE_SMOKING)
	BANKSEL	_SmokeState
	MOVR	_SmokeState,W
	XORIA	0x05
	BTRSS	STATUS,2
	.line	923, "detect.c"; 	return;
	MGOTO	_02269_DS_
	.line	924, "detect.c"; 	if(!f_bat_lvd_check)
	BANKSEL	_sys_flag_3
	BTRSS	_sys_flag_3,5
	.line	925, "detect.c"; 	return;
	MGOTO	_02269_DS_
_02263_DS_:
	.line	926, "detect.c"; 	f_bat_lvd_check = 0;	
	BANKSEL	_sys_flag_3
	BCR	_sys_flag_3,5
	.line	927, "detect.c"; 	if(PCON1&C_LVDOUT)
	IOSTR	_PCON1
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BTRSS	r0x102B,6
	MGOTO	_02267_DS_
	.line	943, "detect.c"; 	battery_low_cnt = 0;
	BANKSEL	_battery_low_cnt
	CLRR	_battery_low_cnt
	MGOTO	_02269_DS_
_02267_DS_:
	.line	947, "detect.c"; 	battery_low_cnt++;
	BANKSEL	_battery_low_cnt
	INCR	_battery_low_cnt,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x33=51), size=1
	.line	948, "detect.c"; 	if(battery_low_cnt > 50)//500ms
	MOVIA	0x33
	SUBAR	_battery_low_cnt,W
	BTRSS	STATUS,0
	MGOTO	_02269_DS_
	.line	950, "detect.c"; 	battery_low_cnt = 0;
	CLRR	_battery_low_cnt
	.line	956, "detect.c"; 	I0_PWM2 = MT_OF;
	BSR	_PORTBbits,2
	.line	957, "detect.c"; 	percent_nun = 0;
	BANKSEL	_percent_nun
	CLRR	_percent_nun
	.line	958, "detect.c"; 	msg = MSG_LVD;
	MOVIA	0x08
	BANKSEL	_msg
	MOVAR	_msg
_02269_DS_:
	.line	962, "detect.c"; 	}
	RETURN	
; exit point of _bat_lvd_check

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=detect, function=_charge_check_by_IO
	.debuginfo subprogram _charge_check_by_IO
_charge_check_by_IO:
; 2 exit points
	.line	839, "detect.c"; 	if((nowLedMode == 1)||b_pause_chrg)//吸烟时不检测USB插拔和充满检测
	BANKSEL	_nowLedMode
	MOVR	_nowLedMode,W
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_02207_DS_
	BANKSEL	_sys_flag_2
	BTRSC	_sys_flag_2,7
_02207_DS_:
	.line	840, "detect.c"; 	return;
	MGOTO	_02225_DS_
_02208_DS_:
	.line	841, "detect.c"; 	if(f_charge_check)//10ms
	BANKSEL	_sys_flag_0
	BTRSS	_sys_flag_0,3
	MGOTO	_02225_DS_
	.line	843, "detect.c"; 	f_charge_check = 0;
	BCR	_sys_flag_0,3
	.line	844, "detect.c"; 	if(C_IO_USB_DEC)//USB检测
	BTRSS	_PORTAbits,4
	MGOTO	_02221_DS_
	.line	846, "detect.c"; 	if(!f_charging)
	BTRSC	_sys_flag_0,6
	MGOTO	_02225_DS_
;;unsigned compare: left < lit(0x14=20), size=1
	.line	848, "detect.c"; 	if(Chrg_On_time_count < 20)
	MOVIA	0x14
	BANKSEL	_Chrg_On_time_count
	SUBAR	_Chrg_On_time_count,W
	BTRSC	STATUS,0
	MGOTO	_02211_DS_
	.line	850, "detect.c"; 	Chrg_On_time_count++;
	INCR	_Chrg_On_time_count,F
	MGOTO	_02225_DS_
_02211_DS_:
	.line	855, "detect.c"; 	ChrgFullTimeCount = 0;
	BANKSEL	_ChrgFullTimeCount
	CLRR	_ChrgFullTimeCount
	CLRR	(_ChrgFullTimeCount + 1)
	.line	856, "detect.c"; 	msg = MSG_CHRG;//插入USB充电
	MOVIA	0x03
	BANKSEL	_msg
	MOVAR	_msg
	MGOTO	_02225_DS_
_02221_DS_:
	.line	863, "detect.c"; 	if(f_charging)
	BANKSEL	_sys_flag_0
	BTRSS	_sys_flag_0,6
	MGOTO	_02225_DS_
	.line	865, "detect.c"; 	if(Chrg_On_time_count > 0)
	BANKSEL	_Chrg_On_time_count
	MOVR	_Chrg_On_time_count,W
	BTRSC	STATUS,2
	MGOTO	_02216_DS_
	.line	867, "detect.c"; 	Chrg_On_time_count--;
	DECR	_Chrg_On_time_count,F
	MGOTO	_02225_DS_
_02216_DS_:
	.line	872, "detect.c"; 	msg = MSG_CHRG_OFF; //拔出USB
	MOVIA	0x04
	BANKSEL	_msg
	MOVAR	_msg
_02225_DS_:
	.line	918, "detect.c"; 	}
	RETURN	
; exit point of _charge_check_by_IO

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x102C
;   r0x102D
;; Starting pCode block
.segment "code"; module=detect, function=_HeaterExistdetect
	.debuginfo subprogram _HeaterExistdetect
_HeaterExistdetect:
; 2 exit points
	.line	787, "detect.c"; 	if((nowLedMode == 1)||b_smoke_init||b_smoking||(IN_MIC == 1)||b_heater_detect_mask)//在加热时不检测发热丝的插拔
	BANKSEL	_nowLedMode
	MOVR	_nowLedMode,W
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_02126_DS_
	BANKSEL	_sys_flag_0
	BTRSC	_sys_flag_0,1
	MGOTO	_02126_DS_
	BANKSEL	_sys_flag_1
	BTRSC	_sys_flag_1,1
	MGOTO	_02126_DS_
	BANKSEL	r0x102C
	CLRR	r0x102C
	BTRSC	_PORTBbits,0
	INCR	r0x102C,F
	MOVR	r0x102C,W
;;1	MOVAR	r0x102D
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_02126_DS_
	BANKSEL	_sys_flag_2
	BTRSC	_sys_flag_2,5
_02126_DS_:
	.line	788, "detect.c"; 	return;
	MGOTO	_02151_DS_
_02127_DS_:
	.line	789, "detect.c"; 	C_ADC_OFF2;
	BCR	_ADMD,7
	BCR	_ADMDbits,6
	.line	790, "detect.c"; 	PACON = 0;//C_PA0_AIN0;
	CLRR	_PACON
	.line	791, "detect.c"; 	if(f_heat_check)//10ms
	BANKSEL	_sys_flag_3
	BTRSS	_sys_flag_3,1
	MGOTO	_02144_DS_
	.line	793, "detect.c"; 	f_heat_check = 0;
	BCR	_sys_flag_3,1
	.line	794, "detect.c"; 	if(C_IO_HEATER_CHECK_DEC == 0)//发热丝是否存在检测
	BTRSC	_PORTAbits,0
	MGOTO	_02141_DS_
	.line	796, "detect.c"; 	Heat_On_time_count = 0;
	BANKSEL	_Heat_On_time_count
	CLRR	_Heat_On_time_count
	.line	797, "detect.c"; 	if(!b_heater_exist_flag)
	BANKSEL	_sys_flag_2
	BTRSC	_sys_flag_2,1
	MGOTO	_02144_DS_
	.line	799, "detect.c"; 	Heat_Off_time_count++;
	BANKSEL	_Heat_Off_time_count
	INCR	_Heat_Off_time_count,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x6=6), size=1
	.line	800, "detect.c"; 	if(Heat_Off_time_count > 5)//70 Chrg_Off_time_count*10ms
	MOVIA	0x06
	SUBAR	_Heat_Off_time_count,W
	BTRSS	STATUS,0
	MGOTO	_02144_DS_
	.line	802, "detect.c"; 	Heat_Off_time_count = 0;
	CLRR	_Heat_Off_time_count
	.line	803, "detect.c"; 	b_heater_exist_flag = 1;
	BANKSEL	_sys_flag_2
	BSR	_sys_flag_2,1
	.line	804, "detect.c"; 	msg = MSG_INSERT_HEATER;//插入发热丝
	MOVIA	0x05
	BANKSEL	_msg
	MOVAR	_msg
	MGOTO	_02144_DS_
_02141_DS_:
	.line	811, "detect.c"; 	Heat_Off_time_count = 0;
	BANKSEL	_Heat_Off_time_count
	CLRR	_Heat_Off_time_count
	.line	812, "detect.c"; 	if(b_heater_exist_flag)
	BANKSEL	_sys_flag_2
	BTRSS	_sys_flag_2,1
	MGOTO	_02144_DS_
	.line	815, "detect.c"; 	Heat_On_time_count++;
	BANKSEL	_Heat_On_time_count
	INCR	_Heat_On_time_count,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x6=6), size=1
	.line	816, "detect.c"; 	if(Heat_On_time_count > 5)//70 Chrg_On_time_count*10ms
	MOVIA	0x06
	SUBAR	_Heat_On_time_count,W
	BTRSS	STATUS,0
	MGOTO	_02144_DS_
	.line	818, "detect.c"; 	Heat_On_time_count = 0;
	CLRR	_Heat_On_time_count
	.line	819, "detect.c"; 	b_heater_exist_flag = 0;
	BANKSEL	_sys_flag_2
	BCR	_sys_flag_2,1
	.line	820, "detect.c"; 	msg = MSG_PULLOUT_HEATER; //拔出发热丝
	MOVIA	0x06
	BANKSEL	_msg
	MOVAR	_msg
_02144_DS_:
	.line	825, "detect.c"; 	if((b_heater_exist_flag&&C_IO_HEATER_CHECK_DEC)||(!b_heater_exist_flag&&!C_IO_HEATER_CHECK_DEC))//主要是在检测过程中不能中途进入睡眠中
	BANKSEL	_sys_flag_2
	BTRSS	_sys_flag_2,1
	MGOTO	_02150_DS_
	BTRSC	_PORTAbits,0
	MGOTO	_02145_DS_
_02150_DS_:
	BANKSEL	_sys_flag_2
	BTRSC	_sys_flag_2,1
	MGOTO	_02146_DS_
	BTRSC	_PORTAbits,0
	MGOTO	_02146_DS_
_02145_DS_:
	.line	827, "detect.c"; 	b_heater_exist_check = 1;
	BANKSEL	_sys_flag_3
	BSR	_sys_flag_3,0
	MGOTO	_02147_DS_
_02146_DS_:
	.line	831, "detect.c"; 	b_heater_exist_check = 0;
	BANKSEL	_sys_flag_3
	BCR	_sys_flag_3,0
_02147_DS_:
	.line	833, "detect.c"; 	C_ADC_ON2;
	BSR	_ADMD,7
	BCR	_ADMDbits,6
	.line	834, "detect.c"; 	PACON = C_PA0_AIN0;
	MOVIA	0x01
	MOVAR	_PACON
_02151_DS_:
	.line	835, "detect.c"; 	}
	RETURN	
; exit point of _HeaterExistdetect

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=detect, function=_BaseBatSetPWMValue
	.debuginfo subprogram _BaseBatSetPWMValue
_BaseBatSetPWMValue:
; 2 exit points
;;unsigned compare: left < lit(0x85C=2140), size=2
	.line	692, "detect.c"; 	if(gAdcDataValueBak >= BAT_VOL4P18_ADC_VALUE)//BAT_VOL4P20_ADC_VALUE
	MOVIA	0x5c
	BANKSEL	_gAdcDataValueBak
	SUBAR	_gAdcDataValueBak,W
	MOVIA	0x08
	SBCAR	(_gAdcDataValueBak + 1),W
	BTRSS	STATUS,0
	MGOTO	_02119_DS_
	.line	694, "detect.c"; 	if(SmokingKeepTime)//3.9v/4.2v = 0.928
	BANKSEL	_SmokingKeepTime
	MOVR	(_SmokingKeepTime + 1),W
	IORAR	_SmokingKeepTime,W
	BTRSC	STATUS,2
	MGOTO	_02098_DS_
	.line	695, "detect.c"; 	TargetMotorDuty = 66;//
	MOVIA	0x42
	BANKSEL	_TargetMotorDuty
	MOVAR	_TargetMotorDuty
	MGOTO	_02121_DS_
_02098_DS_:
	.line	697, "detect.c"; 	TargetMotorDuty = 57;//57;//42;//43;//
	MOVIA	0x39
	BANKSEL	_TargetMotorDuty
	MOVAR	_TargetMotorDuty
	.line	697, "detect.c"; 	}
	MGOTO	_02121_DS_
;;unsigned compare: left < lit(0x829=2089), size=2
_02119_DS_:
	.line	699, "detect.c"; 	else if(gAdcDataValueBak >= BAT_VOL4P08_ADC_VALUE)
	MOVIA	0x29
	BANKSEL	_gAdcDataValueBak
	SUBAR	_gAdcDataValueBak,W
	MOVIA	0x08
	SBCAR	(_gAdcDataValueBak + 1),W
	BTRSS	STATUS,0
	MGOTO	_02116_DS_
	.line	701, "detect.c"; 	if(SmokingKeepTime)//3.9v/4.2v = 0.928
	BANKSEL	_SmokingKeepTime
	MOVR	(_SmokingKeepTime + 1),W
	IORAR	_SmokingKeepTime,W
	BTRSC	STATUS,2
	MGOTO	_02101_DS_
	.line	702, "detect.c"; 	TargetMotorDuty = 66;//
	MOVIA	0x42
	BANKSEL	_TargetMotorDuty
	MOVAR	_TargetMotorDuty
	MGOTO	_02121_DS_
_02101_DS_:
	.line	704, "detect.c"; 	TargetMotorDuty = 59;//59;//57;//42;//43;//
	MOVIA	0x3b
	BANKSEL	_TargetMotorDuty
	MOVAR	_TargetMotorDuty
	.line	704, "detect.c"; 	}
	MGOTO	_02121_DS_
;;unsigned compare: left < lit(0x7F5=2037), size=2
_02116_DS_:
	.line	706, "detect.c"; 	else if(gAdcDataValueBak >= BAT_VOL3P98_ADC_VALUE)
	MOVIA	0xf5
	BANKSEL	_gAdcDataValueBak
	SUBAR	_gAdcDataValueBak,W
	MOVIA	0x07
	SBCAR	(_gAdcDataValueBak + 1),W
	BTRSS	STATUS,0
	MGOTO	_02113_DS_
	.line	708, "detect.c"; 	if(SmokingKeepTime)//3.9v/4.2v = 0.928
	BANKSEL	_SmokingKeepTime
	MOVR	(_SmokingKeepTime + 1),W
	IORAR	_SmokingKeepTime,W
	BTRSC	STATUS,2
	MGOTO	_02104_DS_
	.line	709, "detect.c"; 	TargetMotorDuty = 69;//
	MOVIA	0x45
	BANKSEL	_TargetMotorDuty
	MOVAR	_TargetMotorDuty
	MGOTO	_02121_DS_
_02104_DS_:
	.line	711, "detect.c"; 	TargetMotorDuty = 63;//61;//62;//43;//45;//
	MOVIA	0x3f
	BANKSEL	_TargetMotorDuty
	MOVAR	_TargetMotorDuty
	.line	711, "detect.c"; 	}
	MGOTO	_02121_DS_
;;unsigned compare: left < lit(0x7C2=1986), size=2
_02113_DS_:
	.line	713, "detect.c"; 	else if(gAdcDataValueBak >= BAT_VOL3P88_ADC_VALUE)
	MOVIA	0xc2
	BANKSEL	_gAdcDataValueBak
	SUBAR	_gAdcDataValueBak,W
	MOVIA	0x07
	SBCAR	(_gAdcDataValueBak + 1),W
	BTRSS	STATUS,0
	MGOTO	_02110_DS_
	.line	715, "detect.c"; 	if(SmokingKeepTime)//3.9v/4.2v = 0.928
	BANKSEL	_SmokingKeepTime
	MOVR	(_SmokingKeepTime + 1),W
	IORAR	_SmokingKeepTime,W
	BTRSC	STATUS,2
	MGOTO	_02107_DS_
	.line	716, "detect.c"; 	TargetMotorDuty = DUTY_ALL;//
	MOVIA	0x46
	BANKSEL	_TargetMotorDuty
	MOVAR	_TargetMotorDuty
	MGOTO	_02121_DS_
_02107_DS_:
	.line	718, "detect.c"; 	TargetMotorDuty = 68;//49;//48;//46;//
	MOVIA	0x44
	BANKSEL	_TargetMotorDuty
	MOVAR	_TargetMotorDuty
	.line	718, "detect.c"; 	}
	MGOTO	_02121_DS_
_02110_DS_:
	.line	745, "detect.c"; 	TargetMotorDuty = DUTY_ALL;//
	MOVIA	0x46
	BANKSEL	_TargetMotorDuty
	MOVAR	_TargetMotorDuty
_02121_DS_:
	.line	766, "detect.c"; 	}
	RETURN	
; exit point of _BaseBatSetPWMValue

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ADC_Convert_Pre
;   _F_wait_eoc
;   _ADC_Convert_Pre
;   _F_wait_eoc
;5 compiler assigned registers:
;   r0x102F
;   r0x1030
;   r0x1031
;   r0x1032
;   r0x1033
;; Starting pCode block
.segment "code"; module=detect, function=_Get_Bat_ChrgBat_ADCValue
	.debuginfo subprogram _Get_Bat_ChrgBat_ADCValue
;local variable name mapping:
	.debuginfo complex-type (local-sym "_i" 1 "detect.c" 434 (basetype 1 unsigned) split "r0x102F")
_Get_Bat_ChrgBat_ADCValue:
; 2 exit points
	.line	435, "detect.c"; 	if(!f_charging)
	BANKSEL	_sys_flag_0
	BTRSC	_sys_flag_0,6
	MGOTO	_02074_DS_
	.line	437, "detect.c"; 	ChrgFullTimeCount = 0;
	BANKSEL	_ChrgFullTimeCount
	CLRR	_ChrgFullTimeCount
	CLRR	(_ChrgFullTimeCount + 1)
	.line	438, "detect.c"; 	return;
	MGOTO	_02092_DS_
_02074_DS_:
	.line	440, "detect.c"; 	if(!f_10ms_TimeOut)
	BANKSEL	_sys_flag_3
	BTRSS	_sys_flag_3,4
	.line	441, "detect.c"; 	return;
	MGOTO	_02092_DS_
_02076_DS_:
	.line	442, "detect.c"; 	f_10ms_TimeOut = 0;
	BANKSEL	_sys_flag_3
	BCR	_sys_flag_3,4
	.line	446, "detect.c"; 	ADMD &= 0xf0;
	MOVIA	0xf0
	ANDAR	_ADMD,F
	.line	447, "detect.c"; 	ADMD |= C_Quarter_VDD;
	MOVIA	0x0b
	IORAR	_ADMD,F
	.line	450, "detect.c"; 	ADC_Convert_Pre();
	MCALL	_ADC_Convert_Pre
	.line	455, "detect.c"; 	gAdcDataValue = 0;
	BANKSEL	_gAdcDataValue
	CLRR	_gAdcDataValue
	CLRR	(_gAdcDataValue + 1)
	.line	456, "detect.c"; 	for(i = 0; i < 5; i++)
	BANKSEL	r0x102F
	CLRR	r0x102F
_02090_DS_:
	.line	458, "detect.c"; 	ADMDbits.START = 1;
	BSR	_ADMDbits,6
	.line	459, "detect.c"; 	F_wait_eoc();
	MCALL	_F_wait_eoc
	.line	462, "detect.c"; 	if(i > 0)
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	BTRSC	STATUS,2
	MGOTO	_02091_DS_
	.line	464, "detect.c"; 	TmpAdcDataValue = ADD;
	MOVR	_ADD,W
	BANKSEL	_TmpAdcDataValue
	MOVAR	_TmpAdcDataValue
	CLRR	(_TmpAdcDataValue + 1)
	.line	465, "detect.c"; 	TmpAdcDataValue <<= 4;
	SWAPR	(_TmpAdcDataValue + 1),W
	ANDIA	0xf0
	MOVAR	(_TmpAdcDataValue + 1)
	SWAPR	_TmpAdcDataValue,W
	MOVAR	_TmpAdcDataValue
	ANDIA	0x0f
	IORAR	(_TmpAdcDataValue + 1),F
	XORAR	_TmpAdcDataValue,F
	.line	466, "detect.c"; 	TmpAdcDataValue += (ADR & 0x0f);  		
	MOVIA	0x0f
	ANDAR	_ADR,W
	BANKSEL	r0x1030
	MOVAR	r0x1030
;;1	MOVAR	r0x1031
;;1	CLRR	r0x1032
;;99	MOVR	r0x1031,W
	MOVIA	0x00
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	BANKSEL	_TmpAdcDataValue
	ADDAR	_TmpAdcDataValue,F
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	BANKSEL	_TmpAdcDataValue
	ADCAR	(_TmpAdcDataValue + 1),F
	.line	467, "detect.c"; 	gAdcDataValue += TmpAdcDataValue;
	MOVR	_TmpAdcDataValue,W
	BANKSEL	_gAdcDataValue
	ADDAR	_gAdcDataValue,F
	BANKSEL	_TmpAdcDataValue
	MOVR	(_TmpAdcDataValue + 1),W
	BANKSEL	_gAdcDataValue
	ADCAR	(_gAdcDataValue + 1),F
_02091_DS_:
	.line	456, "detect.c"; 	for(i = 0; i < 5; i++)
	BANKSEL	r0x102F
	INCR	r0x102F,F
;;unsigned compare: left < lit(0x5=5), size=1
	MOVIA	0x05
	SUBAR	r0x102F,W
	BTRSS	STATUS,0
	MGOTO	_02090_DS_
	.line	480, "detect.c"; 	gAdcDataValue >>= 2;
	BCR	STATUS,0
	BANKSEL	_gAdcDataValue
	RRR	(_gAdcDataValue + 1),F
	RRR	_gAdcDataValue,F
	BCR	STATUS,0
	RRR	(_gAdcDataValue + 1),F
	RRR	_gAdcDataValue,F
	.line	481, "detect.c"; 	if(Bat_check_cnt == 0)
	BANKSEL	_Bat_check_cnt
	MOVR	_Bat_check_cnt,W
	BTRSS	STATUS,2
	MGOTO	_02081_DS_
	.line	483, "detect.c"; 	Bat_adc_value = 0;
	BANKSEL	_Bat_adc_value
	CLRR	_Bat_adc_value
	CLRR	(_Bat_adc_value + 1)
_02081_DS_:
	.line	485, "detect.c"; 	Bat_adc_value += gAdcDataValue;
	BANKSEL	_gAdcDataValue
	MOVR	_gAdcDataValue,W
	BANKSEL	_Bat_adc_value
	ADDAR	_Bat_adc_value,F
	BANKSEL	_gAdcDataValue
	MOVR	(_gAdcDataValue + 1),W
	BANKSEL	_Bat_adc_value
	ADCAR	(_Bat_adc_value + 1),F
	.line	486, "detect.c"; 	Bat_check_cnt++;
	BANKSEL	_Bat_check_cnt
	INCR	_Bat_check_cnt,F
;;unsigned compare: left < lit(0x4=4), size=1
	.line	487, "detect.c"; 	if(Bat_check_cnt>= 4)
	MOVIA	0x04
	SUBAR	_Bat_check_cnt,W
	BTRSS	STATUS,0
	MGOTO	_02092_DS_
	.line	489, "detect.c"; 	Bat_check_cnt = 0;
	CLRR	_Bat_check_cnt
	.line	490, "detect.c"; 	Bat_adc_value = Bat_adc_value >> 2;
	BCR	STATUS,0
	BANKSEL	_Bat_adc_value
	RRR	(_Bat_adc_value + 1),F
	RRR	_Bat_adc_value,F
	BCR	STATUS,0
	RRR	(_Bat_adc_value + 1),F
	RRR	_Bat_adc_value,F
;;unsigned compare: left < lit(0x866=2150), size=2
	.line	574, "detect.c"; 	if(Bat_adc_value >= BAT_VOL4P20_ADC_VALUE)//BAT_VOL4P17_ADC_VALUE达到了满电了
	MOVIA	0x66
	SUBAR	_Bat_adc_value,W
	MOVIA	0x08
	SBCAR	(_Bat_adc_value + 1),W
	BTRSS	STATUS,0
	MGOTO	_02092_DS_
	.line	576, "detect.c"; 	if(!f_charge_full)
	BANKSEL	_sys_flag_0
	BTRSC	_sys_flag_0,4
	MGOTO	_02092_DS_
	.line	578, "detect.c"; 	ChrgFullTimeCount++;
	BANKSEL	_ChrgFullTimeCount
	INCR	_ChrgFullTimeCount,F
	BTRSC	STATUS,2
	INCR	(_ChrgFullTimeCount + 1),F
	.line	579, "detect.c"; 	if(ChrgFullTimeCount == 20)//达到阈值后继续统计
	MOVR	_ChrgFullTimeCount,W
	XORIA	0x14
	BTRSS	STATUS,2
	MGOTO	_02092_DS_
	MOVR	(_ChrgFullTimeCount + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	MGOTO	_02092_DS_
	.line	581, "detect.c"; 	ChrgFullTimeCount = 0;
	CLRR	_ChrgFullTimeCount
	CLRR	(_ChrgFullTimeCount + 1)
	.line	582, "detect.c"; 	f_charge_full = 1;
	BANKSEL	_sys_flag_0
	BSR	_sys_flag_0,4
	.line	583, "detect.c"; 	msg = MSG_CHRG_FULL;
	MOVIA	0x07
	BANKSEL	_msg
	MOVAR	_msg
_02092_DS_:
	.line	593, "detect.c"; 	}
	RETURN	
; exit point of _Get_Bat_ChrgBat_ADCValue

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=detect, function=_AdjustHeatPwm
	.debuginfo subprogram _AdjustHeatPwm
_AdjustHeatPwm:
; 2 exit points
	.line	342, "detect.c"; 	if(b_smoking||b_heating)
	BANKSEL	_sys_flag_1
	BTRSC	_sys_flag_1,1
	MGOTO	_02065_DS_
	BANKSEL	_sys_flag_3
	BTRSS	_sys_flag_3,2
	MGOTO	_02068_DS_
_02065_DS_:
	.line	344, "detect.c"; 	if(f_1ms_TimeOut)
	BANKSEL	_sys_flag_2
	BTRSS	_sys_flag_2,4
	MGOTO	_02068_DS_
	.line	346, "detect.c"; 	f_1ms_TimeOut = 0;
	BCR	_sys_flag_2,4
	.line	347, "detect.c"; 	NowMotorDuty++;
	BANKSEL	_NowMotorDuty
	INCR	_NowMotorDuty,F
	.line	348, "detect.c"; 	if(NowMotorDuty >= TargetMotorDuty)
	BANKSEL	_TargetMotorDuty
	MOVR	_TargetMotorDuty,W
	BANKSEL	_NowMotorDuty
	SUBAR	_NowMotorDuty,W
	BTRSS	STATUS,0
	MGOTO	_02062_DS_
	.line	350, "detect.c"; 	NowMotorDuty = TargetMotorDuty;
	BANKSEL	_TargetMotorDuty
	MOVR	_TargetMotorDuty,W
	BANKSEL	_NowMotorDuty
	MOVAR	_NowMotorDuty
_02062_DS_:
	.line	352, "detect.c"; 	PWM2DUTY = NowMotorDuty;
	BANKSEL	_NowMotorDuty
	MOVR	_NowMotorDuty,W
	SFUN	_PWM2DUTY
_02068_DS_:
	.line	355, "detect.c"; 	}
	RETURN	
; exit point of _AdjustHeatPwm

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;7 compiler assigned registers:
;   r0x1025
;   r0x1026
;   r0x1027
;   r0x1028
;   r0x1029
;   r0x102A
;   STK00
;; Starting pCode block
.segment "code"; module=detect, function=_adc_get
	.debuginfo subprogram _adc_get
;local variable name mapping:
	.debuginfo complex-type (local-sym "_ch" 1 "detect.c" 259 (basetype 1 unsigned) split "r0x1025")
	.debuginfo complex-type (local-sym "_i" 1 "detect.c" 290 (basetype 1 unsigned) split "r0x1025")
	.debuginfo complex-type (local-sym "_l_u16NowValue" 2 "detect.c" 261 (basetype 2 unsigned) split "r0x1029" "r0x1028")
	.debuginfo complex-type (local-sym "_R_DATA" 2 "detect.c" 262 (basetype 2 unsigned) split "r0x1025" "r0x1026")
_adc_get:
; 2 exit points
	.line	259, "detect.c"; 	u16 adc_get(u8 ch)
	BANKSEL	r0x1025
	MOVAR	r0x1025
	.line	265, "detect.c"; 	b_get_adc_result = 0;
	BANKSEL	_sys_flag_1
	BCR	_sys_flag_1,7
	.line	279, "detect.c"; 	ADMD = 0x90 | ch;
	MOVIA	0x90
	BANKSEL	r0x1025
	IORAR	r0x1025,W
	MOVAR	_ADMD
	.line	280, "detect.c"; 	ADMDbits.START = 1;
	BSR	_ADMDbits,6
_02044_DS_:
	.line	282, "detect.c"; 	while(ADMDbits.EOC == 0)
	BTRSS	_ADMDbits,5
	MGOTO	_02044_DS_
	.line	284, "detect.c"; 	s_u16Sum = 0;
	BANKSEL	_s_u16Sum
	CLRR	_s_u16Sum
	CLRR	(_s_u16Sum + 1)
	.line	285, "detect.c"; 	s_u16LeastValue = 4096;
	BANKSEL	_s_u16LeastValue
	CLRR	_s_u16LeastValue
	MOVIA	0x10
	MOVAR	(_s_u16LeastValue + 1)
	.line	286, "detect.c"; 	s_u16MostValue = 0;
	BANKSEL	_s_u16MostValue
	CLRR	_s_u16MostValue
	CLRR	(_s_u16MostValue + 1)
	.line	290, "detect.c"; 	for (char i = 0; i < 10; i++)
	BANKSEL	r0x1025
	CLRR	r0x1025
;;unsigned compare: left < lit(0xA=10), size=1
_02056_DS_:
	.line	290, "detect.c"; 	{
	MOVIA	0x0a
	BANKSEL	r0x1025
	SUBAR	r0x1025,W
	BTRSC	STATUS,0
	MGOTO	_02054_DS_
	.line	293, "detect.c"; 	ADMDbits.START = 1;
	BSR	_ADMDbits,6
_02047_DS_:
	.line	295, "detect.c"; 	while(ADMDbits.EOC == 0)
	BTRSS	_ADMDbits,5
	MGOTO	_02047_DS_
	.line	300, "detect.c"; 	l_u16NowValue = (ADD << 4) + ( 0x0F & ADR); 
	MOVR	_ADD,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
	BANKSEL	r0x1027
	CLRR	r0x1027
	SWAPR	r0x1027,W
	ANDIA	0xf0
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BANKSEL	r0x1026
	SWAPR	r0x1026,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	ANDIA	0x0f
	BANKSEL	r0x1028
	IORAR	r0x1028,F
	BANKSEL	r0x1029
	XORAR	r0x1029,F
	MOVIA	0x0f
	ANDAR	_ADR,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	r0x1029
	ADDAR	r0x1029,F
	MOVIA	0x00
	BANKSEL	r0x1028
	ADCAR	r0x1028,F
	.line	302, "detect.c"; 	if(l_u16NowValue > s_u16MostValue)				//取极大值
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BANKSEL	_s_u16MostValue
	SUBAR	_s_u16MostValue,W
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	_s_u16MostValue
	SBCAR	(_s_u16MostValue + 1),W
	BTRSC	STATUS,0
	MGOTO	_02051_DS_
	.line	304, "detect.c"; 	s_u16MostValue = l_u16NowValue;
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BANKSEL	_s_u16MostValue
	MOVAR	_s_u16MostValue
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	_s_u16MostValue
	MOVAR	(_s_u16MostValue + 1)
_02051_DS_:
	.line	306, "detect.c"; 	if(l_u16NowValue < s_u16LeastValue)				//取极小值
	BANKSEL	_s_u16LeastValue
	MOVR	_s_u16LeastValue,W
	BANKSEL	r0x1029
	SUBAR	r0x1029,W
	BANKSEL	_s_u16LeastValue
	MOVR	(_s_u16LeastValue + 1),W
	BANKSEL	r0x1028
	SBCAR	r0x1028,W
	BTRSC	STATUS,0
	MGOTO	_02053_DS_
	.line	308, "detect.c"; 	s_u16LeastValue = l_u16NowValue;
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BANKSEL	_s_u16LeastValue
	MOVAR	_s_u16LeastValue
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	_s_u16LeastValue
	MOVAR	(_s_u16LeastValue + 1)
_02053_DS_:
	.line	311, "detect.c"; 	s_u16Sum += l_u16NowValue;	//累加
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BANKSEL	_s_u16Sum
	ADDAR	_s_u16Sum,F
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	_s_u16Sum
	ADCAR	(_s_u16Sum + 1),F
	.line	290, "detect.c"; 	for (char i = 0; i < 10; i++)
	BANKSEL	r0x1025
	INCR	r0x1025,F
	.line	290, "detect.c"; 	{
	MGOTO	_02056_DS_
_02054_DS_:
	.line	325, "detect.c"; 	s_u16Sum -= s_u16MostValue;
	BANKSEL	_s_u16MostValue
	MOVR	_s_u16MostValue,W
	BANKSEL	_s_u16Sum
	SUBAR	_s_u16Sum,F
	BANKSEL	_s_u16MostValue
	MOVR	(_s_u16MostValue + 1),W
	BANKSEL	_s_u16Sum
	SBCAR	(_s_u16Sum + 1),F
	.line	326, "detect.c"; 	s_u16Sum -= s_u16LeastValue;// - s_u16LeastValue;
	BANKSEL	_s_u16LeastValue
	MOVR	_s_u16LeastValue,W
	BANKSEL	_s_u16Sum
	SUBAR	_s_u16Sum,F
	BANKSEL	_s_u16LeastValue
	MOVR	(_s_u16LeastValue + 1),W
	BANKSEL	_s_u16Sum
	SBCAR	(_s_u16Sum + 1),F
	.line	327, "detect.c"; 	R_DATA = s_u16Sum >> 3;
	BCR	STATUS,0
	RRR	(_s_u16Sum + 1),W
	BANKSEL	r0x1026
	MOVAR	r0x1026
	BANKSEL	_s_u16Sum
	RRR	_s_u16Sum,W
	BANKSEL	r0x1025
	MOVAR	r0x1025
	BCR	STATUS,0
	BANKSEL	r0x1026
	RRR	r0x1026,F
	BANKSEL	r0x1025
	RRR	r0x1025,F
	BCR	STATUS,0
	BANKSEL	r0x1026
	RRR	r0x1026,F
	BANKSEL	r0x1025
	RRR	r0x1025,F
	.line	329, "detect.c"; 	b_get_adc_result = 1;
	BANKSEL	_sys_flag_1
	BSR	_sys_flag_1,7
	.line	337, "detect.c"; 	return R_DATA;
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK00
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	.line	338, "detect.c"; 	}
	RETURN	
; exit point of _adc_get

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ADC_Convert_Pre
;   _F_wait_eoc
;   _ADC_Convert_Pre
;   _F_wait_eoc
;10 compiler assigned registers:
;   r0x1034
;   r0x1035
;   r0x1036
;   r0x1037
;   r0x1038
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;   STK00
;; Starting pCode block
.segment "code"; module=detect, function=_Get_adc_data
	.debuginfo subprogram _Get_adc_data
;local variable name mapping:
	.debuginfo complex-type (local-sym "_ch" 1 "detect.c" 176 (basetype 1 unsigned) split "r0x1034")
	.debuginfo complex-type (local-sym "_R_DATA" 2 "detect.c" 179 (basetype 2 unsigned) split "r0x1035" "r0x1036")
	.debuginfo complex-type (local-sym "_i" 1 "detect.c" 178 (basetype 1 unsigned) split "r0x1034")
	.debuginfo complex-type (local-sym "_temp" 2 "detect.c" 179 (basetype 2 unsigned) split "r0x1037" "r0x1038")
_Get_adc_data:
; 2 exit points
	.line	176, "detect.c"; 	u16 Get_adc_data(u8 ch)
	BANKSEL	r0x1034
	MOVAR	r0x1034
	.line	179, "detect.c"; 	u16  temp,R_DATA = 0;		
	BANKSEL	r0x1035
	CLRR	r0x1035
	BANKSEL	r0x1036
	CLRR	r0x1036
	.line	181, "detect.c"; 	ADMD = 0x90 | ch;			
	MOVIA	0x90
	BANKSEL	r0x1034
	IORAR	r0x1034,W
	MOVAR	_ADMD
	.line	182, "detect.c"; 	ADC_Convert_Pre();
	MCALL	_ADC_Convert_Pre
	.line	189, "detect.c"; 	for(i = 0; i < 5; i++)//8
	BANKSEL	r0x1034
	CLRR	r0x1034
_02038_DS_:
	.line	191, "detect.c"; 	ADMDbits.START = 1;
	BSR	_ADMDbits,6
	.line	192, "detect.c"; 	F_wait_eoc();
	MCALL	_F_wait_eoc
	.line	193, "detect.c"; 	if(i > 0)
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BTRSC	STATUS,2
	MGOTO	_02039_DS_
	.line	195, "detect.c"; 	temp = ADD;
	MOVR	_ADD,W
	BANKSEL	r0x1037
	MOVAR	r0x1037
	BANKSEL	r0x1038
	CLRR	r0x1038
	.line	196, "detect.c"; 	temp <<= 4;
	SWAPR	r0x1038,W
	ANDIA	0xf0
	BANKSEL	r0x1039
	MOVAR	r0x1039
	BANKSEL	r0x1037
	SWAPR	r0x1037,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
	ANDIA	0x0f
	BANKSEL	r0x1039
	IORAR	r0x1039,F
	BANKSEL	r0x103A
	XORAR	r0x103A,F
	.line	197, "detect.c"; 	temp += (ADR & 0x0f);  		
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1037
	BANKSEL	r0x1038
	MOVAR	r0x1038
	MOVIA	0x00
	BANKSEL	r0x103C
	MOVAR	r0x103C
;;100	MOVR	r0x1037,W
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	r0x1037
	MOVAR	r0x1037
	BANKSEL	r0x103A
	ADDAR	r0x103A,F
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	BANKSEL	r0x1039
	ADCAR	r0x1039,F
	.line	198, "detect.c"; 	R_DATA += temp;
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	BANKSEL	r0x1035
	ADDAR	r0x1035,F
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	BANKSEL	r0x1036
	ADCAR	r0x1036,F
_02039_DS_:
	.line	189, "detect.c"; 	for(i = 0; i < 5; i++)//8
	BANKSEL	r0x1034
	INCR	r0x1034,F
;;unsigned compare: left < lit(0x5=5), size=1
	MOVIA	0x05
	SUBAR	r0x1034,W
	BTRSS	STATUS,0
	MGOTO	_02038_DS_
	.line	202, "detect.c"; 	R_DATA >>= 2;//3; 	
	BCR	STATUS,0
	BANKSEL	r0x1036
	RRR	r0x1036,F
	BANKSEL	r0x1035
	RRR	r0x1035,F
	BCR	STATUS,0
	BANKSEL	r0x1036
	RRR	r0x1036,F
	BANKSEL	r0x1035
	RRR	r0x1035,F
	.line	203, "detect.c"; 	return R_DATA;
	MOVR	r0x1035,W
	MOVAR	STK00
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	.line	205, "detect.c"; 	}
	RETURN	
; exit point of _Get_adc_data

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x103D
;   STK00
;   r0x103E
;   STK01
;   r0x103F
;   STK02
;   r0x1040
;   r0x1041
;   r0x1042
;; Starting pCode block
.segment "code"; module=detect, function=_getAbs
	.debuginfo subprogram _getAbs
;local variable name mapping:
	.debuginfo complex-type (local-sym "_num_a" 2 "detect.c" 164 (basetype 2 unsigned) split "r0x103E" "r0x103D")
	.debuginfo complex-type (local-sym "_num_b" 2 "detect.c" 164 (basetype 2 unsigned) split "r0x1040" "r0x103F")
_getAbs:
; 2 exit points
	.line	164, "detect.c"; 	u16 getAbs(u16 num_a, u16 num_b)
	BANKSEL	r0x103D
	MOVAR	r0x103D
	MOVR	STK00,W
	BANKSEL	r0x103E
	MOVAR	r0x103E
	MOVR	STK01,W
	BANKSEL	r0x103F
	MOVAR	r0x103F
	MOVR	STK02,W
	BANKSEL	r0x1040
	MOVAR	r0x1040
	.line	166, "detect.c"; 	if (num_a > num_b)
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	r0x1040
	SUBAR	r0x1040,W
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	BANKSEL	r0x103F
	SBCAR	r0x103F,W
	BTRSC	STATUS,0
	MGOTO	_02028_DS_
	.line	168, "detect.c"; 	return num_a - num_b;
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	BANKSEL	r0x103E
	SUBAR	r0x103E,W
	BANKSEL	r0x1041
	MOVAR	r0x1041
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	BANKSEL	r0x103D
	SBCAR	r0x103D,W
	BANKSEL	r0x1042
	MOVAR	r0x1042
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	MOVAR	STK00
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	MGOTO	_02030_DS_
_02028_DS_:
	.line	172, "detect.c"; 	return num_b - num_a;
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	r0x1040
	SUBAR	r0x1040,W
	BANKSEL	r0x103E
	MOVAR	r0x103E
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	BANKSEL	r0x103F
	SBCAR	r0x103F,W
	BANKSEL	r0x103D
	MOVAR	r0x103D
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	MOVAR	STK00
	BANKSEL	r0x103D
	MOVR	r0x103D,W
_02030_DS_:
	.line	174, "detect.c"; 	}
	RETURN	
; exit point of _getAbs

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=detect, function=_F_wait_eoc
	.debuginfo subprogram _F_wait_eoc
_F_wait_eoc:
; 2 exit points
_02022_DS_:
	.line	160, "detect.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_02022_DS_
	.line	162, "detect.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _NOP10_
;   _NOP10_
;1 compiler assigned register :
;   r0x102E
;; Starting pCode block
.segment "code"; module=detect, function=_ADC_Convert_Pre
	.debuginfo subprogram _ADC_Convert_Pre
;local variable name mapping:
	.debuginfo complex-type (local-sym "_i" 1 "detect.c" 151 (basetype 1 unsigned) split "r0x102E")
_ADC_Convert_Pre:
; 2 exit points
	.line	151, "detect.c"; 	for(char i=0; i < 32;i++)
	BANKSEL	r0x102E
	CLRR	r0x102E
;;unsigned compare: left < lit(0x20=32), size=1
_02015_DS_:
	MOVIA	0x20
	BANKSEL	r0x102E
	SUBAR	r0x102E,W
	BTRSC	STATUS,0
	MGOTO	_02017_DS_
	.line	153, "detect.c"; 	ADMDbits.START = 1;
	BSR	_ADMDbits,6
	.line	154, "detect.c"; 	NOP10_();
	MCALL	_NOP10_
	.line	151, "detect.c"; 	for(char i=0; i < 32;i++)
	BANKSEL	r0x102E
	INCR	r0x102E,F
	MGOTO	_02015_DS_
_02017_DS_:
	.line	156, "detect.c"; 	}
	RETURN	
; exit point of _ADC_Convert_Pre

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=detect, function=_NOP10_
	.debuginfo subprogram _NOP10_
_NOP10_:
; 2 exit points
	.line	145, "detect.c"; 	NOP();NOP();NOP();NOP();NOP();
	nop
	nop
	nop
	nop
	nop
	.line	146, "detect.c"; 	NOP();NOP();NOP();NOP();NOP();
	nop
	nop
	nop
	nop
	nop
	.line	147, "detect.c"; 	}
	RETURN	
; exit point of _NOP10_

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=detect, function=_detect_param_init
	.debuginfo subprogram _detect_param_init
_detect_param_init:
; 2 exit points
	.line	100, "detect.c"; 	usb_check_ad_time_cnt = 0;
	BANKSEL	_usb_check_ad_time_cnt
	CLRR	_usb_check_ad_time_cnt
	.line	101, "detect.c"; 	Chrg_On_time_count = 0;
	BANKSEL	_Chrg_On_time_count
	CLRR	_Chrg_On_time_count
	.line	103, "detect.c"; 	Heat_On_time_count = 0;
	BANKSEL	_Heat_On_time_count
	CLRR	_Heat_On_time_count
	.line	104, "detect.c"; 	Heat_Off_time_count = 0;
	BANKSEL	_Heat_Off_time_count
	CLRR	_Heat_Off_time_count
	.line	105, "detect.c"; 	f_charging = 0;
	BANKSEL	_sys_flag_0
	BCR	_sys_flag_0,6
	.line	108, "detect.c"; 	OverCurrent_check_cnt = 0;
	BANKSEL	_OverCurrent_check_cnt
	CLRR	_OverCurrent_check_cnt
	.line	110, "detect.c"; 	f_charge_full = 0;
	BANKSEL	_sys_flag_0
	BCR	_sys_flag_0,4
	.line	111, "detect.c"; 	b_smoking = 0;
	BANKSEL	_sys_flag_1
	BCR	_sys_flag_1,1
	.line	113, "detect.c"; 	ChrgFullTimeCount = 0;
	BANKSEL	_ChrgFullTimeCount
	CLRR	_ChrgFullTimeCount
	CLRR	(_ChrgFullTimeCount + 1)
	.line	122, "detect.c"; 	GroupColourIndex = 0;
	BANKSEL	_GroupColourIndex
	CLRR	_GroupColourIndex
	.line	129, "detect.c"; 	b_heating = 0;
	BANKSEL	_sys_flag_3
	BCR	_sys_flag_3,2
	.line	130, "detect.c"; 	SmokingKeepTime = 0;//吸烟时长，主要是为了处理在吸烟前0.3秒是否需要全功率输出的问题
	BANKSEL	_SmokingKeepTime
	CLRR	_SmokingKeepTime
	CLRR	(_SmokingKeepTime + 1)
	.line	135, "detect.c"; 	b_heater_detect_mask = 0;
	BANKSEL	_sys_flag_2
	BCR	_sys_flag_2,5
	.line	136, "detect.c"; 	SmokeState = 0;
	BANKSEL	_SmokeState
	CLRR	_SmokeState
	.line	137, "detect.c"; 	now_ch = C_Quarter_VDD;
	MOVIA	0x0b
	BANKSEL	_now_ch
	MOVAR	_now_ch
	.line	138, "detect.c"; 	battery_low_cnt = 0;
	BANKSEL	_battery_low_cnt
	CLRR	_battery_low_cnt
	.line	139, "detect.c"; 	disp_delay_time_cnt = 0;
	BANKSEL	_disp_delay_time_cnt
	CLRR	_disp_delay_time_cnt
	.line	141, "detect.c"; 	}
	RETURN	
; exit point of _detect_param_init


;	code size estimation:
;	  720+  277 =   997 instructions ( 2548 byte)

	end
