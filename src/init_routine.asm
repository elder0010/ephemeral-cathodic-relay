init_routine:
        jsr clear_screen
        jsr init_irq

        :lowercase()
        :sound_off()

//relocate text
        lda #RAMEXP_ENABLE
        sta $fff0 

        ldy #0 
        sty page_pt
        sty script_col_pt
        sty script_row_pt
        sty default_col_val
        sty default_row_val
        sty cursor_sw
        sty forced_decay_pt
        sty petscii_pointer
        sty petscii_callback_pt
        sty sample_pt
        sty image_pt
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
        .if(ENABLE_CURSOR_BEEP){
                lda #0
                sta can_cursor_beep
        }
.if(HALF_SPEED_TEXT){
        sta half_speed_delayer
}
        :set_addr(script, text_addr)
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

        lda #0 
        sta $fff0 
        lda #<timer_irq_body
        sta $90 
        lda #>timer_irq_body
        sta $91
        rts