;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"led.c"
	list	p=NY8B062F,c=on
	#include "ny8b062f.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_charge_check_by_IO
	extern	_Detect_OverCurrent_ByAD
	extern	_BaseBatSetPWMValue
	extern	_ADC_Convert_Pre
	extern	_Get_Onetime_Bat_ADCValue
	extern	_Ledbreathing
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
	extern	_OverCurrentCount
	extern	_OverCurrentDelayTime
	extern	_percent_nun
	extern	_PwmCycleCount
	extern	_sleepCnt
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
	extern	_breathingLedRunOnce_FirstToUp_AfterToDown2
	extern	_breathingLedRunOnce_FirstToUp_AfterToDown
	extern	_breathingLedRunOnce_ToDown
	extern	_breathingLedRunOnce_ToUp
	extern	_ledRunOnce
	extern	_LedFlash
	extern	_SetLedColor
	extern	_SetLedGroup
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
	extern	_res
	extern	_temptimecount
	extern	_StartColourIndex
	extern	_TempCount
	extern	_BuleLed_delay_keep_time
	extern	_breathingVar
	extern	_baseLedCounter
	extern	_breathingLightReversal
	extern	_breathingLightLow
	extern	_LedShowKeepTime
	extern	_LedShowStep
	extern	_LedPwmCycleCount
	extern	_LedPwmDuty
	extern	_EnterbatteryLowFlag
	extern	_delay_keep_time
	extern	_Led_Breathe_count_Total
	extern	_Led_Breathe_count
	extern	_GroupColourIndex
	extern	_ledRunSup
	extern	_ledRunStarStep
	extern	_ledRunStep
	extern	_nowLedMode
	extern	_led_on_keep_time
	extern	_led_delay_keep_time
	extern	_led_flash_finish_return
	extern	_led_flash_count
	extern	_led_flash_flag
	extern	_ledstatusdata
	extern	_SetLedFlashParameters
	extern	_SetLedColorNormallyOn
	extern	_LedOff
	extern	_SetLedBreathingParameters
	extern	_SetLedBreathingParameters2
	extern	_ledRun
	extern	_led_param_init
	extern	_led_handle

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_ledstatusdata:
	.res 1
	.debuginfo complex-type (symbol "_ledstatusdata" 1 global "led.c" 26 (basetype 1 unsigned))

.segment "uninit"
_led_flash_flag:
	.res 1
	.debuginfo complex-type (symbol "_led_flash_flag" 1 global "led.c" 32 (basetype 1 unsigned))

.segment "uninit"
_led_flash_count:
	.res 1
	.debuginfo complex-type (symbol "_led_flash_count" 1 global "led.c" 33 (basetype 1 unsigned))

.segment "uninit"
_led_flash_finish_return:
	.res 1
	.debuginfo complex-type (symbol "_led_flash_finish_return" 1 global "led.c" 34 (basetype 1 unsigned))

.segment "uninit"
_led_delay_keep_time:
	.res 1
	.debuginfo complex-type (symbol "_led_delay_keep_time" 1 global "led.c" 35 (basetype 1 unsigned))

.segment "uninit"
_led_on_keep_time:
	.res 1
	.debuginfo complex-type (symbol "_led_on_keep_time" 1 global "led.c" 36 (basetype 1 unsigned))

.segment "uninit"
_nowLedMode:
	.res 1
	.debuginfo complex-type (symbol "_nowLedMode" 1 global "led.c" 37 (basetype 1 unsigned))

.segment "uninit"
_ledRunStep:
	.res 1
	.debuginfo complex-type (symbol "_ledRunStep" 1 global "led.c" 38 (basetype 1 unsigned))

.segment "uninit"
_ledRunStarStep:
	.res 1
	.debuginfo complex-type (symbol "_ledRunStarStep" 1 global "led.c" 39 (basetype 1 unsigned))

.segment "uninit"
_ledRunSup:
	.res 1
	.debuginfo complex-type (symbol "_ledRunSup" 1 global "led.c" 40 (basetype 1 unsigned))

.segment "uninit"
_GroupColourIndex:
	.res 1
	.debuginfo complex-type (symbol "_GroupColourIndex" 1 global "led.c" 43 (basetype 1 unsigned))

.segment "uninit"
_Led_Breathe_count:
	.res 1
	.debuginfo complex-type (symbol "_Led_Breathe_count" 1 global "led.c" 44 (basetype 1 unsigned))

.segment "uninit"
_Led_Breathe_count_Total:
	.res 2
	.debuginfo complex-type (symbol "_Led_Breathe_count_Total" 2 global "led.c" 45 (basetype 2 unsigned))

.segment "uninit"
_delay_keep_time:
	.res 1
	.debuginfo complex-type (symbol "_delay_keep_time" 1 global "led.c" 46 (basetype 1 unsigned))

.segment "uninit"
_EnterbatteryLowFlag:
	.res 1
	.debuginfo complex-type (symbol "_EnterbatteryLowFlag" 1 global "led.c" 47 (basetype 1 unsigned))

.segment "uninit"
_LedPwmDuty:
	.res 1
	.debuginfo complex-type (symbol "_LedPwmDuty" 1 global "led.c" 48 (basetype 1 unsigned))

.segment "uninit"
_LedPwmCycleCount:
	.res 1
	.debuginfo complex-type (symbol "_LedPwmCycleCount" 1 global "led.c" 51 (basetype 1 unsigned))

.segment "uninit"
_LedShowStep:
	.res 1
	.debuginfo complex-type (symbol "_LedShowStep" 1 global "led.c" 52 (basetype 1 unsigned))

.segment "uninit"
_LedShowKeepTime:
	.res 2
	.debuginfo complex-type (symbol "_LedShowKeepTime" 2 global "led.c" 53 (basetype 2 unsigned))

.segment "uninit"
_breathingLightLow:
	.res 1
	.debuginfo complex-type (symbol "_breathingLightLow" 1 global "led.c" 56 (basetype 1 unsigned))

.segment "uninit"
_breathingLightReversal:
	.res 1
	.debuginfo complex-type (symbol "_breathingLightReversal" 1 global "led.c" 57 (basetype 1 unsigned))

.segment "uninit"
_baseLedCounter:
	.res 2
	.debuginfo complex-type (symbol "_baseLedCounter" 2 global "led.c" 58 (basetype 2 unsigned))

.segment "uninit"
_breathingVar:
	.res 1
	.debuginfo complex-type (symbol "_breathingVar" 1 global "led.c" 59 (basetype 1 unsigned))

.segment "uninit"
_BuleLed_delay_keep_time:
	.res 1
	.debuginfo complex-type (symbol "_BuleLed_delay_keep_time" 1 global "led.c" 60 (basetype 1 unsigned))

.segment "uninit"
_TempCount:
	.res 1
	.debuginfo complex-type (symbol "_TempCount" 1 global "led.c" 61 (basetype 1 unsigned))

.segment "uninit"
_StartColourIndex:
	.res 1
	.debuginfo complex-type (symbol "_StartColourIndex" 1 global "led.c" 62 (basetype 1 unsigned))

.segment "uninit"
_temptimecount:
	.res 2
	.debuginfo complex-type (symbol "_temptimecount" 2 global "led.c" 63 (basetype 2 unsigned))

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
r0x101A:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x101D:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x101C:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_res:
	.debuginfo complex-type (symbol "_res" 1 global "led.c" 667 (basetype 1 unsigned))

	dw	0x00	; 0

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
; code_led	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SetLedColorNormallyOn
;   _SetLedColorNormallyOn
;   _LedOff
;   _LedFlash
;   _SetLedColorNormallyOn
;   _SetLedColorNormallyOn
;   _LedOff
;   _LedFlash
;1 compiler assigned register :
;   r0x101C
;; Starting pCode block
.segment "code"; module=led, function=_led_handle
	.debuginfo subprogram _led_handle
