init_irq:      
        lda #$0 
        sta $e811
        sta $e821
        sta $e823
        sta $e84e

        lda #%10111101
        sta $e813

        lda #<timer_irq 
        sta $fffe 

        lda #>timer_irq 
        sta $ffff 
        

        lda #0 
        sta $fff0 
        lda #<timer_irq_body
        sta $90 
        lda #>timer_irq_body
        sta $91
        rts

/*
kernal_irq_handler:

         pha 
         txa 
         tya 
         pha 
         
         jmp timer_irq_body
 PHA
.C:e443  8A          TXA
.C:e444  48          PHA
.C:e445  98          TYA
.C:e446  48          PHA
.C:e447  BA          TSX
.C:e448  BD 04 01    LDA $0104,X
.C:e44b  29 10       AND #$10
.C:e44d  F0 03       BEQ $E452
.C:e44f  6C 92 00    JMP ($0092)
*/
.pc = * "IRQ handler"
timer_irq:
 .break 
        lda #0 
        sta $fff0 
 .break       
        jmp $e442 

timer_irq_body:
        lda $e812
        inc screen 
       // inc $E84A
        lda #RAMEXP_ENABLE
        sta $fff0 
        /*
               ldx #0
!: 
        lda ram_area, x
        sta screen,x 

        lda ram_area_2, x
        sta screen+$100,x 
        dex 
        bne !-

*/
irq_fn:
        jsr text_routine

        lda #RAMEXP_DISABLE
        sta $fff0 
        pla 
        tay 
        pla 
        tax 
        pla
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