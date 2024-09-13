.var filenames = List().add("IMG00","IMG01")
files:
.for(var x=0;x<filenames.size();x++){
    .text filenames.get(x)
    .byte 0
}

.var filenames_addr = List()
.var f_addr = files
.for(var x=0;x<filenames.size();x++){
    .eval filenames_addr.add(f_addr)
    .eval f_addr = f_addr + filenames.get(x).size()+1

    //.print(toHexString(f_addr))
}

.pc = * "files addresses lo"
files_lo:
.for(var x=0;x<filenames_addr.size();x++){
    .byte <filenames_addr.get(x)
}

.pc = * "files addresses hi"
files_hi:
.for(var x=0;x<filenames_addr.size();x++){
    .byte >filenames_addr.get(x)
}