;local variable name mapping:
	.debuginfo complex-type (local-sym "_flashresult" 1 "led.c" 1398 (basetype 1 unsigned) split "r0x101C")
_led_handle:
; 2 exit points
	.line	1400, "led.c"; 	switch(nowLedMode)
	BANKSEL	_nowLedMode
	MOVR	_nowLedMode,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02220_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x33=51), size=2
	.line	1403, "led.c"; 	if(LedShowKeepTime > 50)
	MOVIA	0x33
	BANKSEL	_LedShowKeepTime
	SUBAR	_LedShowKeepTime,W
	MOVIA	0x00
	SBCAR	(_LedShowKeepTime + 1),W
	BTRSS	STATUS,0
	MGOTO	_02218_DS_
	.line	1406, "led.c"; 	SetLedColorNormallyOn(COLOR_RED);//红色
	MOVIA	0x00
	MCALL	_SetLedColorNormallyOn
	MGOTO	_02220_DS_
_02218_DS_:
	.line	1408, "led.c"; 	else if(LedShowKeepTime > 0)
	BANKSEL	_LedShowKeepTime
	MOVR	(_LedShowKeepTime + 1),W
	IORAR	_LedShowKeepTime,W
	BTRSC	STATUS,2
	MGOTO	_02215_DS_
	.line	1410, "led.c"; 	SetLedColorNormallyOn(COLOR_GREEN);
	MOVIA	0x02
	MCALL	_SetLedColorNormallyOn
	MGOTO	_02220_DS_
_02215_DS_:
	.line	1412, "led.c"; 	else if(LedShowKeepTime == 0)
	BANKSEL	_LedShowKeepTime
	MOVR	(_LedShowKeepTime + 1),W
	IORAR	_LedShowKeepTime,W
	BTRSS	STATUS,2
	MGOTO	_02220_DS_
	.line	1414, "led.c"; 	LedOff();//灯熄灭
	MCALL	_LedOff
	.line	1415, "led.c"; 	nowLedMode = 0;
	BANKSEL	_nowLedMode
	CLRR	_nowLedMode
_02220_DS_:
	.line	1420, "led.c"; 	flashresult = LedFlash();
	MCALL	_LedFlash
	BANKSEL	r0x101C
	MOVAR	r0x101C
	.line	1421, "led.c"; 	if(flashresult == 2)
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02228_DS_
	.line	1423, "led.c"; 	if(f_charging)
	BANKSEL	_sys_flag_0
	BTRSS	_sys_flag_0,6
	MGOTO	_02225_DS_
	.line	1425, "led.c"; 	if(f_charge_full)
	BTRSS	_sys_flag_0,4
	MGOTO	_02222_DS_
	.line	1428, "led.c"; 	nowLedMode = 0;
	BANKSEL	_nowLedMode
	CLRR	_nowLedMode
	.line	1430, "led.c"; 	msg = MSG_CHRG_FULL;
	MOVIA	0x07
	BANKSEL	_msg
	MOVAR	_msg
	MGOTO	_02228_DS_
_02222_DS_:
	.line	1435, "led.c"; 	msg = MSG_CHRG;
	MOVIA	0x03
	BANKSEL	_msg
	MOVAR	_msg
	MGOTO	_02228_DS_
_02225_DS_:
	.line	1441, "led.c"; 	nowLedMode = 0;
	BANKSEL	_nowLedMode
	CLRR	_nowLedMode
_02228_DS_:
	.line	1449, "led.c"; 	if(flashresult == 1)
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02236_DS_
	.line	1451, "led.c"; 	if(f_charging)//
	BANKSEL	_sys_flag_0
	BTRSS	_sys_flag_0,6
	MGOTO	_02236_DS_
	.line	1453, "led.c"; 	if(f_charge_full)
	BTRSS	_sys_flag_0,4
	MGOTO	_02230_DS_
	.line	1455, "led.c"; 	msg = MSG_CHRG_FULL;
	MOVIA	0x07
	BANKSEL	_msg
	MOVAR	_msg
	MGOTO	_02236_DS_
_02230_DS_:
	.line	1462, "led.c"; 	msg = MSG_CHRG;
	MOVIA	0x03
	BANKSEL	_msg
	MOVAR	_msg
_02236_DS_:
	.line	1473, "led.c"; 	}
	RETURN	
; exit point of _led_handle

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=led, function=_led_param_init
	.debuginfo subprogram _led_param_init
_led_param_init:
; 2 exit points
	.line	1357, "led.c"; 	led_flash_flag = 0;
	BANKSEL	_led_flash_flag
	CLRR	_led_flash_flag
	.line	1359, "led.c"; 	led_delay_keep_time = 0;
	BANKSEL	_led_delay_keep_time
	CLRR	_led_delay_keep_time
	.line	1360, "led.c"; 	led_on_keep_time = 0;
	BANKSEL	_led_on_keep_time
	CLRR	_led_on_keep_time
	.line	1362, "led.c"; 	ledRunStep = 0;
	BANKSEL	_ledRunStep
	CLRR	_ledRunStep
	.line	1363, "led.c"; 	ledRunSup = 0;
	BANKSEL	_ledRunSup
	CLRR	_ledRunSup
	.line	1372, "led.c"; 	led_flash_count = 0;//变量公用方式
	BANKSEL	_led_flash_count
	CLRR	_led_flash_count
	.line	1374, "led.c"; 	delay_keep_time = 0;
	BANKSEL	_delay_keep_time
	CLRR	_delay_keep_time
	.line	1375, "led.c"; 	EnterbatteryLowFlag = 0;
	BANKSEL	_EnterbatteryLowFlag
	CLRR	_EnterbatteryLowFlag
	.line	1379, "led.c"; 	nowLedMode = 0;
	BANKSEL	_nowLedMode
	CLRR	_nowLedMode
	.line	1381, "led.c"; 	LedPwmDuty = 0;
	BANKSEL	_LedPwmDuty
	CLRR	_LedPwmDuty
	.line	1382, "led.c"; 	Led_Breathe_count = 0;
	BANKSEL	_Led_Breathe_count
	CLRR	_Led_Breathe_count
	.line	1383, "led.c"; 	LedShowStep = 0;
	BANKSEL	_LedShowStep
	CLRR	_LedShowStep
	.line	1385, "led.c"; 	LedPwmCycleCount = 0;
	BANKSEL	_LedPwmCycleCount
	CLRR	_LedPwmCycleCount
	.line	1386, "led.c"; 	led_breath_flash_flag = 0;
	BANKSEL	_sys_flag_2
	BCR	_sys_flag_2,2
	.line	1389, "led.c"; 	}
	RETURN	
; exit point of _led_param_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _breathingLedRunOnce_ToUp
;   _breathingLedRunOnce_ToDown
;   _breathingLedRunOnce_FirstToUp_AfterToDown
;   _breathingLedRunOnce_ToUp
;   _breathingLedRunOnce_ToDown
;   _breathingLedRunOnce_FirstToUp_AfterToDown
;1 compiler assigned register :
;   r0x1022
;; Starting pCode block
.segment "code"; module=led, function=_ledRun
	.debuginfo subprogram _ledRun
