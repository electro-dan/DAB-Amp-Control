#include <system.h>
#include "DABControl.h"

// Target PIC16F77
// Configuration registers
#pragma DATA _CONFIG, _BODEN_OFF & _PWRTE_OFF & _WDT_OFF & _CP_OFF & _HS_OSC // Brown out reset off, Power-up Timer off, Watchdog timer off, Code Protection off, HS oscillator

// Set clock frequency - 6MHz Crystal
#pragma CLOCK_FREQ  6000000

// http://www.sourceboost.com/Products/BoostC/ExampleCode/I2C/I2C_Slave_1/I2C_Slave_1.c.html
// https://www.microchip.com/forums/m486328.aspx
// https://www.microchip.com/forums/m14311.aspx
// https://electrosome.com/i2c-pic-microcontroller-mplab-xc8/

// https://hackaday.com/2015/10/29/embed-with-elliot-going-round-with-circular-buffers/
// https://github.com/hexagon5un/embed_with_elliot-circular_buffer

// http://eng-serve.com/pic/pic_timer.html

// https://www.allaboutcircuits.com/technical-articles/how-to-a-162-lcd-module-with-an-mcu/

/******************************************************
  Global variables
*******************************************************/
char I2C_slave_address = 0x3E; // slave address

char iRS232Index;
char rs232Buffer[RX_BUFFER_SIZE];

char cTask;
char iSecQ;

char iActiveInput;
char iActiveInputPrev;

/******************************************************
  These variables and functions are for a circular buffer
*******************************************************/
enum BufferStatus {BUFFER_OK, BUFFER_EMPTY, BUFFER_FULL};
struct Buffer {
    unsigned char data[I2C_BUFFER_SIZE];
    unsigned char iHead;
    unsigned char iTail;
};
volatile struct Buffer i2cBuffer = {{0}, 0, 0};

enum BufferStatus i2cBufferWrite(unsigned char byteIn) {
    unsigned char iNextHead = (i2cBuffer.iHead == (I2C_BUFFER_SIZE - 1)) ? 0 : i2cBuffer.iHead + 1; 
 
    if (iNextHead == i2cBuffer.iTail){
        return BUFFER_FULL;
    }
    i2cBuffer.data[i2cBuffer.iHead] = byteIn;
    i2cBuffer.iHead = iNextHead;
    return BUFFER_OK;
}

enum BufferStatus i2cBufferRead(unsigned char *byteOut) {
    if (i2cBuffer.iHead == i2cBuffer.iTail){
        return BUFFER_EMPTY;
    }
    *byteOut = i2cBuffer.data[i2cBuffer.iTail];
    i2cBuffer.iTail = (i2cBuffer.iTail == (I2C_BUFFER_SIZE - 1)) ? 0 : i2cBuffer.iTail + 1; 
    return BUFFER_OK;
}

