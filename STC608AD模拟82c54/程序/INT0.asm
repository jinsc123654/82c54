
    EXTRN CODE (DELAY)                //声明要使用的代码段
    PUBLIC    INT0_INIT, INT_0

    ORG 0003H                        //以下程序存储位置
    LJMP INT_0

    _INT0_ASM  SEGMENT  CODE        //动态分配代码位置
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
    
    
        
        
END                                    ;程序结束