_ledRun:
; 2 exit points
	.line	1029, "led.c"; 	if(led_breath_flash_flag)
	BANKSEL	_sys_flag_2
	BTRSS	_sys_flag_2,2
	MGOTO	_02202_DS_
	.line	1031, "led.c"; 	if(ledRunSup == 0)
	BANKSEL	_ledRunSup
	MOVR	_ledRunSup,W
	BTRSS	STATUS,2
	MGOTO	_02198_DS_
	.line	1034, "led.c"; 	breathingVar = 65;//63;//85;
	MOVIA	0x41
	BANKSEL	_breathingVar
	MOVAR	_breathingVar
	.line	1035, "led.c"; 	if(breathingLedRunOnce_ToUp())
	MCALL	_breathingLedRunOnce_ToUp
	BANKSEL	r0x1022
	MOVAR	r0x1022
	MOVR	r0x1022,W
	BTRSC	STATUS,2
	MGOTO	_02174_DS_
	.line	1037, "led.c"; 	ledRunSup = 1;
	MOVIA	0x01
	BANKSEL	_ledRunSup
	MOVAR	_ledRunSup
_02174_DS_:
	.line	1039, "led.c"; 	if(!keyPressStatus)
	BANKSEL	_sys_flag_1
	BTRSC	_sys_flag_1,4
	MGOTO	_02202_DS_
	.line	1041, "led.c"; 	ledRunSup = 2;
	MOVIA	0x02
	BANKSEL	_ledRunSup
	MOVAR	_ledRunSup
	.line	1042, "led.c"; 	isbreathingFlag = 1;
	BANKSEL	_sys_flag_1
	BSR	_sys_flag_1,2
	.line	1042, "led.c"; 	}
	MGOTO	_02202_DS_
_02198_DS_:
	.line	1045, "led.c"; 	else if(ledRunSup == 1)
	BANKSEL	_ledRunSup
	MOVR	_ledRunSup,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02195_DS_
	.line	1047, "led.c"; 	if(!keyPressStatus)
	BANKSEL	_sys_flag_1
	BTRSC	_sys_flag_1,4
	MGOTO	_02180_DS_
	.line	1049, "led.c"; 	ledRunSup = 2;
	MOVIA	0x02
	BANKSEL	_ledRunSup
	MOVAR	_ledRunSup
	.line	1050, "led.c"; 	isbreathingFlag = 1;
	BANKSEL	_sys_flag_1
	BSR	_sys_flag_1,2
	MGOTO	_02202_DS_
_02180_DS_:
	.line	1054, "led.c"; 	if(LedShowKeepTime == 0)
	BANKSEL	_LedShowKeepTime
	MOVR	(_LedShowKeepTime + 1),W
	IORAR	_LedShowKeepTime,W
	BTRSS	STATUS,2
	MGOTO	_02202_DS_
	.line	1058, "led.c"; 	msg = MSG_SMOKE_TIMEOUT;
	MOVIA	0x0a
	BANKSEL	_msg
	MOVAR	_msg
	.line	1058, "led.c"; 	}
	MGOTO	_02202_DS_
_02195_DS_:
	.line	1064, "led.c"; 	else if(ledRunSup == 2)
	BANKSEL	_ledRunSup
	MOVR	_ledRunSup,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02192_DS_
	.line	1067, "led.c"; 	if(breathingLedRunOnce_ToDown())
	MCALL	_breathingLedRunOnce_ToDown
	BANKSEL	r0x1022
	MOVAR	r0x1022
	MOVR	r0x1022,W
	BTRSC	STATUS,2
	MGOTO	_02202_DS_
	.line	1070, "led.c"; 	ledRunStep = 0;
	BANKSEL	_ledRunStep
	CLRR	_ledRunStep
	.line	1072, "led.c"; 	ledRunSup = 0;
	BANKSEL	_ledRunSup
	CLRR	_ledRunSup
	.line	1073, "led.c"; 	nowLedMode = 0;
	BANKSEL	_nowLedMode
	CLRR	_nowLedMode
	.line	1074, "led.c"; 	isbreathingFlag = 0;
	BANKSEL	_sys_flag_1
	BCR	_sys_flag_1,2
	.line	1075, "led.c"; 	led_breath_flash_flag = 0;
	BANKSEL	_sys_flag_2
	BCR	_sys_flag_2,2
	.line	1076, "led.c"; 	if(f_charging)//吸完烟后如果当前还在充电状态则需恢复充电的指示灯状态
	BANKSEL	_sys_flag_0
	BTRSS	_sys_flag_0,6
	MGOTO	_02202_DS_
	.line	1078, "led.c"; 	if(f_charge_full)
	BTRSS	_sys_flag_0,4
	MGOTO	_02183_DS_
	.line	1080, "led.c"; 	msg = MSG_CHRG_FULL;	
	MOVIA	0x07
	BANKSEL	_msg
	MOVAR	_msg
	MGOTO	_02202_DS_
_02183_DS_:
	.line	1085, "led.c"; 	msg = MSG_CHRG;
	MOVIA	0x03
	BANKSEL	_msg
	MOVAR	_msg
	.line	1085, "led.c"; 	}
	MGOTO	_02202_DS_
_02192_DS_:
	.line	1093, "led.c"; 	else if(ledRunSup == 3)
	BANKSEL	_ledRunSup
	MOVR	_ledRunSup,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_02202_DS_
	.line	1096, "led.c"; 	breathingVar = 140;//65;//70;//85;
	MOVIA	0x8c
	BANKSEL	_breathingVar
	MOVAR	_breathingVar
	.line	1117, "led.c"; 	breathingLedRunOnce_FirstToUp_AfterToDown();
	MCALL	_breathingLedRunOnce_FirstToUp_AfterToDown
_02202_DS_:
	.line	1243, "led.c"; 	}
	RETURN	
; exit point of _ledRun

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _breathingLedRunOnce_ToUp
;   _breathingLedRunOnce_ToDown
;   _breathingLedRunOnce_ToUp
;   _breathingLedRunOnce_ToDown
;1 compiler assigned register :
;   r0x1023
;; Starting pCode block
.segment "code"; module=led, function=_breathingLedRunOnce_FirstToUp_AfterToDown2
	.debuginfo subprogram _breathingLedRunOnce_FirstToUp_AfterToDown2
_breathingLedRunOnce_FirstToUp_AfterToDown2:
; 2 exit points
	.line	789, "led.c"; 	if (breathingLightReversal == 0)
	BANKSEL	_breathingLightReversal
	MOVR	_breathingLightReversal,W
	BTRSS	STATUS,2
	MGOTO	_02166_DS_
	.line	791, "led.c"; 	if(breathingLedRunOnce_ToUp())
	MCALL	_breathingLedRunOnce_ToUp
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVR	r0x1023,W
	BTRSC	STATUS,2
	MGOTO	_02167_DS_
	.line	793, "led.c"; 	breathingLightReversal = 1;
	MOVIA	0x01
	BANKSEL	_breathingLightReversal
	MOVAR	_breathingLightReversal
;;unsigned compare: left < lit(0x2=2), size=1
	.line	794, "led.c"; 	if(ledRunStep < 2)
	MOVIA	0x02
	BANKSEL	_ledRunStep
	SUBAR	_ledRunStep,W
	BTRSC	STATUS,0
	MGOTO	_02152_DS_
	.line	795, "led.c"; 	BuleLed_delay_keep_time = 27;//35;//4;//20;
	MOVIA	0x1b
	BANKSEL	_BuleLed_delay_keep_time
	MOVAR	_BuleLed_delay_keep_time
	MGOTO	_02167_DS_
