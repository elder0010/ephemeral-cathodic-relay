.var filenames = List().add("IMG00","SFX00","IMG01","SFX01","IMG02","IMG03","IMG04","IMG05","IMG06","IMG07","IMG08","IMG09")
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

