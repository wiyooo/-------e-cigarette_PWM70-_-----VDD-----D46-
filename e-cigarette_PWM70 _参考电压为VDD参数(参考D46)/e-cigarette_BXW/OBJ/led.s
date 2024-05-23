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
	extern	_led_flash_cnt
	extern	_led_dis_cnt
	extern	_res
	extern	_led_mode_flag
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
	extern	_led_dis_loop_func
	extern	_led_mode_set

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
r0x1033:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_led_mode_flag:
	.debuginfo complex-type (symbol "_led_mode_flag" 1 global "led.c" 65 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_res:
	.debuginfo complex-type (symbol "_res" 1 global "led.c" 669 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_led_dis_cnt:
	.debuginfo complex-type (symbol "_led_dis_cnt" 2 global "led.c" 1477 (basetype 2 unsigned))

	dw	0x00, 0x00	; 0


.segment "idata"
_led_flash_cnt:
	.debuginfo complex-type (symbol "_led_flash_cnt" 1 global "led.c" 1478 (basetype 1 unsigned))

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
;1 compiler assigned register :
;   r0x101E
;; Starting pCode block
.segment "code"; module=led, function=_led_mode_set
	.debuginfo subprogram _led_mode_set
;local variable name mapping:
	.debuginfo complex-type (local-sym "_mode" 1 "led.c" 1533 (basetype 1 unsigned) split "r0x101E")
_led_mode_set:
; 2 exit points
	.line	1533, "led.c"; 	void led_mode_set(u8 mode)
	BANKSEL	r0x101E
	MOVAR	r0x101E
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xB=11), size=1
	.line	1535, "led.c"; 	switch (mode)
	MOVIA	0x0b
	SUBAR	r0x101E,W
	BTRSC	STATUS,0
	MGOTO	_02334_DS_
	MOVIA	((_02342_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x101E,W
	ADDIA	_02342_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_02342_DS_:
	MGOTO	_02334_DS_
	MGOTO	_02324_DS_
	MGOTO	_02325_DS_
	MGOTO	_02326_DS_
	MGOTO	_02327_DS_
	MGOTO	_02328_DS_
	MGOTO	_02329_DS_
	MGOTO	_02330_DS_
	MGOTO	_02331_DS_
	MGOTO	_02332_DS_
	MGOTO	_02333_DS_
_02324_DS_:
	.line	1539, "led.c"; 	led_mode_flag = mode;
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	_led_mode_flag
	MOVAR	_led_mode_flag
	.line	1540, "led.c"; 	led_dis_cnt = 100;
	MOVIA	0x64
	BANKSEL	_led_dis_cnt
	MOVAR	_led_dis_cnt
	CLRR	(_led_dis_cnt + 1)
	.line	1541, "led.c"; 	break;
	MGOTO	_02336_DS_
_02325_DS_:
	.line	1543, "led.c"; 	led_mode_flag = mode;
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	_led_mode_flag
	MOVAR	_led_mode_flag
	.line	1544, "led.c"; 	PIN_LED = LED_ON;
	BCR	_PORTBbits,3
	.line	1545, "led.c"; 	break;
	MGOTO	_02336_DS_
_02326_DS_:
	.line	1547, "led.c"; 	led_mode_flag = mode;
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	_led_mode_flag
	MOVAR	_led_mode_flag
	.line	1548, "led.c"; 	PIN_LED = LED_OFF;
	BSR	_PORTBbits,3
	.line	1549, "led.c"; 	break;
	MGOTO	_02336_DS_
_02327_DS_:
	.line	1551, "led.c"; 	led_mode_flag = mode;
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	_led_mode_flag
	MOVAR	_led_mode_flag
	.line	1552, "led.c"; 	led_dis_cnt = 50;
	MOVIA	0x32
	BANKSEL	_led_dis_cnt
	MOVAR	_led_dis_cnt
	CLRR	(_led_dis_cnt + 1)
	.line	1553, "led.c"; 	led_flash_cnt = 2;
	MOVIA	0x02
	BANKSEL	_led_flash_cnt
	MOVAR	_led_flash_cnt
	.line	1554, "led.c"; 	break;
	MGOTO	_02336_DS_
_02328_DS_:
	.line	1556, "led.c"; 	led_mode_flag = mode;
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	_led_mode_flag
	MOVAR	_led_mode_flag
	.line	1557, "led.c"; 	led_dis_cnt = 50;
	MOVIA	0x32
	BANKSEL	_led_dis_cnt
	MOVAR	_led_dis_cnt
	CLRR	(_led_dis_cnt + 1)
	.line	1558, "led.c"; 	led_flash_cnt = 10;
	MOVIA	0x0a
	BANKSEL	_led_flash_cnt
	MOVAR	_led_flash_cnt
	.line	1559, "led.c"; 	break;
	MGOTO	_02336_DS_
_02329_DS_:
	.line	1561, "led.c"; 	led_mode_flag = mode;
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	_led_mode_flag
	MOVAR	_led_mode_flag
	.line	1562, "led.c"; 	led_dis_cnt = 50;
	MOVIA	0x32
	BANKSEL	_led_dis_cnt
	MOVAR	_led_dis_cnt
	CLRR	(_led_dis_cnt + 1)
	.line	1563, "led.c"; 	led_flash_cnt = 2;
	MOVIA	0x02
	BANKSEL	_led_flash_cnt
	MOVAR	_led_flash_cnt
	.line	1564, "led.c"; 	break;
	MGOTO	_02336_DS_
_02330_DS_:
	.line	1566, "led.c"; 	led_mode_flag = mode;
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	_led_mode_flag
	MOVAR	_led_mode_flag
	.line	1567, "led.c"; 	PIN_LED = LED_ON;
	BCR	_PORTBbits,3
	.line	1568, "led.c"; 	break;
	MGOTO	_02336_DS_
_02331_DS_:
	.line	1570, "led.c"; 	led_mode_flag = mode;
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	_led_mode_flag
	MOVAR	_led_mode_flag
	.line	1571, "led.c"; 	PIN_LED = LED_OFF;
	BSR	_PORTBbits,3
	.line	1572, "led.c"; 	break;
	MGOTO	_02336_DS_
_02332_DS_:
	.line	1574, "led.c"; 	led_mode_flag = mode;
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	_led_mode_flag
	MOVAR	_led_mode_flag
	.line	1575, "led.c"; 	PIN_LED = LED_OFF;
	BSR	_PORTBbits,3
	.line	1576, "led.c"; 	break;
	MGOTO	_02336_DS_
_02333_DS_:
	.line	1578, "led.c"; 	led_mode_flag = mode;
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	_led_mode_flag
	MOVAR	_led_mode_flag
	.line	1579, "led.c"; 	led_dis_cnt = 50;
	MOVIA	0x32
	BANKSEL	_led_dis_cnt
	MOVAR	_led_dis_cnt
	CLRR	(_led_dis_cnt + 1)
	.line	1580, "led.c"; 	led_flash_cnt = 5;
	MOVIA	0x05
	BANKSEL	_led_flash_cnt
	MOVAR	_led_flash_cnt
	.line	1581, "led.c"; 	break;
	MGOTO	_02336_DS_
_02334_DS_:
	.line	1583, "led.c"; 	led_mode_flag = 0;
	BANKSEL	_led_mode_flag
	CLRR	_led_mode_flag
	.line	1584, "led.c"; 	PIN_LED = LED_OFF;
	BSR	_PORTBbits,3
_02336_DS_:
	.line	1587, "led.c"; 	}
	RETURN	
; exit point of _led_mode_set

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=led, function=_led_dis_loop_func
	.debuginfo subprogram _led_dis_loop_func
_led_dis_loop_func:
; 2 exit points
	.line	1483, "led.c"; 	switch (led_mode_flag)
	BANKSEL	_led_mode_flag
	MOVR	_led_mode_flag,W
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_02241_DS_
	MOVR	_led_mode_flag,W
	XORIA	0x04
	BTRSC	STATUS,2
	MGOTO	_02248_DS_
	MOVR	_led_mode_flag,W
	XORIA	0x05
	BTRSC	STATUS,2
	MGOTO	_02248_DS_
	MOVR	_led_mode_flag,W
	XORIA	0x0a
	BTRSC	STATUS,2
	MGOTO	_02248_DS_
	MGOTO	_02266_DS_
_02241_DS_:
	.line	1486, "led.c"; 	if(led_dis_cnt)
	BANKSEL	_led_dis_cnt
	MOVR	(_led_dis_cnt + 1),W
	IORAR	_led_dis_cnt,W
	BTRSC	STATUS,2
	MGOTO	_02266_DS_
	.line	1488, "led.c"; 	PIN_LED = LED_ON;
	BCR	_PORTBbits,3
	.line	1489, "led.c"; 	if(--led_dis_cnt == 0)
	MOVIA	0xff
	ADDAR	_led_dis_cnt,F
	MOVIA	0xff
	ADCAR	(_led_dis_cnt + 1),F
	MOVR	(_led_dis_cnt + 1),W
	IORAR	_led_dis_cnt,W
	BTRSS	STATUS,2
	MGOTO	_02266_DS_
	.line	1491, "led.c"; 	PIN_LED = LED_OFF;
	BSR	_PORTBbits,3
	.line	1492, "led.c"; 	led_mode_flag = 0;
	BANKSEL	_led_mode_flag
	CLRR	_led_mode_flag
	.line	1495, "led.c"; 	break;
	MGOTO	_02266_DS_
_02248_DS_:
	.line	1499, "led.c"; 	led_dis_cnt--;
	MOVIA	0xff
	BANKSEL	_led_dis_cnt
	ADDAR	_led_dis_cnt,F
	MOVIA	0xff
	ADCAR	(_led_dis_cnt + 1),F
;;unsigned compare: left < lit(0x19=25), size=2
	.line	1500, "led.c"; 	if (led_dis_cnt >= 25)
	MOVIA	0x19
	SUBAR	_led_dis_cnt,W
	MOVIA	0x00
	SBCAR	(_led_dis_cnt + 1),W
	BTRSS	STATUS,0
	MGOTO	_02262_DS_
	.line	1502, "led.c"; 	PIN_LED = LED_OFF;
	BSR	_PORTBbits,3
	MGOTO	_02266_DS_
_02262_DS_:
	.line	1504, "led.c"; 	else if (led_dis_cnt > 0)
	BANKSEL	_led_dis_cnt
	MOVR	(_led_dis_cnt + 1),W
	IORAR	_led_dis_cnt,W
	BTRSC	STATUS,2
	MGOTO	_02259_DS_
	.line	1506, "led.c"; 	PIN_LED = LED_ON;
	BCR	_PORTBbits,3
	MGOTO	_02266_DS_
_02259_DS_:
	.line	1508, "led.c"; 	else if(led_dis_cnt == 0)
	BANKSEL	_led_dis_cnt
	MOVR	(_led_dis_cnt + 1),W
	IORAR	_led_dis_cnt,W
	BTRSS	STATUS,2
	MGOTO	_02266_DS_
	.line	1510, "led.c"; 	if(led_flash_cnt)
	BANKSEL	_led_flash_cnt
	MOVR	_led_flash_cnt,W
	BTRSC	STATUS,2
	MGOTO	_02266_DS_
	.line	1512, "led.c"; 	led_flash_cnt--;
	DECR	_led_flash_cnt,F
	.line	1513, "led.c"; 	if(led_flash_cnt != 0)
	MOVR	_led_flash_cnt,W
	BTRSC	STATUS,2
	MGOTO	_02252_DS_
	.line	1515, "led.c"; 	led_dis_cnt = 50;
	MOVIA	0x32
	BANKSEL	_led_dis_cnt
	MOVAR	_led_dis_cnt
	CLRR	(_led_dis_cnt + 1)
	MGOTO	_02266_DS_
_02252_DS_:
	.line	1517, "led.c"; 	else if(led_flash_cnt == 0)
	BANKSEL	_led_flash_cnt
	MOVR	_led_flash_cnt,W
	BTRSS	STATUS,2
	MGOTO	_02266_DS_
	.line	1519, "led.c"; 	led_dis_cnt = 0;
	BANKSEL	_led_dis_cnt
	CLRR	_led_dis_cnt
	CLRR	(_led_dis_cnt + 1)
	.line	1520, "led.c"; 	PIN_LED = LED_OFF;
	BSR	_PORTBbits,3
	.line	1521, "led.c"; 	led_mode_flag = 0;
	BANKSEL	_led_mode_flag
	CLRR	_led_mode_flag
_02266_DS_:
	.line	1531, "led.c"; 	}
	RETURN	
; exit point of _led_dis_loop_func

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SetLedColorNormallyOn
;   _SetLedColorNormallyOn
;   _LedFlash
;   _SetLedColorNormallyOn
;   _SetLedColorNormallyOn
;   _LedFlash
;1 compiler assigned register :
;   r0x1021
;; Starting pCode block
.segment "code"; module=led, function=_led_handle
	.debuginfo subprogram _led_handle
;local variable name mapping:
	.debuginfo complex-type (local-sym "_flashresult" 1 "led.c" 1400 (basetype 1 unsigned) split "r0x1021")
_led_handle:
; 2 exit points
	.line	1402, "led.c"; 	switch(nowLedMode)
	BANKSEL	_nowLedMode
	MOVR	_nowLedMode,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x33=51), size=2
	.line	1405, "led.c"; 	if(LedShowKeepTime > 50)
	MOVIA	0x33
	BANKSEL	_LedShowKeepTime
	SUBAR	_LedShowKeepTime,W
	MOVIA	0x00
	SBCAR	(_LedShowKeepTime + 1),W
	BTRSS	STATUS,0
	MGOTO	_02218_DS_
	.line	1408, "led.c"; 	SetLedColorNormallyOn(COLOR_RED);//红色
	MOVIA	0x00
	MCALL	_SetLedColorNormallyOn
	MGOTO	_00001_DS_
