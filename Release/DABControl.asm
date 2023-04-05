;/////////////////////////////////////////////////////////////////////////////////
;// Code Generator: BoostC Compiler - http://www.sourceboost.com
;// Version       : 8.01
;// License Type  : Pro License
;// Limitations   : PIC12,PIC16 max code size:Unlimited, max RAM banks:Unlimited
;/////////////////////////////////////////////////////////////////////////////////

	include "P16F77.inc"
; Heap block 0, size:96 (0x00000190 - 0x000001EF)
__HEAP_BLOCK0_BANK               EQU	0x00000003
__HEAP_BLOCK0_START_OFFSET       EQU	0x00000010
__HEAP_BLOCK0_END_OFFSET         EQU	0x0000006F
; Heap block 1, size:80 (0x000000A0 - 0x000000EF)
__HEAP_BLOCK1_BANK               EQU	0x00000001
__HEAP_BLOCK1_START_OFFSET       EQU	0x00000020
__HEAP_BLOCK1_END_OFFSET         EQU	0x0000006F
; Heap block 2, size:37 (0x0000004B - 0x0000006F)
__HEAP_BLOCK2_BANK               EQU	0x00000000
__HEAP_BLOCK2_START_OFFSET       EQU	0x0000004B
__HEAP_BLOCK2_END_OFFSET         EQU	0x0000006F
; Heap block 3, size:8 (0x00000077 - 0x0000007E)
__HEAP_BLOCK3_BANK               EQU	0x00000000
__HEAP_BLOCK3_START_OFFSET       EQU	0x00000077
__HEAP_BLOCK3_END_OFFSET         EQU	0x0000007E
gbl_status                       EQU	0x00000003 ; bytes:1
gbl_indf                         EQU	0x00000000 ; bytes:1
gbl_tmr0                         EQU	0x00000001 ; bytes:1
gbl_pcl                          EQU	0x00000002 ; bytes:1
gbl_fsr                          EQU	0x00000004 ; bytes:1
gbl_porta                        EQU	0x00000005 ; bytes:1
gbl_portb                        EQU	0x00000006 ; bytes:1
gbl_portc                        EQU	0x00000007 ; bytes:1
gbl_portd                        EQU	0x00000008 ; bytes:1
gbl_porte                        EQU	0x00000009 ; bytes:1
gbl_pclath                       EQU	0x0000000A ; bytes:1
gbl_intcon                       EQU	0x0000000B ; bytes:1
gbl_pir1                         EQU	0x0000000C ; bytes:1
gbl_pir2                         EQU	0x0000000D ; bytes:1
gbl_tmr1l                        EQU	0x0000000E ; bytes:1
gbl_tmr1h                        EQU	0x0000000F ; bytes:1
gbl_t1con                        EQU	0x00000010 ; bytes:1
gbl_tmr2                         EQU	0x00000011 ; bytes:1
gbl_t2con                        EQU	0x00000012 ; bytes:1
gbl_sspbuf                       EQU	0x00000013 ; bytes:1
gbl_sspcon                       EQU	0x00000014 ; bytes:1
gbl_ccpr1l                       EQU	0x00000015 ; bytes:1
gbl_ccpr1h                       EQU	0x00000016 ; bytes:1
gbl_ccp1con                      EQU	0x00000017 ; bytes:1
gbl_rcsta                        EQU	0x00000018 ; bytes:1
gbl_txreg                        EQU	0x00000019 ; bytes:1
gbl_rcreg                        EQU	0x0000001A ; bytes:1
gbl_ccpr2l                       EQU	0x0000001B ; bytes:1
gbl_ccpr2h                       EQU	0x0000001C ; bytes:1
gbl_ccp2con                      EQU	0x0000001D ; bytes:1
gbl_adres                        EQU	0x0000001E ; bytes:1
gbl_adcon0                       EQU	0x0000001F ; bytes:1
gbl_option_reg                   EQU	0x00000081 ; bytes:1
gbl_trisa                        EQU	0x00000085 ; bytes:1
gbl_trisb                        EQU	0x00000086 ; bytes:1
gbl_trisc                        EQU	0x00000087 ; bytes:1
gbl_trisd                        EQU	0x00000088 ; bytes:1
gbl_trise                        EQU	0x00000089 ; bytes:1
gbl_pie1                         EQU	0x0000008C ; bytes:1
gbl_pie2                         EQU	0x0000008D ; bytes:1
gbl_pcon                         EQU	0x0000008E ; bytes:1
gbl_pr2                          EQU	0x00000092 ; bytes:1
gbl_sspadd                       EQU	0x00000093 ; bytes:1
gbl_sspstat                      EQU	0x00000094 ; bytes:1
gbl_txsta                        EQU	0x00000098 ; bytes:1
gbl_spbrg                        EQU	0x00000099 ; bytes:1
gbl_adcon1                       EQU	0x0000009F ; bytes:1
gbl_pmdata                       EQU	0x0000010C ; bytes:1
gbl_pmadr                        EQU	0x0000010D ; bytes:1
gbl_pmdath                       EQU	0x0000010E ; bytes:1
gbl_pmadrh                       EQU	0x0000010F ; bytes:1
gbl_pmcon1                       EQU	0x0000018C ; bytes:1
gbl_writeDelayType               EQU	0x00000023 ; bytes:1
gbl_I2C_slave_address            EQU	0x00000024 ; bytes:1
gbl_iRS232Index                  EQU	0x00000025 ; bytes:1
gbl_cTask                        EQU	0x00000026 ; bytes:1
gbl_iSecQ                        EQU	0x00000027 ; bytes:1
gbl_iActiveInput                 EQU	0x00000028 ; bytes:1
gbl_iActiveInputPrev             EQU	0x00000029 ; bytes:1
gbl_i2cBuffer                    EQU	0x00000110 ; bytes:103
i2cProcess_00000_1_iReadData     EQU	0x0000002A ; bytes:1
i2cProcess_00000_1_iProcessing   EQU	0x0000002B ; bytes:1
CompTempVarRet551                EQU	0x0000002E ; bytes:1
i2cProcess_00000_19_rs           EQU	0x00000007 ; bit:2
i2cBufferW_00016_arg_byteIn      EQU	0x00000048 ; bytes:1
CompTempVarRet555                EQU	0x0000004A ; bytes:1
i2cBufferW_00016_1_iNextHead     EQU	0x00000049 ; bytes:1
i2cBufferR_00014_arg_byteOut     EQU	0x0000002C ; bytes:2
CompTempVar552                   EQU	0x0000002F ; bytes:1
CompTempVar553                   EQU	0x00000030 ; bytes:1
CompTempVar554                   EQU	0x0000002F ; bytes:1
CompTempVar557                   EQU	0x0000002A ; bytes:1
LCD_Setup_00000_1_trisRS         EQU	0x00000087 ; bit:2
LCD_Setup_00000_1_trisRW         EQU	0x00000087 ; bit:1
LCD_Setup_00000_1_trisE          EQU	0x00000087 ; bit:0
LCD_Setup_00000_11_rs            EQU	0x00000007 ; bit:2
LCD_Setup_00000_30_rs            EQU	0x00000007 ; bit:2
LCD_Setup_00000_30_old_RS        EQU	0x0000002A ; bit:0
CompTempVarRet558                EQU	0x00000042 ; bytes:1
LCD_Setup_00000_39_rs            EQU	0x00000007 ; bit:2
LCD_Setup_00000_39_old_RS        EQU	0x0000002A ; bit:0
LCD_RawWri_00017_arg_d           EQU	0x0000002A ; bytes:1
LCD_RawWri_00017_1_data          EQU	0x00000008 ; bytes:1
LCD_RawWri_00017_1_tris          EQU	0x00000088 ; bytes:1
LCD_RawWri_00017_1_rw            EQU	0x00000007 ; bit:1
LCD_RawWri_00017_1_e             EQU	0x00000007 ; bit:0
LCD_Read_00000_1_d               EQU	0x00000041 ; bytes:1
LCD_Read_00000_1_data            EQU	0x00000008 ; bytes:1
LCD_Read_00000_1_tris            EQU	0x00000088 ; bytes:1
LCD_Read_00000_1_rw              EQU	0x00000007 ; bit:1
LCD_Read_00000_1_e               EQU	0x00000007 ; bit:0
LCD_Write_00000_arg_d            EQU	0x0000003F ; bytes:1
LCD_Write_00000_1_rs             EQU	0x00000007 ; bit:2
LCD_Write_00000_5_rs             EQU	0x00000007 ; bit:2
LCD_Write_00000_5_old_RS         EQU	0x00000040 ; bit:0
LCD_RawWri_00018_arg_d           EQU	0x00000040 ; bytes:1
LCD_RawWri_00018_1_tris          EQU	0x00000088 ; bytes:1
LCD_RawWri_00018_1_data          EQU	0x00000008 ; bytes:1
LCD_RawWri_00018_1_rw            EQU	0x00000007 ; bit:1
LCD_RawWri_00018_1_e             EQU	0x00000007 ; bit:0
LCD_RawWri_00018_2_flag          EQU	0x00000041 ; bit:0
LCD_RawWri_00018_5_d             EQU	0x00000042 ; bytes:1
LCD_RawWri_00018_7_data          EQU	0x00000008 ; bytes:1
LCD_RawWri_00018_7_tris          EQU	0x00000088 ; bytes:1
LCD_RawWri_00018_7_rw            EQU	0x00000007 ; bit:1
LCD_RawWri_00018_7_e             EQU	0x00000007 ; bit:0
CompTempVar559                   EQU	0x00000042 ; bytes:1
interrupt_9_i2cData              EQU	0x00000043 ; bytes:1
interrupt_9_i2cStatus            EQU	0x00000044 ; bytes:1
CompTempVar560                   EQU	0x00000045 ; bytes:1
CompTempVar561                   EQU	0x00000046 ; bytes:1
CompTempVar562                   EQU	0x00000047 ; bytes:1
LCD_Functi_00015_arg_func        EQU	0x0000002C ; bytes:1
LCD_Functi_00015_4_rs            EQU	0x00000007 ; bit:2
CompTempVar565                   EQU	0x0000002C ; bytes:4
CompTempVar567                   EQU	0x0000002C ; bytes:9
CompTempVar569                   EQU	0x0000002C ; bytes:11
CompTempVar571                   EQU	0x0000002C ; bytes:10
LCD_Clear_00000_4_rs             EQU	0x00000007 ; bit:2
LCD_GotoXy_00000_arg_x           EQU	0x0000002A ; bytes:1
LCD_GotoXy_00000_arg_y           EQU	0x0000002B ; bytes:1
LCD_GotoXy_00000_1_offset        EQU	0x0000002C ; bytes:1
LCD_GotoXy_00000_4_rs            EQU	0x00000007 ; bit:2
LCD_Printf_00000_arg_lcdptr      EQU	0x0000002A ; bytes:2
LCD_Printf_00000_1_pi            EQU	0x0000003D ; bytes:1
LCD_Printf_00000_1_c             EQU	0x0000003E ; bytes:1
LCD_Printf_00000_4_rs            EQU	0x00000007 ; bit:2
CompTempVar574                   EQU	0x0000003F ; bytes:1
LCD_Printf_00000_10_rs           EQU	0x00000007 ; bit:2
LCD_Printf_00000_16_rs           EQU	0x00000007 ; bit:2
CompTempVar575                   EQU	0x0000002C ; bytes:7
CompTempVar577                   EQU	0x0000002C ; bytes:17
CompTempVar579                   EQU	0x0000002C ; bytes:6
delay_10us_00000_arg_del         EQU	0x0000002A ; bytes:1
delay_ms_00000_arg_del           EQU	0x0000002A ; bytes:1
Int1Context                      EQU	0x0000007F ; bytes:1
Int1BContext                     EQU	0x00000020 ; bytes:3
	ORG 0x00000000
	GOTO	_startup
	ORG 0x00000004
	MOVWF Int1Context
	SWAPF STATUS, W
	BCF STATUS, RP0
	BCF STATUS, RP1
	MOVWF Int1BContext
	SWAPF PCLATH, W
	MOVWF Int1BContext+D'1'
	SWAPF FSR, W
	MOVWF Int1BContext+D'2'
	BCF PCLATH,3
	BCF PCLATH,4
	GOTO	interrupt
	ORG 0x00000010
