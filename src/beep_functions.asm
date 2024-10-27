/*
*
POKE 59467,16 (turn on port for sound output use 0 to turn it off*)
    POKE 59466,octave (octave number, see below)
    POKE 59464,frequency (0 for no sound)

    
         octave=15     octave=51     octave=85
  Note  Oct.0 Oct.1 ! Oct.1 Oct.2 ! Oct.2 Oct.3
  Freq  ------------+-------------+-------------- 
   B     251   125  !  251   125  !  251   125
   C     238   118  !  238   118  !  238   118
   C#    224   110  !  224   110  !  224   110
   D     210   104  !  210   104  !  210   104
   D#    199    99  !  199    99  !  199    99
   E     188    93  !  188    93  !  188    93
   F     177    88  !  177    88  !  177    88
   F#    168    83  !  168    83  !  168    83
   G     158    78  !  158    78  !  158    78
   G#    149    74  !  149    74  !  149    74
   A     140    69  !  140    69  !  140    69
   A#    133    65  !  133    65  !  133    65
*/

beep_0: 

        :sound_on()

beep0pt:
        ldx #0 
        lda beep_0_tbl,x 
        sta $e84a 

beep_note:
        lda #CHARACTER_BEEP_NOTE
        sta $e848 

        inc beep0pt+1 
        lda beep_0_tbl+1,x
        cmp #1
        bne !+

        lda #0 
        sta beep0pt+1
     //   sta $e848 
        sta $e84a
       // :set_addr(stop_beep, beep_fn)
     //   jsr stop_beep
       // lda #CHARACTER_BEEP_NOTE
       // sta beep_note+1
       // :sound_off()
!:
        rts 

stop_beep:
        lda #0 
      //  sta $e848
        sta $e84a
        sta beep0pt+1
       // :sound_off()

        rts

beep_0_tbl:
.byte 15,15,15,15