_02218_DS_:
	.line	1410, "led.c"; 	else if(LedShowKeepTime > 0)
	BANKSEL	_LedShowKeepTime
	MOVR	(_LedShowKeepTime + 1),W
	IORAR	_LedShowKeepTime,W
	BTRSC	STATUS,2
	MGOTO	_02215_DS_
	.line	1412, "led.c"; 	SetLedColorNormallyOn(COLOR_GREEN);
	MOVIA	0x02
	MCALL	_SetLedColorNormallyOn
	MGOTO	_00001_DS_
_02215_DS_:
	.line	1414, "led.c"; 	else if(LedShowKeepTime == 0)
	BANKSEL	_LedShowKeepTime
	MOVR	(_LedShowKeepTime + 1),W
	IORAR	_LedShowKeepTime,W
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	.line	1417, "led.c"; 	nowLedMode = 0;
	BANKSEL	_nowLedMode
	CLRR	_nowLedMode
_00001_DS_:
	.line	1422, "led.c"; 	flashresult = LedFlash();
	MCALL	_LedFlash
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	1423, "led.c"; 	if(flashresult == 2)
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02228_DS_
	.line	1425, "led.c"; 	if(f_charging)
	BANKSEL	_sys_flag_0
	BTRSS	_sys_flag_0,6
	MGOTO	_02225_DS_
	.line	1427, "led.c"; 	if(f_charge_full)
	BTRSS	_sys_flag_0,4
	MGOTO	_02222_DS_
	.line	1430, "led.c"; 	nowLedMode = 0;
	BANKSEL	_nowLedMode
	CLRR	_nowLedMode
	.line	1432, "led.c"; 	msg = MSG_CHRG_FULL;
	MOVIA	0x07
	BANKSEL	_msg
	MOVAR	_msg
	MGOTO	_02228_DS_
