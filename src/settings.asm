.const ROWS = 25
.const COLS = 80

.const ENABLE_BREAKPOINTS = true 
.const DEBUG_LOAD_IMAGE_CALLBACK = false 
.const DEBUG_LOAD_SFX_CALLBACK = false

.const CURSOR_BLINK_SPEED = 16
.const CRUNCH_CHARS_ON_IMAGE = false 
.const CRUNCH_HIDE_TIME = $4 //how many frames to hide the crt shake after the crunch

.const HALF_SPEED_TEXT = true

.const RESET_CURSOR_TO_DEFAULT_ON_PAGEBREAK = true 
.const DEFAULT_CURSOR_Y = 12
.const DEFAULT_CURSOR_X = 4

.const DEFAULT_DELAY_ON_LINEBREAK = 64 //how many frames to wait after a linebreak

.const ENABLE_CHARACTER_BEEP = true
.const ENABLE_NEWPAGE_BEEP = true
.const ENABLE_CURSOR_BEEP = true
.const DEBUG_AUDIO = false //print the sound values to the screen
.const CHARACTER_BEEP_NOTE = $03
.const CHARACTER_BEEP_OCTAVE = 1 //can be 0/1/2

.const NEWPAGE_BEEP_NOTE = $34
.const NEWPAGE_BEEP_OCTAVE = 0 //can be 0/1/2

//$18 / 0 -> ok
//$10 / 2 -> quieter
.const CURSOR_BEEP_NOTE = $18 
.const CURSOR_BEEP_OCTAVE = $0 //1 //can be 0/1/2

.const PROCEDURAL_BEEP_ACTIVE = true

.const INVERT_IMAGES = false

.const ENABLE_SAMPLE_DECRUNCHING = true
.const ENABLE_IMAGES_DECRUNCHING = true

.var source_images_path = "src/data/img/converted/"
.var source_graph_path = "src/data/graph/"

//Delay between colour ramps (frames)
.var forced_decay_offset_list = List().add(
    0,  //img00
    2,  //img01
    0,  //img02
    0,  //img03
    0,  //img04
    0,  //img05
    0,  //img06
    0,  //img07
    0,  //img08
    0,  //img09
    0,  //img10
    0,  //img11
    0,  //img12
    0,  //img13
    0,  //img14
    0,  //img15
    0   //img16
)

//PETSCII Callback hold time (0 = no callback)
.var petscii_callback_delay_list = List().add(
    0,  //img00
    0,  //img01
    0,  //img02
    0,  //img03
    0,  //img04
    0,  //img05
    0,  //img06
    0,  //img07
    0,  //img08
    0,  //img09
    0,  //img10
    0,  //img11
    0,  //img12
    0,  //img13
    0,  //img14
    0,  //img15
    0   //img16
)