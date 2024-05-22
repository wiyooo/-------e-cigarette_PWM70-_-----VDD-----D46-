//==============================================================================
//	Include Header Files
//==============================================================================
#include "common.h"


//==============================================================================
//	Macro Definition
//==============================================================================


//==============================================================================
//	Variable Definitions
//==============================================================================


//==============================================================================
//	Function Declaration
//==============================================================================
void gpio_init(void);
void timer0_init(void);
void timer1_init(void);
void pwm1_init(void);
#if USE_MCU == __CPU_NY8A062D__
void pwm2_init(void);
void adc_init(void);
#endif
void pwm3_init(void);

void wdt_init(void);
void lvd_init(void);
void lvr_init(void);
void isr_init(void);


//==============================================================================
//	Function: system_init
//		Input: None
//		Output: None
//==============================================================================
void system_init(void)
{
	//Disable Interrupt.
	DISI();
//	CMPCR = 0x0a;
	gpio_init();
	timer0_init();
	timer1_init();
//	pwm1_init();
#if USE_MCU == __CPU_NY8A062D__
//	pwm2_init();
	//adc2_init();
#endif
//	pwm3_init();
	wdt_init();
	lvd_init();
	lvr_init();
	isr_init();

	//Enable Interrupt.
	ENI();
}


//==============================================================================
//	Function: sleep_init
//		Input: None
//		Output: None
//==============================================================================
void sleep_init(void)
{
	//Disable Interrupt.
	DISI();
	
	gpio_init();
	PCON1 &= ~0x01;			//disable timer0
	//T2CR1 = 0x82;			//disable pwm2
	//T3CR1 = 0x82;			//disable pwm3
	//#if USE_MCU == __CPU_NY8A062D
	#if USE_MCU == __CPU_NY8A062D__
	ADMD = 0x00;			//disable adc
	#endif
	PCONbits.WDTEN = 0;		//enable watchdog
	//PCONbits.WDTEN = 1;		//disable watchdog
	PCONbits.LVREN = 1;		//enable lvr
	//INTE = C_INT_PABKey|C_INT_WDT;//0x42;//0100 0010b -bit1-C_INT_PABKey bit6-C_INT_WDT
	INTE = C_INT_PABKey;//0x42;//0100 0010b -bit1-C_INT_PABKey bit6-C_INT_WDT
	INTF = 0x00;

	//Enable Interrupt.
	ENI();
}


