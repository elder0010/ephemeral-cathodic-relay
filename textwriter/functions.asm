clear_screen:
        lda #$20 
        ldx #$0 
!:
        sta screen,x 
        sta screen+$100,x 
        sta screen+$200,x
        sta screen+$300,x 
        sta screen+$400,x
        sta screen+$500,x 
        sta screen+$600,x
        sta screen+$700,x 
        dex
        bne !-
        rts


reset_cursor:
        lda #0 
        sta col_pt
        sta row_pt

        :set_addr_zp(screen, text_row_zp_addr)
        rts

write_next_char:

text_addr:
        lda $ffff 
        beq newline //newline each 0 terminated string

        ldy col_pt
        sta (text_row_zp_addr),y

        inc col_pt
        lda col_pt
        cmp #COLS
        bne !+
        //next row
        
        lda row_pt
        cmp #ROWS
        bne newline
//page finished
        inc page_pt
        jsr reset_cursor
        jsr clear_screen
        jmp move_text_pt
newline:
    //.break 
        inc row_pt
        ldx row_pt
        lda screen_rows_lo,x 
        sta text_row_zp_addr
        lda screen_rows_hi,x
        sta text_row_zp_addr+1
        lda #0
        sta col_pt
!:

move_text_pt:
        :inc_addr(text_addr, 1)
        rts 

handle_events:

command_address:
        lda commands_indexes
        cmp col_pt
        bne noevent 
event:

        //handle event
        cmp #EVENT_DELAY
        bne !+
        jsr event_delay
        jmp point_next_event
!:
        cmp #EVENT_PAGE
        bne !+
        jsr event_page
        jmp point_next_event
!:
        cmp #EVENT_SETPOS
        bne !+
        jsr event_setpos
        jmp point_next_event
!:
        cmp #EVENT_IMAGE
        bne !+
        jsr event_image
  //      jmp point_next_event
!:
point_next_event:
        :inc_addr(command_address, 1)
noevent:
        rts