delay_ms_00000
; { delay_ms ; function begin
	MOVF delay_ms_00000_arg_del, F
	BTFSS STATUS,Z
	GOTO	label1
	RETURN
label1
	MOVLW 0xF9
label2
	NOP
	NOP
	ADDLW 0xFF
	BTFSS STATUS,Z
	GOTO	label2
	NOP
	NOP
	NOP
	DECFSZ delay_ms_00000_arg_del, F
	GOTO	label1
	RETURN
; } delay_ms function end

	ORG 0x00000020
delay_10us_00000
; { delay_10us ; function begin
	MOVF delay_10us_00000_arg_del, F
	BTFSS STATUS,Z
	GOTO	label3
	RETURN
label3
	MOVLW 0x02
label4
	NOP
	ADDLW 0xFF
	BTFSS STATUS,Z
	GOTO	label4
	NOP
	NOP
	DECFSZ delay_10us_00000_arg_del, F
	GOTO	label3
	RETURN
; } delay_10us function end

	ORG 0x0000002E
i2cBufferW_00016
; { i2cBufferWrite ; function begin
	MOVF gbl_i2cBuffer+D'101', W
	XORLW 0x64
	BTFSS STATUS,Z
	GOTO	label5
	CLRF i2cBufferW_00016_1_iNextHead
	GOTO	label6
label5
	INCF gbl_i2cBuffer+D'101', W
	MOVWF i2cBufferW_00016_1_iNextHead
label6
	MOVF gbl_i2cBuffer+D'102', W
	XORWF i2cBufferW_00016_1_iNextHead, W
	BTFSS STATUS,Z
	GOTO	label7
	MOVLW 0x02
	MOVWF CompTempVarRet555
	RETURN
label7
	BSF	STATUS,IRP
	MOVLW LOW(gbl_i2cBuffer+D'0')
	MOVWF FSR
	MOVF gbl_i2cBuffer+D'101', W
	ADDWF FSR, F
	MOVF i2cBufferW_00016_arg_byteIn, W
	MOVWF INDF
	MOVF i2cBufferW_00016_1_iNextHead, W
	MOVWF gbl_i2cBuffer+D'101'
	CLRF CompTempVarRet555
	RETURN
; } i2cBufferWrite function end

	ORG 0x00000048
