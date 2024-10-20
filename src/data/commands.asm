.const COMMANDS_NUMBER=4

.pc=commands_data "Commands data"

//commands sequence
commands_sequence:
:SetMargin(07,04)
:Delay(350)
:Delay(50)
:Delay(50)

//pages sequence
commands_pages:
.byte 0
.byte 0
.byte 0
.byte 0

//lines sequence
commands_lines:
.byte 0
.byte 1
.byte 1
.byte 1

//indexes sequence
commands_indexes:
.byte 0
.byte 30
.byte 36
.byte 42
