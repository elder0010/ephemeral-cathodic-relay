.import source("../../macros.asm")
.import source("../../text_macros.asm")
.import source("../../variables.asm")
.import source("../../settings.asm")
.import source("../image_importer.asm")
.import source("../graph_importer.asm")

:process_image(source_images_path+"img_00.png")

:process_graph(source_graph_path+"graph_00.png")

.if(petscii_callback_delay_list.get(0) > 0){
    .import source("../petscii/pet_00.asm")
}