LCD_Read_00000
; { LCD_Read ; function begin
	MOVLW 0xF0
	BSF STATUS, RP0
	BCF STATUS, RP1
	IORWF LCD_Read_00000_1_tris, F
	BCF STATUS, RP0
	BSF LCD_Read_00000_1_rw,1
	NOP
	NOP
	BSF LCD_Read_00000_1_e,0
	NOP
	NOP
	NOP
	NOP
	NOP
	MOVLW 0xF0
	ANDWF LCD_Read_00000_1_data, W
	MOVWF LCD_Read_00000_1_d
	BCF LCD_Read_00000_1_e,0
	NOP
	NOP
	NOP
	NOP
	NOP
	BSF LCD_Read_00000_1_e,0
	NOP
	NOP
	NOP
	NOP
	NOP
	SWAPF LCD_Read_00000_1_data, W
	ANDLW 0x0F
	IORWF LCD_Read_00000_1_d, F
	BCF LCD_Read_00000_1_e,0
	NOP
	NOP
	NOP
	MOVF LCD_Read_00000_1_d, W
	MOVWF CompTempVarRet558
	RETURN
; } LCD_Read function end

	ORG 0x0000006F
LCD_RawWri_00018
; { LCD_RawWrite ; function begin
	BCF LCD_RawWri_00018_2_flag,0
label8
	MOVF LCD_RawWri_00018_arg_d, W
	MOVWF LCD_RawWri_00018_5_d
	BCF LCD_RawWri_00018_7_rw,1
	NOP
	NOP
	MOVLW 0x0F
	BSF STATUS, RP0
	ANDWF LCD_RawWri_00018_7_tris, F
	MOVLW 0x0F
	BCF STATUS, RP0
	ANDWF LCD_RawWri_00018_7_data, F
	MOVLW 0xF0
	ANDWF LCD_RawWri_00018_5_d, W
	IORWF LCD_RawWri_00018_7_data, F
	BSF LCD_RawWri_00018_7_e,0
	NOP
	NOP
	NOP
	NOP
	NOP
	BCF LCD_RawWri_00018_7_e,0
	NOP
	NOP
	NOP
	CLRF CompTempVar559
	BTFSS LCD_RawWri_00018_2_flag,0
	INCF CompTempVar559, F
	BCF LCD_RawWri_00018_2_flag,0
	BTFSC CompTempVar559,0
	BSF LCD_RawWri_00018_2_flag,0
	SWAPF LCD_RawWri_00018_arg_d, F
	MOVLW 0xF0
	ANDWF LCD_RawWri_00018_arg_d, F
	BTFSC LCD_RawWri_00018_2_flag,0
	GOTO	label8
	RETURN
; } LCD_RawWrite function end

	ORG 0x00000094
