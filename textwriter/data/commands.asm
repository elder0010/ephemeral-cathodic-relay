.const COMMANDS_NUMBER=14

.pc=commands_data "Commands data"

//commands sequence
commands_sequence:
:SetMargin(10,10)
:SetPos(10,20)
:SetPos(15,30)
:Delay(50)
:Delay(20)
:Delay(50)
:Delay(50)
:Delay(50)
:Page()
:SetMargin(0,10)
:Delay(20)
:Delay(20)
:Delay(20)
:Delay(20)

//pages sequence
commands_pages:
.byte 0
.byte 0
.byte 0
.byte 0
.byte 0
.byte 0
.byte 0
.byte 0
.byte 0
.byte 1
.byte 1
.byte 1
.byte 1
.byte 1

//lines sequence
commands_lines:
.byte 0
.byte 2
.byte 2
.byte 2
.byte 3
.byte 3
.byte 3
.byte 4
.byte 5
.byte 0
.byte 1
.byte 3
.byte 5
.byte 7

//indexes sequence
commands_indexes:
.byte 0
.byte 27
.byte 31
.byte 35
.byte 3
.byte 18
.byte 24
.byte 36
.byte 0
.byte 0
.byte 3
.byte 3
.byte 3
.byte 3
