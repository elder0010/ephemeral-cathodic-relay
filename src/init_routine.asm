init_routine:
        jsr clear_screen
        jsr init_irq
    
        :sound_on()

//relocate text
        lda #RAMEXP_ENABLE
        sta $fff0 

        ldy #0 
copytxt:
        ldx #0 
!:

srctxt:
        lda text_src,x 
dsttxt:
        sta script,x

        dex 
        bne !-
        inc srctxt+2
        inc dsttxt+2
        iny
        cpy #34
        bne copytxt

//relocate commands
        ldy #0 
copycmd:
        ldx #0 
!:
srccmd:
        lda commands_sequence,x 
dstcmd:       
        sta commands_sequence_relocated,x
        dex 
        bne !-

        inc srccmd+2
        inc dstcmd+2

        iny
        cpy #18
        bne copycmd

//relocate functions
        ldy #0 
copyfnc:
        ldx #0 
srcfnc:
        lda event_functions_src,x 
dstfnc:
        sta relocated_functions,x 
        dex 
        bne srcfnc
        inc srcfnc+2
        inc dstfnc+2
        iny
        cpy #8
        bne copyfnc

        lda #0
        sta page_pt
        sta script_col_pt
        sta script_row_pt
        sta default_col_val
        sta default_row_val
        sta cursor_sw
        .if(ENABLE_CURSOR_BEEP){
                lda #0
                sta can_cursor_beep
        }
.if(HALF_SPEED_TEXT){
        sta half_speed_delayer
}
        :set_addr(script, text_addr)
        
        //:set_addr_zp(commands_sequence, command_sequence_pt)
        :set_addr_zp(commands_sequence_relocated, command_sequence_pt)

        lda #RAMEXP_DISABLE
        sta $fff0 

        jsr reset_cursor
        rts

init_irq:      
        lda #$0 
        sta $e811
        sta $e821
        sta $e823
        sta $e84e

        lda #%10111101
        sta $e813

        //lda #<timer_irq 
        //sta $fffe 

        //lda #>timer_irq 
        //sta $ffff 
        
        lda #0 
        sta $fff0 
        lda #<timer_irq_body
        sta $90 
        lda #>timer_irq_body
        sta $91
        rts