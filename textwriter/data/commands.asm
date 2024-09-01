.const COMMANDS_NUMBER=18

.pc=commands_data "Commands data"

//commands sequence
commands_sequence:
:Delay(20)
:Delay(20)
:Page()
:Delay(20)
:Delay(20)
:Delay(40)
:Delay(80)
:Delay(80)
:Image(0,500)
:Page()
:Delay(40)
:Delay(40)
:Delay(40)
:Delay(40)
:Image(1,500)
:Image(2,500)
:Image(3,500)
:Page()

//pages sequence
commands_pages:
.byte 0
.byte 0
.byte 0
.byte 1
.byte 1
.byte 1
.byte 1
.byte 1
.byte 1
.byte 1
.byte 2
.byte 2
.byte 2
.byte 2
.byte 2
.byte 2
.byte 2
.byte 2

//indexes sequence
commands_indexes:
.byte 7
.byte 7
.byte 17
.byte 2
.byte 2
.byte 2
.byte 8
.byte 9
.byte 17
.byte 18
.byte 4
.byte 4
.byte 4
.byte 4
.byte 7
.byte 12
.byte 14
.byte 17