LCD_Write_00000
; { LCD_Write ; function begin
	MOVF gbl_writeDelayType, F
	BTFSS STATUS,Z
	GOTO	label11
	BCF LCD_Write_00000_5_old_RS,0
	BTFSS LCD_Write_00000_5_rs,2
	GOTO	label9
	BSF LCD_Write_00000_5_old_RS,0
label9
	BCF LCD_Write_00000_5_rs,2
label10
	CALL LCD_Read_00000
	BTFSC CompTempVarRet558,7
	GOTO	label10
	BTFSC LCD_Write_00000_5_old_RS,0
	BSF LCD_Write_00000_5_rs,2
	BTFSS LCD_Write_00000_5_old_RS,0
	BCF LCD_Write_00000_5_rs,2
label11
	MOVF LCD_Write_00000_arg_d, W
	MOVWF LCD_RawWri_00018_arg_d
	CALL LCD_RawWri_00018
	RETURN
; } LCD_Write function end

	ORG 0x000000A7
LCD_RawWri_00017
; { LCD_RawWriteNibble ; function begin
	BCF LCD_RawWri_00017_1_rw,1
	NOP
	NOP
	MOVLW 0x0F
	BSF STATUS, RP0
	ANDWF LCD_RawWri_00017_1_tris, F
	MOVLW 0x0F
	BCF STATUS, RP0
	ANDWF LCD_RawWri_00017_1_data, F
	MOVLW 0xF0
	ANDWF LCD_RawWri_00017_arg_d, W
	IORWF LCD_RawWri_00017_1_data, F
	BSF LCD_RawWri_00017_1_e,0
	NOP
	NOP
	NOP
	NOP
	NOP
	BCF LCD_RawWri_00017_1_e,0
	NOP
	NOP
	NOP
	RETURN
; } LCD_RawWriteNibble function end

	ORG 0x000000BE
LCD_Printf_00000
; { LCD_Printf ; function begin
	CLRF LCD_Printf_00000_1_pi
	BSF LCD_Printf_00000_4_rs,2
label12
	BCF STATUS,IRP
	BTFSC LCD_Printf_00000_arg_lcdptr+D'1',0
	BSF STATUS,IRP
	MOVF LCD_Printf_00000_arg_lcdptr, W
	MOVWF FSR
	BCF STATUS,IRP
	BTFSC LCD_Printf_00000_arg_lcdptr+D'1',0
	BSF STATUS,IRP
	MOVF LCD_Printf_00000_arg_lcdptr, W
	MOVWF FSR
	MOVF LCD_Printf_00000_1_pi, W
	MOVWF CompTempVar574
	INCF LCD_Printf_00000_1_pi, F
	MOVF CompTempVar574, W
	ADDWF FSR, F
	MOVF INDF, W
	MOVWF LCD_Printf_00000_1_c
	MOVF LCD_Printf_00000_1_c, F
	BTFSC STATUS,Z
	RETURN
	MOVF LCD_Printf_00000_1_c, W
	XORLW 0x0A
	BTFSS STATUS,Z
	GOTO	label13
	BCF LCD_Printf_00000_10_rs,2
	MOVLW 0xC0
	MOVWF LCD_Write_00000_arg_d
	CALL LCD_Write_00000
	BSF LCD_Printf_00000_16_rs,2
	GOTO	label12
label13
	MOVF LCD_Printf_00000_1_c, W
	MOVWF LCD_Write_00000_arg_d
	CALL LCD_Write_00000
	GOTO	label12
; } LCD_Printf function end

	ORG 0x000000E2
LCD_GotoXy_00000
; { LCD_GotoXy ; function begin
	BCF LCD_GotoXy_00000_4_rs,2
	MOVF LCD_GotoXy_00000_arg_x, W
	MOVWF LCD_GotoXy_00000_1_offset
	BTFSS LCD_GotoXy_00000_arg_y,0
	GOTO	label14
	MOVLW 0x40
	ADDWF LCD_GotoXy_00000_1_offset, F
label14
	BTFSS LCD_GotoXy_00000_arg_y,1
	GOTO	label15
	MOVLW 0x14
	ADDWF LCD_GotoXy_00000_1_offset, F
label15
	MOVF LCD_GotoXy_00000_1_offset, W
	ADDLW 0x80
	MOVWF LCD_Write_00000_arg_d
	CALL LCD_Write_00000
	RETURN
; } LCD_GotoXy function end

	ORG 0x000000F2
LCD_Clear_00000
; { LCD_Clear ; function begin
	BCF STATUS, RP0
	BCF STATUS, RP1
	BCF LCD_Clear_00000_4_rs,2
	MOVLW 0x01
	MOVWF LCD_Write_00000_arg_d
	CALL LCD_Write_00000
	MOVLW 0x02
	MOVWF LCD_Write_00000_arg_d
	CALL LCD_Write_00000
	RETURN
; } LCD_Clear function end

	ORG 0x000000FC
