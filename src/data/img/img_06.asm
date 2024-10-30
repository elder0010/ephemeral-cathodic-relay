.import source("../../macros.asm")
.import source("../../text_macros.asm")
.import source("../../variables.asm")
.import source("../../settings.asm")
.import source("../image_importer.asm")
.import source("../graph_importer.asm")

.var beep_step = 0
:process_image(source_images_path+"img_06.png")
:process_graph(source_graph_path+"graph_06.png", beep_step)

.if(petscii_callback_delay_list.get(6) > 0){
    .import source("../petscii/pet_06.asm")
}