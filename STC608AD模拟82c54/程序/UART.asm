
    PUBLIC    Init_UART, SendOneByte

    AUXR    DATA    08EH
    
    _UART_ASM  SEGMENT  CODE        //动态分配代码位置
    RSEG  _UART_ASM

    ORG 0023H
    LJMP UARTInterrupt


Init_UART:

    ORL AUXR,#40H  ;AUXR
    
    ORL TMOD,#20H
    MOV SCON,#50H
    MOV TH1,#0FAH
    MOV TL1,TH1
    MOV PCON,#00H
    SETB EA
    SETB ES
    SETB TR1
    RET

UARTInterrupt:
    JB RI,IsUART_Receive
    CLR TI
    RETI
IsUART_Receive:
    CLR RI
    PUSH ACC
    MOV A,SBUF
    ;========================
         ;add your code here!
    ;========================
    POP ACC
    RETI

SendOneByte:
    CLR ES
    CLR TI
    MOV SBUF,A
WaitSendFinish:
    JNB TI,WaitSendFinish
    CLR TI
    SETB ES
    RET

END