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
//.import source "data/image_importer.asm"
.import source "data/filenames.asm"

*= basic_upstart "Basic upstart"
        :BasicUpstart2()

        sei



/*
        lax #0
!: 
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
        :set_screen(1)
bk:

        inc screen_image
        jmp bk 
*/

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
        //inc screen 
can_load_file:
        bit load_file

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
        //inc screen+3
draw_out_jmp:
        jmp next_op 
next_op:

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

wl0:
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

.pc = * "Loader"
.import source "loader.asm"

.pc = $2000 "Image buffer area (unusable)"
//.import source("src/data/image_importer.asm")
//:process_image("src/data/images/img_00.png")
.fill $1421,$00

.pc = * "Unrolled draw functions"
.import source "draw_image_routine.asm"