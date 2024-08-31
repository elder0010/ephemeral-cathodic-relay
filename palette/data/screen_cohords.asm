.var x_cohord = List() 

.for(var x=0;x<30;x++){
    .eval x_cohord.add([4*x]+screen)
}

.var y_cohord = List()

.for(var y=0;y<25;y++){
    .eval y_cohord.add(y*$50)
}

x_addr_lo:
.for (var x=0;x<x_cohord.size();x++){
    .byte <x_cohord.get(x)
}

x_addr_hi:
.for (var x=0;x<x_cohord.size();x++){
    .byte >x_cohord.get(x)
}

y_addr_lo:
.for (var x=0;x<y_cohord.size();x++){
    .byte <y_cohord.get(x)
}

y_addr_hi:
.for (var x=0;x<y_cohord.size();x++){
    .byte >y_cohord.get(x)
}


