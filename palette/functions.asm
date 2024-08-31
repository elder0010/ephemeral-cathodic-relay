clear_screen:
        lda #$20 
        ldx #$0 
!:
        sta screen,x 
        sta screen+$100,x 
        sta screen+$200,x
        sta screen+$300,x 
        sta screen+$400,x
        sta screen+$500,x 
        sta screen+$600,x
        sta screen+$700,x 
        dex
        bne !-
        rts

draw_square:

        sta colour 

        lda x_addr_lo,x 
        sta square_addr_zp
        lda x_addr_hi,x 
        sta square_addr_zp+1


        clc 
        lda y_addr_hi,y
        adc square_addr_zp+1
        sta square_addr_zp+1
        bcc !+
        inc square_addr_zp+1
!:

        clc 
        lda y_addr_lo,y
        adc square_addr_zp
        sta square_addr_zp
        bcc !+
        inc square_addr_zp+1
!:


        ldx #0 

nextrw:
        ldy #0
        lda colour
        sta (square_addr_zp),y 
        iny 
        sta (square_addr_zp),y 
        iny 
        sta (square_addr_zp),y 
        iny 
        sta (square_addr_zp),y 
        ldy #0 
        lda square_addr_zp
        clc
        adc #$50 
        sta square_addr_zp
        bcc !+
        inc square_addr_zp+1
!:
        inx 
        cpx #3
        bne nextrw

        rts 