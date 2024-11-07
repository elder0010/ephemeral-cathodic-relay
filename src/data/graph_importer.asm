.macro process_graph(graph_path, step){

    .print("Processing graph: "+graph_path)
    .var picture = LoadPicture(graph_path)

    
    .var bottom_y = picture.height

    .var gate_values = List()
    
    
    .for(var x=0;x<=255;x++){
        .var colour = toHexString(picture.getPixel(x,bottom_y-1),6).toUpperCase()
      //  .print(toHexString(colour,6).toUpperCase())

        .var found = false
        .for(var y=0;y<picture.height;y++){
            .if(!found){
                .var colour = toHexString(picture.getPixel(x,y),6).toUpperCase()
                .if(colour == "000000"){
                    .eval found = true
                }
            }
        }

        .if(found){
            .eval gate_values.add(16)
        }else{
            .eval gate_values.add(0)
        }

        /*
        .if(colour == "FF0000"){
            .eval gate_values.add(16)
        }else{
            .eval gate_values.add(0)
        }*/
    }

    .var notes_mapping = List()
    .var octaves_mapping = List()
    .for(var x=64;x<=255;x++){
        .eval notes_mapping.add(x)
        .eval octaves_mapping.add(2)
    }
    .for(var x=64;x<=255;x++){
        .eval notes_mapping.add(x)
        .eval octaves_mapping.add(1)
    }
    .for(var x=64;x<=255;x++){
        .eval notes_mapping.add(x)
        .eval octaves_mapping.add(0)
    }

    .var notes = List()
    .var octaves = List()
    .var base = 0
    .while(base < 255-step){
        //Get the note
        .var found = false
        .for(var y=0;y<picture.height;y++){
            .if(!found){
                .var colour = toHexString(picture.getPixel(base,y),6).toUpperCase()
                .if(colour == "000000"){
                    .eval notes.add(notes_mapping.get(y))
                    .eval octaves.add(get_octave(octaves_mapping.get(y)))
                    .eval found = true
                }
            }
        }
        .eval base = base + step
    }

    .print("Gate values: "+gate_values)
    .print("Notes: "+notes)

    .pc = graph_note "Graph notes"
    .for (var x=0;x<notes.size();x++){
        .byte notes.get(x)
    
    }

    .pc = graph_octave "Graph octaves"
    .for (var x=0;x<octaves.size();x++){
        //.byte 51
        .byte octaves.get(x)
    }

    .pc = graph_gate "Graph gate"
    .for (var x=0;x<gate_values.size();x++){
        .byte gate_values.get(x)
    }
}