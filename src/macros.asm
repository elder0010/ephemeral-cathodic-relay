.macro BasicUpstartPET(){
        .byte $0e,$04,$0a,$00,$9e,$20,$28,$31,$30,$34,$30,$29,$00,$00,$00
}

.macro set_addr(val, addr)
{
    lda #<val
    sta addr+1
    lda #>val
    sta addr+2
}

.macro set_addr_zp(val, addr)
{
    lda #<val
    sta addr
    lda #>val
    sta addr+1
}

.macro inc_addr(address, increment)
{
    lda address+1
    clc
    adc #increment
    sta address+1
    bcc !+
    inc address+2
!:
}

.macro inc_addr_zp(address, increment)
{
    lda address
    clc
    adc #increment
    sta address
    bcc !+
    inc address+1
!:
}

.macro disable_function(address)
{
    lda #$2c 
    sta address
}

.macro enable_function(address)
{
    lda #$20
    sta address
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

.macro inc_16bit_addr_zp(address, amount){
        clc 
        lda address
        adc #amount
        sta address
        bcc !+
        inc address+1
!:
}

.macro set_screen(screen_nr){
        lda #12
        sta $e880
        lda #screen_nr*4
        sta $e881
}

.macro set_char_height(height){
        lda #9
        sta $e880
        lda #height
        sta $e881               
}

.macro wait_frame(){
    !:
        lda VIA_PORT_B
        and #$20 
        bne !-

!:
        lda VIA_PORT_B
        and #$20 
        beq !-
}

.macro enable_io(){
        lda $fff0 
        and #%00010000 
        ora #%01100000
        sta $fff0 
}

.macro disable_expansion(){
        lda $fff0 
        and #%01111111 
        sta $fff0 
}

.macro enable_expansion(){
        lda $fff0 
        ora #%10000000
        sta $fff0 
}

//Control Register Bit 6 - When equal to 1, I/O peek through is enabled.
.macro enable_io_peek(){
        lda $fff0 
        ora #%01000000
        sta $fff0 
}

//Control Register Bit 6 - When equal to 0, I/O peek through is disabled.
.macro disable_io_peek(){
        lda $fff0 
        and #%10111111 
        sta $fff0 
}

//Control Register Bit 5 - When equal to 1, screen peek through is enabled.
.macro enable_screen(){
        lda $fff0 
        ora #%00100000
        sta $fff0 
}

//Control Register Bit 5 - When equal to 0, screen peek through is disabled.
.macro disable_screen(){
        lda $fff0 
        and #%11011111 
        sta $fff0 
}


/*
Control Register Bit 2 - When equal to 1, block 1 (16k-byte) is selected.
When equal to 0, block 0 (16k-byte) is selected.
*/
.macro select_block_0(){
        lda $fff0 
        and #%11111011
        sta $fff0 
}
.macro select_block_1(){
        lda $fff0 
        ora #%00000100
        sta $fff0 
}

/*
Control Register Bit 3 - When equal to 1, block 3 (16k-byte) is selected.
When equal to 0, block 2 (16k-byte) is selected.
*/
.macro select_block_3(){
        lda $fff0 
        and #%11110111
        sta $fff0 
}
.macro select_block_2(){
        lda $fff0 
        ora #%00001000
        sta $fff0 
}

.macro disable_write_protect(){
        lda $fff0 
        and #%11111100 
        sta $fff0 
}

//
//Address $E84B will turn the sound on or off... we write #16 to turn it on, #0 to turn it off.
//Address $E84A can be used to select the Octave with value 15/51/85
//Address $E848 can be used to select the note, a value of 64-255 should be passed.
.macro sound_on(){
        lda #16 
        sta $e84b 
}

.macro sound_off(){
        lda #0 
        sta $e84b 
}

.function get_octave(octave){
     .var octave_list = List().add(15,51,85)
     .return octave_list.get(octave)
}

.macro uppercase(){
        lda #12
        sta $e84c
}

.macro lowercase(){
        lda #14 
        sta $e84c
}