//==============================================================================
//	Function: gpio_init
//		Input: None
//		Output: None
//==============================================================================
void gpio_init(void)
{
	//------------------------------------------------------
	//	io status, 0:low, 1:high
	//------------------------------------------------------
	//PA7 = 1, output, LED_R.
	//PA6 = 0, output, not used.
	//PA5 = 0, output, 吸烟时暂停充电工作控制IO.
	//PA4 = 0, input, USB check
	//PA3 = 0, output, not used.
	//PA2 = 0, input, CHRG
	//PA1 = 0, output, not used.
	//PA0 = 0, input,ADC,heat插拔公用.
	PORTA = 0x80;
	//xx
	//xx
	//PB5 = 0, output, not used.
	//PB4 = 0, output, not used.
	//PB3 = 1, output, LED_G.
	//PB2 = 1, output, PWM2.
	//PB1 = 0, output, not used.
	//PB0 = 0, input, MIC.
	PORTB = 0x0c;
	
	//------------------------------------------------------
	//	io direction, 0:output, 1:input
	//------------------------------------------------------
	//IOPA7 = 0, output, LED_R.
	//IOPA6 = 0, output, not used.
	//IOPA5 = 0, output, 吸烟时暂停充电工作控制IO.
	//IOPA4 = 1, input, USB check
	//IOPA3 = 0, output, not used.
	//IOPA2 = 1, input, CHRG
	//IOPA1 = 0, output, not used.
	//IOPA0 = 1, input,ADC,heat插拔公用.
	IOSTA = 0x15;
	//xx
	//xx
	//IOPB5 = 0, output, not used.
	//IOPB4 = 0, output, not used.
	//IOPB3 = 0, output, LED_G.
	//IOPB2 = 0, output, PWM2.
	//IOPB1 = 0, output, not used.
	//IOPB0 = 1, input, MIC.
	IOSTB = 0x01;
	
	//------------------------------------------------------
	//	pull-up resistor, 0:enable, 1:disable
	//------------------------------------------------------
	//PHPA7 = 1,
	//PHPA6 = 1, 
	//PLPA5 = 1.
	//PHPA4 = 1.
	//PHPA3 = 1.
	//PHPA2 = 0.
	//PHPA1 = 1, 
	//PHPA0 = 1, 
	APHCON = 0xfb;
	
	//PHPA5 = 1						
	PCONbits.PHPA5 = 1;	
	
	//xx
	//xx
	//PHPB5 = 1.
	//PHPB4 = 1.
	//PHPB3 = 1.
	//PHPB2 = 1. 
	//PHPB1 = 1.
	//PHPB0 = 1.
	BPHCON = 0x3F;
	
	//------------------------------------------------------
	//	pull-down resistor, 0:enable, 1:disable
	//------------------------------------------------------
	//PLPB3 = 1.
	//PLPB2 = 1.
	//PLPB1 = 1.
	//PLPB0 = 0.
	//PLPA3 = 1, 
	//PLPA2 = 1.
	//PLPA1 = 1.
	//PLPA0 = 1.
	//ABPLCON = 0xef;//for test
	ABPLCON = 0xff;
	//------------------------------------------------------
	//	portA and portB wake up, 0:disable, 1:enable
	//------------------------------------------------------
	//WUPA7 = 0.
	//WUPA6 = 0.
	//WUPA5 = 1.
	//WUPA4 = 0.
	//WUPA3 = 0.
	//WUPA2 = 1.
	//WUPA1 = 0.
	//WUPA0 = 1.
	AWUCON = C_PA4_Wakeup;//C_PA0_Wakeup|C_PA2_Wakeup|C_PA5_Wakeup;
	//xx
	//xx
	//WUPB5 = 0.
	//WUPB4 = 0.
	//WUPB3 = 0.
	//WUPB2 = 0.
	//WUPB1 = 0.
	//WUPB0 = 1.
	BWUCON = C_PB0_Wakeup;
	#if USE_MCU == __CPU_NY8A062D__
	//------------------------------------------------------
	//	0:as gpio pin or ad pin, 1:only as ad pin
	//------------------------------------------------------
	//PBCON2 = 0,
	//PBCON1 = 0,
	//PBCON0 = 0,
	//PACON4 = 0,
	//PACON3 = 0.
	//PACON2 = 0,
	//PACON1 = 0,
	//PACON0 = 1,
	PACON = 0;//C_PA0_AIN0;
	//PBCON5 = 0.
	ADCRbits.PBCON5 = 0; 
	//PBCON4 = 0.
	ADCRbits.PBCON4 = 0;
	//PBCON3 = 0.
	ADCRbits.PBCON3 = 0;
	#endif
	
	//------------------------------------------------------
	//0:disable open-drain, 1:enable open-drain
	//------------------------------------------------------
	BODCON = 0x00;
}