showSource_00000
; { showSource ; function begin
	CALL LCD_Clear_00000
	BTFSS gbl_porta,0
	GOTO	label16
	CLRF LCD_GotoXy_00000_arg_x
	CLRF LCD_GotoXy_00000_arg_y
	CALL LCD_GotoXy_00000
	MOVLW 0x44
	MOVWF CompTempVar565
	MOVLW 0x41
	MOVWF CompTempVar565+D'1'
	MOVLW 0x42
	MOVWF CompTempVar565+D'2'
	CLRF CompTempVar565+D'3'
	MOVLW HIGH(CompTempVar565+D'0')
	MOVWF LCD_Printf_00000_arg_lcdptr+D'1'
	MOVLW LOW(CompTempVar565+D'0')
	MOVWF LCD_Printf_00000_arg_lcdptr
	CALL LCD_Printf_00000
	RETURN
label16
	BTFSS gbl_porta,1
	GOTO	label17
	CLRF LCD_GotoXy_00000_arg_x
	CLRF LCD_GotoXy_00000_arg_y
	CALL LCD_GotoXy_00000
	MOVLW 0x50
	MOVWF CompTempVar567
	MOVLW 0x43
	MOVWF CompTempVar567+D'1'
	MOVLW 0x20
	MOVWF CompTempVar567+D'2'
	MOVLW 0x41
	MOVWF CompTempVar567+D'3'
	MOVLW 0x75
	MOVWF CompTempVar567+D'4'
	MOVLW 0x64
	MOVWF CompTempVar567+D'5'
	MOVLW 0x69
	MOVWF CompTempVar567+D'6'
	MOVLW 0x6F
	MOVWF CompTempVar567+D'7'
	CLRF CompTempVar567+D'8'
	MOVLW HIGH(CompTempVar567+D'0')
	MOVWF LCD_Printf_00000_arg_lcdptr+D'1'
	MOVLW LOW(CompTempVar567+D'0')
	MOVWF LCD_Printf_00000_arg_lcdptr
	CALL LCD_Printf_00000
	RETURN
label17
	BTFSS gbl_porta,2
	GOTO	label18
	CLRF LCD_GotoXy_00000_arg_x
	CLRF LCD_GotoXy_00000_arg_y
	CALL LCD_GotoXy_00000
	MOVLW 0x43
	MOVWF CompTempVar569
	MOVLW 0x68
	MOVWF CompTempVar569+D'1'
	MOVLW 0x72
	MOVWF CompTempVar569+D'2'
	MOVLW 0x6F
	MOVWF CompTempVar569+D'3'
	MOVLW 0x6D
	MOVWF CompTempVar569+D'4'
	MOVLW 0x65
	MOVWF CompTempVar569+D'5'
	MOVLW 0x63
	MOVWF CompTempVar569+D'6'
	MOVLW 0x61
	MOVWF CompTempVar569+D'7'
	MOVLW 0x73
	MOVWF CompTempVar569+D'8'
	MOVLW 0x74
	MOVWF CompTempVar569+D'9'
	CLRF CompTempVar569+D'10'
	MOVLW HIGH(CompTempVar569+D'0')
	MOVWF LCD_Printf_00000_arg_lcdptr+D'1'
	MOVLW LOW(CompTempVar569+D'0')
	MOVWF LCD_Printf_00000_arg_lcdptr
	CALL LCD_Printf_00000
	RETURN
label18
	CLRF LCD_GotoXy_00000_arg_x
	CLRF LCD_GotoXy_00000_arg_y
	CALL LCD_GotoXy_00000
	MOVLW 0x41
	MOVWF CompTempVar571
	MOVLW 0x61
	MOVWF CompTempVar571+D'6'
	MOVLW 0x69
	MOVWF CompTempVar571+D'3'
	MOVWF CompTempVar571+D'5'
	MOVLW 0x6C
	MOVWF CompTempVar571+D'4'
	MOVLW 0x72
	MOVWF CompTempVar571+D'7'
	MOVLW 0x75
	MOVWF CompTempVar571+D'1'
	MOVLW 0x78
	MOVWF CompTempVar571+D'2'
	MOVLW 0x79
	MOVWF CompTempVar571+D'8'
	CLRF CompTempVar571+D'9'
	MOVLW HIGH(CompTempVar571+D'0')
	MOVWF LCD_Printf_00000_arg_lcdptr+D'1'
	MOVLW LOW(CompTempVar571+D'0')
	MOVWF LCD_Printf_00000_arg_lcdptr
	CALL LCD_Printf_00000
	RETURN
; } showSource function end

	ORG 0x00000166
i2cBufferR_00014
; { i2cBufferRead ; function begin
	MOVF gbl_i2cBuffer+D'102', W
	XORWF gbl_i2cBuffer+D'101', W
	BTFSS STATUS,Z
	GOTO	label19
	MOVLW 0x01
	MOVWF CompTempVarRet551
	RETURN
label19
	BSF	STATUS,IRP
	MOVLW LOW(gbl_i2cBuffer+D'0')
	MOVWF FSR
	MOVF gbl_i2cBuffer+D'102', W
	MOVWF CompTempVar552
	MOVF CompTempVar552, W
	ADDWF FSR, F
	MOVF INDF, W
	MOVWF CompTempVar553
	BCF STATUS,IRP
	BTFSC i2cBufferR_00014_arg_byteOut+D'1',0
	BSF STATUS,IRP
	MOVF i2cBufferR_00014_arg_byteOut, W
	MOVWF FSR
	MOVF CompTempVar553, W
	MOVWF INDF
	MOVF gbl_i2cBuffer+D'102', W
	XORLW 0x64
	BTFSS STATUS,Z
	GOTO	label20
	CLRF CompTempVar554
	GOTO	label21
label20
	INCF gbl_i2cBuffer+D'102', W
	MOVWF CompTempVar554
label21
	MOVF CompTempVar554, W
	MOVWF gbl_i2cBuffer+D'102'
	CLRF CompTempVarRet551
	RETURN
; } i2cBufferRead function end

	ORG 0x00000189
