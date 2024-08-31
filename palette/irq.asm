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

.pc = * "can go irq"
can_go_irq:
        lda #0
        bne !+
        jmp end_irq
!:

        lda #0 
        sta square_ct
loop_x:
        ldx square_ct
        lda square_delays,x 
        cmp delay_values,x 
        bne !+

       // lda #0 
     //   sta square_delays,x 

    
        ldy #10
        lda #BLACK_PIXEL
        jsr draw_square

        inc erased_sq

        ldx square_ct
!:
        inc square_delays,x 
        inc square_ct
        lda square_ct
        cmp #20 
        bne loop_x

     
end_irq:
        lda $e812

        lda erased_sq
        cmp #20 
        bne !+

        jsr wait_for_restart
!:
        inc screen

        lda erased_sq
        sta screen+1
        //stx $fff0 
        pla 
        tay 
        pla 
        tax 
        pla
        rti 

wait_for_restart:
        lda #0

        inc wait_for_restart+1
        lda wait_for_restart+1
        cmp #$a0
        bne !+
        jsr restart 
!:
        rts 


restart:
        lda #0 
        sta erased_sq
        sta wait_for_restart+1

        lda #0 
        ldy #20
rsd: 
        sta square_delays,y 
        dey
        bpl rsd
    
        inc must_draw+1

        rts 
