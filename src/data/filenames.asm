//LRNZ 
.var filenames = List().add("IMG00","SFX00","IMG01","SFX01","IMG02","IMG03","IMG04","IMG05","IMG06","IMG07","IMG08","IMG09","IMG10","IMG11","IMG12","IMG13","IMG14","IMG15","IMG16")

//ELDER 
//.var filenames = List().add("IMG00","SFX00","IMG01","SFX01","IMG02","SFX02","IMG03","SFX03","IMG04","SFX04","IMG05","SFX05","IMG06","SFX06","IMG07","SFX07","IMG08","SFX08","IMG09","SFX09","IMG10","SFX10","IMG11","SFX11","IMG12","SFX12","IMG13","SFX13","IMG14","SFX14","IMG15","SFX15","IMG16","SFX16")

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

.pc = * "Force decay offset list"
force_decay_list:
.for(var x=0;x<forced_decay_offset_list.size();x++){
    .byte forced_decay_offset_list.get(x)
}