_02152_DS_:
	.line	797, "led.c"; 	BuleLed_delay_keep_time = 30;//35;//4;//20;
	MOVIA	0x1e
	BANKSEL	_BuleLed_delay_keep_time
	MOVAR	_BuleLed_delay_keep_time
	MGOTO	_02167_DS_
_02166_DS_:
	.line	801, "led.c"; 	else if(breathingLightReversal == 1)
	BANKSEL	_breathingLightReversal
	MOVR	_breathingLightReversal,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02163_DS_
	.line	803, "led.c"; 	if(BuleLed_delay_keep_time == 0)
	BANKSEL	_BuleLed_delay_keep_time
	MOVR	_BuleLed_delay_keep_time,W
	BTRSS	STATUS,2
	MGOTO	_02167_DS_
	.line	805, "led.c"; 	breathingLightReversal = 2;
	MOVIA	0x02
	BANKSEL	_breathingLightReversal
	MOVAR	_breathingLightReversal
	MGOTO	_02167_DS_
_02163_DS_:
	.line	808, "led.c"; 	else if(breathingLightReversal == 2)
	BANKSEL	_breathingLightReversal
	MOVR	_breathingLightReversal,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02167_DS_
	.line	810, "led.c"; 	if(breathingLedRunOnce_ToDown())
	MCALL	_breathingLedRunOnce_ToDown
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVR	r0x1023,W
	BTRSC	STATUS,2
	MGOTO	_02167_DS_
	.line	812, "led.c"; 	breathingLightReversal = 0;
	BANKSEL	_breathingLightReversal
	CLRR	_breathingLightReversal
	.line	813, "led.c"; 	return 1;
	MOVIA	0x01
	MGOTO	_02168_DS_
_02167_DS_:
	.line	816, "led.c"; 	return 0;
	MOVIA	0x00
_02168_DS_:
	.line	817, "led.c"; 	}
	RETURN	
; exit point of _breathingLedRunOnce_FirstToUp_AfterToDown2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _breathingLedRunOnce_ToDown
;   _breathingLedRunOnce_ToUp
;   _breathingLedRunOnce_ToDown
;   _breathingLedRunOnce_ToUp
;1 compiler assigned register :
;   r0x1021
;; Starting pCode block
.segment "code"; module=led, function=_breathingLedRunOnce_FirstToUp_AfterToDown
	.debuginfo subprogram _breathingLedRunOnce_FirstToUp_AfterToDown
_breathingLedRunOnce_FirstToUp_AfterToDown:
; 2 exit points
	.line	769, "led.c"; 	if (breathingLightReversal)
	BANKSEL	_breathingLightReversal
	MOVR	_breathingLightReversal,W
	BTRSC	STATUS,2
	MGOTO	_02144_DS_
	.line	771, "led.c"; 	if(breathingLedRunOnce_ToDown())
	MCALL	_breathingLedRunOnce_ToDown
	BANKSEL	r0x1021
	MOVAR	r0x1021
	MOVR	r0x1021,W
	BTRSC	STATUS,2
	MGOTO	_02145_DS_
	.line	773, "led.c"; 	breathingLightReversal = 0;
	BANKSEL	_breathingLightReversal
	CLRR	_breathingLightReversal
	.line	774, "led.c"; 	return 1;
	MOVIA	0x01
	MGOTO	_02146_DS_
_02144_DS_:
	.line	779, "led.c"; 	if(breathingLedRunOnce_ToUp())
	MCALL	_breathingLedRunOnce_ToUp
	BANKSEL	r0x1021
	MOVAR	r0x1021
	MOVR	r0x1021,W
	BTRSC	STATUS,2
	MGOTO	_02145_DS_
	.line	781, "led.c"; 	breathingLightReversal = 1;
	MOVIA	0x01
	BANKSEL	_breathingLightReversal
	MOVAR	_breathingLightReversal
_02145_DS_:
	.line	784, "led.c"; 	return 0;
	MOVIA	0x00
_02146_DS_:
	.line	785, "led.c"; 	}
	RETURN	
; exit point of _breathingLedRunOnce_FirstToUp_AfterToDown

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;4 compiler assigned registers:
;   r0x101D
;   r0x101E
;   r0x101F
;   r0x1020
;; Starting pCode block
.segment "code"; module=led, function=_breathingLedRunOnce_ToDown
	.debuginfo subprogram _breathingLedRunOnce_ToDown
_breathingLedRunOnce_ToDown:
; 2 exit points
	.line	720, "led.c"; 	res = 0;
	BANKSEL	_res
	CLRR	_res
	.line	721, "led.c"; 	baseLedCounter++;
	BANKSEL	_baseLedCounter
	INCR	_baseLedCounter,F
	BTRSC	STATUS,2
	INCR	(_baseLedCounter + 1),F
	.line	722, "led.c"; 	if (baseLedCounter <=  breathingVar - breathingLightLow)
	BANKSEL	_breathingVar
	MOVR	_breathingVar,W
	BANKSEL	r0x101D
	MOVAR	r0x101D
	BANKSEL	r0x101E
	CLRR	r0x101E
	BANKSEL	_breathingLightLow
	MOVR	_breathingLightLow,W
;;3	MOVAR	r0x101F
	BANKSEL	r0x101D
	SUBAR	r0x101D,F
	MOVIA	0x00
	BANKSEL	r0x101E
	SBCAR	r0x101E,F
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x1020
	MOVAR	r0x1020
	BANKSEL	_baseLedCounter
	MOVR	_baseLedCounter,W
	BANKSEL	r0x101F
	SUBAR	r0x101F,W
	BANKSEL	_baseLedCounter
	MOVR	(_baseLedCounter + 1),W
	BANKSEL	r0x1020
	SBCAR	r0x1020,W
	BTRSS	STATUS,0
	MGOTO	_02132_DS_
	.line	724, "led.c"; 	OUT_LED_R = LED_OFF;
	BSR	_PORTAbits,7
	.line	725, "led.c"; 	OUT_LED_G = LED_OFF;
	BSR	_PORTBbits,3
	MGOTO	_02133_DS_
_02132_DS_:
	.line	729, "led.c"; 	else if (baseLedCounter <= breathingVar)
	BANKSEL	_breathingVar
	MOVR	_breathingVar,W
	BANKSEL	r0x101D
	MOVAR	r0x101D
	BANKSEL	r0x101E
	CLRR	r0x101E
	BANKSEL	_baseLedCounter
	MOVR	_baseLedCounter,W
	BANKSEL	r0x101D
	SUBAR	r0x101D,W
	BANKSEL	_baseLedCounter
	MOVR	(_baseLedCounter + 1),W
	BANKSEL	r0x101E
	SBCAR	r0x101E,W
	BTRSS	STATUS,0
	MGOTO	_02129_DS_
	.line	731, "led.c"; 	OUT_LED_R = led_r;
	BANKSEL	r0x101D
	CLRR	r0x101D
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,0
	MGOTO	_00001_DS_
	BANKSEL	r0x101D
	INCR	r0x101D,F
_00001_DS_:
	BANKSEL	r0x101D
	RRR	r0x101D,W
	BTRSS	STATUS,0
	BCR	_PORTAbits,7
	BTRSC	STATUS,0
	BSR	_PORTAbits,7
	.line	732, "led.c"; 	OUT_LED_G = led_g;
	CLRR	r0x101D
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,1
	MGOTO	_00002_DS_
	BANKSEL	r0x101D
	INCR	r0x101D,F
_00002_DS_:
	BANKSEL	r0x101D
	RRR	r0x101D,W
	BTRSS	STATUS,0
	BCR	_PORTBbits,3
	BTRSC	STATUS,0
	BSR	_PORTBbits,3
	MGOTO	_02133_DS_
