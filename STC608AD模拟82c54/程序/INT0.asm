
    EXTRN CODE (DELAY)                //����Ҫʹ�õĴ����
    PUBLIC    INT0_INIT, INT_0

    ORG 0003H                        //���³���洢λ��
    LJMP INT_0

    _INT0_ASM  SEGMENT  CODE        //��̬�������λ��
    RSEG  _INT0_ASM
    LED0 BIT P2.0
        
INT0_INIT:
    SETB IT0
    CLR PX0
    SETB EX0
    SETB EA
    
    RET

INT_0:
    PUSH ACC;
    PUSH PSW;
    CLR LED0
    SETB LED0
    POP ACC;
    POP PSW;
    RETI
    
    
        
        
END                                    ;�������