_02222_DS_:
	.line	1437, "led.c"; 	msg = MSG_CHRG;
	MOVIA	0x03
	BANKSEL	_msg
	MOVAR	_msg
	MGOTO	_02228_DS_
_02225_DS_:
	.line	1443, "led.c"; 	nowLedMode = 0;
	BANKSEL	_nowLedMode
	CLRR	_nowLedMode
_02228_DS_:
	.line	1451, "led.c"; 	if(flashresult == 1)
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02236_DS_
	.line	1453, "led.c"; 	if(f_charging)//
	BANKSEL	_sys_flag_0
	BTRSS	_sys_flag_0,6
	MGOTO	_02236_DS_
	.line	1455, "led.c"; 	if(f_charge_full)
	BTRSS	_sys_flag_0,4
	MGOTO	_02230_DS_
	.line	1457, "led.c"; 	msg = MSG_CHRG_FULL;
	MOVIA	0x07
	BANKSEL	_msg
	MOVAR	_msg
	MGOTO	_02236_DS_
_02230_DS_:
	.line	1464, "led.c"; 	msg = MSG_CHRG;
	MOVIA	0x03
	BANKSEL	_msg
	MOVAR	_msg
_02236_DS_:
	.line	1475, "led.c"; 	}
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
	.line	1359, "led.c"; 	led_flash_flag = 0;
	BANKSEL	_led_flash_flag
	CLRR	_led_flash_flag
	.line	1361, "led.c"; 	led_delay_keep_time = 0;
	BANKSEL	_led_delay_keep_time
	CLRR	_led_delay_keep_time
	.line	1362, "led.c"; 	led_on_keep_time = 0;
	BANKSEL	_led_on_keep_time
	CLRR	_led_on_keep_time
	.line	1364, "led.c"; 	ledRunStep = 0;
	BANKSEL	_ledRunStep
	CLRR	_ledRunStep
	.line	1365, "led.c"; 	ledRunSup = 0;
	BANKSEL	_ledRunSup
	CLRR	_ledRunSup
	.line	1374, "led.c"; 	led_flash_count = 0;//变量公用方式
	BANKSEL	_led_flash_count
	CLRR	_led_flash_count
	.line	1376, "led.c"; 	delay_keep_time = 0;
	BANKSEL	_delay_keep_time
	CLRR	_delay_keep_time
	.line	1377, "led.c"; 	EnterbatteryLowFlag = 0;
	BANKSEL	_EnterbatteryLowFlag
	CLRR	_EnterbatteryLowFlag
	.line	1381, "led.c"; 	nowLedMode = 0;
	BANKSEL	_nowLedMode
	CLRR	_nowLedMode
	.line	1383, "led.c"; 	LedPwmDuty = 0;
	BANKSEL	_LedPwmDuty
	CLRR	_LedPwmDuty
	.line	1384, "led.c"; 	Led_Breathe_count = 0;
	BANKSEL	_Led_Breathe_count
	CLRR	_Led_Breathe_count
	.line	1385, "led.c"; 	LedShowStep = 0;
	BANKSEL	_LedShowStep
	CLRR	_LedShowStep
	.line	1387, "led.c"; 	LedPwmCycleCount = 0;
	BANKSEL	_LedPwmCycleCount
	CLRR	_LedPwmCycleCount
	.line	1388, "led.c"; 	led_breath_flash_flag = 0;
	BANKSEL	_sys_flag_2
	BCR	_sys_flag_2,2
	.line	1391, "led.c"; 	}
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
;   r0x1027
;; Starting pCode block
.segment "code"; module=led, function=_ledRun
	.debuginfo subprogram _ledRun
_ledRun:
; 2 exit points
	.line	1031, "led.c"; 	if(led_breath_flash_flag)
	BANKSEL	_sys_flag_2
	BTRSS	_sys_flag_2,2
	MGOTO	_02202_DS_
	.line	1033, "led.c"; 	if(ledRunSup == 0)
	BANKSEL	_ledRunSup
	MOVR	_ledRunSup,W
	BTRSS	STATUS,2
	MGOTO	_02198_DS_
	.line	1036, "led.c"; 	breathingVar = 65;//63;//85;
	MOVIA	0x41
	BANKSEL	_breathingVar
	MOVAR	_breathingVar
	.line	1037, "led.c"; 	if(breathingLedRunOnce_ToUp())
	MCALL	_breathingLedRunOnce_ToUp
	BANKSEL	r0x1027
	MOVAR	r0x1027
	MOVR	r0x1027,W
	BTRSC	STATUS,2
	MGOTO	_02174_DS_
	.line	1039, "led.c"; 	ledRunSup = 1;
	MOVIA	0x01
	BANKSEL	_ledRunSup
	MOVAR	_ledRunSup
_02174_DS_:
	.line	1041, "led.c"; 	if(!keyPressStatus)
	BANKSEL	_sys_flag_1
	BTRSC	_sys_flag_1,4
	MGOTO	_02202_DS_
	.line	1043, "led.c"; 	ledRunSup = 2;
	MOVIA	0x02
	BANKSEL	_ledRunSup
	MOVAR	_ledRunSup
	.line	1044, "led.c"; 	isbreathingFlag = 1;
	BANKSEL	_sys_flag_1
	BSR	_sys_flag_1,2
	.line	1044, "led.c"; 	}
	MGOTO	_02202_DS_
_02198_DS_:
	.line	1047, "led.c"; 	else if(ledRunSup == 1)
	BANKSEL	_ledRunSup
	MOVR	_ledRunSup,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02195_DS_
	.line	1049, "led.c"; 	if(!keyPressStatus)
	BANKSEL	_sys_flag_1
	BTRSC	_sys_flag_1,4
	MGOTO	_02180_DS_
	.line	1051, "led.c"; 	ledRunSup = 2;
	MOVIA	0x02
	BANKSEL	_ledRunSup
	MOVAR	_ledRunSup
	.line	1052, "led.c"; 	isbreathingFlag = 1;
	BANKSEL	_sys_flag_1
	BSR	_sys_flag_1,2
	MGOTO	_02202_DS_
_02180_DS_:
	.line	1056, "led.c"; 	if(LedShowKeepTime == 0)
	BANKSEL	_LedShowKeepTime
	MOVR	(_LedShowKeepTime + 1),W
	IORAR	_LedShowKeepTime,W
	BTRSS	STATUS,2
	MGOTO	_02202_DS_
	.line	1060, "led.c"; 	msg = MSG_SMOKE_TIMEOUT;
	MOVIA	0x0a
	BANKSEL	_msg
	MOVAR	_msg
	.line	1060, "led.c"; 	}
	MGOTO	_02202_DS_
_02195_DS_:
	.line	1066, "led.c"; 	else if(ledRunSup == 2)
	BANKSEL	_ledRunSup
	MOVR	_ledRunSup,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02192_DS_
	.line	1069, "led.c"; 	if(breathingLedRunOnce_ToDown())
	MCALL	_breathingLedRunOnce_ToDown
	BANKSEL	r0x1027
	MOVAR	r0x1027
	MOVR	r0x1027,W
	BTRSC	STATUS,2
	MGOTO	_02202_DS_
	.line	1072, "led.c"; 	ledRunStep = 0;
	BANKSEL	_ledRunStep
	CLRR	_ledRunStep
	.line	1074, "led.c"; 	ledRunSup = 0;
	BANKSEL	_ledRunSup
	CLRR	_ledRunSup
	.line	1075, "led.c"; 	nowLedMode = 0;
	BANKSEL	_nowLedMode
	CLRR	_nowLedMode
	.line	1076, "led.c"; 	isbreathingFlag = 0;
	BANKSEL	_sys_flag_1
	BCR	_sys_flag_1,2
	.line	1077, "led.c"; 	led_breath_flash_flag = 0;
	BANKSEL	_sys_flag_2
	BCR	_sys_flag_2,2
	.line	1078, "led.c"; 	if(f_charging)//吸完烟后如果当前还在充电状态则需恢复充电的指示灯状态
	BANKSEL	_sys_flag_0
	BTRSS	_sys_flag_0,6
	MGOTO	_02202_DS_
	.line	1080, "led.c"; 	if(f_charge_full)
	BTRSS	_sys_flag_0,4
	MGOTO	_02183_DS_
	.line	1082, "led.c"; 	msg = MSG_CHRG_FULL;	
	MOVIA	0x07
	BANKSEL	_msg
	MOVAR	_msg
	MGOTO	_02202_DS_
