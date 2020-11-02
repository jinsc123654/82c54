
    PUBLIC    DELAY

    _DELAY_ASM  SEGMENT  CODE        //动态分配代码位置
    RSEG  _DELAY_ASM
    

DELAY:                                //延时为R6*R7*DJNZ()
    MOV R7, #240
D1:
    MOV R6, #240
    DJNZ R6, $
    DJNZ R7, D1
    RET
    
    
END                                    ;程序结束