_02129_DS_:
	.line	740, "led.c"; 	if (breathingLightLow == 0)
	BANKSEL	_breathingLightLow
	MOVR	_breathingLightLow,W
	BTRSS	STATUS,2
	MGOTO	_02126_DS_
	.line	742, "led.c"; 	return 1;
	MOVIA	0x01
	MGOTO	_02134_DS_
_02126_DS_:
	.line	746, "led.c"; 	breathingLightLow--;
	BANKSEL	_breathingLightLow
	DECR	_breathingLightLow,F
	.line	748, "led.c"; 	baseLedCounter = 0;
	BANKSEL	_baseLedCounter
	CLRR	_baseLedCounter
	CLRR	(_baseLedCounter + 1)
_02133_DS_:
	.line	764, "led.c"; 	return 0;
	MOVIA	0x00
_02134_DS_:
	.line	765, "led.c"; 	}
	RETURN	
; exit point of _breathingLedRunOnce_ToDown

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;4 compiler assigned registers:
;   r0x101D
;   r0x101E
;   r0x101F
;   r0x1020
;; Starting pCode block
.segment "code"; module=led, function=_breathingLedRunOnce_ToUp
	.debuginfo subprogram _breathingLedRunOnce_ToUp
_breathingLedRunOnce_ToUp:
; 2 exit points
	.line	671, "led.c"; 	res = 0;
	BANKSEL	_res
	CLRR	_res
	.line	672, "led.c"; 	baseLedCounter++;
	BANKSEL	_baseLedCounter
	INCR	_baseLedCounter,F
	BTRSC	STATUS,2
	INCR	(_baseLedCounter + 1),F
	.line	673, "led.c"; 	if (baseLedCounter <=  breathingVar - breathingLightLow)
	BANKSEL	_breathingVar
	MOVR	_breathingVar,W
	BANKSEL	r0x101D
	MOVAR	r0x101D
	BANKSEL	r0x101E
	CLRR	r0x101E
	BANKSEL	_breathingLightLow
	MOVR	_breathingLightLow,W
;;3	MOVAR	r0x101F
	BANKSEL	r0x101D
	SUBAR	r0x101D,F
	MOVIA	0x00
	BANKSEL	r0x101E
	SBCAR	r0x101E,F
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x1020
	MOVAR	r0x1020
	BANKSEL	_baseLedCounter
	MOVR	_baseLedCounter,W
	BANKSEL	r0x101F
	SUBAR	r0x101F,W
	BANKSEL	_baseLedCounter
	MOVR	(_baseLedCounter + 1),W
	BANKSEL	r0x1020
	SBCAR	r0x1020,W
	BTRSS	STATUS,0
	MGOTO	_02118_DS_
	.line	675, "led.c"; 	OUT_LED_R = LED_OFF;
	BSR	_PORTAbits,7
	.line	676, "led.c"; 	OUT_LED_G = LED_OFF;
	BSR	_PORTBbits,3
	MGOTO	_02119_DS_
_02118_DS_:
	.line	680, "led.c"; 	else if (baseLedCounter <= breathingVar)
	BANKSEL	_breathingVar
	MOVR	_breathingVar,W
	BANKSEL	r0x101D
	MOVAR	r0x101D
	BANKSEL	r0x101E
	CLRR	r0x101E
	BANKSEL	_baseLedCounter
	MOVR	_baseLedCounter,W
	BANKSEL	r0x101D
	SUBAR	r0x101D,W
	BANKSEL	_baseLedCounter
	MOVR	(_baseLedCounter + 1),W
	BANKSEL	r0x101E
	SBCAR	r0x101E,W
	BTRSS	STATUS,0
	MGOTO	_02115_DS_
	.line	682, "led.c"; 	OUT_LED_R = led_r;
	BANKSEL	r0x101D
	CLRR	r0x101D
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,0
	MGOTO	_00003_DS_
	BANKSEL	r0x101D
	INCR	r0x101D,F
_00003_DS_:
	BANKSEL	r0x101D
	RRR	r0x101D,W
	BTRSS	STATUS,0
	BCR	_PORTAbits,7
	BTRSC	STATUS,0
	BSR	_PORTAbits,7
	.line	683, "led.c"; 	OUT_LED_G = led_g;
	CLRR	r0x101D
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,1
	MGOTO	_00004_DS_
	BANKSEL	r0x101D
	INCR	r0x101D,F
_00004_DS_:
	BANKSEL	r0x101D
	RRR	r0x101D,W
	BTRSS	STATUS,0
	BCR	_PORTBbits,3
	BTRSC	STATUS,0
	BSR	_PORTBbits,3
	MGOTO	_02119_DS_
_02115_DS_:
	.line	690, "led.c"; 	if (breathingLightLow == breathingVar)
	BANKSEL	_breathingVar
	MOVR	_breathingVar,W
	BANKSEL	_breathingLightLow
	XORAR	_breathingLightLow,W
	BTRSS	STATUS,2
	MGOTO	_02112_DS_
	.line	692, "led.c"; 	return 1;
	MOVIA	0x01
	MGOTO	_02120_DS_
_02112_DS_:
	.line	696, "led.c"; 	breathingLightLow++;
	BANKSEL	_breathingLightLow
	INCR	_breathingLightLow,F
	.line	698, "led.c"; 	baseLedCounter = 0;
	BANKSEL	_baseLedCounter
	CLRR	_baseLedCounter
	CLRR	(_baseLedCounter + 1)
_02119_DS_:
	.line	715, "led.c"; 	return 0;
	MOVIA	0x00
_02120_DS_:
	.line	716, "led.c"; 	}
	RETURN	
; exit point of _breathingLedRunOnce_ToUp

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;7 compiler assigned registers:
;   r0x1024
;   STK00
;   r0x1025
;   STK01
;   r0x1026
;   STK02
;   r0x1027
;; Starting pCode block
.segment "code"; module=led, function=_ledRunOnce
	.debuginfo subprogram _ledRunOnce
;local variable name mapping:
	.debuginfo complex-type (local-sym "_low" 2 "led.c" 641 (basetype 2 unsigned) split "r0x1025" "r0x1024")
	.debuginfo complex-type (local-sym "_high" 2 "led.c" 641 (basetype 2 unsigned) split "r0x1027" "r0x1026")
_ledRunOnce:
; 2 exit points
	.line	641, "led.c"; 	u8 ledRunOnce(u16 low,u16 high)
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVR	STK00,W
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVR	STK01,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVR	STK02,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	.line	644, "led.c"; 	baseLedCounter++;
	BANKSEL	_baseLedCounter
	INCR	_baseLedCounter,F
	BTRSC	STATUS,2
	INCR	(_baseLedCounter + 1),F
	.line	645, "led.c"; 	if (baseLedCounter <= high)
	MOVR	_baseLedCounter,W
	BANKSEL	r0x1027
	SUBAR	r0x1027,W
	BANKSEL	_baseLedCounter
	MOVR	(_baseLedCounter + 1),W
	BANKSEL	r0x1026
	SBCAR	r0x1026,W
	BTRSS	STATUS,0
	MGOTO	_02104_DS_
	.line	647, "led.c"; 	OUT_LED_R = LED_OFF;
	BSR	_PORTAbits,7
	.line	648, "led.c"; 	OUT_LED_G = LED_OFF;
	BSR	_PORTBbits,3
	.line	650, "led.c"; 	return 0;
	MOVIA	0x00
	MGOTO	_02106_DS_