//==============================================================================
//	Function: timer0_init
//		Input: None
//		Output: None
//==============================================================================
void timer0_init(void)
{
	PCON1 &= ~0x01;						//disable timer0
	
	//8M/2T=4M
	//4M/16 = 250K
	//Per step is 4us
	//4us * 250 = 1ms
	//256 - 250 = 6		
/*	
#if	USE_TIMER0_1K
	
#if USE_CPU_CLOCK == USE_4M_2T
	T0MD = C_PS0_TMR0 | C_PS0_Div8 ;				

#elif USE_CPU_CLOCK == USE_8M_2T
	T0MD = C_PS0_TMR0 | C_PS0_Div16 ;		
#endif	
	// Load 0x00 to TMR0 (Initial Timer0 register)
	TMR0 = 6;			// (256-X)/(4MM/16) = 1/1K -> (256-X)/250K = 1/1K -> X = 256-250 = 6;						
	// --------------- 产生10K -------------------
#elif USE_TIMER0_10K

#if USE_CPU_CLOCK == USE_4M_4T
	T0MD = C_PS0_TMR0 | C_PS0_Div0 ;		// Prescaler0 is assigned to Timer0, Prescaler0 dividing rate = 1:4,clock source is instruction clock					// Enable Timer0

#elif USE_CPU_CLOCK == USE_4M_2T
	T0MD = C_PS0_TMR0 | C_PS0_Div2 ;		

#elif USE_CPU_CLOCK == USE_8M_4T
	T0MD = C_PS0_TMR0 | C_PS0_Div2 ;		

#elif USE_CPU_CLOCK == USE_8M_2T
	T0MD = C_PS0_TMR0 | C_PS0_Div4 ;		
#endif	
	// Load 0x00 to TMR0 (Initial Timer0 register)
	TMR0 = 163;//156;			// (256-X)/(4MM/4) = 1/10K -> (256-X)/1KK = 1/10K -> X = 256-100 = 156;
#endif	
*/	
	TMR0 = 163;//156;			// (256-X)/(4MM/4) = 1/10K -> (256-X)/1KK = 1/10K -> X = 256-100 = 156;
//	TMR0 = 6;//156;			// (256-X)/(4MM/4) = 1/4K -> (256-X)/1KK = 1/4K -> X = 256-250 = 6;
//   TMR0 = 131;//156;			// (256-X)/(2MM/4) = 1/4K -> (256-X)/500K = 1/4K -> X = 256-125 = 131;
/*	
#define		C_PS0_TMR0					0x00			//; Prescaler0 is assigned to TMR0
//;Bit[2:0] : Prescaler0 Dividing Rate Selection
#define		C_PS0_Div					0x07			//; Prescaler0 Dividing Rate Selection
#define		C_PS0_Div2					0x00
#define		C_PS0_Div4					0x01
#define		C_PS0_Div8					0x02
#define		C_PS0_Div16					0x03
#define		C_PS0_Div32					0x04
#define		C_PS0_Div64					0x05
#define		C_PS0_Div128				0x06
#define		C_PS0_Div256				0x07	
*/	
	T0MD = C_PS0_TMR0 | C_PS0_Div2 ;
//	T0MD = C_PS0_TMR0 | C_PS0_Div4 ;
//	T0MD = C_PS0_TMR0 | C_PS0_Div8 ;
//	T0MD = C_PS0_Div4;//C_PS0_Div16;//0x03;
	
	PCON1 |= 0x01;						//enable timer0.
}
/*
void timer1_init(void)//---4K
{
// X / 4KK = 1 / 100K -> X = 4K / 100 =40; 因为计数器是向下减到0,所以40-1
// X / 2KK = 1 / 10K -> X = 2K / 10 =200; 因为计数器是向下减到0,所以200-1
// X / 1KK = 1 / 4K -> X = 1K / 4 =250; 因为计数器是向下减到0,所以250-1
	T1CR1 = C_TMR1_Dis; // Disable Timer0
	T1CR2 = C_TMR1_ClkSrc_Inst|C_TMR1_ExtRising|C_PS1_EN| C_PS1_Div4;//|C_PS1_Dis
	TMRH = 0x00;
	//TMR1 = 199;
	TMR1 = 249;
	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	INTE |= C_INT_TMR1;
}
*/
/*
void timer1_init(void)//---10K
{
// X / 4KK = 1 / 100K -> X = 4K / 100 =40; 因为计数器是向下减到0,所以40-1
// X / 2KK = 1 / 10K -> X = 2K / 10 =200; 因为计数器是向下减到0,所以200-1
// X / 1KK = 1 / 4K -> X = 1K / 4 =250; 因为计数器是向下减到0,所以250-1
	T1CR1 = C_TMR1_Dis; // Disable Timer0
	T1CR2 = C_TMR1_ClkSrc_Inst|C_TMR1_ExtRising|C_PS1_EN| C_PS1_Div2;//|C_PS1_Dis
	TMRH = 0x00;
	//TMR1 = 199;
	TMR1 = 199;
	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	INTE |= C_INT_TMR1;
}
*/
/*
void timer1_init(void)//---20K
{
// X / 4KK = 1 / 100K -> X = 4K / 100 =40; 因为计数器是向下减到0,所以40-1
// X / 2KK = 1 / 10K -> X = 2K / 10 =200; 因为计数器是向下减到0,所以200-1
// X / 2KK = 1 / 20K -> X = 2K / 20 =100; 因为计数器是向下减到0,所以100-1
// X / 1KK = 1 / 4K -> X = 1K / 4 =250; 因为计数器是向下减到0,所以250-1
	T1CR1 = C_TMR1_Dis; // Disable Timer0
	T1CR2 = C_TMR1_ClkSrc_Inst|C_TMR1_ExtRising|C_PS1_EN| C_PS1_Div2;//|C_PS1_Dis
	TMRH = 0x00;
	//TMR1 = 199;
	TMR1 = 99;
	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	INTE |= C_INT_TMR1;
}
*/
/*
void timer1_init(void)//---50K
{
// X / 4KK = 1 / 100K -> X = 4K / 100 =40; 因为计数器是向下减到0,所以40-1
// X / 2KK = 1 / 10K -> X = 2K / 10 =200; 因为计数器是向下减到0,所以200-1
// X / 2KK = 1 / 20K -> X = 2K / 20 =100; 因为计数器是向下减到0,所以100-1
// X / 2KK = 1 / 30K -> X = 2K / 30 =67; 因为计数器是向下减到0,67-1
// X / 2KK = 1 / 50K -> X = 2K / 50 =40; 因为计数器是向下减到0,40-1
// X / 1KK = 1 / 4K -> X = 1K / 4 =250; 因为计数器是向下减到0,所以250-1
	T1CR1 = C_TMR1_Dis; // Disable Timer0
	T1CR2 = C_TMR1_ClkSrc_Inst|C_TMR1_ExtRising|C_PS1_EN| C_PS1_Div2;//|C_PS1_Dis
	TMRH = 0x00;
	//TMR1 = 199;
	TMR1 = 39;
	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	INTE |= C_INT_TMR1;
}
*/

