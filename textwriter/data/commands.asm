.const COMMANDS_NUMBER=27

.pc=commands_data "Commands data"

//commands sequence
commands_sequence:
:SetMargin(10,10)
:Delay(50)
:Delay(50)
:Delay(50)
:SetPos(10,20)
:Delay(50)
:SetPos(15,30)
:Delay(50)
:Delay(20)
:Delay(50)
:Delay(50)
:Delay(20)
:Delay(20)
:Delay(20)
:Delay(150)
:Page()
:SetMargin(0,0)
:Delay(50)
:Delay(20)
:Delay(20)
:Delay(20)
:Delay(20)
:Delay(10)
:Delay(20)
:Delay(30)
:Delay(40)
:Delay(50)

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
.byte 1
.byte 1
.byte 1
.byte 1
.byte 1
.byte 1

//lines sequence
commands_lines:
.byte 0
.byte 1
.byte 2
.byte 3
.byte 3
.byte 3
.byte 3
.byte 3
.byte 4
.byte 4
.byte 4
.byte 5
.byte 5
.byte 5
.byte 5
.byte 6
.byte 0
.byte 1
.byte 1
.byte 3
.byte 5
.byte 7
.byte 8
.byte 8
.byte 8
.byte 8
.byte 9

//indexes sequence
commands_indexes:
.byte 0
.byte 45
.byte 12
.byte 27
.byte 28
.byte 37
.byte 38
.byte 48
.byte 3
.byte 18
.byte 24
.byte 61
.byte 62
.byte 63
.byte 64
.byte 0
.byte 0
.byte 34
.byte 38
.byte 3
.byte 3
.byte 3
.byte 40
.byte 43
.byte 46
.byte 49
.byte 13
