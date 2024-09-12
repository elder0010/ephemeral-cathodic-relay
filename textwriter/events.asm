//--------------------------------------------
//DELAY
event_delay:
e0_init:
        lda #0
        bne !+

        lda #0
        sta delay_tk+1

        ldy #1
        lda (command_sequence_pt),y //skip event byte
        sta delay_val+1

        sty can_cursor+1

        :inc_addr_zp(command_sequence_pt, 2) //skip event byte and delay byte
        
        :disable_function(write_fn)
        :set_addr(event_delay, event_fn)
        inc e0_init+1 //init done
!:
        inc delay_tk+1
delay_tk:
        lda #0
delay_val:
        cmp #0
        bne !+
        //event delay finished
        lda #0
        sta e0_init+1
        sta can_cursor+1
        :enable_function(write_fn)
        :set_addr(handle_events, event_fn)
!:
        rts

//PAGE
event_page:

        inc page_pt
        :inc_addr_zp(command_sequence_pt, 1) //skip event byte and delay byte
        jsr reset_cursor
        jsr clear_screen

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

event_end:
        jsr $fd16
   