void timer1_init(void)//---40K
{
// X / 4KK = 1 / 100K -> X = 4K / 100 =40; 因为计数器是向下减到0,所以40-1
// X / 2KK = 1 / 10K -> X = 2K / 10 =200; 因为计数器是向下减到0,所以200-1
// X / 2KK = 1 / 20K -> X = 2K / 20 =100; 因为计数器是向下减到0,所以100-1
// X / 1KK = 1 / 4K -> X = 1K / 4 =250; 因为计数器是向下减到0,所以250-1
//X / 2KK = 1 / 40K -> X = 2K / 40 =50; 因为计数器是向下减到0,所以50-1
	T1CR1 = C_TMR1_Dis; // Disable Timer1
	T1CR2 = C_TMR1_ClkSrc_Inst|C_TMR1_ExtRising|C_PS1_Dis;//|C_PS1_EN| C_PS1_Div2;//|C_PS1_Dis
	//T1CR2 = C_TMR1_ClkSrc_Inst|C_TMR1_ExtRising|C_PS1_EN| C_PS1_Div2;//|C_PS1_Dis
	TMRH = 0x00;
	//TMR1 = 199;
	//TMR1 = 49;
	TMR1 = 49;
	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	INTE |= C_INT_TMR1;
}

//==============================================================================
//	Function: pwm1_init
//		Input: None
//		Output: None
//==============================================================================
void pwm1_init(void)
{
//	T1CR1 = 0x82;
	
	//PWM1OEN = 1, pb2 output pwm 1.
	//PWM1OAL = 0, output high when tmr1 = pwm1duty.
	//x, ignore.
	//x, ignore.
	//x, ignore.
	//T1OS = 0, Non-Stop mode.
	//T1RL = 1, reloaded from the TMR1[9:0] when underflow occurs.
	//T1EN = 1, enable timer 1.
    //T1CR1 = C_PWM1_En|C_PWM1_Active_Hi|C_TMR1_Reload|C_TMR1_En;//0x83;	
	T1CR1 = C_PWM1_En|C_PWM1_Active_Lo|C_TMR1_Reload|C_TMR1_En;//0x83;	
	//x, ignore.
	//x, ignore.
	//T1CS = 0, timer 1 clock source is Finst, Finst = 8M/2T = 4M.
	//T1CE, ignore.
	//PS1EN = 1, close prescaler.
	//PS1SEL[2], ignore.
	//PS1SEL[1], ignore.
	//PS1SEL[0], ignore.
//	T1CR2 = 0x08;
	T1CR2 = C_TMR1_ClkSrc_Inst|C_TMR1_ExtRising|C_PS1_EN|C_PS1_Div2;//0x08;
	//Finst=8M/2T/2 = 2M
	
	
	TMRH = 0x00;
	
	//3 = 1MHz, 7 = 500KHz, 15 = 250KHz, 31 = 125KHz, 63 = 62.5KHz...
	/// X / 2KK = 1 / 10K -> X = 2K / 10 =200; 因为计数器是向下减到0,所以200-1
	// X / 2KK = 1 / 20K -> X = 2K / 20 =100; 因为计数器是向下减到0,所以100-1
	// X / 4KK = 1 / 100K -> X = 4K / 100 =40; 因为计数器是向下减到0,所以40-1
	TMR1 = 99;
	
	//PWM1DUTY must be less than or equal to TMR1.
	PWM1DUTY = 0;//PWM1DUTY = TMR1*70%=139
}
//==============================================================================
//	Function: pwm2_init
//		Input: None
//		Output: None
//==============================================================================
/*
void pwm2_init(void)
{
	T2CR1 = 0x82;
	
	TMRH = 0x00;
	
	//3 = 1MHz, 7 = 500KHz, 15 = 250KHz, 31 = 125KHz, 63 = 62.5KHz...
	TMR2 = 63;
	
	//PWM1DUTY must be less than or equal to TMR1.
	PWM2DUTY = 63;//0;
	
	//x, ignore.
	//x, ignore.
	//T1CS = 0, timer 1 clock source is Finst, Finst = 8M/2T = 4M.
	//T1CE, ignore.
	//PS1EN = 1, close prescaler.
	//PS1SEL[2], ignore.
	//PS1SEL[1], ignore.
	//PS1SEL[0], ignore.
	T2CR2 = 0x08;
	
	//PWM1OEN = 1, pb2 output pwm 1.
	//PWM1OAL = 0, output high when tmr1 = pwm1duty.
	//x, ignore.
	//x, ignore.
	//x, ignore.
	//T1OS = 0, Non-Stop mode.
	//T1RL = 1, reloaded from the TMR1[9:0] when underflow occurs.
	//T1EN = 1, enable timer 1.
	T2CR1 = 0x83;
}
*/
#if USE_MCU == __CPU_NY8A062D__
void pwm2_init(void)
{
	T2CR1 = 0x82;
	
	//PWM1OEN = 1, pb2 output pwm 1.
	//PWM1OAL = 0, output high when tmr1 = pwm1duty.
	//x, ignore.
	//x, ignore.
	//x, ignore.
	//T1OS = 0, Non-Stop mode.
	//T1RL = 1, reloaded from the TMR1[9:0] when underflow occurs.
	//T1EN = 1, enable timer 1.
  //  T2CR1 = C_PWM2_En|C_PWM2_Active_Hi|C_TMR2_Reload|C_TMR2_En;//0x83;	
    T2CR1 = C_PWM2_En|C_PWM2_Active_Lo|C_TMR2_Reload|C_TMR2_En;//0x83;	
	
	//x, ignore.
	//x, ignore.
	//T1CS = 0, timer 1 clock source is Finst, Finst = 8M/2T = 4M.
	//T1CE, ignore.
	//PS1EN = 1, close prescaler.
	//PS1SEL[2], ignore.
	//PS1SEL[1], ignore.
	//PS1SEL[0], ignore.
//	T2CR2 = 0x08;
	T2CR2 = C_TMR2_ClkSrc_Inst|C_TMR2_ExtRising|C_PS2_EN|C_PS2_Div2;//0x08;
//	T2CR2 = C_TMR2_ClkSrc_Inst|C_TMR2_ExtRising|C_PS2_Dis;//0x08;
	//Finst=8M/2T/2 = 2M
	
	
	TMRH = 0x00;
	
	//3 = 1MHz, 7 = 500KHz, 15 = 250KHz, 31 = 125KHz, 63 = 62.5KHz...
	//X / 4000k = 1 / 37.9K -> X = 105.54 因为计数器是向下减到0,所以105-1
	/// X / 2KK = 1 / 10K -> X = 2K / 10 =200; 因为计数器是向下减到0,所以200-1
	// X / 2KK = 1 / 20K -> X = 2K / 20 =100; 因为计数器是向下减到0,所以100-1
	TMR2 = 99;
	
	//PWM1DUTY must be less than or equal to TMR1.
	PWM2DUTY = 0;
}
#endif
//==============================================================================
//	Function: pwm3_init
//		Input: None
//		Output: None
//==============================================================================
/*
void pwm3_init(void)
{
//	INTE |= C_INT_TMR1;
	T3CR1 = 0x82;
	
	TM3RH = 0x00;
	
	//3 = 1MHz, 7 = 500KHz, 15 = 250KHz, 31 = 125KHz, 63 = 62.5KHz...
	TMR3 = 31;
	//X / 125k = 1 / 2.73K -> X = 45.78 因为计数器是向下减到0,所以46-1
	//TMR3 = 31;
	
	//PWM1DUTY must be less than or equal to TMR1.
	PWM3DUTY = 0;
	
	//x, ignore.
	//x, ignore.
	//T1CS = 0, timer 1 clock source is Finst, Finst = 8M/2T = 4M.
	//T1CE, ignore.
	//PS1EN = 1, close prescaler.
	//PS1SEL[2], ignore.
	//PS1SEL[1], ignore.
	//PS1SEL[0], ignore.
	T3CR2 = 0x08;//0x08;
	//Finst=8M/2T/C_PS1_Div32 = 125K
	
	
	
	//PWM1OEN = 1, pb2 output pwm 1.
	//PWM1OAL = 0, output high when tmr1 = pwm1duty.
	//x, ignore.
	//x, ignore.
	//x, ignore.
	//T1OS = 0, Non-Stop mode.
	//T1RL = 1, reloaded from the TMR1[9:0] when underflow occurs.
	//T1EN = 1, enable timer 1.
	T3CR1 = 0x83;//0x83;
}
*/

