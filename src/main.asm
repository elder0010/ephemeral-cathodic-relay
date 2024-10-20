/**
TextWriter

2024 G*P / Distant Future
Code: Elder0010
*/


//Address $E84B will turn the sound on or off... we write #16 to turn it on, #0 to turn it off.
//Address $E84A can be used to select the Octave with value 15/51/85
//Address $E848 can be used to select the note, a value of 64-255 should be passed.


.import source("macros.asm")
.import source("text_macros.asm")
.import source("variables.asm")
.import source("settings.asm")
.import source("data/commands.asm")
.import source "data/filenames.asm"

*= basic_upstart "Basic upstart"
        :BasicUpstart2()
        sei
        jsr clear_screen

        lda #16 
        sta $e84b 

        lda #50 
        sta $E848
        lda #15 
        sta $e84a
 //inc $E84A
//bk:
       
  //      inc $E848 
    //    jmp bk 

        lda #0
        sta page_pt
        sta script_col_pt
        sta script_row_pt
        sta default_col_val
        sta default_row_val
        sta cursor_sw
.if(HALF_SPEED_TEXT){
        sta half_speed_delayer
}
        :set_addr(script, text_addr)
        
        :set_addr_zp(commands_sequence, command_sequence_pt)

        jsr reset_cursor

        jsr init_irq

//------------------------------------------------------------------------------------
//WRITE MAIN THREAD
write_main:


nxx:
     

     
samplel:
        lda sound_sin
        sta $e84a 

        .fill 16,NOP
        clc 
        lda samplel+1
        adc #1
        sta samplel+1
        bcc !+
        inc samplel+2
!:
        jmp nxx


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
        //jsr draw_img

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

.pc = * "Screen address tables"
.import source "data/screen_addresses.asm"

.pc = * "Loader"
.import source "loader.asm"

.pc = $2000 "Image buffer area (unusable)"
//.import source("src/data/image_importer.asm")
//:process_image("src/data/images/img_00.png")


/*
.pc = * "Unrolled draw functions"
.import source "draw_image_routine.asm"
*/
.pc = * "Text"
script:
.import source "data/script.asm"


.var sound = List().add(
   38,38,39,40,41,41,42,43,44,44,45,46,46,47,48,49,49,50,50,51,52,52,53,54,54,55,55,56,56,57,57,58,58,59,59,59,60,60,61,61,61,62,62,62,62,63,63,63,63,63,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,63,63,63,63,63,62,62,62,62,61,61,61,60,60,59,59,59,58,58,57,57,56,56,55,55,54,53,53,52,52,51,50,50,49,48,48,47,46,46,45,44,43,43,42,41,40,40,39,38,37,37,36,35,34,33,33,32,31,30,30,29,28,27,26,26,25,24,23,23,22,21,20,20,19,18,18,17,16,15,15,14,14,13,12,12,11,10,10,9,9,8,8,7,7,6,6,5,5,5,4,4,3,3,3,2,2,2,2,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,2,2,2,2,3,3,3,4,4,5,5,5,6,6,7,7,8,8,9,9,10,11,11,12,12,13,14,14,15,16,16,17,18,18,19,20,21,21,22,23,24,24,25,26,27,27,28,29,30,31,31,32,33,34,34,35,36,37
)
sound_sin:
/*
.for(var x=0;x<sound.size();x++){
        .byte sound.get(x)
}
*/
.import binary("data/sample_7khz.raw")