/******************************************************
  Function called once only to initialise variables and
  setup the PIC registers
*******************************************************/
void initialise() {
    // IO ports setup
    trisa = 0x07; // RA0, RA1, RA2 are input, rest ouptuts (only RA4 used)
    porta = 0x00; // set to off
    trisb = 0x01; // RB0 (INT) is an input, rest outputs, unsued
    portb = 0x00; // set to off
    trisc = 0xD8; // RC7 (Rx) and RC6 (Tx) are inputs, RC4[SDA] and RC3[SCL] are inputs (for I2C slave), RC0, RC1 and RC2 for LCD ouputs, RC5 unused
    portc = 0x18; // set to off, except RC4, RC3 for I2C
    trisd = 0x00; // All outputs, LCD
    portd = 0x00; // LCD outputs off
    trise = 0x00; // All outputs, unused
    porte = 0x00; // All off

    // ADC setup
    adcon0 = 0x00; // ADC off
    adcon1 = 0x0F; // All digital I/O
    
    t1con = 0x31;  //  00 11 0000 - 1:8 prescale, oscil off, internal clock, timer disabled
    // Timer 1 setup - interrupt every 0.5 sec
    // Timer1 Registers Prescaler= 1:8 - TMR1 Preset = 18660 - Freq = 4.00 Hz - Period = 0.250005 seconds
    t1con.T1CKPS1 = 1;   // bits 5-4  Prescaler Rate Select bits
    t1con.T1CKPS0 = 1;   // bit 4
    t1con.T1OSCEN = 0;   // bit 3 Timer1 Oscillator Enable Control bit 0 = off (pins used for LCD)
    t1con.NOT_T1SYNC = 1;// bit 2 Timer1 External Clock Input Synchronization Control bit...1 = Do not synchronize external clock input
    t1con.TMR1CS = 0;    // bit 1 Timer1 Clock Source Select bit...0 = Internal clock (FOSC/4)
    t1con.TMR1ON = 0;    // bit 0 enables timer
    tmr1h = TMR1HV;      // preset for timer1 MSB register
    tmr1l = TMR1LV;      // preset for timer1 LSB register
    pie1.TMR1IE = 1;     // Timer 1 interrupt

    // I2C communications setup
    //sspcon = 0x2E; // Receive Overflow Indicator cleared, SSPEN SDA/SCL set as enabled, CKP clock disabled, 1110 = I2C Slave mode - 7-bit address, with start/stop interrupts
    sspcon.WCOL = 0; // No colision
    sspcon.SSPOV = 0; // No overflow
    sspcon.SSPEN = 1; // Enabled SDA/SCL pins
    sspcon.CKP = 1; // SCK release control - enable clock
    // 1110 = I2C Slave mode, 7-bit address with START and STOP bit interrupts enabled
    sspcon.SSPM3 = 1;
    sspcon.SSPM2 = 1;
    sspcon.SSPM1 = 1;
    sspcon.SSPM0 = 0;
    
    sspadd = I2C_slave_address << 1; // Address requested from the DAB module, should be shifted one bit to the left [ SSPSR<7:1> ]
    sspstat = 0; // Clear by default

    // rs232 communications setup
    // SYNC = 0, BRGH = 1, BRG16 = 0
    // 4MHz Baud rate 9600 = 25 = ((4000000 / 9600) / 16) - 1
    spbrg = 25; // 25 = ((4000000 / 9600) / 16) - 1
    txsta = 0x36; // 00100110 - 8 bit, transmit enable, async mode, high speed, TSR empty, 9bit (0)
    rcsta = 0x90; // 10010000 - serial port enabled, 8 bit reception, async mode continuous recieve, no frame error, no overrun error
    // No receive commands, only sends
    //pie1.RCIE = 1; // Usart interrupt receive (no send interrupt)
    iRS232Index = 0;
    
    // Slight delay before initialising LCD and interrupts
    delay_ms(200);
    
    // Setup for RB0 Interrupt [DC fail]
    intcon.INTE = 1; // RB2 Interrupt (for DC Fail)
    option_reg.INTEDG = 0; // RB2 interrupt should occur on falling edge
    intcon.INTF = 0; // Clear RB2 interrupt flag bit
    option_reg.NOT_RBPU = 1; // Port B pull-ups disabled (otherwise DC fail is not detected)

    // Interrupt setup
    intcon.PEIE = 1; // Enables all unmasked peripheral interrupts (required for RS232 and I2C)
    intcon.GIE = 1; // Enable global interrupts
    pie1.SSPIE = 1; // Enable I2C interrupt

    // No task at initialisation
    cTask = 0;
    iSecQ = 0;
    
    lcd_setup();
    
    sspcon.CKP = 1; // Pull clock high - we're ready to receive data
}

