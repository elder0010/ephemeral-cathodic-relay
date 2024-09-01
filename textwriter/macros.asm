.macro enable_io(){
        lda $fff0 
        and #%00010000 
        ora #%01100000
        sta $fff0 
}

.macro BasicUpstart2(){
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