_02104_DS_:
	.line	652, "led.c"; 	else if (baseLedCounter <= (high + low))
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BANKSEL	r0x1025
	ADDAR	r0x1025,F
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BANKSEL	r0x1024
	ADCAR	r0x1024,F
	BANKSEL	_baseLedCounter
	MOVR	_baseLedCounter,W
	BANKSEL	r0x1025
	SUBAR	r0x1025,W
	BANKSEL	_baseLedCounter
	MOVR	(_baseLedCounter + 1),W
	BANKSEL	r0x1024
	SBCAR	r0x1024,W
	BTRSS	STATUS,0
	MGOTO	_02101_DS_
	.line	654, "led.c"; 	OUT_LED_R = led_r;
	BANKSEL	r0x1025
	CLRR	r0x1025
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,0
	MGOTO	_00005_DS_
	BANKSEL	r0x1025
	INCR	r0x1025,F
_00005_DS_:
	BANKSEL	r0x1025
	RRR	r0x1025,W
	BTRSS	STATUS,0
	BCR	_PORTAbits,7
	BTRSC	STATUS,0
	BSR	_PORTAbits,7
	.line	655, "led.c"; 	OUT_LED_G = led_g;
	CLRR	r0x1025
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,1
	MGOTO	_00006_DS_
	BANKSEL	r0x1025
	INCR	r0x1025,F
_00006_DS_:
	BANKSEL	r0x1025
	RRR	r0x1025,W
	BTRSS	STATUS,0
	BCR	_PORTBbits,3
	BTRSC	STATUS,0
	BSR	_PORTBbits,3
	.line	657, "led.c"; 	return 0;
	MOVIA	0x00
	MGOTO	_02106_DS_
_02101_DS_:
	.line	662, "led.c"; 	baseLedCounter = 0;
	BANKSEL	_baseLedCounter
	CLRR	_baseLedCounter
	CLRR	(_baseLedCounter + 1)
	.line	664, "led.c"; 	return res;
	MOVIA	0x01
_02106_DS_:
	.line	665, "led.c"; 	}
	RETURN	
; exit point of _ledRunOnce

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SetLedColor
;   _SetLedColor
;2 compiler assigned registers:
;   r0x1028
;   r0x1029
;; Starting pCode block
.segment "code"; module=led, function=_SetLedBreathingParameters2
	.debuginfo subprogram _SetLedBreathingParameters2
;local variable name mapping:
	.debuginfo complex-type (local-sym "_color" 1 "led.c" 613 (basetype 1 unsigned) split "r0x1028")
_SetLedBreathingParameters2:
; 2 exit points
	.line	613, "led.c"; 	void SetLedBreathingParameters2(u8 color)//
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	615, "led.c"; 	led_flash_flag = 0;//关闭闪烁效果
	BANKSEL	_led_flash_flag
	CLRR	_led_flash_flag
	.line	616, "led.c"; 	led_breath_flash_flag = 1;//打开呼吸效果
	BANKSEL	_sys_flag_2
	BSR	_sys_flag_2,2
	.line	617, "led.c"; 	breathingLightLow = 0;
	BANKSEL	_breathingLightLow
	CLRR	_breathingLightLow
	.line	618, "led.c"; 	breathingLightReversal = 0;	
	BANKSEL	_breathingLightReversal
	CLRR	_breathingLightReversal
	.line	619, "led.c"; 	SetLedColor(color);
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MCALL	_SetLedColor
	.line	620, "led.c"; 	OUT_LED_R = led_r;
	BANKSEL	r0x1029
	CLRR	r0x1029
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,0
	MGOTO	_00007_DS_
	BANKSEL	r0x1029
	INCR	r0x1029,F
_00007_DS_:
	BANKSEL	r0x1029
	RRR	r0x1029,W
	BTRSS	STATUS,0
	BCR	_PORTAbits,7
	BTRSC	STATUS,0
	BSR	_PORTAbits,7
	.line	621, "led.c"; 	OUT_LED_G = led_g;
	CLRR	r0x1029
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,1
	MGOTO	_00008_DS_
	BANKSEL	r0x1029
	INCR	r0x1029,F
_00008_DS_:
	BANKSEL	r0x1029
	RRR	r0x1029,W
	BTRSS	STATUS,0
	BCR	_PORTBbits,3
	BTRSC	STATUS,0
	BSR	_PORTBbits,3
	.line	623, "led.c"; 	if(color == COLOR_GREEN)//白灯
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02094_DS_
	.line	625, "led.c"; 	ledRunSup = 0;
	BANKSEL	_ledRunSup
	CLRR	_ledRunSup
	MGOTO	_02095_DS_
_02094_DS_:
	.line	627, "led.c"; 	else if(color == COLOR_RED)//红灯
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BTRSS	STATUS,2
	MGOTO	_02095_DS_
	.line	629, "led.c"; 	ledRunSup = 3;
	MOVIA	0x03
	BANKSEL	_ledRunSup
	MOVAR	_ledRunSup
_02095_DS_:
	.line	638, "led.c"; 	nowLedMode = 2;
	MOVIA	0x02
	BANKSEL	_nowLedMode
	MOVAR	_nowLedMode
	.line	639, "led.c"; 	}
	RETURN	
; exit point of _SetLedBreathingParameters2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=led, function=_SetLedBreathingParameters
	.debuginfo subprogram _SetLedBreathingParameters
_SetLedBreathingParameters:
; 2 exit points
	.line	589, "led.c"; 	led_flash_flag = 0;//关闭闪烁效果
	BANKSEL	_led_flash_flag
	CLRR	_led_flash_flag
	.line	590, "led.c"; 	led_breath_flash_flag = 1;//打开呼吸效果
	BANKSEL	_sys_flag_2
	BSR	_sys_flag_2,2
	.line	591, "led.c"; 	breathingLightLow = 0;
	BANKSEL	_breathingLightLow
	CLRR	_breathingLightLow
	.line	595, "led.c"; 	breathingLightReversal = 0;
	BANKSEL	_breathingLightReversal
	CLRR	_breathingLightReversal
	.line	597, "led.c"; 	ledRunStarStep++;
	BANKSEL	_ledRunStarStep
	INCR	_ledRunStarStep,F
;;unsigned compare: left < lit(0x6=6), size=1
	.line	598, "led.c"; 	if(ledRunStarStep >= 6)
	MOVIA	0x06
	SUBAR	_ledRunStarStep,W
	BTRSC	STATUS,0
	.line	599, "led.c"; 	ledRunStarStep = 0;
	CLRR	_ledRunStarStep
	.line	603, "led.c"; 	ledRunSup = 0;
	BANKSEL	_ledRunSup
	CLRR	_ledRunSup
	.line	604, "led.c"; 	ledRunStep = 0;
	BANKSEL	_ledRunStep
	CLRR	_ledRunStep
	.line	612, "led.c"; 	}
	RETURN	
; exit point of _SetLedBreathingParameters

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101A
;; Starting pCode block
.segment "code"; module=led, function=_LedFlash
	.debuginfo subprogram _LedFlash