_02183_DS_:
	.line	1087, "led.c"; 	msg = MSG_CHRG;
	MOVIA	0x03
	BANKSEL	_msg
	MOVAR	_msg
	.line	1087, "led.c"; 	}
	MGOTO	_02202_DS_
_02192_DS_:
	.line	1095, "led.c"; 	else if(ledRunSup == 3)
	BANKSEL	_ledRunSup
	MOVR	_ledRunSup,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_02202_DS_
	.line	1098, "led.c"; 	breathingVar = 140;//65;//70;//85;
	MOVIA	0x8c
	BANKSEL	_breathingVar
	MOVAR	_breathingVar
	.line	1119, "led.c"; 	breathingLedRunOnce_FirstToUp_AfterToDown();
	MCALL	_breathingLedRunOnce_FirstToUp_AfterToDown
_02202_DS_:
	.line	1245, "led.c"; 	}
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
;   r0x1028
;; Starting pCode block
.segment "code"; module=led, function=_breathingLedRunOnce_FirstToUp_AfterToDown2
	.debuginfo subprogram _breathingLedRunOnce_FirstToUp_AfterToDown2
_breathingLedRunOnce_FirstToUp_AfterToDown2:
; 2 exit points
	.line	791, "led.c"; 	if (breathingLightReversal == 0)
	BANKSEL	_breathingLightReversal
	MOVR	_breathingLightReversal,W
	BTRSS	STATUS,2
	MGOTO	_02166_DS_
	.line	793, "led.c"; 	if(breathingLedRunOnce_ToUp())
	MCALL	_breathingLedRunOnce_ToUp
	BANKSEL	r0x1028
	MOVAR	r0x1028
	MOVR	r0x1028,W
	BTRSC	STATUS,2
	MGOTO	_02167_DS_
	.line	795, "led.c"; 	breathingLightReversal = 1;
	MOVIA	0x01
	BANKSEL	_breathingLightReversal
	MOVAR	_breathingLightReversal
;;unsigned compare: left < lit(0x2=2), size=1
	.line	796, "led.c"; 	if(ledRunStep < 2)
	MOVIA	0x02
	BANKSEL	_ledRunStep
	SUBAR	_ledRunStep,W
	BTRSC	STATUS,0
	MGOTO	_02152_DS_
	.line	797, "led.c"; 	BuleLed_delay_keep_time = 27;//35;//4;//20;
	MOVIA	0x1b
	BANKSEL	_BuleLed_delay_keep_time
	MOVAR	_BuleLed_delay_keep_time
	MGOTO	_02167_DS_
_02152_DS_:
	.line	799, "led.c"; 	BuleLed_delay_keep_time = 30;//35;//4;//20;
	MOVIA	0x1e
	BANKSEL	_BuleLed_delay_keep_time
	MOVAR	_BuleLed_delay_keep_time
	MGOTO	_02167_DS_
_02166_DS_:
	.line	803, "led.c"; 	else if(breathingLightReversal == 1)
	BANKSEL	_breathingLightReversal
	MOVR	_breathingLightReversal,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02163_DS_
	.line	805, "led.c"; 	if(BuleLed_delay_keep_time == 0)
	BANKSEL	_BuleLed_delay_keep_time
	MOVR	_BuleLed_delay_keep_time,W
	BTRSS	STATUS,2
	MGOTO	_02167_DS_
	.line	807, "led.c"; 	breathingLightReversal = 2;
	MOVIA	0x02
	BANKSEL	_breathingLightReversal
	MOVAR	_breathingLightReversal
	MGOTO	_02167_DS_
_02163_DS_:
	.line	810, "led.c"; 	else if(breathingLightReversal == 2)
	BANKSEL	_breathingLightReversal
	MOVR	_breathingLightReversal,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02167_DS_
	.line	812, "led.c"; 	if(breathingLedRunOnce_ToDown())
	MCALL	_breathingLedRunOnce_ToDown
	BANKSEL	r0x1028
	MOVAR	r0x1028
	MOVR	r0x1028,W
	BTRSC	STATUS,2
	MGOTO	_02167_DS_
	.line	814, "led.c"; 	breathingLightReversal = 0;
	BANKSEL	_breathingLightReversal
	CLRR	_breathingLightReversal
	.line	815, "led.c"; 	return 1;
	MOVIA	0x01
	MGOTO	_02168_DS_
_02167_DS_:
	.line	818, "led.c"; 	return 0;
	MOVIA	0x00
_02168_DS_:
	.line	819, "led.c"; 	}
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
;   r0x1026
;; Starting pCode block
.segment "code"; module=led, function=_breathingLedRunOnce_FirstToUp_AfterToDown
	.debuginfo subprogram _breathingLedRunOnce_FirstToUp_AfterToDown
_breathingLedRunOnce_FirstToUp_AfterToDown:
; 2 exit points
	.line	771, "led.c"; 	if (breathingLightReversal)
	BANKSEL	_breathingLightReversal
	MOVR	_breathingLightReversal,W
	BTRSC	STATUS,2
	MGOTO	_02144_DS_
	.line	773, "led.c"; 	if(breathingLedRunOnce_ToDown())
	MCALL	_breathingLedRunOnce_ToDown
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVR	r0x1026,W
	BTRSC	STATUS,2
	MGOTO	_02145_DS_
	.line	775, "led.c"; 	breathingLightReversal = 0;
	BANKSEL	_breathingLightReversal
	CLRR	_breathingLightReversal
	.line	776, "led.c"; 	return 1;
	MOVIA	0x01
	MGOTO	_02146_DS_
_02144_DS_:
	.line	781, "led.c"; 	if(breathingLedRunOnce_ToUp())
	MCALL	_breathingLedRunOnce_ToUp
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVR	r0x1026,W
	BTRSC	STATUS,2
	MGOTO	_02145_DS_
	.line	783, "led.c"; 	breathingLightReversal = 1;
	MOVIA	0x01
	BANKSEL	_breathingLightReversal
	MOVAR	_breathingLightReversal
_02145_DS_:
	.line	786, "led.c"; 	return 0;
	MOVIA	0x00
_02146_DS_:
	.line	787, "led.c"; 	}
	RETURN	
; exit point of _breathingLedRunOnce_FirstToUp_AfterToDown

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;4 compiler assigned registers:
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;; Starting pCode block
.segment "code"; module=led, function=_breathingLedRunOnce_ToDown
	.debuginfo subprogram _breathingLedRunOnce_ToDown
_breathingLedRunOnce_ToDown:
; 2 exit points
	.line	722, "led.c"; 	res = 0;
	BANKSEL	_res
	CLRR	_res
	.line	723, "led.c"; 	baseLedCounter++;
	BANKSEL	_baseLedCounter
	INCR	_baseLedCounter,F
	BTRSC	STATUS,2
	INCR	(_baseLedCounter + 1),F
	.line	724, "led.c"; 	if (baseLedCounter <=  breathingVar - breathingLightLow)
	BANKSEL	_breathingVar
	MOVR	_breathingVar,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
	BANKSEL	r0x1023
	CLRR	r0x1023
	BANKSEL	_breathingLightLow
	MOVR	_breathingLightLow,W