void pwm3_init(void)
{
//	T3CR1 = 0x82;
	
	//PWM1OEN = 1, pb2 output pwm 1.
	//PWM1OAL = 0, output high when tmr1 = pwm1duty.
	//x, ignore.
	//x, ignore.
	//x, ignore.
	//T1OS = 0, Non-Stop mode.
	//T1RL = 1, reloaded from the TMR1[9:0] when underflow occurs.
	//T1EN = 1, enable timer 1.
	//T3CR1 = C_PWM3_En|C_PWM3_Active_Hi|C_TMR3_Reload|C_TMR3_En;//0x83;	
	T3CR1 = C_PWM3_Active_Hi|C_TMR3_Reload|C_TMR3_En;
	//x, ignore.
	//x, ignore.
	//T1CS = 0, timer 1 clock source is Finst, Finst = 8M/2T = 4M.
	//T1CE, ignore.
	//PS1EN = 1, close prescaler.
	//PS1SEL[2], ignore.
	//PS1SEL[1], ignore.
	//PS1SEL[0], ignore.
	T3CR2 = C_TMR3_ClkSrc_Inst|C_TMR3_ExtRising|C_PS3_EN|C_PS3_Div32;//0x08;
	//Finst=8M/2T/C_PS1_Div32 = 125K
#if USE_MCU == __CPU_NY8A062D__	
	TM3RH = 0x00;
#endif	
	//3 = 1MHz, 7 = 500KHz, 15 = 250KHz, 31 = 125KHz, 63 = 62.5KHz...
	//TMR3 = 31;
	//X / 125k = 1 / 2.73K -> X = 45.78 因为计数器是向下减到0,所以46-1
	TMR3 = 45;
	
	//PWM1DUTY must be less than or equal to TMR1.
	PWM3DUTY = 23;//11;//23;	// = PWM3DUTY = TMR3*50% = 45*50% = 23
}

