.macro process_graph(graph_path){

    .print("Processing graph: "+graph_path)
    .var picture = LoadPicture(graph_path)

    
    .var bottom_y = picture.height

    .var gate_values = List()

    .for(var x=0;x<255;x++){
        .var colour = toHexString(picture.getPixel(x,bottom_y-1),6).toUpperCase()
      //  .print(toHexString(colour,6).toUpperCase())

        .if(colour == "FF0000"){
            .eval gate_values.add(1)
        }else{
            .eval gate_values.add(0)
        }
    }

    .print("Gate values: "+gate_values)
    
    .var notes_mapping = List()
    .var octaves_mapping = List()
    .for(var x=255;x>=64;x--){
        .eval notes_mapping.add(x)
        .eval octaves_mapping.add(2)
    }
    .for(var x=255;x>=64;x--){
        .eval notes_mapping.add(x)
        .eval octaves_mapping.add(1)
    }
    .for(var x=255;x>=64;x--){
        .eval notes_mapping.add(x)
        .eval octaves_mapping.add(0)
    }

    .var notes = List()
    .var octaves = List()
    .for(var x=0;x<=255;x++){
        //Get the note
        .var found = false
        .for(var y=0;y<picture.height;y++){
            .if(!found){
            .var colour = toHexString(picture.getPixel(x,y),6).toUpperCase()
                .if(colour == "000000"){
                    .eval notes.add(notes_mapping.get(y))
                    .eval octaves.add(octaves_mapping.get(y))
                    .eval found = true
                }
            }
        }
    }

    .pc = graph_note "Graph notes"
    .for (var x=0;x<notes.size();x++){
        .byte notes.get(x)
    }

    .pc = graph_octave "Graph octaves"
    .for (var x=0;x<octaves.size();x++){
        .byte octaves.get(x)
    }
}