;;3	MOVAR	r0x1024
	BANKSEL	r0x1022
	SUBAR	r0x1022,F
	MOVIA	0x00
	BANKSEL	r0x1023
	SBCAR	r0x1023,F
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1025
	MOVAR	r0x1025
	BANKSEL	_baseLedCounter
	MOVR	_baseLedCounter,W
	BANKSEL	r0x1024
	SUBAR	r0x1024,W
	BANKSEL	_baseLedCounter
	MOVR	(_baseLedCounter + 1),W
	BANKSEL	r0x1025
	SBCAR	r0x1025,W
	BTRSS	STATUS,0
	MGOTO	_02132_DS_
	.line	726, "led.c"; 	OUT_LED_R = LED_OFF;
	BSR	_PORTAbits,7
	.line	727, "led.c"; 	OUT_LED_G = LED_OFF;
	BSR	_PORTBbits,3
	MGOTO	_02133_DS_
_02132_DS_:
	.line	731, "led.c"; 	else if (baseLedCounter <= breathingVar)
	BANKSEL	_breathingVar
	MOVR	_breathingVar,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
	BANKSEL	r0x1023
	CLRR	r0x1023
	BANKSEL	_baseLedCounter
	MOVR	_baseLedCounter,W
	BANKSEL	r0x1022
	SUBAR	r0x1022,W
	BANKSEL	_baseLedCounter
	MOVR	(_baseLedCounter + 1),W
	BANKSEL	r0x1023
	SBCAR	r0x1023,W
	BTRSS	STATUS,0
	MGOTO	_02129_DS_
	.line	733, "led.c"; 	OUT_LED_R = led_r;
	BANKSEL	r0x1022
	CLRR	r0x1022
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,0
	MGOTO	_00002_DS_
	BANKSEL	r0x1022
	INCR	r0x1022,F
_00002_DS_:
	BANKSEL	r0x1022
	RRR	r0x1022,W
	BTRSS	STATUS,0
	BCR	_PORTAbits,7
	BTRSC	STATUS,0
	BSR	_PORTAbits,7
	.line	734, "led.c"; 	OUT_LED_G = led_g;
	CLRR	r0x1022
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,1
	MGOTO	_00003_DS_
	BANKSEL	r0x1022
	INCR	r0x1022,F
_00003_DS_:
	BANKSEL	r0x1022
	RRR	r0x1022,W
	BTRSS	STATUS,0
	BCR	_PORTBbits,3
	BTRSC	STATUS,0
	BSR	_PORTBbits,3
	MGOTO	_02133_DS_
_02129_DS_:
	.line	742, "led.c"; 	if (breathingLightLow == 0)
	BANKSEL	_breathingLightLow
	MOVR	_breathingLightLow,W
	BTRSS	STATUS,2
	MGOTO	_02126_DS_
	.line	744, "led.c"; 	return 1;
	MOVIA	0x01
	MGOTO	_02134_DS_
_02126_DS_:
	.line	748, "led.c"; 	breathingLightLow--;
	BANKSEL	_breathingLightLow
	DECR	_breathingLightLow,F
	.line	750, "led.c"; 	baseLedCounter = 0;
	BANKSEL	_baseLedCounter
	CLRR	_baseLedCounter
	CLRR	(_baseLedCounter + 1)
_02133_DS_:
	.line	766, "led.c"; 	return 0;
	MOVIA	0x00
_02134_DS_:
	.line	767, "led.c"; 	}
	RETURN	
; exit point of _breathingLedRunOnce_ToDown

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;4 compiler assigned registers:
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;; Starting pCode block
.segment "code"; module=led, function=_breathingLedRunOnce_ToUp
	.debuginfo subprogram _breathingLedRunOnce_ToUp
_breathingLedRunOnce_ToUp:
; 2 exit points
	.line	673, "led.c"; 	res = 0;
	BANKSEL	_res
	CLRR	_res
	.line	674, "led.c"; 	baseLedCounter++;
	BANKSEL	_baseLedCounter
	INCR	_baseLedCounter,F
	BTRSC	STATUS,2
	INCR	(_baseLedCounter + 1),F
	.line	675, "led.c"; 	if (baseLedCounter <=  breathingVar - breathingLightLow)
	BANKSEL	_breathingVar
	MOVR	_breathingVar,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
	BANKSEL	r0x1023
	CLRR	r0x1023
	BANKSEL	_breathingLightLow
	MOVR	_breathingLightLow,W
;;3	MOVAR	r0x1024
	BANKSEL	r0x1022
	SUBAR	r0x1022,F
	MOVIA	0x00
	BANKSEL	r0x1023
	SBCAR	r0x1023,F
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1025
	MOVAR	r0x1025
	BANKSEL	_baseLedCounter
	MOVR	_baseLedCounter,W
	BANKSEL	r0x1024
	SUBAR	r0x1024,W
	BANKSEL	_baseLedCounter
	MOVR	(_baseLedCounter + 1),W
	BANKSEL	r0x1025
	SBCAR	r0x1025,W
	BTRSS	STATUS,0
	MGOTO	_02118_DS_
	.line	677, "led.c"; 	OUT_LED_R = LED_OFF;
	BSR	_PORTAbits,7
	.line	678, "led.c"; 	OUT_LED_G = LED_OFF;
	BSR	_PORTBbits,3
	MGOTO	_02119_DS_
_02118_DS_:
	.line	682, "led.c"; 	else if (baseLedCounter <= breathingVar)
	BANKSEL	_breathingVar
	MOVR	_breathingVar,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
	BANKSEL	r0x1023
	CLRR	r0x1023
	BANKSEL	_baseLedCounter
	MOVR	_baseLedCounter,W
	BANKSEL	r0x1022
	SUBAR	r0x1022,W
	BANKSEL	_baseLedCounter
	MOVR	(_baseLedCounter + 1),W
	BANKSEL	r0x1023
	SBCAR	r0x1023,W
	BTRSS	STATUS,0
	MGOTO	_02115_DS_
	.line	684, "led.c"; 	OUT_LED_R = led_r;
	BANKSEL	r0x1022
	CLRR	r0x1022
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,0
	MGOTO	_00004_DS_
	BANKSEL	r0x1022
	INCR	r0x1022,F
_00004_DS_:
	BANKSEL	r0x1022
	RRR	r0x1022,W
	BTRSS	STATUS,0
	BCR	_PORTAbits,7
	BTRSC	STATUS,0
	BSR	_PORTAbits,7
	.line	685, "led.c"; 	OUT_LED_G = led_g;
	CLRR	r0x1022
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,1
	MGOTO	_00005_DS_
	BANKSEL	r0x1022
	INCR	r0x1022,F
_00005_DS_:
	BANKSEL	r0x1022
	RRR	r0x1022,W
	BTRSS	STATUS,0
	BCR	_PORTBbits,3
	BTRSC	STATUS,0
	BSR	_PORTBbits,3
	MGOTO	_02119_DS_
_02115_DS_:
	.line	692, "led.c"; 	if (breathingLightLow == breathingVar)
	BANKSEL	_breathingVar
	MOVR	_breathingVar,W
	BANKSEL	_breathingLightLow
	XORAR	_breathingLightLow,W
	BTRSS	STATUS,2
	MGOTO	_02112_DS_
	.line	694, "led.c"; 	return 1;
	MOVIA	0x01
	MGOTO	_02120_DS_
_02112_DS_:
	.line	698, "led.c"; 	breathingLightLow++;
	BANKSEL	_breathingLightLow
	INCR	_breathingLightLow,F
	.line	700, "led.c"; 	baseLedCounter = 0;
	BANKSEL	_baseLedCounter
	CLRR	_baseLedCounter
	CLRR	(_baseLedCounter + 1)
_02119_DS_:
	.line	717, "led.c"; 	return 0;
	MOVIA	0x00
_02120_DS_:
	.line	718, "led.c"; 	}
	RETURN	
; exit point of _breathingLedRunOnce_ToUp

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;7 compiler assigned registers:
;   r0x1029
;   STK00
;   r0x102A
;   STK01
;   r0x102B
;   STK02
;   r0x102C
;; Starting pCode block
.segment "code"; module=led, function=_ledRunOnce
	.debuginfo subprogram _ledRunOnce