//==============================================================================
//	Function: adc_init
//		Input: None
//		Output: None
//==============================================================================
#if USE_MCU == __CPU_NY8A062D__
void adc_init(void)//-----上电时先检测NTC有没有失效或没有接，参考电压设置为5V,2V过低
{
	u8 i;	
/*
	ADMD = 0x99;	//AIN9  PB4
    ADR = 0x00;
    ADVREFH = 0x00;
    ADCR &= 0xF0;
    ADCR |= 0x0A;
 */  
 	//APHCON = 0xff;
 	//ABPLCON = 0xff;
	//ADVREFH = C_Vrefh_2V;	//参考电压
	ADVREFH = C_Vrefh_VDD;	//参考电压
	//ADR	 = C_Ckl_Div8;	//时钟分频
	ADR	 = C_Ckl_Div2;	//时钟分频
	ADCR  = C_Sample_8clk | C_12BIT;//采样频率和采样位数
	//ADCR  = C_Sample_1clk | C_12BIT;//采样频率和采样位数
	PACON = C_PA0_AIN0;//通道设置
	ADMD  = C_ADC_En | C_ADC_CH_En |C_ADC_PA0;//C_ADC_CH_Dis
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
	ADRbits.ADIE = 0;						// Enable adc interrupt bit
//	Delay_N1ms_16bit(50);					// 50//Delay 1.12ms(Instruction clock=4MHz/4T) for waiting ADC stable
	//delay(50);
	for(i=1;i<= 50;i++)
		;
	ADMDbits.START = 0;	  
	CLRWDT();
}