_LedFlash:
; 2 exit points
	.line	337, "led.c"; 	if(led_flash_flag)
	BANKSEL	_led_flash_flag
	MOVR	_led_flash_flag,W
	BTRSC	STATUS,2
	MGOTO	_02079_DS_
	.line	339, "led.c"; 	if(led_delay_keep_time == 0)
	BANKSEL	_led_delay_keep_time
	MOVR	_led_delay_keep_time,W
	BTRSS	STATUS,2
	MGOTO	_02079_DS_
	.line	341, "led.c"; 	led_delay_keep_time = led_on_keep_time;
	BANKSEL	_led_on_keep_time
	MOVR	_led_on_keep_time,W
	BANKSEL	_led_delay_keep_time
	MOVAR	_led_delay_keep_time
	.line	342, "led.c"; 	if(led_flash_count > 0)
	BANKSEL	_led_flash_count
	MOVR	_led_flash_count,W
	BTRSS	STATUS,2
	.line	344, "led.c"; 	led_flash_count--;
	DECR	_led_flash_count,F
	.line	347, "led.c"; 	if(led_flash_count == 0)//0
	MOVR	_led_flash_count,W
	BTRSS	STATUS,2
	MGOTO	_02072_DS_
	.line	349, "led.c"; 	OUT_LED_R = LED_OFF;
	BSR	_PORTAbits,7
	.line	350, "led.c"; 	OUT_LED_G = LED_OFF;
	BSR	_PORTBbits,3
	.line	363, "led.c"; 	led_flash_flag = 0;
	BANKSEL	_led_flash_flag
	CLRR	_led_flash_flag
	.line	364, "led.c"; 	return led_flash_finish_return;
	BANKSEL	_led_flash_finish_return
	MOVR	_led_flash_finish_return,W
	MGOTO	_02080_DS_
_02072_DS_:
	.line	366, "led.c"; 	if(led_flash_count%2 == 0)
	BANKSEL	_led_flash_count
	BTRSC	_led_flash_count,0
	MGOTO	_02074_DS_
	.line	368, "led.c"; 	OUT_LED_R = led_r;
	BANKSEL	r0x101A
	CLRR	r0x101A
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,0
	MGOTO	_00009_DS_
	BANKSEL	r0x101A
	INCR	r0x101A,F
_00009_DS_:
	BANKSEL	r0x101A
	RRR	r0x101A,W
	BTRSS	STATUS,0
	BCR	_PORTAbits,7
	BTRSC	STATUS,0
	BSR	_PORTAbits,7
	.line	369, "led.c"; 	OUT_LED_G = led_g;
	CLRR	r0x101A
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,1
	MGOTO	_00010_DS_
	BANKSEL	r0x101A
	INCR	r0x101A,F
_00010_DS_:
	BANKSEL	r0x101A
	RRR	r0x101A,W
	BTRSS	STATUS,0
	BCR	_PORTBbits,3
	BTRSC	STATUS,0
	BSR	_PORTBbits,3
	.line	369, "led.c"; 	//OUT_LED_B = led_b;
	MGOTO	_02079_DS_
_02074_DS_:
	.line	386, "led.c"; 	OUT_LED_R = LED_OFF;
	BSR	_PORTAbits,7
	.line	387, "led.c"; 	OUT_LED_G = LED_OFF;
	BSR	_PORTBbits,3
_02079_DS_:
	.line	422, "led.c"; 	return 0;
	MOVIA	0x00
_02080_DS_:
	.line	423, "led.c"; 	}
	RETURN	
; exit point of _LedFlash

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=led, function=_LedOff
	.debuginfo subprogram _LedOff
_LedOff:
; 2 exit points
	.line	319, "led.c"; 	OUT_LED_R = LED_OFF;
	BSR	_PORTAbits,7
	.line	320, "led.c"; 	OUT_LED_G = LED_OFF;
	BSR	_PORTBbits,3
	.line	333, "led.c"; 	}
	RETURN	
; exit point of _LedOff

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SetLedColor
;   _SetLedColor
;1 compiler assigned register :
;   r0x101B
;; Starting pCode block
.segment "code"; module=led, function=_SetLedColorNormallyOn
	.debuginfo subprogram _SetLedColorNormallyOn
;local variable name mapping:
	.debuginfo complex-type (local-sym "_color" 1 "led.c" 294 (basetype 1 unsigned) split "r0x101B")
_SetLedColorNormallyOn:
; 2 exit points
	.line	294, "led.c"; 	void SetLedColorNormallyOn(u8 color)//设置颜色常亮
	BANKSEL	r0x101B
	MOVAR	r0x101B
	.line	297, "led.c"; 	led_breath_flash_flag = 0;//停止呼吸效果
	BANKSEL	_sys_flag_2
	BCR	_sys_flag_2,2
	.line	298, "led.c"; 	led_flash_flag = 0;
	BANKSEL	_led_flash_flag
	CLRR	_led_flash_flag
	.line	299, "led.c"; 	SetLedColor(color);
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	MCALL	_SetLedColor
	.line	300, "led.c"; 	OUT_LED_R = led_r;
	BANKSEL	r0x101B
	CLRR	r0x101B
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,0
	MGOTO	_00011_DS_
	BANKSEL	r0x101B
	INCR	r0x101B,F
_00011_DS_:
	BANKSEL	r0x101B
	RRR	r0x101B,W
	BTRSS	STATUS,0
	BCR	_PORTAbits,7
	BTRSC	STATUS,0
	BSR	_PORTAbits,7
	.line	301, "led.c"; 	OUT_LED_G = led_g;
	CLRR	r0x101B
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,1
	MGOTO	_00012_DS_
	BANKSEL	r0x101B
	INCR	r0x101B,F
_00012_DS_:
	BANKSEL	r0x101B
	RRR	r0x101B,W
	BTRSS	STATUS,0
	BCR	_PORTBbits,3
	BTRSC	STATUS,0
	BSR	_PORTBbits,3
	.line	314, "led.c"; 	}
	RETURN	
; exit point of _SetLedColorNormallyOn

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SetLedColor
;   _SetLedColor
;7 compiler assigned registers:
;   r0x102A
;   STK00
;   r0x102B
;   STK01
;   r0x102C
;   STK02
;   r0x102D
;; Starting pCode block
.segment "code"; module=led, function=_SetLedFlashParameters
	.debuginfo subprogram _SetLedFlashParameters
;local variable name mapping:
	.debuginfo complex-type (local-sym "_color" 1 "led.c" 266 (basetype 1 unsigned) split "r0x102A")
	.debuginfo complex-type (local-sym "_count" 1 "led.c" 266 (basetype 1 unsigned) split "r0x102B")
	.debuginfo complex-type (local-sym "_ledontime" 1 "led.c" 266 (basetype 1 unsigned) split "r0x102C")
	.debuginfo complex-type (local-sym "_flag" 1 "led.c" 266 (basetype 1 unsigned) split "r0x102D")
_SetLedFlashParameters:
; 2 exit points
	.line	266, "led.c"; 	void SetLedFlashParameters(u8 color,u8 count,u8 ledontime,u8 flag)//flag = 1不关机   flag = 2关机  ledontime--点亮时长(单位:10ms)
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVR	STK00,W
	BANKSEL	_led_flash_count
	MOVAR	_led_flash_count
;;1	MOVAR	r0x102B
	MOVR	STK01,W
	BANKSEL	_led_on_keep_time
	MOVAR	_led_on_keep_time
	BANKSEL	_led_delay_keep_time
	MOVAR	_led_delay_keep_time
;;1	MOVAR	r0x102C
	MOVR	STK02,W
	BANKSEL	_led_flash_finish_return
	MOVAR	_led_flash_finish_return
;;1	MOVAR	r0x102D
	.line	269, "led.c"; 	led_breath_flash_flag = 0;//停止呼吸效果
	BANKSEL	_sys_flag_2
	BCR	_sys_flag_2,2
	.line	270, "led.c"; 	led_flash_flag = 1;
	MOVIA	0x01
	BANKSEL	_led_flash_flag
	MOVAR	_led_flash_flag
