write_next_char:
.if(HALF_SPEED_TEXT){
        lda half_speed_delayer
        eor #$ff 
        sta half_speed_delayer
        bne !+
        rts 
!:
}
text_addr:
        lda $ffff 
        beq newline //newline each 0 terminated string

        ldy col_pt
        sta (text_row_zp_addr),y

        lda #0 
.if(ENABLE_CURSOR_BEEP){
        sta can_cursor_beep
}
        sta can_cursor+1

.if(ENABLE_CHARACTER_BEEP){
        lda #CHARACTER_BEEP_NOTE
        sta beep_note+1

        lda #get_octave(CHARACTER_BEEP_OCTAVE)
        sta beep_0_tbl

        :set_addr(beep_0, beep_fn)
        :sound_on()
}
        inc script_col_pt
        inc col_pt

        lda #WHITE_PIXEL
        ldy col_pt
        sta (text_row_zp_addr),y

        lda col_pt
        cmp #COLS
        bne !+

        lda row_pt
        cmp #ROWS
        bne newline
//page finished
        inc page_pt
        jsr reset_cursor
        jsr clear_screen
        jmp move_text_pt
        //:set_addr(stop_beep, beep_fn)
newline:
        :set_addr(stop_beep, beep_fn)
        :sound_off()
        lda #1
        .if(ENABLE_CURSOR_BEEP){
                sta can_cursor_beep
        }
        sta can_cursor+1
        .if(DEFAULT_DELAY_ON_LINEBREAK>0){
                :set_addr(linebreak_delay, write_fn)
                :set_addr(stop_beep, beep_fn)
                lda #1
                sta can_cursor+1
        }else{
                jsr clear_line
        }
!:
//nocursor
move_text_pt:
        :inc_addr(text_addr, 1)

finished_write:
        //lda #0
        //sta force_skip_write_next+1
        rts 

linebreak_delay:
        dec line_dl+1
line_dl:
        lda #1
        bne !+
        :set_addr(write_next_char, write_fn)
        lda #DEFAULT_DELAY_ON_LINEBREAK
        sta line_dl+1
        jsr clear_line
!:
        rts 

clear_line:
        lda #BLACK_PIXEL
        ldy col_pt
        //dey
        sta (text_row_zp_addr),y       
        inc script_row_pt
        inc row_pt
        ldx row_pt
        lda screen_rows_lo,x 
        sta text_row_zp_addr
        lda screen_rows_hi,x
        sta text_row_zp_addr+1
        lda #0
        sta script_col_pt
        lda default_col_val
        sta col_pt
        lda #0 
        sta can_cursor+1
        rts 

.const RELOCATION_OFFSET = commands_sequence_relocated - commands_sequence
handle_events:
cur_com_page:
        lda commands_pages+RELOCATION_OFFSET //should be changed accordingly to the relocation
        cmp page_pt
        beq !+
        jmp noevent
!:
cur_com_line:
        lda commands_lines+RELOCATION_OFFSET
        cmp script_row_pt
        beq !+
        jmp noevent
!:
cur_com_index:
        lda commands_indexes+RELOCATION_OFFSET
        cmp script_col_pt
        beq event
        jmp noevent 
event:
        ldy #0
        lda (command_sequence_pt),y
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
        cmp #EVENT_SETMARGIN
        bne !+
        jsr event_setmargin
        jmp point_next_event
!:
        cmp #EVENT_IMAGE
        bne !+
        jsr event_image
        jmp point_next_event
!:
        cmp #EVENT_LOADNEXT
        bne !+
        jsr event_loadnext
        jmp point_next_event
!:
        cmp #EVENT_LOADSFX
        bne !+
        jsr event_loadnext
        jmp point_next_event
!:
        cmp #EVENT_STRING
        bne !+
        jsr event_string
        jmp point_next_event
!:
.if(ENABLE_BREAKPOINTS){
        cmp #EVENT_BREAKPOINT
        bne !+
        jsr event_breakpoint
        jmp point_next_event
!:
}
        cmp #EVENT_SETCURSORSPEED
        bne !+
        jsr event_setcursorspeed
        jmp point_next_event
!:
        cmp #EVENT_END
        bne noevent
        jsr event_end
!:

point_next_event:
        :inc_addr(cur_com_index, 1)
        :inc_addr(cur_com_line, 1)
        :inc_addr(cur_com_page, 1)
noevent:
        rts

enable_write_mode:
        :set_addr(write_main, draw_next_jmp)
        :set_addr(text_routine, irq_fn)
        :set_addr(write_main, draw_out_jmp)
        :set_addr(write_main, write_next_jmp)
        :set_screen(4)
        .if(CRUNCH_CHARS_ON_IMAGE){
                :set_char_height(8)
        }
        :sound_off()

        //disable sampling 
        lda #BIT_ABS 
        sta can_sample_draw

        lda #JSR_ABS
        sta beep_fn
                
        rts 

enable_draw_mode:
        :rewind_sample()
        :sound_on()

        //Reset procedural beep fx
        .if(PROCEDURAL_BEEP_ACTIVE){
                lda #0 
                sta procedural_beep_sin_pt+1
                lda #JSR_ABS
                sta procedural_beep_fn
        }

        :set_addr(next_op, draw_out_jmp)
        :set_addr(draw_main, write_next_jmp)
        .if(CRUNCH_CHARS_ON_IMAGE){
                :set_addr(hide_crunch_glitch, irq_fn)
        }else{
                :set_addr(image_routine, irq_fn)
                :set_screen(5)
        }
 
        jsr init_displayer
  
        .if(CRUNCH_CHARS_ON_IMAGE){
                :set_char_height(7)
        }
        rts
