clear_screen:
        lda #$20 

        lda #BLACK_PIXEL
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

clear_image_screen:
        ldx #0
        lda #BLACK_PIXEL_IMAGE
        ldx #$0 
!:
        sta screen_image,x 
        sta screen_image+$100,x 
        sta screen_image+$200,x
        sta screen_image+$300,x 
        sta screen_image+$400,x
        sta screen_image+$500,x 
        sta screen_image+$600,x
        sta screen_image+$700,x 
        dex
        bne !-
        rts

reset_cursor:
        lda default_col_val
        sta col_pt

        lda default_row_val
        sta row_pt

        ldx row_pt
        lda screen_rows_lo,x 
        sta text_row_zp_addr
        lda screen_rows_hi,x
        sta text_row_zp_addr+1

        .if(ENABLE_CURSOR_BEEP){
                lda #1 
                sta can_cursor_beep
        }
        rts