/******************************************************
  Interrupt handler
*******************************************************/
void interrupt(void) {
    // external interrupt on RB0 - highest priority [DC fail]
    if (intcon.INTF) {
        if (!NODC_FAIL) {
            MUTEOUT = 0; // Mute amps
            // Show fault on display
            // Flag this task to the task array
            cTask.TASK_INT_EXT0 = 1;
        }
        intcon.INTF = 0;

        return; // do not process any other interrupt
    }

    // I2C
    // SSP interrupt byte received
    if (pir1.SSPIF) {
        
        char i2cData;
        char i2cStatus;
        char i2cState;

        if ( sspcon.SSPOV == 1 ) { 
            // Test if we have an overflow condition and clear it
            i2cData = sspbuf; // Do a dummy read of the SSPBUF
            sspcon.SSPOV = 0; // Clear the overflow flag
        } else {
            // Mask the status bits out from the other unimportant register bits
            // SSPSTAT_BIT_MASK  0b00101101
            // bit 0 BF: Buffer Full Status bit
            // bit 2 R/W: Read/Write bit Information (I2C mode only)
            // bit 3 S: START bit
            // bit 5 D/A: Data/Address bit (I2C mode only)
            i2cStatus = ( sspstat & SSPSTAT_BIT_MASK );
            
            if ( (i2cStatus ^ I2CSTATE_1 ) == 0 ) {
                // State 1 - SSPSTAT bits: S = 1, D_A = 0, R_W = 0, BF = 1
                // State 1: Master Write, Last Byte was an Address
                // Do a dummy read of the SSPBUF
                i2cData = sspbuf;
            } else if ( (i2cStatus ^ I2CSTATE_2 ) == 0 ) {
                // State 2 - SSPSTAT bits: S = 1, D_A = 1, R_W = 0, BF = 1
                // State 2: Master Write, Last Byte was Data
                // Read from SSBUF
                i2cData = sspbuf;
                i2cBufferWrite(i2cData);
            }
        }

        // If stop condition:
        // State Stop - SSPSTAT bits: D_A = 1, P = 1, S = 0, R_W = 0, BF = 0
        if ((( sspstat & SSPSTAT_STOP_BIT_MASK ) ^ I2CSTATE_STOP) == 0 ) {
            // End of command - write FF to indicate it
            i2cBufferWrite(0xFF);
            // Flag the task scheduler that there is data to process
            cTask.TASK_I2C_RECV = 1;
        }

        pir1.SSPIF = 0; // Clear interrupt flag
    }
    
    // Handle timer1 interrupt
    if (pir1.TMR1IF) {
        tmr1h = TMR1HV;      // preset for timer1 MSB register
        tmr1l = TMR1LV;      // preset for timer1 LSB register
        
        // Tick the quarter seconds
        iSecQ++; 
        // Once it reaches 8 (2 seconds), flag the task
        if (iSecQ >= 8) {
            cTask.TASK_TIMER1 = 1;
            iSecQ = 0;
        }

        pir1.TMR1IF = 0;     // Clear interrupt flag
    }
}

/******************************************************
  RS232 functions (for debugging)
*******************************************************/
// Send single character byte over rs232
void rs232SendByte(char c) {
    txreg = c;
    while (pir1.TXIF == 0); // Wait for byte to be transmitted
    while (txsta.TRMT == 0); // Wait for byte to be transmitted
}

void rs232Print(unsigned char *s) {
      while (*s) {
        rs232SendByte(*s++);
    }
}

/******************************************************
  Called after I2C communcation received to process the 
  bytes in the buffer
*******************************************************/
void i2cProcess() {

    unsigned char iReadData;
    unsigned char iProcessing = 0; // 0 for looking, 1 for functions, 2 for text data, 3 for custom data

    /*
    if first command is 00
    - if next is 38
        - function follows (48,50)
    - else function (80, C0)
    if first command is 40 or C0
        - data follows
    */

    // Keep reading until BUFFER_EMPTY
    // i2cBufferRead moving the start position in the buffer for us
    while (i2cBufferRead(&iReadData) == BUFFER_OK) {
        if (iReadData == 0xFF) {
            // Finished command
            iProcessing = 0;
        } else if (iProcessing == 0) {
            // Looking for a command or function
            if (iReadData == 0x00) // found function
                iProcessing = 1;
            else if (iReadData == 0xC0) // found LCD data
                iProcessing = 2;
            else if (iReadData == 0x40) // found custom chars
                iProcessing = 3;
        } else if (iProcessing == 1) {
            // Doing functions
            if (iReadData != 0x38) // Skip 0x38 function, but write anything else
                lcd_function(iReadData);
        } else if (iProcessing > 1) {
            // Doing data
            if (iReadData != 0xC0) { // Skip 0xC0 data, but write anything else
                lcd_datamode();
                lcd_write(iReadData);
            }
        }
    }   
}

