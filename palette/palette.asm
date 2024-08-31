/**
Fade test

2022 G*P
Code: Elder0010
*/
.import source "../variables.asm"

.macro enable_io(){
        lda $fff0 
        and #%00010000 
        ora #%01100000
        sta $fff0 
}
*= basic_upstart "Basic upstart"
.byte $0e,$04,$0a,$00,$9e,$20,$28,$31,$30,$34,$30,$29,$00,$00,$00
init:
.pc = * "init"
        jsr clear_screen
        sei 

        lda #0 
        sta erased_sq

        //set uppercase
        lda #$c
        sta $e84c 

        jsr init_irq

x_loop:
        ldx #0 
        ldy #10
        lda #WHITE_PIXEL
        jsr draw_square

        inc x_loop+1
        lda x_loop+1
        cmp #20
        bne x_loop
        
        lda #0 
        sta x_loop+1

        lda #1 
        sta can_go_irq+1
        
must_draw:
!:
        lda #0 
        beq !-

        lda #0 
        sta must_draw+1
        jmp x_loop

    

        jmp *

.pc = * "Functions"
.import source "functions.asm"

.pc = * "Irq"
.import source "irq.asm"

.pc = * "Screen cohordinates"
.import source "data/screen_cohords.asm"

.pc = * "Delay times"
.import source "data/delay_times.asm"

.pc = * "Image parser"
.import source "data/image_parser.asm"


.pc = * "delay times"
delay_times:
.for(var x=0;x<delay_list.size();x++){
    .byte delay_list.get(x)
}
//.print(delay_list.size())