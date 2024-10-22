init_irq:
       // sei     

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

        lda #<timer_irq_hiram
       // sta $fffa 
        sta $fffe 
        lda #>timer_irq 
        sta $91 
     //   sta $fffb

        lda #>timer_irq_hiram
        sta $ffff

        lda #<boccio 
        sta $fffa 
        sta $94 

        lda #>boccio
        sta $fffb
        sta $95
      
        rts

boccio:
.break 
        rti 

timer_irq_hiram:
        sta r_zp_1
        sty r_zp_2 
        stx r_zp_3
.break
        :set_addr(hiram_exit, irq_exit_jmp)
timer_irq:
        lda #0
        sta $fff0 
.break
     // lda MEMMAP
       // sta $fff0 



       // inc $E84A
irq_fn:
        jsr text_routine
      

   
        lda $e812

  //      lda MEMMAP
//        sta $fff0 

irq_exit_jmp:
        jmp kernal_exit

kernal_exit:
        pla 
        tay 
        pla 
        tax 
        pla
        rti 
hiram_exit:
        :set_addr(kernal_exit, irq_exit_jmp)
        lda r_zp_1
        ldy r_zp_2
        ldx r_zp_3
        rti 

text_routine:
event_fn:
        jsr handle_events

skip_write:
        lda #1
        beq !+
write_fn:
        jsr write_next_char
!:
        lda #1
        sta skip_write+1

        //handle cursor
can_cursor:
        lda #0
        beq nocrsupdate
        ldy col_pt 
        //iny
cursor_c:
        lda #BLACK_PIXEL
        sta (text_row_zp_addr),y

        dec cursor_ct+1
cursor_ct:
        lda #CURSOR_BLINK_SPEED
        bne nocrsupdate

        lda #CURSOR_BLINK_SPEED
        sta cursor_ct+1

        lda cursor_sw
        eor #$ff 
        sta cursor_sw
        bne !+
        lda #WHITE_PIXEL
        jmp stc
!:
        lda #BLACK_PIXEL
stc:
        sta cursor_c+1
        rts 
        //jmp irqack
nocrsupdate:
        rts 

image_routine:
        lda draw_state
        cmp #DRAWING
        bne !+
//drawing
        jmp exit
!:
        cmp #WAIT_FOR_FADE
        bne !+
        dec delay 
        bne exit
        lda #COLOUR_DELAY
        sta delay 

        lda #FADING
        sta draw_state 
        jmp exit
!:
exit:
        rts


//hides the crt shake in the frames after the crunch
hide_crunch_glitch:
.if(CRUNCH_CHARS_ON_IMAGE){
        dec crtk+1
crtk:
        lda #CRUNCH_HIDE_TIME
        bne !+
        lda #CRUNCH_HIDE_TIME
        sta crtk+1
        :set_screen(5)
        :set_addr(image_routine, irq_fn)
!:
        rts 
}