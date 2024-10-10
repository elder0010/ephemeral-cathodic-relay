
.pc = * " Draw image"

draw_img:
sei 
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

cli
        rts 
        

mask_colours:
       // :set_addr(screen_addr_lo, mask_tb_lo)
       // :set_addr(screen_addr_hi, mask_tb_hi)
.break 
        lda #0 
        sta msk_ct+1

        ldx px_cnt_pt
        lda pixels_colour_amt,x 
        sta msk_amount+1
        
        inc px_cnt_pt 
        lda px_cnt_pt
total_colours_val:
        cmp #total_colours+1 //RICORDATI DI SETTARMI!!
        bne mask_tb_lo
//--------------------------------------
//time to reset 
        lda #FINISHED 
        sta draw_state

        lda #0 
        sta px_cnt_pt
        sta msk_ct+1
        :set_addr(screen_addr_lo, mask_tb_lo)
        :set_addr(screen_addr_hi, mask_tb_hi)
        :set_addr(screen_addr_lo, tb_lo)
        :set_addr(screen_addr_hi, tb_hi)

        //trigger hold function
        :set_addr(hold_image, irq_fn)
        //jsr enable_write_mode
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

init_displayer:
        lda #COLOUR_DELAY
        sta delay

        lda #0 
        sta px_cnt_pt
        sta hold_tk_lo
        sta hold_tk_hi
        //sta msk_ct+1
        lda #WAIT_FOR_FADE
        sta draw_state 

        :set_addr(screen_addr_lo, mask_tb_lo)
        :set_addr(screen_addr_hi, mask_tb_hi)

        :set_screen(1)
        :set_char_height(7)
       // jsr draw_img

  //      jmp *
  
        rts 

hold_image:

        clc 
        lda hold_tk_lo
        adc #1
        sta hold_tk_lo
        bcc !+
        inc hold_tk_hi
!:
        lda hold_tk_hi
        cmp hold_time_hi
        bne !+
        lda hold_tk_lo
        cmp hold_time_lo
        bne !+
        jsr enable_write_mode
!:
        rts 