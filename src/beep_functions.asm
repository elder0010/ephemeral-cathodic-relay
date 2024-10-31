beep_0: 
beep0pt:
        ldx #0 
        lda beep_0_tbl,x 
        sta $e84a 

beep_note:
        lda #CHARACTER_BEEP_NOTE
        sta $e848 

        inc beep0pt+1 
        lda beep0pt+1,x
        cmp #4
        bne !+
        lda #get_octave(2)
        sta $e84a

        lda #$0
        sta $e848 
        sta beep0pt+1
        sta $e84b
        :set_addr(stop_beep, beep_fn)
!:
        rts 

stop_beep: 
        :sound_off()
        sta beep0pt+1
        rts

beep_0_tbl:
.byte 15,15,15,15

.pc = * "Procedural sound"
procedural_beep:
        //:sound_on()
        ldx note_octave_pt
        lda graph_octave,x 
        sta $e84a
        lda graph_note,x
        sta $e848

        ldx gate_pt
        lda graph_gate,x
        sta $e84b

        inc gate_pt
        bne !+
        :sound_off()
        lda #BIT_ABS
        sta procedural_beep_fn
!:
        rts 