void adc2_init(void)//-----上电时先检测NTC有没有失效或没有接，参考电压设置为5V,2V过低
{
	u8 i;	
/*
	ADMD = 0x99;	//AIN9  PB4
    ADR = 0x00;
    ADVREFH = 0x00;
    ADCR &= 0xF0;
    ADCR |= 0x0A;
 */  
 	//APHCON = 0xff;
 	//ABPLCON = 0xff;
	ADVREFH = C_Vrefh_2V;	//参考电压
	ADR	 = C_Ckl_Div8;	//时钟分频
	ADCR  = C_Sample_8clk | C_12BIT;//采样频率和采样位数
	PACON = C_PA0_AIN0;//通道设置
	ADMD  = C_ADC_En | C_ADC_CH_En |C_Quarter_VDD;//C_ADC_CH_Dis
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
	ADRbits.ADIE = 0;						// Enable adc interrupt bit
//	Delay_N1ms_16bit(50);					// 50//Delay 1.12ms(Instruction clock=4MHz/4T) for waiting ADC stable
	//delay(50);
	for(i=1;i<= 50;i++)
		;
	ADMDbits.START = 0;	 
	CLRWDT();
}

void adc3_init(void)//
{
	u8 i;	
/*
	ADMD = 0x99;	//AIN9  PB4
    ADR = 0x00;
    ADVREFH = 0x00;
    ADCR &= 0xF0;
    ADCR |= 0x0A;
 */  
 	//APHCON = 0xff;
 	//ABPLCON = 0xff;
	//ADVREFH = C_Vrefh_2V;	//参考电压
	ADVREFH = C_Vrefh_3V;	//参考电压
	//ADVREFH = C_Vrefh_VDD;	//参考电压
	//ADR	 = C_Ckl_Div8;	//时钟分频
	ADR	 = C_Ckl_Div2;	//时钟分频
	//ADR	 = C_Ckl_Div1;	//时钟分频
	//ADCR  = C_Sample_8clk | C_12BIT;//采样频率和采样位数
	//ADCR  = C_Sample_1clk | C_12BIT;//采样频率和采样位数
	ADCR  = C_Sample_2clk | C_12BIT;//采样频率和采样位数
	PACON = C_PA0_AIN0;//通道设置
	ADMD  = C_ADC_En | C_ADC_CH_En |C_ADC_PA0;//C_ADC_CH_Dis
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
	ADRbits.ADIE = 0;						// Enable adc interrupt bit
//	Delay_N1ms_16bit(50);					// 50//Delay 1.12ms(Instruction clock=4MHz/4T) for waiting ADC stable
	//delay(50);
	for(i=1;i<= 50;i++)
		;
	ADMDbits.START = 0;	  
	CLRWDT();
}

