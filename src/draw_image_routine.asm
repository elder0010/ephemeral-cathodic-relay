.pc = * " Draw image"
draw_img:
        jsr clear_unrolled

        :set_addr_zp(unroll_start, unroll_start_zp)
//generate unrolled code
        :set_addr(screen_addr_lo, tb_lo)
        :set_addr(screen_addr_hi, tb_hi)
        
tb_lo:
        lda screen_addr_lo
        sta dst_addr_lo+1
tb_hi:
        lda screen_addr_hi
        sta dst_addr_hi+1


        lda #STA_ABS 
        ldy #0
        sta (unroll_start_zp),y 

dst_addr_lo:
        lda #0 
        ldy #1
        sta (unroll_start_zp),y 

dst_addr_hi:
        lda #0
        ldy #2
        sta (unroll_start_zp),y 
/*
        lda #WHITE_PIXEL
dst_addr:
        sta $ffff 
*/
        :inc_16bit_addr(tb_lo)
        :inc_16bit_addr(tb_hi)

        :inc_16bit_addr_zp(unroll_start_zp, 3)
        

        lda dst_addr_hi+1
        cmp #$ff //finished?
        beq !+
        jmp tb_lo
!:

        jsr draw_unrolled
    
        rts 

draw_unrolled:
        ldx #0


        lda #WHITE_PIXEL
unroll_start:
        .for(var x=0;x<$800;x++){
            and screen+x
        }
        rts 


clear_unrolled:
        :set_addr(unroll_start, cldst)

        ldy #0
clear_100:
        lda #BIT_ABS
      
        ldx #0 
cldst:
        sta unroll_start

        clc 
        lda cldst+1
        adc #3
        sta cldst+1
        bcc !+
        inc cldst+2
!:
        lda #BIT_ABS
        dex 
        bne cldst

        iny 
        cpy #8 
        bne clear_100
        rts





/*
draw_100:
        ldy #0
        .for(var x=0;x<$100;x++){
            lda (screen_src_zp),y 
            sta (screen_dst_zp),y
            iny 
        }
        inc screen_src_zp+1
        inc screen_dst_zp+1
        inx 
        cpx #8
        beq !+
        jmp draw_100
!:
        rts 
        */