
.pc = * "Draw image"
draw_img:
        jsr clear_image_screen
        :set_addr(screen_addr_lo, tb_lo)
        :set_addr(screen_addr_hi, tb_hi)

tb_lo:
        lda screen_addr_lo
        sta dst_addr+1
tb_hi:
        lda screen_addr_hi
        sta dst_addr+2

        lda #WHITE_PIXEL_IMAGE
dst_addr:
        sta $8000 

        :inc_16bit_addr(tb_lo)
        :inc_16bit_addr(tb_hi)

        lda dst_addr+2
        cmp #$ff //finished?
        beq !+
        jmp tb_lo
!:
        rts 
        
mask_colours:
//.break
        //check if we need to delay
slow_mask_enabled:
        lda forced_decay_amt
        beq !+
//slow mask mode
        dec forced_decay_amt
       // rts 
!:
forced_decay_v0:
        lda #0
        sta forced_decay_amt
//----------------------------------------   
        lda #0 
        sta msk_ct+1

        ldx px_cnt_pt
        lda pixels_colour_amt,x 
        sta msk_amount+1

mask_tb_lo:
        lda screen_addr_lo
        sta mask_dst_addr+1
mask_tb_hi:
        lda screen_addr_hi
        sta mask_dst_addr+2

        lda #BLACK_PIXEL_IMAGE
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
//----------------------------------------
        inc px_cnt_pt 
        lda px_cnt_pt
total_colours_val:
        cmp #$ff //RICORDATI DI SETTARMI!!
        bne skipreset
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

        jsr trigger_sample
        
        //trigger hold function
        :set_addr(hold_image, irq_fn)
        ldx petscii_callback_pt
        inc petscii_callback_pt
        lda petscii_callback_delay,x 
        beq no_callback 
callback:
        sta pet_tk+1
        :set_addr(delay_petscii, petscii_fn)
        jsr draw_petscii
        lda #JSR_ABS 
        sta petscii_fn 
        rts

skipreset:
no_callback:
        rts
/*
        lda #0 
        sta msk_ct+1

        ldx px_cnt_pt
        lda pixels_colour_amt,x 
        sta msk_amount+1
        
        inc px_cnt_pt 
        lda px_cnt_pt
total_colours_val:
        cmp #total_colours //RICORDATI DI SETTARMI!!
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

        jsr trigger_sample
        
        //trigger hold function
        :set_addr(hold_image, irq_fn)
        ldx petscii_callback_pt
        inc petscii_callback_pt
        lda petscii_callback_delay,x 
        beq no_callback 
callback:
        sta pet_tk+1
        :set_addr(delay_petscii, petscii_fn)
        jsr draw_petscii
        lda #JSR_ABS 
        sta petscii_fn 
        rts

no_callback:
*/
  //      rts
        
trigger_sample:
        :sound_on()
        lda #JSR_ABS
        sta can_sample_draw

        lda #BIT_ABS
        sta beep_fn
        rts 

//--------------------------------------

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

.pc = * "PETSCII displayer"
draw_petscii:
        :uppercase()

        lda #0 
        sta petscii_pointer 

        lda petscii_start 
        sta current_petscii_size

        //calculate the petscii addresses (depends on the size)
        :set_addr(petscii_addr_lo, pet_src_hi)
        clc 
        lda #<petscii_addr_lo
        adc current_petscii_size 
        sta pet_src_hi+1
        bcc !+
        inc pet_src_hi+2
!:
        //calculate the petscii values start address (depends on the size)
        clc 
        lda pet_src_hi+1 
        adc current_petscii_size
        sta pet_val_src+1
        lda pet_src_hi+2
        sta pet_val_src+2
        bcc !+
        inc pet_val_src+2
!:
        ldx petscii_pointer
p_loop:
pet_src_lo:
        lda petscii_addr_lo,x   //always start+1
        sta p_target+1

pet_src_hi:
        lda $ffff,x     //must change accordingly to size
        sta p_target+2

pet_val_src:
        lda $ffff,x 
p_target:
        sta $ffff 

        inx 
        cpx petscii_size 
        bne p_loop

        :set_addr(delay_petscii, petscii_fn)
        rts

delay_petscii:
        dec pet_tk+1
pet_tk:
        lda #0
        bne !+
        lda #BIT_ABS
        sta petscii_fn
        jsr clear_petscii
!:
        rts 

clear_petscii:
        lda #0 
        sta petscii_pointer

        lda petscii_start 
        sta current_petscii_size

        //calculate the petscii addresses (depends on the size)
        :set_addr(petscii_addr_lo, pet_src_hi_clear)
        clc 
        lda #<petscii_addr_lo
        adc current_petscii_size 
        sta pet_src_hi_clear+1
        bcc !+
        inc pet_src_hi_clear+2
!:
        ldx petscii_pointer
p_loop_clear:
pet_src_lo_clear:
        lda petscii_addr_lo,x   //always start+1
        sta p_target_clear+1

pet_src_hi_clear:
        lda $ffff,x     //must change accordingly to size
        sta p_target_clear+2

        lda #BLACK_PIXEL
p_target_clear:
        sta $ffff 

        inx 
        cpx petscii_size 
        bne p_loop_clear

        :lowercase()
        rts