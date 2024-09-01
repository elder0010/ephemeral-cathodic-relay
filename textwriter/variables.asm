.const basic_upstart = $401
.var screen = $8000

.var commands_data = $2000

.var col_pt = $10
.var text_row_zp_addr = $11 //word
.var page_pt = $13
.var row_pt = $16
.var page_index_pt = $17 //for triggering page events

.var event_address_zp = $18 //word

//event defines
.const EVENT_DELAY = 1
.const EVENT_PAGE = 2
.const EVENT_SETPOS = 3
.const EVENT_IMAGE = 4