// isData = 0 for instruction, 1 for data
/*void lcdWrite(char isData, char cData, char doBusyWait) {
    delay_ms(1);
    portd = cData; // Instruction on portd bus
    
    LCD_RS = isData; // Instruction is 0, Data is 1
    LCD_RW = 0; // Write operation
    
    LCD_E = 0; // E to 0
    delay_us(20);
    LCD_E = 1; // E to 1
    delay_us(20);
    LCD_E = 0; // E to 0 to generate a falling edge
    delay_us(20);
    
    //if (doBusyWait)
    //  lcdBusyWait();
}


char lcdRead() {
    char d;
    // Make port an input
    trisd = 0xFF;
    LCD_RS = 0;
    LCD_RW = 1; // Read operation
    LCD_E = 1; // E to 1
    d = portd;
    LCD_E = 0; // E to 0
    // Put back to output
    trisd = 0;
}

void lcdInit() {
    portd = 0;
    trisd = 0;
    LCD_RW = 0;
    LCD_RS = 0;
    LCD_E = 0;
    delay_ms(40);

    // Reset
    lcdWrite(0, 3, 0);
    delay_ms(5);
    
    // 0x30
    lcdWrite(0, 0x30, 0);
    delay_ms(5);
    lcdWrite(0, 0x30, 0);
    delay_ms(5);
    lcdWrite(0, 0x30, 0);
    delay_ms(5);
    
    // Function set - 001[DL],[N][F][FT1][FT0]
    // DL=1 for 8 bit, N=1 for 2 lines, F=0 font 8 line, FT1/FT0=01 english/russian)
    lcdWrite(0, 0x39, 1);
    delay_ms(2);
    
    // Display on/off - 0000,1DCB
    // D=1 for Display on, C=0 for cursor off, B=0 for blicking off
    //lcdWrite(0, 0x0C, 1);
    lcdWrite(0, 0x0E, 1);
    delay_ms(2);
    
    // Display clear - 0000,0001
    lcdWrite(0, 0x01, 1);
    delay_ms(2);
    
    // Entry mode set - 0000,01[I/D]S
    // I/D=1 for, S=0
    // Move from left-to-right, no shifting
    //lcdWrite(0, 0x06, 1);
    lcdWrite(0, 0x80, 1);
    delay_ms(5);

    // Display clear - 0000,0001
    lcdWrite(0, 0x01, 1);
    delay_ms(2);
}

void lcdGoto(char col, char row) {
    lcdWrite(0, 0x80 + (row * 4) + col, 1); // Goto position
}

void lcdBusyWait() {
    while( lcdRead() & 0x80 ); // wait while busy set
}*/

/******************************************************
  Called after rotary switch change is detected, used 
  to display the approriate selected input
*******************************************************/
void showSource() {
    lcd_clear();
    if (test_bit(porta, 0)) {
        lcd_gotoxy(0, 0);
        lprintf("DAB");
    } else if (test_bit(porta, 1)) {
        lcd_gotoxy(0, 0);
        lprintf("PC Audio");
    } else if (test_bit(porta, 2)) {
        lcd_gotoxy(0, 0);
        lprintf("Chromecast");
    } else {
        lcd_gotoxy(0, 0);
        lprintf("Auxiliary");
    }
}

/******************************************************
  Called after timer 1 has counted enough times, used 
  to unmute the speakers
*******************************************************/
void onTimer1() {
    if (NODC_FAIL) {
        // If DC fail is OK, unmute
        // Enable the relay output
        MUTEOUT = 1;        

        // Turn off the timer
        t1con.TMR1ON = 0;
        showSource();
    }
}

/******************************************************
  MAIN PROGRAM
*******************************************************/
void main()
{
    initialise();
    
    // During start up, enable timer 1
    t1con.TMR1ON = 1;
    
    // Welcome message
    lcd_gotoxy(0, 0);
    lprintf("Hello!");
    lcd_gotoxy(0, 1);
    lprintf("Just a moment...");
    
    while (1) {
        // Task scheduler
        // If there are tasks to be performed, find out the
        // most recent task from the array and execute it
        while (cTask > 0) {
            if (cTask.TASK_INT_EXT0) {
                // A DC fault occurred - show on display
                t1con.TMR1ON = 1; // Switch on the timer - will reset fault if it clears within 2 seconds
                lcd_clear();
                lprintf("FAULT");
                cTask.TASK_INT_EXT0 = 0;
            } else if (cTask.TASK_TIMER1) {
                onTimer1(); // Timer 1 has finished counting
                cTask.TASK_TIMER1 = 0;
            } else if (cTask.TASK_I2C_RECV) {
                // Only process DAB LCD commands if no fault
                if (NODC_FAIL)
                    i2cProcess();
                cTask.TASK_I2C_RECV = 0;
            }            
        }
        
        // Check the selected input (unless DC fault is present, or muted)
        if (NODC_FAIL && MUTEOUT) {
            // Get porta status for active input
            iActiveInput = porta & 0b00000111;
            
            if (iActiveInput != iActiveInputPrev) {
                // debounce
                delay_ms(50);
                iActiveInput = porta & 0b00000111;
            }
            
            // if still different, show the new input on the LCD
            if (iActiveInput != iActiveInputPrev) {
                iActiveInputPrev = iActiveInput;
                showSource();
            }
        }
    }
} 
