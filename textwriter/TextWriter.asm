/**
TextWriter

2024 G*P / Distant Future
Code: Elder0010
*/

.import source("macros.asm")
.import source("text_macros.asm")
.import source("variables.asm")
.import source("scene_settings.asm")
.import source("data/commands.asm")
.import source "data/image_importer.asm"

*= basic_upstart "Basic upstart"
        :BasicUpstart2()

        sei
        jsr clear_screen

        lda #0
        sta page_pt
        sta script_col_pt
        sta script_row_pt
        sta default_col_val
        sta default_row_val
        sta cursor_sw

        :set_addr(script, text_addr)
        
        :set_addr_zp(commands_sequence, command_sequence_pt)

        jsr reset_cursor

        jsr init_irq

//------------------------------------------------------------------------------------
//WRITE MAIN THREAD
write_main:

write_next_jmp:
        jmp write_main
        
//------------------------------------------------------------------------------------
//MAIN DRAW ROUTINE
draw_main:
wait_for_draw:
        lda #DRAWING
        sta draw_state  
        jsr draw_img

        lda #WAIT_FOR_FADE
        sta draw_state

waitloop:
!:
        lda draw_state
        cmp #WAIT_FOR_FADE
        beq !-

        jsr mask_colours

        lda draw_state
        cmp #DRAWING
        bne !+
        jmp wait_for_draw
!:
        lda #WAIT_FOR_FADE
        sta draw_state
        jmp waitloop
draw_next_jmp:
        jmp wait_for_draw 


.pc = * "IRQ"
.import source "irq.asm"

.pc = * "Functions - Text Writer"
.import source "functions.asm"

.pc = * "Functions - Displayer"
.import source "functions_displayer.asm"

.pc = * "Event functions"
.import source "events.asm"

.pc = * "Text"
script:
.import source "data/script.asm"

.pc = * "Screen address tables"
.import source "data/screen_addresses.asm"