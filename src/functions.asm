clear_screen:
        lda #$20 

        lda #BLACK_PIXEL
        ldx #$0 
!:
txa
        and #$f
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

        lda #$e0


        lda #BLACK_PIXEL
        ldx #$0 
!:
        txa
        and #$f
        sta screen_image,x 
        sta screen_image+$100,x 
        sta screen_image+$200,x
        sta screen_image+$300,x 
        sta screen_image+$400,x
        sta screen_image+$500,x 
        sta screen_image+$600,x
        sta screen_image+$700,x 
        dex
        bne !-

bk:
:set_screen(1)
:set_char_height(7)
ldy #$50
!: 
dey 
bpl !-
:set_screen(0)
:set_screen(8)
ldy #$50
!: 
dey 
bpl !-

jmp bk
//:set_char_height(7)
 
jmp *

//:set_screen(1)
/*

        lda #9
        sta $e880
        lda #7
        sta $e881               //; charline height to 8 rasterlines

sei 


jmp * 
*/


        rts

reset_cursor:
        lda default_col_val
        sta col_pt

        lda default_row_val
        sta row_pt

        ldx row_pt
        lda screen_rows_lo,x 
        sta text_row_zp_addr
        lda screen_rows_hi,x
        sta text_row_zp_addr+1
        rts

write_next_char:
/*
//#PAGE# change this to skip write on page change
force_skip_write_next:
        lda #0 
        beq !+
        //.break

        lda #0 
        sta skip_write+1
        jmp finished_write
!: 
*/
text_addr:
        lda $ffff 
        beq newline //newline each 0 terminated string

        ldy col_pt
        sta (text_row_zp_addr),y

        inc script_col_pt
        inc col_pt

        lda #WHITE_PIXEL
        ldy col_pt
        sta (text_row_zp_addr),y

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

       lda #BLACK_PIXEL
        ldy col_pt

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
       // jmp nocursor
!:
        
//nocursor

move_text_pt:
        :inc_addr(text_addr, 1)

finished_write:
        //lda #0
        //sta force_skip_write_next+1
        rts 

handle_events:
//.break
cur_com_page:
        lda commands_pages
        cmp page_pt
        bne noevent
cur_com_line:
        lda commands_lines 
        cmp script_row_pt
        bne noevent 
cur_com_index:
        lda commands_indexes
        cmp script_col_pt
        bne noevent 
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

        cmp #EVENT_END
        bne noevent
        jsr event_end
!:
  //      jmp point_next_event

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
        
      //  jsr event_page
        rts 

enable_draw_mode:
        :set_addr(next_op, draw_out_jmp)
        :set_addr(draw_main, write_next_jmp)
        :set_addr(image_routine, irq_fn)
        jsr init_displayer
        rts