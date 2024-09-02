.const basic_upstart = $401
.var screen = $8000

.var commands_data = $2000

.var col_pt = $08
.var text_row_zp_addr = $11 //word
.var page_pt = $13
.var row_pt = $16

.var command_sequence_pt = $18 //word

//event defines
.const EVENT_DELAY = 1
.const EVENT_PAGE = 2
.const EVENT_SETPOS = 3
.const EVENT_IMAGE = 4
