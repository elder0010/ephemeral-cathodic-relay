init_irq:
        sei     

        lda $fff0 
        and #%00010000 
        ora #%01100000
        sta $fff0 


        lda #$0 
        sta $e811
        sta $e821
        sta $e823
        sta $e84e

        lda #%10111101
        sta $e813

  
        lda #<timer_irq 
        sta $90
        lda #>timer_irq 
        sta $91 

        cli 
        rts

timer_irq:
       // ldx $fff0 
        lda $fff0 
        and #%00010000 
        ora #%01100000
        sta $fff0 

        jsr write_next_char

irqack:
        lda $e812

        pla 
        tay 
        pla 
        tax 
        pla
        rti 

