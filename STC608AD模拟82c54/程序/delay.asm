
    PUBLIC    DELAY

    _DELAY_ASM  SEGMENT  CODE        //��̬�������λ��
    RSEG  _DELAY_ASM
    

DELAY:                                //��ʱΪR6*R7*DJNZ()
    MOV R7, #240
D1:
    MOV R6, #240
    DJNZ R6, $
    DJNZ R7, D1
    RET
    
    
END                                    ;�������