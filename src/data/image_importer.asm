.const VERBOSE_OUTPUT = false 
.var image = "" 

.function screen_addr(screen_address, x_cohord,y_cohord) {
    .return screen_address+y_cohord*$50+x_cohord
}

.function generate_palette(){
    .var palette = List()
    .for (var x=0;x<=256;x++){
        .var bb = toHexString(x,2).toUpperCase()
        .var hex_string = "#"+bb+bb+bb
        //.print("Color: "+hex_string)
        .if(hex_string!="#000000"){
            .eval palette.add(hex_string)
        }
        //.eval palette.add(hex_string)
    }
    .return palette
}

.macro process_image(image_path){
        .var picture = LoadPicture(image_path)

        .print("Processing image: "+image_path)

        .if(VERBOSE_OUTPUT){
            .print("Image width: "+picture.width)
            .print("Image height: "+picture.height)
        }
      
        //Get image palette
        .var palette = Hashtable()
        .for (var y=0;y<picture.height;y++){
            .for (var x=0;x<picture.width;x++){
                .var colour = picture.getPixel(x,y) 
                .var c_key = "#"+toHexString(colour,6).toUpperCase()
        
                .if(!palette.containsKey(c_key)){
                    .eval palette.put(c_key,List())
                    //.print(c_key)
                }
                .var x_pad = ""
                .var y_pad = ""

                .if (x<10){
                    .eval x_pad = "0"
                }
                .if (y<10){
                    .eval y_pad = "0"
                }
                .eval palette.get(c_key).add(x_pad+x.string()+"_"+y_pad+y.string())
            }
        }

        .if(VERBOSE_OUTPUT){
            .print("IMAGE PALETTE")
            .for (var x=0;x<palette.keys().size();x++){
                .var key = palette.keys().get(x)
                .print(key+" : "+palette.get(key).size())
            }
        }

        .if(VERBOSE_OUTPUT){
            .print("---------------")
        }

        //.var sorted_palette = List().add("#F6F6F6", "#EEEEEE", "#E6E6E6", "#DEDEDE", "#D5D5D5", "#CDCDCD", "#C5C5C5", "#BDBDBD", "#B4B4B4", "#ACACAC", "#A4A4A4", "#9C9C9C", "#949494", "#8B8B8B", "#838383", "#7B7B7B", "#737373", "#6A6A6A", "#626262", "#5A5A5A", "#525252", "#4A4A4A", "#414141", "#393939", "#313131", "#292929", "#181818", "#202020", "#101010","#80808")
        .var sorted_palette = generate_palette()

        .if(VERBOSE_OUTPUT){
            .print ("Palette size: "+sorted_palette.size())
            .print("Sorted palette")
            .for (var x=0;x<sorted_palette.size();x++){
                .print(sorted_palette.get(x))
            }
        }
        //calc decay for each colour: the brighter the slower to go away
        .var amount_list = List()
        .var total_colours = 0

        //.var pixels_by_delay = Hashtable()
        .var px_nr = 0

        .var screen_cohord_lo = List()
        .var screen_cohord_hi = List()
        .var colours_overflow = false

        .for(var x=0;x<sorted_palette.size();x++){
            .var next_col = sorted_palette.get(x)

            .var cohordinates = palette.get(next_col)

            //.eval delays_list.add(starting_delay)
            .if(cohordinates!=null){

                .if(cohordinates.size()>255){
                    .print("Error: Too many pixels for colour: "+next_col+ " ("+cohordinates.size()+")")
                    .eval colours_overflow = true
                }
                //prepare the cohordinates list (screen addresses) for the current delay
                .var c_list = List()
                .for(var a=0; a<palette.get(next_col).size(); a++){
                    .var cohordinate = palette.get(next_col).get(a)
                    .var x_int = cohordinate.substring(0,2).asNumber()
                    .var y_int = cohordinate.substring(3,5).asNumber()
                    .var screen_loc = screen_addr(screen_image,x_int,y_int)
                    .eval c_list.add(screen_loc)
                    .eval screen_cohord_lo.add(<screen_loc)
                    .eval screen_cohord_hi.add(>screen_loc)
                }

                .if(VERBOSE_OUTPUT){
                    .print("--------------")
                    .print("Color: "+next_col)
                    //.print("Delay: $"+toHexString(starting_delay))
                    .print ("Pixels nr: $"+toHexString(c_list.size()))
                }

                .eval amount_list.add(c_list.size())
                .eval px_nr = px_nr+c_list.size()
                .eval total_colours = total_colours+1
            }
        }

.print("Total pixels: $"+toHexString(px_nr))
.if(!colours_overflow){
    .print("Colour quantity check passed.")
}

.var procedural_beep_step = floor(255/total_colours)
.print("Procedural beep step: $"+toHexString(procedural_beep_step))
.eval beep_step = procedural_beep_step
.print("Total colours: "+total_colours)

.pc = screen_addr_lo "Screen address lo"
//screen_addr_lo:
.for (var x=0;x<screen_cohord_lo.size();x++){
    .byte screen_cohord_lo.get(x)
}

.pc = screen_addr_lo+$800 "Screen address hi"
screen_addr_hi:
.for (var x=0;x<screen_cohord_hi.size();x++){
    .byte screen_cohord_hi.get(x)
}
.byte $ff 

.pc = screen_addr_lo+$1004 "Pixels amount per colour"
pixels_colour_amt: 
//.print("Amount list size: "+amount_list.size())
.for(var x=0;x<amount_list.size();x++){
    .byte amount_list.get(x)
}

.pc = screen_addr_lo+$1000 "Total pixels"
px_number:
.word px_nr

.pc = screen_addr_lo+$1002 "Total colours"
.byte total_colours

//.pc = screen_addr_lo+$1003 "Procedural beep step" 
//.byte procedural_beep_step
}

