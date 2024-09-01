//--------------------------------------------
//DELAY
event_delay:
e0_init:
        lda #0
        bne !+

        lda #0
        sta delay_tk+1

        ldy #1
        lda (event_address_zp),y //skip event byte
        sta delay_val+1

        :inc_addr_zp(event_address_zp, 2) //skip event byte and delay byte
        
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
        inc page_index_pt
        :inc_addr_zp(event_address_zp, 1) //skip event byte and delay byte
        jsr reset_cursor
        jsr clear_screen
        rts

//SETPOS
event_setpos:
        ldy #1
        lda (event_address_zp),y 
        sta row_pt
        iny 
        lda (event_address_zp),y 
        sta col_pt

        :inc_addr_zp(event_address_zp, 3) //skip event byte and delay byte
        rts

//IMAGE
event_image:
        rts