;local variable name mapping:
	.debuginfo complex-type (local-sym "_low" 2 "led.c" 643 (basetype 2 unsigned) split "r0x102A" "r0x1029")
	.debuginfo complex-type (local-sym "_high" 2 "led.c" 643 (basetype 2 unsigned) split "r0x102C" "r0x102B")
_ledRunOnce:
; 2 exit points
	.line	643, "led.c"; 	u8 ledRunOnce(u16 low,u16 high)
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVR	STK00,W
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVR	STK01,W
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVR	STK02,W
	BANKSEL	r0x102C
	MOVAR	r0x102C
	.line	646, "led.c"; 	baseLedCounter++;
	BANKSEL	_baseLedCounter
	INCR	_baseLedCounter,F
	BTRSC	STATUS,2
	INCR	(_baseLedCounter + 1),F
	.line	647, "led.c"; 	if (baseLedCounter <= high)
	MOVR	_baseLedCounter,W
	BANKSEL	r0x102C
	SUBAR	r0x102C,W
	BANKSEL	_baseLedCounter
	MOVR	(_baseLedCounter + 1),W
	BANKSEL	r0x102B
	SBCAR	r0x102B,W
	BTRSS	STATUS,0
	MGOTO	_02104_DS_
	.line	649, "led.c"; 	OUT_LED_R = LED_OFF;
	BSR	_PORTAbits,7
	.line	650, "led.c"; 	OUT_LED_G = LED_OFF;
	BSR	_PORTBbits,3
	.line	652, "led.c"; 	return 0;
	MOVIA	0x00
	MGOTO	_02106_DS_
_02104_DS_:
	.line	654, "led.c"; 	else if (baseLedCounter <= (high + low))
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BANKSEL	r0x102A
	ADDAR	r0x102A,F
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BANKSEL	r0x1029
	ADCAR	r0x1029,F
	BANKSEL	_baseLedCounter
	MOVR	_baseLedCounter,W
	BANKSEL	r0x102A
	SUBAR	r0x102A,W
	BANKSEL	_baseLedCounter
	MOVR	(_baseLedCounter + 1),W
	BANKSEL	r0x1029
	SBCAR	r0x1029,W
	BTRSS	STATUS,0
	MGOTO	_02101_DS_
	.line	656, "led.c"; 	OUT_LED_R = led_r;
	BANKSEL	r0x102A
	CLRR	r0x102A
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,0
	MGOTO	_00006_DS_
	BANKSEL	r0x102A
	INCR	r0x102A,F
_00006_DS_:
	BANKSEL	r0x102A
	RRR	r0x102A,W
	BTRSS	STATUS,0
	BCR	_PORTAbits,7
	BTRSC	STATUS,0
	BSR	_PORTAbits,7
	.line	657, "led.c"; 	OUT_LED_G = led_g;
	CLRR	r0x102A
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,1
	MGOTO	_00007_DS_
	BANKSEL	r0x102A
	INCR	r0x102A,F
_00007_DS_:
	BANKSEL	r0x102A
	RRR	r0x102A,W
	BTRSS	STATUS,0
	BCR	_PORTBbits,3
	BTRSC	STATUS,0
	BSR	_PORTBbits,3
	.line	659, "led.c"; 	return 0;
	MOVIA	0x00
	MGOTO	_02106_DS_
_02101_DS_:
	.line	664, "led.c"; 	baseLedCounter = 0;
	BANKSEL	_baseLedCounter
	CLRR	_baseLedCounter
	CLRR	(_baseLedCounter + 1)
	.line	666, "led.c"; 	return res;
	MOVIA	0x01
_02106_DS_:
	.line	667, "led.c"; 	}
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
;   r0x102D
;   r0x102E
;; Starting pCode block
.segment "code"; module=led, function=_SetLedBreathingParameters2
	.debuginfo subprogram _SetLedBreathingParameters2
;local variable name mapping:
	.debuginfo complex-type (local-sym "_color" 1 "led.c" 615 (basetype 1 unsigned) split "r0x102D")
_SetLedBreathingParameters2:
; 2 exit points
	.line	615, "led.c"; 	void SetLedBreathingParameters2(u8 color)//
	BANKSEL	r0x102D
	MOVAR	r0x102D
	.line	617, "led.c"; 	led_flash_flag = 0;//关闭闪烁效果
	BANKSEL	_led_flash_flag
	CLRR	_led_flash_flag
	.line	618, "led.c"; 	led_breath_flash_flag = 1;//打开呼吸效果
	BANKSEL	_sys_flag_2
	BSR	_sys_flag_2,2
	.line	619, "led.c"; 	breathingLightLow = 0;
	BANKSEL	_breathingLightLow
	CLRR	_breathingLightLow
	.line	620, "led.c"; 	breathingLightReversal = 0;	
	BANKSEL	_breathingLightReversal
	CLRR	_breathingLightReversal
	.line	621, "led.c"; 	SetLedColor(color);
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	MCALL	_SetLedColor
	.line	622, "led.c"; 	OUT_LED_R = led_r;
	BANKSEL	r0x102E
	CLRR	r0x102E
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,0
	MGOTO	_00008_DS_
	BANKSEL	r0x102E
	INCR	r0x102E,F
_00008_DS_:
	BANKSEL	r0x102E
	RRR	r0x102E,W
	BTRSS	STATUS,0
	BCR	_PORTAbits,7
	BTRSC	STATUS,0
	BSR	_PORTAbits,7
	.line	623, "led.c"; 	OUT_LED_G = led_g;
	CLRR	r0x102E
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,1
	MGOTO	_00009_DS_
	BANKSEL	r0x102E
	INCR	r0x102E,F
_00009_DS_:
	BANKSEL	r0x102E
	RRR	r0x102E,W
	BTRSS	STATUS,0
	BCR	_PORTBbits,3
	BTRSC	STATUS,0
	BSR	_PORTBbits,3
	.line	625, "led.c"; 	if(color == COLOR_GREEN)//白灯
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02094_DS_
	.line	627, "led.c"; 	ledRunSup = 0;
	BANKSEL	_ledRunSup
	CLRR	_ledRunSup
	MGOTO	_02095_DS_
_02094_DS_:
	.line	629, "led.c"; 	else if(color == COLOR_RED)//红灯
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BTRSS	STATUS,2
	MGOTO	_02095_DS_
	.line	631, "led.c"; 	ledRunSup = 3;
	MOVIA	0x03
	BANKSEL	_ledRunSup
	MOVAR	_ledRunSup
_02095_DS_:
	.line	640, "led.c"; 	nowLedMode = 2;
	MOVIA	0x02
	BANKSEL	_nowLedMode
	MOVAR	_nowLedMode
	.line	641, "led.c"; 	}
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
	.line	591, "led.c"; 	led_flash_flag = 0;//关闭闪烁效果
	BANKSEL	_led_flash_flag
	CLRR	_led_flash_flag
	.line	592, "led.c"; 	led_breath_flash_flag = 1;//打开呼吸效果
	BANKSEL	_sys_flag_2
	BSR	_sys_flag_2,2
	.line	593, "led.c"; 	breathingLightLow = 0;
	BANKSEL	_breathingLightLow
	CLRR	_breathingLightLow
	.line	597, "led.c"; 	breathingLightReversal = 0;
	BANKSEL	_breathingLightReversal
	CLRR	_breathingLightReversal
	.line	599, "led.c"; 	ledRunStarStep++;
	BANKSEL	_ledRunStarStep
	INCR	_ledRunStarStep,F
