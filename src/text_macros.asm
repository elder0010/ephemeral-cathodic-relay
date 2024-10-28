.macro SetPos(row, col){
    .byte EVENT_SETPOS
    .byte row
    .byte col
}

.macro SetMargin(row, col){
    .byte EVENT_SETMARGIN
    .byte row
    .byte col
}

.macro Delay(time){
    .var time_lo = <time 
    .var time_hi = <floor(time/256)
    .byte EVENT_DELAY
    .byte time_lo
    .byte time_hi
}

.macro Page(){
    .byte EVENT_PAGE
}

.macro Image(delay){
    .byte EVENT_IMAGE
    .byte <delay
    .byte >delay
}

.macro End(){
    .byte EVENT_END
}

.macro LoadNext(){
    .byte EVENT_LOADNEXT
}

.macro LoadSfx(){
    .byte EVENT_LOADSFX
}

.macro String(length){
    .byte EVENT_STRING
    .byte length
}

.macro SetCursorSpeed(speed){
    .byte EVENT_SETCURSORSPEED
    .byte speed
}

.macro BreakPoint(){
    .if(ENABLE_BREAKPOINTS){
        .byte EVENT_BREAKPOINT
    }
}