;;101	MOVR	r0x102C,W
;;102	MOVR	r0x102C,W
;;99	MOVR	r0x102B,W
;;100	MOVR	r0x102D,W
	.line	275, "led.c"; 	SetLedColor(color);
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MCALL	_SetLedColor
	.line	276, "led.c"; 	OUT_LED_R = led_r;
	BANKSEL	r0x102A
	CLRR	r0x102A
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,0
	MGOTO	_00013_DS_
	BANKSEL	r0x102A
	INCR	r0x102A,F
_00013_DS_:
	BANKSEL	r0x102A
	RRR	r0x102A,W
	BTRSS	STATUS,0
	BCR	_PORTAbits,7
	BTRSC	STATUS,0
	BSR	_PORTAbits,7
	.line	277, "led.c"; 	OUT_LED_G = led_g;
	CLRR	r0x102A
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,1
	MGOTO	_00014_DS_
	BANKSEL	r0x102A
	INCR	r0x102A,F
_00014_DS_:
	BANKSEL	r0x102A
	RRR	r0x102A,W
	BTRSS	STATUS,0
	BCR	_PORTBbits,3
	BTRSC	STATUS,0
	BSR	_PORTBbits,3
	.line	292, "led.c"; 	}
	RETURN	
; exit point of _SetLedFlashParameters

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101A
;; Starting pCode block
.segment "code"; module=led, function=_SetLedColor
	.debuginfo subprogram _SetLedColor
;local variable name mapping:
	.debuginfo complex-type (local-sym "_color" 1 "led.c" 234 (basetype 1 unsigned) split "r0x101A")
_SetLedColor:
; 2 exit points
	.line	234, "led.c"; 	void SetLedColor(u8 color)
	BANKSEL	r0x101A
	MOVAR	r0x101A
	.line	236, "led.c"; 	if(color == COLOR_RED_GREEN)//---红绿色(粉绿色)--黄色
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02050_DS_
	.line	238, "led.c"; 	ledstatusdata = 0b100;//0b010;
	MOVIA	0x04
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	MGOTO	_02052_DS_
_02050_DS_:
	.line	240, "led.c"; 	else if(color == COLOR_GREEN)
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02047_DS_
	.line	242, "led.c"; 	ledstatusdata = 0b101;//---绿色
	MOVIA	0x05
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	MGOTO	_02052_DS_
_02047_DS_:
	.line	244, "led.c"; 	else if(color == COLOR_GREEN_BLUE)//---绿蓝色(淡蓝色)
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_02044_DS_
	.line	246, "led.c"; 	ledstatusdata = 0b001;
	MOVIA	0x01
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	MGOTO	_02052_DS_
_02044_DS_:
	.line	248, "led.c"; 	else if(color == COLOR_BLUE)
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_02041_DS_
	.line	250, "led.c"; 	ledstatusdata = 0b011;//---蓝色
	MOVIA	0x03
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	MGOTO	_02052_DS_
_02041_DS_:
	.line	252, "led.c"; 	else if(color == COLOR_RED_BLUE)//---红蓝色(粉红色)
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_02038_DS_
	.line	254, "led.c"; 	ledstatusdata = 0b010;//0b100;
	MOVIA	0x02
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	MGOTO	_02052_DS_
_02038_DS_:
	.line	256, "led.c"; 	else if(color == COLOR_WHITE)
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_02035_DS_
	.line	258, "led.c"; 	ledstatusdata = 0b000;//---白色
	BANKSEL	_ledstatusdata
	CLRR	_ledstatusdata
	MGOTO	_02052_DS_
_02035_DS_:
	.line	260, "led.c"; 	else if(color == COLOR_RED)
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	BTRSS	STATUS,2
	MGOTO	_02052_DS_
	.line	262, "led.c"; 	ledstatusdata = 0b110;//---红色
	MOVIA	0x06
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
_02052_DS_:
	.line	264, "led.c"; 	}
	RETURN	
; exit point of _SetLedColor

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x102E
;   STK00
;; Starting pCode block
.segment "code"; module=led, function=_SetLedGroup
	.debuginfo subprogram _SetLedGroup
;local variable name mapping:
	.debuginfo complex-type (local-sym "_group" 1 "led.c" 86 (basetype 1 unsigned) split "r0x102E")
_SetLedGroup:
; 2 exit points
	.line	86, "led.c"; 	void SetLedGroup(u8 group,u8 color)
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVR	STK00,W
	BANKSEL	_ledRunStep
	MOVAR	_ledRunStep
	.line	89, "led.c"; 	if(group == 0)
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	BTRSS	STATUS,2
	MGOTO	_02027_DS_
	.line	91, "led.c"; 	if(ledRunStep == 0)//---红色
	BANKSEL	_ledRunStep
	MOVR	_ledRunStep,W
	BTRSS	STATUS,2
	MGOTO	_02023_DS_
	.line	93, "led.c"; 	ledstatusdata = 0b110;
	MOVIA	0x06
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	.line	93, "led.c"; 	}
	MGOTO	_02027_DS_
_02023_DS_:
	.line	95, "led.c"; 	else if(ledRunStep == 1)//---绿色
	BANKSEL	_ledRunStep
	MOVR	_ledRunStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02020_DS_
	.line	97, "led.c"; 	ledstatusdata = 0b101;
	MOVIA	0x05
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	.line	97, "led.c"; 	}
	MGOTO	_02027_DS_
_02020_DS_:
	.line	99, "led.c"; 	else if(ledRunStep == 2)//---蓝色
	BANKSEL	_ledRunStep
	MOVR	_ledRunStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02017_DS_
	.line	101, "led.c"; 	ledstatusdata = 0b011;
	MOVIA	0x03
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	.line	101, "led.c"; 	}	
	MGOTO	_02027_DS_
_02017_DS_:
	.line	103, "led.c"; 	else if(ledRunStep == 3)//---绿蓝色(淡蓝色)
	BANKSEL	_ledRunStep
	MOVR	_ledRunStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_02014_DS_
	.line	105, "led.c"; 	ledstatusdata = 0b001;
	MOVIA	0x01
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	.line	105, "led.c"; 	}		
	MGOTO	_02027_DS_
_02014_DS_:
	.line	107, "led.c"; 	else if(ledRunStep == 4)//---白色
	BANKSEL	_ledRunStep
	MOVR	_ledRunStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_02011_DS_
	.line	109, "led.c"; 	ledstatusdata = 0b000;
	BANKSEL	_ledstatusdata
	CLRR	_ledstatusdata
	.line	109, "led.c"; 	}	
	MGOTO	_02027_DS_
_02011_DS_:
	.line	111, "led.c"; 	else if(ledRunStep == 5)//---红蓝色(粉红色)
	BANKSEL	_ledRunStep
	MOVR	_ledRunStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_02008_DS_
	.line	113, "led.c"; 	ledstatusdata = 0b010;//0b100;
	MOVIA	0x02
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	.line	113, "led.c"; 	}	
	MGOTO	_02027_DS_
_02008_DS_:
	.line	115, "led.c"; 	else if(ledRunStep == 6)//---红绿色(粉绿色)
	BANKSEL	_ledRunStep
	MOVR	_ledRunStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_02027_DS_
	.line	117, "led.c"; 	ledstatusdata = 0b100;//0b010;
	MOVIA	0x04
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
_02027_DS_:
	.line	232, "led.c"; 	}
	RETURN	
; exit point of _SetLedGroup


;	code size estimation:
;	  638+  260 =   898 instructions ( 2316 byte)

	end
