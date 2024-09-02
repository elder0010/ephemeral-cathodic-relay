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
        //lda #1 
        //sta force_skip_write_next+1
        rts

//SETPOS
event_setpos:
        ldy #1
        lda (command_sequence_pt),y 
        sta row_pt
        iny 
        lda (command_sequence_pt),y 
        sta col_pt

        :inc_addr_zp(command_sequence_pt, 3) //skip event byte and delay byte
        rts

//IMAGE
event_image:
        rts