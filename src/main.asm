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
.import source "data/filenames.asm"

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

        lda #%10000000

        lda #$e8 
        sta MEMMAP

        jsr clear_screen
        jsr init_irq

 
      //  cli 



        

        :sound_on()

        /*
//copy kernal rom 
        ldy #0 

copy0:
        ldx #0
!:


src0:
        lda $f000,x 
dst0:
        sta $2000,x 

        
        dex 
        bne !-
        inc src0+2
        inc dst0+2
        iny 
        cpy #$10 
        bne copy0

lda #%100100000

//lda #%10000000
sta $fff0 
sta MEMMAP

//now copy again 
        ldy #0 

copy1:
        ldx #0
!:
src1:
        lda $2000,x 
dst1:
        sta $f000,x 
        dex 
        bne !-
        inc src1+2
        inc dst1+2
        iny 
        cpy #$10 
        bne copy1

        lda #%011000000

//lda #%10000000
sta $fff0 
sta MEMMAP
*/



//lda #%01100000
//sta $fff0 

.const ram_area = $a000
.const ram_area_2 = $fb00 
        lda #11100100
        sta $fff0 

        ldx #0
!: 
        lda #1 
        sta ram_area  ,x

        lda #2
        sta ram_area_2,x
        dex 
        bne !- 


        ldy #%11100100
        sty $fff0 

            lda #<timer_irq 
        sta $fffe 

        lda #>timer_irq 
        sta $ffff 

        ldx #0
!: 
        lda ram_area, x
        sta screen,x 

        lda ram_area_2, x
        sta screen+$100,x 
        dex 
        bne !-

       jmp *
      // lda #$80 
       sty $fff0 
       sty MEMMAP




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

           cli 

/*
mloop:

lda #$80 
sta $fff0 

lda $a000 
sta screen+1

lda #00 
sta $fff0 
lda $a000 
sta screen+2
inc $a000 


jmp mloop
*/
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
        //jsr draw_img
        lda #WAIT_FOR_FADE
        sta draw_state
             
waitloop:
!:
can_sample_draw:
        bit sample_loop
       //.break
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


//Sample routine
sample_loop:
//sei 
       //lda #$e8
     //  sta $fff0 
       //sta MEMMAP
     //  .break

       ldy #%11100100
        sty $fff0 
sample_addr:
        lda sample

       
        sta $e84a 

        
        sta $e848

        .fill 6,NOP
        clc 
        lda sample_addr+1
        adc #1
        sta sample_addr+1
        bcc !+
        inc sample_addr+2
!:

sample_jmp:
                 
  

       // lda MEMMAP
     //   sta $fff0
//cli 
        rts
       // jmp sample_loop

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

.pc = * "Text"
script:
.import source "data/script.asm"



.pc = $2000 "Image buffer area (unusable)"
//.fill $1421,$00
//.import source("src/data/image_importer.asm")
//:process_image("src/data/images/img_00.png")



