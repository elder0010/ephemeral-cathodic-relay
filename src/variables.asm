.const basic_upstart = $401
.var screen = $8000
.var screen_image = $8800

.var commands_data = $1000 //source

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

//relocated text
.var commands_sequence_relocated = $9000 //$1600 should be enough
.var script = $a600 //$3400 should be enough
.var relocated_functions = $da00 

.var RAMEXP_ENABLE = %11100100
.var RAMEXP_DISABLE = %00000000

//event defines
.const EVENT_DELAY = 1
.const EVENT_PAGE = 2
.const EVENT_SETPOS = 3
.const EVENT_IMAGE = 4
.const EVENT_SETMARGIN = 5
.const EVENT_END = 6
.const EVENT_LOADNEXT = 7
.const EVENT_LOADSFX = 8
.const EVENT_STRING = 9
.const EVENT_SETCURSORSPEED = 10
.const EVENT_BREAKPOINT = 11
.const EVENT_NOTHING = 12

.const WHITE_PIXEL = $e0 
.const BLACK_PIXEL = $20 

.const WHITE_PIXEL_IMAGE = $a0
.const BLACK_PIXEL_IMAGE = $20
.const VIA_PORT_B = $e840

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

.var unroll_start_zp = $32
.var half_speed_delayer = $34

.var r_zp_1 = $35
.var r_zp_2 = $36
.var r_zp_3 = $37
.var can_cursor_beep = $38
.var forced_decay_pt = $39
.var forced_decay_amt = $40
.var petscii_pointer = $41
.var current_petscii_size = $42
.var petscii_callback_pt = $43
.var gate_pt = $45
.var note_octave_pt = $46
.var sample_pt = $60
.var image_pt = $61 

.var breakpoint_val = $a5ff

.var COLOUR_DELAY = 1
.const DRAWING = 1 
.const WAIT_FOR_FADE = 2
.const FADING = 3
.const FINISHED = 4

//loader Variables
.const MEMMAP = $0000
.const BUF = $200 
.const FNADR = $da  //file name address
.const FNLEN = $d1  //current filename length
.const STATUS = $96 //kernal I/O status word (ST)
.const FA = $d4     //device number
.const SA = $d3 
.const RCLRCH = $f2a6 //restore default I/O
.const RLISTN = $f0d5 //send LISTEN
.const RSECND = $f143 //send data on IEEE bus (?)
.const RCIOUT = $f19e //send data on IEEE bus (?)
.const RUNLSN = $f1b9 //send UNLISTEN
.const RTALK = $f0d2 //send TALK 
.const RTKSA = $f193 //send data on IEEE bus (?)
.const RACPTR = $f1c0 //resyncing / send UNLISTEN
.const RUNTLK = $f1ae //Send UNTALK
.const ROPENI = $f4a5 //Get Next One Byte Parameter / send listen

//Images memory locations (image + optional PETSCII payload)
.const screen_addr_lo = $1000 //image start
.const screen_addr_hi = screen_addr_lo+$800
.const px_number = screen_addr_lo+$1000
.const total_colours = screen_addr_lo+$1002
.const procedural_beep_step = screen_addr_lo+$1003
.const pixels_colour_amt = screen_addr_lo+$1004

.const petscii_start = pixels_colour_amt+$100
.const petscii_size = petscii_start
.const petscii_addr_lo = petscii_size+1

.const graph_note = screen_addr_lo - $200
.const graph_octave = graph_note + $100
.const sample = pixels_colour_amt+$200-$4 //must be the same of SAMPLE_ADDRESS in BuildSamples.bat

.print("Sample start: $"+toHexString(sample))