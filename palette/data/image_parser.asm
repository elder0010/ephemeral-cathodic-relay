.var filename = "test.png"

.const C_0 = $ffffff
.const C_1 = $888888
.const C_2 = $333333
.const C_3 = $000000 

.var palette = List().add(C_0,C_1,C_2,C_3)

.var mapping = Hashtable()

.eval mapping.put(C_0, $12)
.eval mapping.put(C_1, $08)
.eval mapping.put(C_2, $04)
.eval mapping.put(C_3, $00)


.var picture = LoadPicture(filename, palette)

.var x_chars = picture.width
.var y_chars = picture.height/2

.print("X Chars "+x_chars)
.print("Y Chars "+y_chars)

.var delay_list = List()
.for (var y=0;y<y_chars;y++){
    .for (var x=0;x<x_chars;x++){
        .var col = picture.getPixel(x,y*2)
        //.print(toHexString(col))
        .var delay = mapping.get(col)
        //.print(delay)
        .eval delay_list.add(delay)
    }
}


