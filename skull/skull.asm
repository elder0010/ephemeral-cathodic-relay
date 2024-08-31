/**
Skull test

2022 G*P
Code: Elder0010
*/
.import source "../variables.asm"
.import source "variables.asm"
.import source "data/image_importer.asm"

.macro enable_io(){
        lda $fff0 
        and #%00010000 
        ora #%01100000
        sta $fff0 
}

.macro inc_16bit_addr(address){
        clc 
        lda address+1
        adc #1 
        sta address+1
        bcc !+
        inc address+2
!:
}

.macro set_addr(address, target){
        lda #<address
        sta target+1
        lda #>address 
        sta target+2
}

*= basic_upstart "Basic upstart"
.byte $0e,$04,$0a,$00,$9e,$20,$28,$31,$30,$34,$30,$29,$00,$00,$00
init:
.pc = * "init"
        jsr init_irq 
        jsr clear_screen

        lda #COLOUR_DELAY
        sta delay

        lda #0 
        sta px_cnt_pt
    

wait_for_draw:
        lda #DRAWING
        sta scene_state  
        jsr draw_img

        lda #WAIT_FOR_FADE
        sta scene_state
waitloop:
!:
        lda scene_state
        cmp #WAIT_FOR_FADE
        beq !-

      //  inc screen 

        jsr mask_colours

        lda scene_state
        cmp #DRAWING
        bne !+


        jmp *
        
        jmp wait_for_draw
!:

        lda #WAIT_FOR_FADE
        sta scene_state
        jmp waitloop

      
       
     //   lda #FINISHED 
      //  sta scene_state 

        jmp wait_for_draw 

.pc = * "functions"
.import source("functions.asm")

.pc = * "irq"
.import source("irqs.asm")