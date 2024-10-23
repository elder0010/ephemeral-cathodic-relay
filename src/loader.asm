load_file:
        //prevent multiple calls
        lda #$2c
        sta can_load_file

       // lda #%10000000
      //  sta MEMMAP
    //    sta $fff0 

       // lda #0 

        lda #%11100100
        
      //  lda #$80 
        
        sta MEMMAP
        sta $fff0 

        
        

        lda #8 
        sta FA      //device #8 in device number 

init10:
        lda #<BUF 
        sta FNADR
        lda #>BUF 
        sta FNADR+1 //file name
inputfile:

//input file name
file_ptr:
        ldx #0 
        lda files_lo,x 
        sta nc+1
        lda files_hi,x 
        sta nc+2
        
        inc file_ptr+1

        ldx #$0 
nc:
        lda $ffff,x 
        sta BUF,x 
        beq !+
        inx 
        jmp nc
!:
  
init30:
        stx FNLEN   //store length of filename

        lda FNLEN
        cmp #1
        bne load //filename empty?
        rts
load:
        lda #0 
        sta STATUS

        lda #$60 
        sta SA      //special load command

        jsr openi

        lda FA      //device number 
        jsr talk 

        lda SA 
        jsr tksa    //tell it to load

        jsr acptr   //get first byte

        sta EAL+1

        lda STATUS
        lsr 
        lsr 
        bcs ld90 //file not found!
//file found
        jsr acptr       //load address high 
        sta EAL+2  
ld40:                   
        lda #$fd         //mask off timeout
        and STATUS 
        sta STATUS
ld45:
        jsr acptr
        tax
        lda STATUS      //timeout?
        lsr 
        lsr 
        bcs ld40        //try again..
EAL: 
        stx $f000   //will be self modified
ld60:
        inc EAL+1
        bne ld70
        inc EAL+2
ld70:
        bit STATUS  //eoi?
        bvc ld40    //no..

        jsr untlk   //close channel
        lda FA 
        jsr listn   //close file
   
        lda SA 
        and #$ef 
        ora #$e0 
        jsr secnd
        jsr unlsn 

        //file  loaded - is image?
must_init_image:
        lda #0
        beq !+
        lda #0
        sta must_init_image+1

        lda total_colours       
        sta total_colours_val+1

       // jsr draw_img
!:
        rts

//restore and write "file not found error"
ld90:
        jsr clrch
        lda #$0 
   //     sta $fff0 
        ldy #MS1-MS1 
        
        jsr msg

        cli 
        jmp init10

openi:
.break 
        jsr ROPENI

        rts 

talk:
        sta FA 
        jsr RTALK
        rts 

tksa: 
        pha 
        pla 
        jsr RTKSA 
        rts 

acptr: 
        jsr RACPTR
        rts 

untlk: 
        jsr RUNTLK 
        rts

clrch:
        lda #$0 
   //     sta $fff0 
        jsr RCLRCH //restore default I/O
      //  lda MEMMAP
      //  sta $fff0 
        rts 

listn: 
        sta FA 
        jsr RLISTN
        rts 

secnd:
        pha 
        pla 
        jsr RSECND
        rts 

unlsn:
        jsr RUNLSN 
        rts 

MS1:
.byte $d
.text "00"  //file not found

MS2:    
.text "01" //file not found
endms2:

msg: 
        ldy #0 
!:
        lda MS2,y 
        sta screen,y
        iny 
        cpy #endms2-MS2
        bne !- 
        rts 