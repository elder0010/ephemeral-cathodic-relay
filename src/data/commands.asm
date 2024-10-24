.const COMMANDS_NUMBER=5

.pc=commands_data "Commands data"

//commands sequence
commands_sequence:
:Page()
:Page()
:SetMargin(10,8)
:Page()
:End()

//pages sequence
commands_pages:
.byte 0
.byte 1
.byte 2
.byte 2
.byte 3

//lines sequence
commands_lines:
.byte 0
.byte 1
.byte 1
.byte 3
.byte 1

//indexes sequence
commands_indexes:
.byte 0
.byte 0
.byte 0
.byte 0
.byte 0