LCD_Setup_00000
; { LCD_Setup ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	BCF LCD_Setup_00000_1_trisRS,2
	BCF LCD_Setup_00000_1_trisRW,1
	BCF LCD_Setup_00000_1_trisE,0
	MOVLW 0x01
	BCF STATUS, RP0
	MOVWF gbl_writeDelayType
	MOVLW 0x10
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BCF LCD_Setup_00000_11_rs,2
	MOVLW 0x30
	MOVWF LCD_RawWri_00017_arg_d
	CALL LCD_RawWri_00017
	MOVLW 0x05
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	MOVLW 0x30
	MOVWF LCD_RawWri_00017_arg_d
	CALL LCD_RawWri_00017
	MOVLW 0x64
	MOVWF delay_10us_00000_arg_del
	CALL delay_10us_00000
	MOVLW 0x30
	MOVWF LCD_RawWri_00017_arg_d
	CALL LCD_RawWri_00017
	BCF LCD_Setup_00000_30_old_RS,0
	BTFSC LCD_Setup_00000_30_rs,2
	BSF LCD_Setup_00000_30_old_RS,0
	BCF LCD_Setup_00000_30_rs,2
label22
	CALL LCD_Read_00000
	BTFSC CompTempVarRet558,7
	GOTO	label22
	BTFSC LCD_Setup_00000_30_old_RS,0
	BSF LCD_Setup_00000_30_rs,2
	BTFSS LCD_Setup_00000_30_old_RS,0
	BCF LCD_Setup_00000_30_rs,2
	MOVLW 0x28
	MOVWF LCD_RawWri_00017_arg_d
	CALL LCD_RawWri_00017
	BCF LCD_Setup_00000_39_old_RS,0
	BTFSC LCD_Setup_00000_39_rs,2
	BSF LCD_Setup_00000_39_old_RS,0
	BCF LCD_Setup_00000_39_rs,2
label23
	CALL LCD_Read_00000
	BTFSC CompTempVarRet558,7
	GOTO	label23
	BTFSC LCD_Setup_00000_39_old_RS,0
	BSF LCD_Setup_00000_39_rs,2
	BTFSS LCD_Setup_00000_39_old_RS,0
	BCF LCD_Setup_00000_39_rs,2
	CLRF gbl_writeDelayType
	MOVLW 0x28
	MOVWF LCD_Write_00000_arg_d
	CALL LCD_Write_00000
	MOVLW 0x06
	MOVWF LCD_Write_00000_arg_d
	CALL LCD_Write_00000
	MOVLW 0x0C
	MOVWF LCD_Write_00000_arg_d
	CALL LCD_Write_00000
	MOVLW 0x80
	MOVWF LCD_Write_00000_arg_d
	CALL LCD_Write_00000
	RETURN
; } LCD_Setup function end

	ORG 0x000001CB
LCD_Functi_00015
; { LCD_Function ; function begin
	BCF LCD_Functi_00015_4_rs,2
	MOVF LCD_Functi_00015_arg_func, W
	MOVWF LCD_Write_00000_arg_d
	CALL LCD_Write_00000
	RETURN
; } LCD_Function function end

	ORG 0x000001D0
onTimer1_00000
; { onTimer1 ; function begin
	BCF STATUS, RP0
	BCF STATUS, RP1
	BTFSS gbl_portb,0
	RETURN
	BSF gbl_porta,5
	BCF gbl_t1con,0
	CALL showSource_00000
	RETURN
; } onTimer1 function end

	ORG 0x000001D8
initialise_00000
; { initialise ; function begin
	MOVLW 0x07
	BSF STATUS, RP0
	BCF STATUS, RP1
	MOVWF gbl_trisa
	BCF STATUS, RP0
	CLRF gbl_porta
	MOVLW 0x01
	BSF STATUS, RP0
	MOVWF gbl_trisb
	BCF STATUS, RP0
	CLRF gbl_portb
	MOVLW 0xD8
	BSF STATUS, RP0
	MOVWF gbl_trisc
	MOVLW 0x18
	BCF STATUS, RP0
	MOVWF gbl_portc
	BSF STATUS, RP0
	CLRF gbl_trisd
	BCF STATUS, RP0
	CLRF gbl_portd
	BSF STATUS, RP0
	CLRF gbl_trise
	BCF STATUS, RP0
	CLRF gbl_porte
	CLRF gbl_adcon0
	MOVLW 0x0F
	BSF STATUS, RP0
	MOVWF gbl_adcon1
	MOVLW 0x31
	BCF STATUS, RP0
	MOVWF gbl_t1con
	BSF gbl_t1con,5
	BSF gbl_t1con,4
	BCF gbl_t1con,3
	BSF gbl_t1con,2
	BCF gbl_t1con,1
	BCF gbl_t1con,0
	MOVLW 0x48
	MOVWF gbl_tmr1h
	MOVLW 0xE4
	MOVWF gbl_tmr1l
	BSF STATUS, RP0
	BSF gbl_pie1,0
	BCF STATUS, RP0
	BCF gbl_sspcon,7
	BCF gbl_sspcon,6
	BSF gbl_sspcon,5
	BSF gbl_sspcon,4
	BSF gbl_sspcon,3
	BSF gbl_sspcon,2
	BSF gbl_sspcon,1
	BCF gbl_sspcon,0
	MOVF gbl_I2C_slave_address, W
	MOVWF CompTempVar557
	BCF STATUS,C
	RLF CompTempVar557, W
	BSF STATUS, RP0
	MOVWF gbl_sspadd
	CLRF gbl_sspstat
	MOVLW 0x19
	MOVWF gbl_spbrg
	MOVLW 0x36
	MOVWF gbl_txsta
	MOVLW 0x90
	BCF STATUS, RP0
	MOVWF gbl_rcsta
	CLRF gbl_iRS232Index
	MOVLW 0x64
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BSF gbl_intcon,4
	BSF STATUS, RP0
	BCF gbl_option_reg,6
	BCF gbl_intcon,1
	BSF gbl_option_reg,7
	BSF gbl_intcon,6
	BSF gbl_intcon,7
	BSF gbl_pie1,3
	BCF STATUS, RP0
	CLRF gbl_cTask
	CLRF gbl_iSecQ
	CALL LCD_Setup_00000
	BSF gbl_sspcon,4
	RETURN
; } initialise function end

	ORG 0x0000022D
