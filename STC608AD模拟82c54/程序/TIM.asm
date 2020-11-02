
    PUBLIC    TIM0_INIT, TIM_0

    AUXR    DATA    08EH
        
    ORG 000BH                        //以下程序存储位置
    LJMP TIM_0
    
    _TIM_ASM  SEGMENT  CODE            //动态分配代码位置
    RSEG  _TIM_ASM
    
    LED     BIT     P2.4                     //定义LED的引脚    
        
TIM0_INIT:

    ORL AUXR,#80H  ;AUXR
    
    ORL TMOD, #0EH                     //定时器工作模式2 定时器时钟源为外部 定时器开启由外部中断控制开启
    MOV TH0, #0FEH     //
    MOV TL0, #0FFH
    SETB TR0                         //启动定时器
    SETB ET0                         //启动定时器中断
    SETB EA                         //开总中断
    MOV R2, #40 ;                    //中断计数初始值
    
    RET
    
TIM_0:
    CLR  TR0
    SETB TR0
;    DJNZ R2,  T0E                     //R2减到0重新赋值，否则退出
;    MOV  R2,  #40
    CPL  LED                         //LED亮灭转换
    T0E:
    
    RETI
    
    
    
    
    
END