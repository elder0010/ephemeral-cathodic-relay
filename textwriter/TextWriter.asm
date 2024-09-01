/**
TextWriter

2024 G*P / Distant Future
Code: Elder0010
*/

.import source("macros.asm")
.import source("text_macros.asm")
.import source("variables.asm")
.import source("scene_settings.asm")
.import source("data/commands.asm")

*= basic_upstart "Basic upstart"
        :BasicUpstart2()

        sei
        jsr clear_screen

        :set_addr(script, text_addr)
        :set_addr_zp(screen, text_row_zp_addr)

        jsr reset_cursor

        jsr init_irq
        
        jmp *

.pc = * "IRQ"
.import source "irq.asm"

.pc = * "Functions"
.import source "functions.asm"

.pc = * "Text"
script:
.import source "data/script.asm"

.pc = * "Screen address tables"
.import source "data/screen_addresses.asm"