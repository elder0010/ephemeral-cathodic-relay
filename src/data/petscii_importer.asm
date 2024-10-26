//.import source("../variables.asm")

.macro process_petscii(address_list, values_list){
    .pc = petscii_start "PETSCII size"
    petscii_size:
    .byte address_list.size()

    .pc = * "PETSCII address lo"
    .for (var x=0;x<address_list.size();x++){
        .byte <address_list.get(x)
    }
    .pc = * "PETSCII address hi"
    .for (var x=0;x<address_list.size();x++){
        .byte >address_list.get(x)
    }

    .pc = * "PETSCII values"
    .for (var x=0;x<values_list.size();x++){
        .byte values_list.get(x)
    }
}