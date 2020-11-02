    PUBLIC    PCA0_INIT, PCA_0
        
    CMOD    EQU    0D9H
    CCON    EQU    0D8H
    PCACL   EQU    0E9H
    PCACH   EQU    0F9H
    PCACCAP0L EQU  0EAH
    PCACCAP0H EQU  0FAH
    PCACCAPM0 EQU  0DAH
        
    PCACCAP2L EQU  0ECH
    PCACCAP2H EQU  0FCH
    PCACCAPM2 EQU  0DCH
    OUT3     BIT     P2.6                     //定义OUT3的引脚
    ORG 003BH                        //以下程序存储位置
PCA_0:  
    JNB CCON.0, PCA0_END
    CLR CCON.0
    MOV A, PCACCAP0L
    ADD A, R3
    MOV PCACCAP0L, A
    CLR A
    ADDC A, PCACCAP0H
    MOV PCACCAP0H, A
PCA0_END:

    RETI


    _PCA_ASM  SEGMENT  CODE            //动态分配代码位置
    RSEG  _PCA_ASM
        
PCA0_INIT:
    MOV CCON, #0
    
    MOV PCACL, #0
    MOV PCACH, #0
    MOV CMOD, #6
    MOV PCACCAP0L, R3
    MOV PCACCAP0H, #0
    MOV PCACCAPM0, #04DH
    
    CLR CCON.6
    SETB IE.6
    SETB EA
        
    RET
end