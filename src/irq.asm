
.pc = * "IRQ handler"
timer_irq_body:
        lda $e812
      //  inc screen 

        lda #RAMEXP_ENABLE
        sta $fff0 

        :set_addr(stop_beep, beep_fn)

irq_fn:
        jsr text_routine

        lda #RAMEXP_DISABLE
        sta $fff0 

beep_fn:
        jsr stop_beep

petscii_fn:
        bit draw_petscii

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

cursor_res:
        lda #CURSOR_BLINK_SPEED
        sta cursor_ct+1

        lda cursor_sw
        eor #$ff 
        sta cursor_sw
        bne !+
        lda #WHITE_PIXEL
        .if(ENABLE_CURSOR_BEEP){
                cmp #WHITE_PIXEL
                bne noblink
                
                        pha 

                        lda can_cursor_beep
                        beq beeper_busy
                        lda #CURSOR_BEEP_NOTE
                        sta beep_note+1

                        lda #get_octave(CURSOR_BEEP_OCTAVE)
                        sta beep_0_tbl

                        :set_addr(beep_0, beep_fn)
                        :sound_on()
                        beeper_busy:
                        pla 
                noblink:
        }
        
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