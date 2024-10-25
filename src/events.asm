//--------------------------------------------
//DELAY
event_delay:
e0_init:
        lda #0
        bne !+
        ldy #1
        sty delay_must_hi+1

       // sty can_cursor_beep
        .if(ENABLE_CURSOR_BEEP){
                lda #1 
                sta can_cursor_beep
        }

        lda (command_sequence_pt),y //load delay value (lo)
        sta delay_lo_val+1
        //if delay is 0, skip the delay lo counter
        bne bit_lo
        lda #BIT_ABS  
        sta delay_must_lo+1
        jmp no_bit_lo
bit_lo:
        lda #JMP_ABS 
        sta delay_must_lo+1
no_bit_lo:
        sty can_cursor+1 
        sty e0_init+1 //init done

        ldy #2
        lda (command_sequence_pt),y //load delay value (hi)
        sta delay_hi_val+1
        bne allow_hidelay
//disallow hi delay
        dec delay_must_hi+1
allow_hidelay:
        :inc_addr_zp(command_sequence_pt, 3) //skip event byte and delay byte
        :disable_function(write_fn)
        :set_addr(event_delay, event_fn)
!:
        //processing HI byte
delay_must_hi:
        lda #0
        beq delay_must_lo

delay_hi_count:
        dec delay_hi_tk+1
delay_hi_tk:    //count to 255
        lda #0 
        bne !+
        //check how many times we have to count to 255
        dec delay_hi_val+1
delay_hi_val:
        lda #0
        bne !+
        //now start processing LO byte
        lda #0
        sta delay_must_hi+1
!:
        jmp end_delay_rt
        //processing LO byte
delay_must_lo:
        bit delay_finished //will JMP if delay lo is 0
        dec delay_lo_val+1
delay_lo_val:
        lda #0
        bne !+
delay_finished:
        //event delay finished
        lda #0
        sta e0_init+1
        sta can_cursor+1
        :enable_function(write_fn)
        :set_addr(handle_events, event_fn)
!:
end_delay_rt:
        rts

//PAGE
event_page:
        inc page_pt
        :inc_addr_zp(command_sequence_pt, 1) //skip event byte and delay byte

        .if(RESET_CURSOR_TO_DEFAULT_ON_PAGEBREAK){
                lda #DEFAULT_CURSOR_X
                sta default_col_val
                lda #DEFAULT_CURSOR_Y
                sta default_row_val
        }
        :set_addr(stop_beep, beep_fn)
        jsr reset_cursor
        jsr clear_screen

        .if(ENABLE_NEWPAGE_BEEP){
                lda #NEWPAGE_BEEP_NOTE
                sta beep_note+1

                lda #get_octave(NEWPAGE_BEEP_OCTAVE)
                sta beep_0_tbl

                :set_addr(beep_0, beep_fn)
        }

        dec row_pt
       // dec script_row_pt

        lda #0
        sta script_col_pt

        lda #$ff 
        sta script_row_pt
        //lda #1 
        //sta force_skip_write_next+1
        rts

//SETPOS
event_setpos:
        lda #BLACK_PIXEL
        ldy col_pt
        sta (text_row_zp_addr),y

        ldy #1
        lda (command_sequence_pt),y 
        sta row_pt
        iny 
        lda (command_sequence_pt),y 
        sta col_pt
        
        ldx row_pt
        lda screen_rows_lo,x 
        sta text_row_zp_addr
        lda screen_rows_hi,x
        sta text_row_zp_addr+1

        :inc_addr_zp(command_sequence_pt, 3) //skip event byte and delay byte
        rts

//SETMARGIN
event_setmargin:
        ldy #1
        lda (command_sequence_pt),y 
        sta default_row_val
        iny 
        lda (command_sequence_pt),y 
        sta default_col_val

        lda #BLACK_PIXEL
        ldy col_pt
        //dey
        sta (text_row_zp_addr),y    

        jsr reset_cursor

        :inc_addr_zp(command_sequence_pt, 3) //skip event byte and delay byte
        rts

//IMAGE
event_image:
        ldy #1
        lda (command_sequence_pt),y
        sta hold_time_lo
        iny
        lda (command_sequence_pt),y
        sta hold_time_hi
        
        :inc_addr_zp(command_sequence_pt, 3) //skip event byte and delay byte
        
        jsr clear_screen
        jsr enable_draw_mode
        rts

//LOADNEXT
event_loadnext:
        lda #1 
        sta must_init_image+1

        lda #$20 //jsr 
        sta can_load_file

        :inc_addr_zp(command_sequence_pt, 1) //skip event byte
        rts 

//LOADSFX
event_loadsfx:
        lda #0
        sta must_init_image+1

        inc screen+2

        lda #$20 //jsr 
        sta can_load_file

        :inc_addr_zp(command_sequence_pt, 1) //skip event byte
        rts

//STRING
event_string:
        ldy #1
        lda (command_sequence_pt),y //load string length
        sta string_len+1
        :inc_addr_zp(command_sequence_pt, 2) //skip event byte
        
        lda text_addr+1 
        sta string_addr+1
        lda text_addr+2
        sta string_addr+2
 
        ldy col_pt
        ldx #0
string_addr:
        lda $ffff,x 
        sta (text_row_zp_addr),y
        inc script_col_pt
        inc col_pt
        iny 
        inx 
string_len:
        cpx #$ff
        bne string_addr
        sty col_pt 
        stx textofs+1

        clc 
        lda text_addr+1
textofs:
        adc #0
        sta text_addr+1
        bcc !+
        inc text_addr+2
!:

        .if(ENABLE_CHARACTER_BEEP){
        lda #CHARACTER_BEEP_NOTE
        sta beep_note+1

        lda #get_octave(CHARACTER_BEEP_OCTAVE)
        sta beep_0_tbl

        :set_addr(beep_0, beep_fn)
        :sound_on()
}
        rts

//END
event_end:
        lda #0 
        sta $fff0 
        jsr $fd16
