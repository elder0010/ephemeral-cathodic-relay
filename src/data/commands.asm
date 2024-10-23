.const COMMANDS_NUMBER=42

.pc=commands_data "Commands data"

//commands sequence
commands_sequence:
:SetMargin(07,04)
:LoadNext()
:Delay(128)
:LoadNext()
:Delay(256)
:Delay(256)
:Delay(256)
:Delay(256)
:Delay(256)
:Image(96)
:Page()
:LoadNext()
:Delay(128)
:Delay(128)
:Image(96)
:Page()
:LoadNext()
:Delay(128)
:Delay(128)
:Image(96)
:Page()
:LoadNext()
:Delay(128)
:Delay(128)
:Image(96)
:Page()
:LoadNext()
:Delay(128)
:Delay(128)
:Image(96)
:Page()
:LoadNext()
:Delay(128)
:Delay(128)
:Image(96)
:Page()
:LoadNext()
:Delay(128)
:Delay(128)
:Image(96)
:Page()
:End()

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
.byte 3
.byte 3
.byte 3
.byte 3
.byte 3
.byte 4
.byte 4
.byte 4
.byte 4
.byte 4
.byte 5
.byte 5
.byte 5
.byte 5
.byte 5
.byte 6
.byte 6
.byte 6
.byte 6
.byte 6
.byte 7

//lines sequence
commands_lines:
.byte 0
.byte 1
.byte 1
.byte 1
.byte 1
.byte 1
.byte 1
.byte 1
.byte 1
.byte 2
.byte 3
.byte 0
.byte 0
.byte 0
.byte 1
.byte 2
.byte 0
.byte 0
.byte 0
.byte 1
.byte 2
.byte 0
.byte 0
.byte 0
.byte 1
.byte 2
.byte 0
.byte 0
.byte 0
.byte 1
.byte 2
.byte 0
.byte 0
.byte 0
.byte 1
.byte 2
.byte 0
.byte 0
.byte 0
.byte 1
.byte 2
.byte 1

//indexes sequence
commands_indexes:
.byte 0
.byte 5
.byte 14
.byte 36
.byte 37
.byte 39
.byte 40
.byte 41
.byte 42
.byte 0
.byte 0
.byte 5
.byte 14
.byte 23
.byte 0
.byte 0
.byte 5
.byte 14
.byte 23
.byte 0
.byte 0
.byte 5
.byte 14
.byte 23
.byte 0
.byte 0
.byte 5
.byte 14
.byte 23
.byte 0
.byte 0
.byte 5
.byte 14
.byte 23
.byte 0
.byte 0
.byte 5
.byte 14
.byte 23
.byte 0
.byte 0
.byte 0
