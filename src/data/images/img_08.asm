.import source("../../macros.asm")
.import source("../../text_macros.asm")
.import source("../../variables.asm")
.import source("../../settings.asm")
.import source("../image_importer.asm")

:process_image(source_images_path+"img_08.png")

.if(petscii_callback_delay_list.get(8) > 0){
    .import source("../petscii/pet_08.asm")
}