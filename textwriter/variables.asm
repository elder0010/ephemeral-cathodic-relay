.const basic_upstart = $401
.var screen = $8000

.var commands_data = $3000

.var col_pt = $08
.var text_row_zp_addr = $11 //word
.var page_pt = $13
.var row_pt = $16
.var command_sequence_pt = $18 //word

//absolute pointers for triggering events
.var script_row_pt = $4a 
.var script_col_pt = $4c

.var default_row_val = $4d 
.var default_col_val = $4e

.var cursor_sw = $4f

//event defines
.const EVENT_DELAY = 1
.const EVENT_PAGE = 2
.const EVENT_SETPOS = 3
.const EVENT_IMAGE = 4
.const EVENT_SETMARGIN = 5
.const EVENT_END = 6

.const WHITE_PIXEL = $e0 
.const BLACK_PIXEL = $20 


//Displayer functions
.var pixels_delay_table = $2000
.var px_pt = $20 //word
.var px_cnt = $22 
.var total_px = $24 //word
.var draw_state = $26
.var delay = $27
.var px_cnt_pt = $2a

.var hold_time_lo = $2e 
.var hold_time_hi = $2f

.var hold_tk_lo = $30
.var hold_tk_hi = $31

.var COLOUR_DELAY = 8
.const DRAWING = 1 
.const WAIT_FOR_FADE = 2
.const FADING = 3
.const FINISHED = 4