i2cProcess_00000
; { i2cProcess ; function begin
	BCF STATUS, RP0
	BCF STATUS, RP1
	CLRF i2cProcess_00000_1_iProcessing
label24
	MOVLW HIGH(i2cProcess_00000_1_iReadData+D'0')
	MOVWF i2cBufferR_00014_arg_byteOut+D'1'
	MOVLW LOW(i2cProcess_00000_1_iReadData+D'0')
	MOVWF i2cBufferR_00014_arg_byteOut
	CALL i2cBufferR_00014
	MOVF CompTempVarRet551, F
	BTFSS STATUS,Z
	RETURN
	INCF i2cProcess_00000_1_iReadData, W
	BTFSS STATUS,Z
	GOTO	label25
	CLRF i2cProcess_00000_1_iProcessing
	GOTO	label24
label25
	MOVF i2cProcess_00000_1_iProcessing, F
	BTFSS STATUS,Z
	GOTO	label28
	MOVF i2cProcess_00000_1_iReadData, F
	BTFSS STATUS,Z
	GOTO	label26
	MOVLW 0x01
	MOVWF i2cProcess_00000_1_iProcessing
	GOTO	label24
label26
	MOVF i2cProcess_00000_1_iReadData, W
	XORLW 0xC0
	BTFSS STATUS,Z
	GOTO	label27
	MOVLW 0x02
	MOVWF i2cProcess_00000_1_iProcessing
	GOTO	label24
label27
	MOVF i2cProcess_00000_1_iReadData, W
	XORLW 0x40
	BTFSS STATUS,Z
	GOTO	label24
	MOVLW 0x03
	MOVWF i2cProcess_00000_1_iProcessing
	GOTO	label24
label28
	DECF i2cProcess_00000_1_iProcessing, W
	BTFSS STATUS,Z
	GOTO	label29
	MOVF i2cProcess_00000_1_iReadData, W
	XORLW 0x38
	BTFSC STATUS,Z
	GOTO	label24
	MOVF i2cProcess_00000_1_iReadData, W
	MOVWF LCD_Functi_00015_arg_func
	CALL LCD_Functi_00015
	GOTO	label24
label29
	MOVF i2cProcess_00000_1_iProcessing, W
	SUBLW 0x01
	BTFSC STATUS,C
	GOTO	label24
	MOVF i2cProcess_00000_1_iReadData, W
	XORLW 0xC0
	BTFSC STATUS,Z
	GOTO	label24
	BSF i2cProcess_00000_19_rs,2
	MOVF i2cProcess_00000_1_iReadData, W
	MOVWF LCD_Write_00000_arg_d
	CALL LCD_Write_00000
	GOTO	label24
; } i2cProcess function end

	ORG 0x0000026C
main
; { main ; function begin
	CALL initialise_00000
	BSF gbl_t1con,0
	CLRF LCD_GotoXy_00000_arg_x
	CLRF LCD_GotoXy_00000_arg_y
	CALL LCD_GotoXy_00000
	MOVLW 0x48
	MOVWF CompTempVar575
	MOVLW 0x65
	MOVWF CompTempVar575+D'1'
	MOVLW 0x6C
	MOVWF CompTempVar575+D'2'
	MOVWF CompTempVar575+D'3'
	MOVLW 0x6F
	MOVWF CompTempVar575+D'4'
	MOVLW 0x21
	MOVWF CompTempVar575+D'5'
	CLRF CompTempVar575+D'6'
	MOVLW HIGH(CompTempVar575+D'0')
	MOVWF LCD_Printf_00000_arg_lcdptr+D'1'
	MOVLW LOW(CompTempVar575+D'0')
	MOVWF LCD_Printf_00000_arg_lcdptr
	CALL LCD_Printf_00000
	CLRF LCD_GotoXy_00000_arg_x
	MOVLW 0x01
	MOVWF LCD_GotoXy_00000_arg_y
	CALL LCD_GotoXy_00000
	MOVLW 0x20
	MOVWF CompTempVar577+D'4'
	MOVWF CompTempVar577+D'6'
	MOVLW 0x2E
	MOVWF CompTempVar577+D'13'
	MOVWF CompTempVar577+D'14'
	MOVWF CompTempVar577+D'15'
	MOVLW 0x4A
	MOVWF CompTempVar577
	MOVLW 0x61
	MOVWF CompTempVar577+D'5'
	MOVLW 0x65
	MOVWF CompTempVar577+D'10'
	MOVLW 0x6D
	MOVWF CompTempVar577+D'7'
	MOVWF CompTempVar577+D'9'
	MOVLW 0x6E
	MOVWF CompTempVar577+D'11'
	MOVLW 0x6F
	MOVWF CompTempVar577+D'8'
	MOVLW 0x73
	MOVWF CompTempVar577+D'2'
	MOVLW 0x74
	MOVWF CompTempVar577+D'3'
	MOVWF CompTempVar577+D'12'
	MOVLW 0x75
	MOVWF CompTempVar577+D'1'
	CLRF CompTempVar577+D'16'
	MOVLW HIGH(CompTempVar577+D'0')
	MOVWF LCD_Printf_00000_arg_lcdptr+D'1'
	MOVLW LOW(CompTempVar577+D'0')
	MOVWF LCD_Printf_00000_arg_lcdptr
	CALL LCD_Printf_00000
label30
	MOVF gbl_cTask, W
	SUBLW 0x00
	BTFSC STATUS,C
	GOTO	label34
	BTFSS gbl_cTask,0
	GOTO	label31
	BSF gbl_t1con,0
	CALL LCD_Clear_00000
	MOVLW 0x46
	MOVWF CompTempVar579
	MOVLW 0x41
	MOVWF CompTempVar579+D'1'
	MOVLW 0x55
	MOVWF CompTempVar579+D'2'
	MOVLW 0x4C
	MOVWF CompTempVar579+D'3'
	MOVLW 0x54
	MOVWF CompTempVar579+D'4'
	CLRF CompTempVar579+D'5'
	MOVLW HIGH(CompTempVar579+D'0')
	MOVWF LCD_Printf_00000_arg_lcdptr+D'1'
	MOVLW LOW(CompTempVar579+D'0')
	MOVWF LCD_Printf_00000_arg_lcdptr
	CALL LCD_Printf_00000
	BCF gbl_cTask,0
	GOTO	label30
label31
	BTFSS gbl_cTask,7
	GOTO	label32
	CALL onTimer1_00000
	BCF gbl_cTask,7
	GOTO	label30
label32
	BTFSS gbl_cTask,6
	GOTO	label30
	BTFSS gbl_portb,0
	GOTO	label33
	CALL i2cProcess_00000
label33
	BCF gbl_cTask,6
	GOTO	label30
label34
	BTFSS gbl_portb,0
	GOTO	label30
	BTFSS gbl_porta,5
	GOTO	label30
	MOVLW 0x07
	ANDWF gbl_porta, W
	MOVWF gbl_iActiveInput
	MOVF gbl_iActiveInputPrev, W
	XORWF gbl_iActiveInput, W
	BTFSC STATUS,Z
	GOTO	label35
	MOVLW 0x32
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	MOVLW 0x07
	ANDWF gbl_porta, W
	MOVWF gbl_iActiveInput
label35
	MOVF gbl_iActiveInputPrev, W
	XORWF gbl_iActiveInput, W
	BTFSC STATUS,Z
	GOTO	label30
	MOVF gbl_iActiveInput, W
	MOVWF gbl_iActiveInputPrev
	CALL showSource_00000
	GOTO	label30
; } main function end

	ORG 0x000002E6