;;unsigned compare: left < lit(0x6=6), size=1
	.line	600, "led.c"; 	if(ledRunStarStep >= 6)
	MOVIA	0x06
	SUBAR	_ledRunStarStep,W
	BTRSC	STATUS,0
	.line	601, "led.c"; 	ledRunStarStep = 0;
	CLRR	_ledRunStarStep
	.line	605, "led.c"; 	ledRunSup = 0;
	BANKSEL	_ledRunSup
	CLRR	_ledRunSup
	.line	606, "led.c"; 	ledRunStep = 0;
	BANKSEL	_ledRunStep
	CLRR	_ledRunStep
	.line	614, "led.c"; 	}
	RETURN	
; exit point of _SetLedBreathingParameters

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101F
;; Starting pCode block
.segment "code"; module=led, function=_LedFlash
	.debuginfo subprogram _LedFlash
_LedFlash:
; 2 exit points
	.line	339, "led.c"; 	if(led_flash_flag)
	BANKSEL	_led_flash_flag
	MOVR	_led_flash_flag,W
	BTRSC	STATUS,2
	MGOTO	_02079_DS_
	.line	341, "led.c"; 	if(led_delay_keep_time == 0)
	BANKSEL	_led_delay_keep_time
	MOVR	_led_delay_keep_time,W
	BTRSS	STATUS,2
	MGOTO	_02079_DS_
	.line	343, "led.c"; 	led_delay_keep_time = led_on_keep_time;
	BANKSEL	_led_on_keep_time
	MOVR	_led_on_keep_time,W
	BANKSEL	_led_delay_keep_time
	MOVAR	_led_delay_keep_time
	.line	344, "led.c"; 	if(led_flash_count > 0)
	BANKSEL	_led_flash_count
	MOVR	_led_flash_count,W
	BTRSS	STATUS,2
	.line	346, "led.c"; 	led_flash_count--;
	DECR	_led_flash_count,F
	.line	349, "led.c"; 	if(led_flash_count == 0)//0
	MOVR	_led_flash_count,W
	BTRSS	STATUS,2
	MGOTO	_02072_DS_
	.line	351, "led.c"; 	OUT_LED_R = LED_OFF;
	BSR	_PORTAbits,7
	.line	352, "led.c"; 	OUT_LED_G = LED_OFF;
	BSR	_PORTBbits,3
	.line	365, "led.c"; 	led_flash_flag = 0;
	BANKSEL	_led_flash_flag
	CLRR	_led_flash_flag
	.line	366, "led.c"; 	return led_flash_finish_return;
	BANKSEL	_led_flash_finish_return
	MOVR	_led_flash_finish_return,W
	MGOTO	_02080_DS_
_02072_DS_:
	.line	368, "led.c"; 	if(led_flash_count%2 == 0)
	BANKSEL	_led_flash_count
	BTRSC	_led_flash_count,0
	MGOTO	_02074_DS_
	.line	370, "led.c"; 	OUT_LED_R = led_r;
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,0
	MGOTO	_00010_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00010_DS_:
	BANKSEL	r0x101F
	RRR	r0x101F,W
	BTRSS	STATUS,0
	BCR	_PORTAbits,7
	BTRSC	STATUS,0
	BSR	_PORTAbits,7
	.line	371, "led.c"; 	OUT_LED_G = led_g;
	CLRR	r0x101F
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,1
	MGOTO	_00011_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00011_DS_:
	BANKSEL	r0x101F
	RRR	r0x101F,W
	BTRSS	STATUS,0
	BCR	_PORTBbits,3
	BTRSC	STATUS,0
	BSR	_PORTBbits,3
	.line	371, "led.c"; 	//OUT_LED_B = led_b;
	MGOTO	_02079_DS_
_02074_DS_:
	.line	388, "led.c"; 	OUT_LED_R = LED_OFF;
	BSR	_PORTAbits,7
	.line	389, "led.c"; 	OUT_LED_G = LED_OFF;
	BSR	_PORTBbits,3
_02079_DS_:
	.line	424, "led.c"; 	return 0;
	MOVIA	0x00
_02080_DS_:
	.line	425, "led.c"; 	}
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
	.line	321, "led.c"; 	OUT_LED_R = LED_OFF;
	BSR	_PORTAbits,7
	.line	322, "led.c"; 	OUT_LED_G = LED_OFF;
	BSR	_PORTBbits,3
	.line	335, "led.c"; 	}
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
;   r0x1020
;; Starting pCode block
.segment "code"; module=led, function=_SetLedColorNormallyOn
	.debuginfo subprogram _SetLedColorNormallyOn
;local variable name mapping:
	.debuginfo complex-type (local-sym "_color" 1 "led.c" 296 (basetype 1 unsigned) split "r0x1020")
_SetLedColorNormallyOn:
; 2 exit points
	.line	296, "led.c"; 	void SetLedColorNormallyOn(u8 color)//设置颜色常亮
	BANKSEL	r0x1020
	MOVAR	r0x1020
	.line	299, "led.c"; 	led_breath_flash_flag = 0;//停止呼吸效果
	BANKSEL	_sys_flag_2
	BCR	_sys_flag_2,2
	.line	300, "led.c"; 	led_flash_flag = 0;
	BANKSEL	_led_flash_flag
	CLRR	_led_flash_flag
	.line	301, "led.c"; 	SetLedColor(color);
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	MCALL	_SetLedColor
	.line	302, "led.c"; 	OUT_LED_R = led_r;
	BANKSEL	r0x1020
	CLRR	r0x1020
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,0
	MGOTO	_00012_DS_
	BANKSEL	r0x1020
	INCR	r0x1020,F
_00012_DS_:
	BANKSEL	r0x1020
	RRR	r0x1020,W
	BTRSS	STATUS,0
	BCR	_PORTAbits,7
	BTRSC	STATUS,0
	BSR	_PORTAbits,7
	.line	303, "led.c"; 	OUT_LED_G = led_g;
	CLRR	r0x1020
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,1
	MGOTO	_00013_DS_
	BANKSEL	r0x1020
	INCR	r0x1020,F
_00013_DS_:
	BANKSEL	r0x1020
	RRR	r0x1020,W
	BTRSS	STATUS,0
	BCR	_PORTBbits,3
	BTRSC	STATUS,0
	BSR	_PORTBbits,3
	.line	316, "led.c"; 	}
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
;   r0x102F
;   STK00
;   r0x1030
;   STK01
;   r0x1031
;   STK02
;   r0x1032
;; Starting pCode block
.segment "code"; module=led, function=_SetLedFlashParameters
	.debuginfo subprogram _SetLedFlashParameters
;local variable name mapping:
	.debuginfo complex-type (local-sym "_color" 1 "led.c" 268 (basetype 1 unsigned) split "r0x102F")
	.debuginfo complex-type (local-sym "_count" 1 "led.c" 268 (basetype 1 unsigned) split "r0x1030")
	.debuginfo complex-type (local-sym "_ledontime" 1 "led.c" 268 (basetype 1 unsigned) split "r0x1031")
	.debuginfo complex-type (local-sym "_flag" 1 "led.c" 268 (basetype 1 unsigned) split "r0x1032")
_SetLedFlashParameters:
; 2 exit points
	.line	268, "led.c"; 	void SetLedFlashParameters(u8 color,u8 count,u8 ledontime,u8 flag)//flag = 1不关机   flag = 2关机  ledontime--点亮时长(单位:10ms)
	BANKSEL	r0x102F
	MOVAR	r0x102F
	MOVR	STK00,W
	BANKSEL	_led_flash_count
	MOVAR	_led_flash_count
;;1	MOVAR	r0x1030
	MOVR	STK01,W
	BANKSEL	_led_on_keep_time
	MOVAR	_led_on_keep_time
	BANKSEL	_led_delay_keep_time
	MOVAR	_led_delay_keep_time
;;1	MOVAR	r0x1031
	MOVR	STK02,W
	BANKSEL	_led_flash_finish_return
	MOVAR	_led_flash_finish_return
;;1	MOVAR	r0x1032
	.line	271, "led.c"; 	led_breath_flash_flag = 0;//停止呼吸效果
	BANKSEL	_sys_flag_2
	BCR	_sys_flag_2,2
	.line	272, "led.c"; 	led_flash_flag = 1;
	MOVIA	0x01
	BANKSEL	_led_flash_flag
	MOVAR	_led_flash_flag
