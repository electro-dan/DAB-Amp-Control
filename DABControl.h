#ifndef _DABCONTROL_H_
#define _DABCONTROL_H_

#include <system.h>
#include <lcd_driver.h>
#include <stdio.h>

#define	TASKS_LIMIT			8
#define TASK_INT_EXT0		0
#define TASK_RS232			1
#define TASK_I2C_RECV		6
#define TASK_TIMER1			7

#define MUTEOUT (porta.5)
#define NODC_FAIL (portb.0)

#define TMR1HV 72
#define TMR1LV 228


#define SSPSTAT_BIT_MASK 0b00101101 // Mask for I2C status bits
#define SSPSTAT_STOP_BIT_MASK 0b00111101 // Mask for I2C status bits including stop
// bit 0 BF: Buffer Full Status bit
// bit 2 R/W: Read/Write bit Information (I2C mode only)
// bit 3 S: START bit
// bit 5 D/A: Data/Address bit (I2C mode only)

#define RX_BUFFER_SIZE 30

// 92 is based on the max size seen for a serial stream of commands including custom characters
// e.g.
// Data 00,80 [2]
// Data C0,42,C0,42,C0,43,C0,20,C0,52,C0,61,C0,64,C0,69,C0,6F,C0,20,C0,36,C0,4D,C0,75,C0,73,C0,69,C0,63 [32]
// Data 00,38,48 [3]
// Data 40,00,1F,1F,1F,1F,1F,00,00 [9]
// Data 00,38,50 [3]
// Data 40,1F,11,11,11,11,11,1F,00 [9]
// Data 00.C0 [2]
// Data C0,01,C0,01,C0,20,C0,20,C0,02,C0,20,C0,20,C0,20,C0,20,C0,20,C0,20,C0,20,C0,20,C0,20,C0,20,C0,20 [32]
// This is for a circular buffer, so shouldn't run out of room
// Add room for 9 0xFF characters
#define I2C_BUFFER_SIZE 101

// State 1 - SSPSTAT bits: D_A = 0, S = 1, R_W = 0, BF = 1
#define I2CSTATE_1 0b00001001
// State 2 - SSPSTAT bits: D_A = 1, S = 1, R_W = 0, BF = 1
#define I2CSTATE_2 0b00101001
// State 3 - SSPSTAT bits: D_A = 0, S = 1, R_W = 1, BF = 0
#define I2CSTATE_3 0b00001100
// State 4 - SSPSTAT bits: D_A = 1, S = 1, R_W = 1, BF = 0
#define I2CSTATE_4 0b00101100
// State 5 - SSPSTAT bits: D_A = 1, S = 1, R_W = 0, BF = 0
#define I2CSTATE_5 0b00101000
// State Stop - SSPSTAT bits: S = 1, D_A = 1, R_W = 0, BF = 0
#define I2CSTATE_STOP 0b00110000

#define State_1 0x01
#define State_2 0x02
#define State_3 0x03
#define State_4 0x04
#define State_5 0x05


#define LCD_E (portc.0)
#define LCD_RW (portc.1)
#define LCD_RS (portc.2)

#define LCD_ARGS 	2,	/* Interface type: mode 0 = 8bit, 1 = 4bit(low nibble), 2 = 4bit(upper nibble) */ \
		1, 				/* Use busy signal: 1 = use busy, 0 = use time delays */\
		PORTD, TRISD, 	/* Data port and data port tris register */ \
		PORTC, TRISC, 	/* Control port and control port tris register */ \
		2,				/* Bit number of control port is connected to RS */ \
		1,				/* Bit number of control port is connected to RW */ \
		0 				/* Bit number of control port is connected to Enable */


void rs232SendByte(char c);
void rs232Print(unsigned char *s);

/*void lcdWrite(char isData, char cData, char doBusyWait);
void lcdInit();
void lcdClear();
void lcdGoto(char col, char row);
void lcdBusyWait();
char lcdRead();*/

void i2cProcess();

#endif //_DABCONTROL_H_