_startup
	MOVLW 0x3E
	BCF STATUS, RP0
	BCF STATUS, RP1
	MOVWF gbl_I2C_slave_address
	BSF STATUS, RP1
	CLRF gbl_i2cBuffer
	CLRF gbl_i2cBuffer+D'101'
	CLRF gbl_i2cBuffer+D'102'
	BCF PCLATH,3
	BCF PCLATH,4
	GOTO	main
	ORG 0x000002F1
interrupt
; { interrupt ; function begin
	BTFSS gbl_intcon,1
	GOTO	label38
	BCF STATUS, RP0
	BCF STATUS, RP1
	BTFSC gbl_portb,0
	GOTO	label37
	BCF gbl_porta,5
	BSF gbl_cTask,0
label37
	BCF gbl_intcon,1
	GOTO	label45
label38
	BCF STATUS, RP0
	BCF STATUS, RP1
	BTFSS gbl_pir1,3
	GOTO	label43
	BTFSS gbl_sspcon,6
	GOTO	label39
	MOVF gbl_sspbuf, W
	MOVWF interrupt_9_i2cData
	BCF gbl_sspcon,6
	GOTO	label41
label39
	MOVLW 0x2D
	BSF STATUS, RP0
	ANDWF gbl_sspstat, W
	BCF STATUS, RP0
	MOVWF interrupt_9_i2cStatus
	MOVLW 0x09
	XORWF interrupt_9_i2cStatus, W
	MOVWF CompTempVar561
	MOVF CompTempVar561, F
	BTFSS STATUS,Z
	GOTO	label40
	MOVF gbl_sspbuf, W
	MOVWF interrupt_9_i2cData
	GOTO	label41
label40
	MOVLW 0x29
	XORWF interrupt_9_i2cStatus, W
	MOVWF CompTempVar562
	MOVF CompTempVar562, F
	BTFSS STATUS,Z
	GOTO	label41
	MOVF gbl_sspbuf, W
	MOVWF interrupt_9_i2cData
	MOVF interrupt_9_i2cData, W
	MOVWF i2cBufferW_00016_arg_byteIn
	CALL i2cBufferW_00016
label41
	MOVLW 0x3D
	BSF STATUS, RP0
	ANDWF gbl_sspstat, W
	BCF STATUS, RP0
	MOVWF CompTempVar560
	MOVLW 0x30
	XORWF CompTempVar560, F
	MOVF CompTempVar560, F
	BTFSS STATUS,Z
	GOTO	label42
	MOVLW 0xFF
	MOVWF i2cBufferW_00016_arg_byteIn
	CALL i2cBufferW_00016
	BSF gbl_cTask,6
label42
	BCF gbl_pir1,3
label43
	BTFSS gbl_pir1,0
	GOTO	label45
	MOVLW 0x48
	MOVWF gbl_tmr1h
	MOVLW 0xE4
	MOVWF gbl_tmr1l
	INCF gbl_iSecQ, F
	MOVLW 0x08
	SUBWF gbl_iSecQ, W
	BTFSS STATUS,C
	GOTO	label44
	BSF gbl_cTask,7
	CLRF gbl_iSecQ
label44
	BCF gbl_pir1,0
label45
	SWAPF Int1BContext+D'2', W
	MOVWF FSR
	SWAPF Int1BContext+D'1', W
	MOVWF PCLATH
	SWAPF Int1BContext, W
	MOVWF STATUS
	SWAPF Int1Context, F
	SWAPF Int1Context, W
	RETFIE
; } interrupt function end

	ORG 0x00002007
	DW 0x3FBA
	END