void adc_init4(u8 ch)//
{
	u8 i;
	now_ch = ch;
	PACON = C_PA0_AIN0;//通道设置
	if(ch == Quarter_VDD)
	{
		ADVREFH = C_Vrefh_2V;	//参考电压
		ADR	 = C_Ckl_Div8;	//时钟分频
		//ADR	 = C_Ckl_Div16;	//时钟分频
		//ADCR  = C_Sample_8clk | C_12BIT;//采样频率和采样位数
		ADCR  = C_Sample_1clk | C_12BIT;//采样频率和采样位数
		//PACON = C_PB1_AIN6;//通道设置
		ADMD  = C_ADC_En | C_ADC_CH_En |C_Quarter_VDD;//C_ADC_CH_Dis
	}
	else if(ch == ADC_CHANNEL)
	{
		ADVREFH = C_Vrefh_3V;	//参考电压
		ADR	 = C_Ckl_Div8;	//时钟分频
		//ADR	 = C_Ckl_Div16;	//时钟分频
		//ADCR  = C_Sample_8clk | C_12BIT;//采样频率和采样位数
		ADCR  = C_Sample_1clk | C_12BIT;//采样频率和采样位数
		//PACON = C_PB1_AIN6;//通道设置
		ADMD  = C_ADC_En | C_ADC_CH_En |C_ADC_PA0;//C_ADC_CH_Dis
	}
	else if(ch == ADC_CHANNEL2)
	{
		//ADVREFH = C_Vrefh_2V;	//参考电压
		//ADVREFH = C_Vrefh_3V;	//参考电压
		ADVREFH = C_Vrefh_VDD;	//参考电压
		//ADR	 = C_Ckl_Div8;	//时钟分频
		ADR	 = C_Ckl_Div2;	//时钟分频
		//ADR	 = C_Ckl_Div1;	//时钟分频
		ADCR  = C_Sample_8clk | C_12BIT;//采样频率和采样位数
		//ADCR  = C_Sample_1clk | C_12BIT;//采样频率和采样位数
		//ADCR  = C_Sample_2clk | C_12BIT;//采样频率和采样位数
		//PACON = C_PB1_AIN6;//通道设置
		ADMD  = C_ADC_En | C_ADC_CH_En |C_ADC_PA0;//C_ADC_CH_Dis
	}
	//ADMD  = C_ADC_En | C_ADC_CH_En |ch;//C_ADC_CH_Dis
	
	//ADCRbits.PBCON4 = 0;//C_PB4_AIN9
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
	ADRbits.ADIE = 0;						// Enable adc interrupt bit
	for(i=1;i<= 50;i++)
		;
	ADMDbits.START = 0;	 
	//CLRWDT();
}
/*
void adc4_init(void)//
{
	u8 i;	
 	//APHCON = 0xff;
 	//ABPLCON = 0xff;
	//ADVREFH = C_Vrefh_2V;	//参考电压
	//ADVREFH = C_Vrefh_3V;	//参考电压
	ADVREFH = C_Vrefh_4V;	//参考电压
	//ADVREFH = C_Vrefh_VDD;	//参考电压
	//ADR	 = C_Ckl_Div8;	//时钟分频
	ADR	 = C_Ckl_Div2;	//时钟分频
	//ADR	 = C_Ckl_Div1;	//时钟分频
	//ADCR  = C_Sample_8clk | C_12BIT;//采样频率和采样位数
	//ADCR  = C_Sample_1clk | C_12BIT;//采样频率和采样位数
	ADCR  = C_Sample_2clk | C_12BIT;//采样频率和采样位数
	PACON = C_PA2_AIN2;//通道设置
	ADMD  = C_ADC_En | C_ADC_CH_En |C_ADC_PA2;//C_ADC_CH_Dis
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
	ADRbits.ADIE = 0;						// Enable adc interrupt bit
//	Delay_N1ms_16bit(50);					// 50//Delay 1.12ms(Instruction clock=4MHz/4T) for waiting ADC stable
	//delay(50);
	for(i=1;i<= 50;i++)
		;
	ADMDbits.START = 0;	  
	CLRWDT();
}
*/
void Set_ADVREFH_5V(void)//-----重新设置参考电压设置为5V，
{
//	ADMDbits.START = 0;
//	delay(50);
	ADVREFH = C_Vrefh_VDD;	//参考电压;	//2v
	delay(50);
//	ADMDbits.START = 1;
//	delay(50);
}

void Set_ADVREFH_2V(void)//-----重新设置参考电压设置为2V，
{
//	ADMDbits.START = 0;
//	delay(50);
	ADVREFH = C_Vrefh_2V;	//参考电压;	//2v
	delay(50);
//	ADMDbits.START = 1;
//	delay(50);
}
#endif
//==============================================================================
//	Function: wdt_init
//		Input: None
//		Output: None
//==============================================================================
void wdt_init(void)
{
	//enable watchdog.
	PCONbits.WDTEN = 1;			//250ms reset.
}

//==============================================================================
//	Function: lvd_init
//		Input: None
//		Output: None
//==============================================================================
void lvd_init(void)
{
	//enable LVD.
	PCON |= C_LVD_En;						// 使能LVD功能
	PCON1 &= 0xe3;							// 1110 0011
	PCON1 |= C_LVD_3P3V;					//		
}
//==============================================================================
//	Function: lvr_init
//		Input: None
//		Output: None
//==============================================================================
void lvr_init(void)
{
	//enable LVR, 2.2 V reset.
	PCONbits.LVREN = 1;	
}


//==============================================================================
//	Function: isr_init
//		Input: None
//		Output: None
//==============================================================================
void isr_init(void)
{
	INTEDG = 0x05;//
	INTE = 0x03|C_INT_TMR1;//|C_INT_WDT;
	//INTEDG = C_INT0_En|C_INT1_RisingEdge|C_INT0_RisingEdge;//0x05
	//INTE = C_INT_PABKey|C_INT_TMR0|C_INT_EXT0;//0x03;
	INTE2 = 0x00;
	INTF = 0x00;
}