;;101	MOVR	r0x1031,W
;;102	MOVR	r0x1031,W
;;99	MOVR	r0x1030,W
;;100	MOVR	r0x1032,W
	.line	277, "led.c"; 	SetLedColor(color);
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	MCALL	_SetLedColor
	.line	278, "led.c"; 	OUT_LED_R = led_r;
	BANKSEL	r0x102F
	CLRR	r0x102F
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,0
	MGOTO	_00014_DS_
	BANKSEL	r0x102F
	INCR	r0x102F,F
_00014_DS_:
	BANKSEL	r0x102F
	RRR	r0x102F,W
	BTRSS	STATUS,0
	BCR	_PORTAbits,7
	BTRSC	STATUS,0
	BSR	_PORTAbits,7
	.line	279, "led.c"; 	OUT_LED_G = led_g;
	CLRR	r0x102F
	BANKSEL	_ledstatusdata
	BTRSS	_ledstatusdata,1
	MGOTO	_00015_DS_
	BANKSEL	r0x102F
	INCR	r0x102F,F
_00015_DS_:
	BANKSEL	r0x102F
	RRR	r0x102F,W
	BTRSS	STATUS,0
	BCR	_PORTBbits,3
	BTRSC	STATUS,0
	BSR	_PORTBbits,3
	.line	294, "led.c"; 	}
	RETURN	
; exit point of _SetLedFlashParameters

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101F
;; Starting pCode block
.segment "code"; module=led, function=_SetLedColor
	.debuginfo subprogram _SetLedColor
;local variable name mapping:
	.debuginfo complex-type (local-sym "_color" 1 "led.c" 236 (basetype 1 unsigned) split "r0x101F")
_SetLedColor:
; 2 exit points
	.line	236, "led.c"; 	void SetLedColor(u8 color)
	BANKSEL	r0x101F
	MOVAR	r0x101F
	.line	238, "led.c"; 	if(color == COLOR_RED_GREEN)//---红绿色(粉绿色)--黄色
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02050_DS_
	.line	240, "led.c"; 	ledstatusdata = 0b100;//0b010;
	MOVIA	0x04
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	MGOTO	_02052_DS_
_02050_DS_:
	.line	242, "led.c"; 	else if(color == COLOR_GREEN)
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02047_DS_
	.line	244, "led.c"; 	ledstatusdata = 0b101;//---绿色
	MOVIA	0x05
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	MGOTO	_02052_DS_
_02047_DS_:
	.line	246, "led.c"; 	else if(color == COLOR_GREEN_BLUE)//---绿蓝色(淡蓝色)
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_02044_DS_
	.line	248, "led.c"; 	ledstatusdata = 0b001;
	MOVIA	0x01
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	MGOTO	_02052_DS_
_02044_DS_:
	.line	250, "led.c"; 	else if(color == COLOR_BLUE)
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_02041_DS_
	.line	252, "led.c"; 	ledstatusdata = 0b011;//---蓝色
	MOVIA	0x03
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	MGOTO	_02052_DS_
_02041_DS_:
	.line	254, "led.c"; 	else if(color == COLOR_RED_BLUE)//---红蓝色(粉红色)
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_02038_DS_
	.line	256, "led.c"; 	ledstatusdata = 0b010;//0b100;
	MOVIA	0x02
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	MGOTO	_02052_DS_
_02038_DS_:
	.line	258, "led.c"; 	else if(color == COLOR_WHITE)
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_02035_DS_
	.line	260, "led.c"; 	ledstatusdata = 0b000;//---白色
	BANKSEL	_ledstatusdata
	CLRR	_ledstatusdata
	MGOTO	_02052_DS_
_02035_DS_:
	.line	262, "led.c"; 	else if(color == COLOR_RED)
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BTRSS	STATUS,2
	MGOTO	_02052_DS_
	.line	264, "led.c"; 	ledstatusdata = 0b110;//---红色
	MOVIA	0x06
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
_02052_DS_:
	.line	266, "led.c"; 	}
	RETURN	
; exit point of _SetLedColor

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1033
;   STK00
;; Starting pCode block
.segment "code"; module=led, function=_SetLedGroup
	.debuginfo subprogram _SetLedGroup
;local variable name mapping:
	.debuginfo complex-type (local-sym "_group" 1 "led.c" 88 (basetype 1 unsigned) split "r0x1033")
_SetLedGroup:
; 2 exit points
	.line	88, "led.c"; 	void SetLedGroup(u8 group,u8 color)
	BANKSEL	r0x1033
	MOVAR	r0x1033
	MOVR	STK00,W
	BANKSEL	_ledRunStep
	MOVAR	_ledRunStep
	.line	91, "led.c"; 	if(group == 0)
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	BTRSS	STATUS,2
	MGOTO	_02027_DS_
	.line	93, "led.c"; 	if(ledRunStep == 0)//---红色
	BANKSEL	_ledRunStep
	MOVR	_ledRunStep,W
	BTRSS	STATUS,2
	MGOTO	_02023_DS_
	.line	95, "led.c"; 	ledstatusdata = 0b110;
	MOVIA	0x06
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	.line	95, "led.c"; 	}
	MGOTO	_02027_DS_
_02023_DS_:
	.line	97, "led.c"; 	else if(ledRunStep == 1)//---绿色
	BANKSEL	_ledRunStep
	MOVR	_ledRunStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02020_DS_
	.line	99, "led.c"; 	ledstatusdata = 0b101;
	MOVIA	0x05
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	.line	99, "led.c"; 	}
	MGOTO	_02027_DS_
_02020_DS_:
	.line	101, "led.c"; 	else if(ledRunStep == 2)//---蓝色
	BANKSEL	_ledRunStep
	MOVR	_ledRunStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02017_DS_
	.line	103, "led.c"; 	ledstatusdata = 0b011;
	MOVIA	0x03
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	.line	103, "led.c"; 	}	
	MGOTO	_02027_DS_
_02017_DS_:
	.line	105, "led.c"; 	else if(ledRunStep == 3)//---绿蓝色(淡蓝色)
	BANKSEL	_ledRunStep
	MOVR	_ledRunStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_02014_DS_
	.line	107, "led.c"; 	ledstatusdata = 0b001;
	MOVIA	0x01
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	.line	107, "led.c"; 	}		
	MGOTO	_02027_DS_
_02014_DS_:
	.line	109, "led.c"; 	else if(ledRunStep == 4)//---白色
	BANKSEL	_ledRunStep
	MOVR	_ledRunStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_02011_DS_
	.line	111, "led.c"; 	ledstatusdata = 0b000;
	BANKSEL	_ledstatusdata
	CLRR	_ledstatusdata
	.line	111, "led.c"; 	}	
	MGOTO	_02027_DS_
_02011_DS_:
	.line	113, "led.c"; 	else if(ledRunStep == 5)//---红蓝色(粉红色)
	BANKSEL	_ledRunStep
	MOVR	_ledRunStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_02008_DS_
	.line	115, "led.c"; 	ledstatusdata = 0b010;//0b100;
	MOVIA	0x02
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
	.line	115, "led.c"; 	}	
	MGOTO	_02027_DS_
_02008_DS_:
	.line	117, "led.c"; 	else if(ledRunStep == 6)//---红绿色(粉绿色)
	BANKSEL	_ledRunStep
	MOVR	_ledRunStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_02027_DS_
	.line	119, "led.c"; 	ledstatusdata = 0b100;//0b010;
	MOVIA	0x04
	BANKSEL	_ledstatusdata
	MOVAR	_ledstatusdata
_02027_DS_:
	.line	234, "led.c"; 	}
	RETURN	
; exit point of _SetLedGroup


;	code size estimation:
;	  795+  302 =  1097 instructions ( 2798 byte)

	end
