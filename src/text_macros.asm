.var page_nr = 0
.var row = 0
.var col = 0 


/*
.function GoToPage(page_nr){
    print("Going to page " + page_nr);
    .eval page_nr = page_nr
}

.function NextPage(){
    print("Going to next page");
    .eval page_nr = page_nr+1
}

.function NewLine(){
    print("Going to next line");
    .eval row = row+1
    .eval col = 0
}
*/

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