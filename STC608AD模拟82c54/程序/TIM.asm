
    PUBLIC    TIM0_INIT, TIM_0

    AUXR    DATA    08EH
        
    ORG 000BH                        //���³���洢λ��
    LJMP TIM_0
    
    _TIM_ASM  SEGMENT  CODE            //��̬�������λ��
    RSEG  _TIM_ASM
    
    LED     BIT     P2.4                     //����LED������    
        
TIM0_INIT:

    ORL AUXR,#80H  ;AUXR
    
    ORL TMOD, #0EH                     //��ʱ������ģʽ2 ��ʱ��ʱ��ԴΪ�ⲿ ��ʱ���������ⲿ�жϿ��ƿ���
    MOV TH0, #0FEH     //
    MOV TL0, #0FFH
    SETB TR0                         //������ʱ��
    SETB ET0                         //������ʱ���ж�
    SETB EA                         //�����ж�
    MOV R2, #40 ;                    //�жϼ�����ʼֵ
    
    RET
    
TIM_0:
    CLR  TR0
    SETB TR0
;    DJNZ R2,  T0E                     //R2����0���¸�ֵ�������˳�
;    MOV  R2,  #40
    CPL  LED                         //LED����ת��
    T0E:
    
    RETI
    
    
    
    
    
END