.var screen_rows_list = List()
.for (var y=0;y<ROWS;y++){
    .eval screen_rows_list.add(screen+[y*COLS])
    .print(toHexString(screen+[y*COLS]))
}

screen_rows_lo:
.for (var i=0;i<screen_rows_list.size();i++){
    .byte <screen_rows_list.get(i)
}

screen_rows_hi:
.for (var i=0;i<screen_rows_list.size();i++){
    .byte >screen_rows_list.get(i)
}