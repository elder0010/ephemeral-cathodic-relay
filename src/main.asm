/**
TextWriter

2024 G*P / Distant Future
Code: Elder0010
*/
.import source("macros.asm")
.import source("text_macros.asm")
.import source("variables.asm")
.import source("settings.asm")
.import source("data/commands.asm")

.macro rewind_sample(){
        lda #<sample
        sta sample_addr+1
        lda #>sample
        sta sample_addr+2

        lda #0 
        sta $e84a
        sta $e848
}

*= basic_upstart "Basic upstart"
        :BasicUpstart2()
        sei
        jsr init_routine


        cli 
//------------------------------------------------------------------------------------
//WRITE MAIN THREAD
write_main:
        //inc screen 
can_load_file:
        bit load_file

        lda #0 
        sta MEMMAP
        sta $fff0 
write_next_jmp:
        jmp write_main
        
//------------------------------------------------------------------------------------
//MAIN DRAW ROUTINE
draw_main:
wait_for_draw:  
        lda #DRAWING
        sta draw_state  
 
        lda #WAIT_FOR_FADE
        sta draw_state

waitloop:
!:
can_sample_draw:
        bit sample_loop
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

//Sample routine
sample_loop:
sample_addr:
        lda sample
        sta $e84a 
        sta $e848

//.fill 7,NOP
        .fill 34,NOP
        clc 
        lda sample_addr+1
        adc #1
        sta sample_addr+1
        bcc !+
        inc sample_addr+2
        lda sample_addr+2
        cmp #$7e 
        bne !+
        :sound_off()
        lda #BIT_ABS 
        sta can_sample_draw
!:
sample_jmp:
        rts
       // jmp sample_loop
do_reset:
        lda #0 
        sta $fff0 
        jsr $fd16

.pc = * "IRQ"
.import source "irq.asm"

.pc = * "Functions - General"
.import source "functions.asm"

.pc = * "Functions - Displayer"
.import source "functions_displayer.asm"

.pc = * "Screen address tables"
.import source "data/screen_addresses.asm"

.pc = * "Loader"
.import source "loader.asm"
.import source "data/filenames.asm"

.pc = * "Beep functions"
.import source "beep_functions.asm"

.pc = $2000 "Text"
text_src:
.import source "data/script.asm"
text_end:
.if(text_end-text_src > $1600){
        .print("ERROR! Text is too long!")
}else{
        .print("Text is $"+ toHexString(text_end-text_src) +" bytes long, all good!")
}

.pc = * "Init routine"
.import source("init_routine.asm")

/*

.pc = petscii_start "PETSCII test"
.import source("data/petscii_importer.asm")
.import source("data/petscii/converted/petscii_00.asm")
:process_petscii(petscii_address_list, petscii_values_list)
*/

.pc = $4000 "Event functions"
event_functions_src:
.pseudopc relocated_functions{
        .import source "events.asm"
        .import source "functions_text.asm"	
}

/*
.pc = $2000 "Image buffer area (unusable)"
.fill $1050,$00
*/

//.import source("src/data/image_importer.asm")
//:process_image("src/data/images/img_00.png")

//.pc = sample "Sample"
//.import binary("data/sample_7khz.raw")