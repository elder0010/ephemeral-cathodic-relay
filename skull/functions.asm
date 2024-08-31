clear_screen:
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

draw_img:
        :set_addr(screen_addr_lo, tb_lo)
        :set_addr(screen_addr_hi, tb_hi)
        
tb_lo:
        lda screen_addr_lo
        sta dst_addr+1
tb_hi:
        lda screen_addr_hi
        sta dst_addr+2

        lda #WHITE_PIXEL
dst_addr:
        sta $ffff 

        :inc_16bit_addr(tb_lo)
        :inc_16bit_addr(tb_hi)

        lda dst_addr+2
        cmp #$ff //finished?
        beq !+
        jmp tb_lo
!:
        rts 

mask_colours:
       // :set_addr(screen_addr_lo, mask_tb_lo)
       // :set_addr(screen_addr_hi, mask_tb_hi)

        lda #0 
        sta msk_ct+1

        ldx px_cnt_pt
        lda pixels_colour_amt,x 
        sta msk_amount+1
        
        inc px_cnt_pt 
        lda px_cnt_pt
        cmp #total_colours+1
        bne mask_tb_lo
//--------------------------------------
//time to reset 
        lda #FINISHED 
        sta scene_state

        lda #0 
        sta px_cnt_pt
        sta msk_ct+1
        :set_addr(screen_addr_lo, mask_tb_lo)
        :set_addr(screen_addr_hi, mask_tb_hi)
        :set_addr(screen_addr_lo, tb_lo)
        :set_addr(screen_addr_hi, tb_hi)
        rts
        
//--------------------------------------
mask_tb_lo:
        lda screen_addr_lo
        sta mask_dst_addr+1
mask_tb_hi:
        lda screen_addr_hi
        sta mask_dst_addr+2

        lda #BLACK_PIXEL
mask_dst_addr:
        sta $ffff 

        :inc_16bit_addr(mask_tb_lo)
        :inc_16bit_addr(mask_tb_hi)

        inc msk_ct+1
msk_ct:
        lda #0 
msk_amount:
        cmp #0
        beq !+
        jmp mask_tb_lo
!:      
        rts 
