
    PUBLIC    TIM0_INIT, TIM_0, TIM1_INIT, TIM_1

    AUXR    DATA    08EH
    OUT1     BIT     P2.4                     //定义OUT1的引脚
    OUT2     BIT     P2.5                     //定义OUT2的引脚
    PCACL   EQU    0E9H
    PCACH   EQU    0F9H

/****************************************************下方为定时器0*****************************************************/
    ORG 000BH                        //以下程序存储位置
    TIM_0:
    CLR  TR0
    SETB TR0
    CPL  OUT1                         //LED亮灭转换
    T0E:
    
    RETI
/****************************************************下方为定时器1*****************************************************/
    ORG 001BH                        //以下程序存储位置
    TIM_1:
    CPL  OUT2                         //LED亮灭转换
    T1E:
    
    RETI
    

    _TIM_ASM  SEGMENT  CODE            //动态分配代码位置
    RSEG  _TIM_ASM
        
/****************************************************下方为定时器0*****************************************************/
TIM0_INIT:

    ORL AUXR,#80H  ;AUXR
    
    ORL TMOD, #0EH                     //定时器工作模式2 定时器时钟源为外部 定时器开启由外部中断控制开启
    MOV TH0, #0FEH
    MOV TL0, #0FFH
    SETB TR0                         //启动定时器
    SETB ET0                         //启动定时器中断
    SETB EA                         //开总中断
    MOV R2, #40 ;                    //中断计数初始值
    
    RET
    

    
/****************************************************下方为定时器1*****************************************************/
TIM1_INIT:

    ORL AUXR,#80H  ;AUXR
    
    ORL TMOD, #0E0H                     //定时器工作模式2 定时器时钟源为外部 定时器开启由外部中断控制开启
    MOV TH1, #0FEH     //
    MOV TL1, #0FFH
    SETB TR1                         //启动定时器
    SETB ET1                         //启动定时器中断
    SETB EA                         //开总中断
    MOV R2, #40 ;                    //中断计数初始值
    
    RET
   
    
    
    
    
END