.const COMMANDS_NUMBER=10

.pc=commands_data "Commands data"

//commands sequence
commands_sequence:
:Delay(20)
:Delay(20)
:Page()
:Delay(20)
:Delay(50)
:Page()
:Delay(20)
:Delay(20)
:Delay(20)
:Delay(20)

//pages sequence
commands_pages:
.byte 0
.byte 0
.byte 0
.byte 1
.byte 1
.byte 1
.byte 2
.byte 2
.byte 2
.byte 2

//lines sequence
commands_lines:
.byte 0
.byte 1
.byte 2
.byte 0
.byte 1
.byte 2
.byte 0
.byte 2
.byte 4
.byte 6

//indexes sequence
commands_indexes:
.byte 1
.byte 19
.byte 0
.byte 4
.byte 26
.byte 0
.byte 4
.byte 4
.byte 4
.byte 4
