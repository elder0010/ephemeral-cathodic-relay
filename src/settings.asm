.const ROWS = 25
.const COLS = 80

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

.const CHARACTER_BEEP_NOTE = $ff
.const CHARACTER_BEEP_OCTAVE = 0 //can be 0/1/2

.const NEWPAGE_BEEP_NOTE = $a0
.const NEWPAGE_BEEP_OCTAVE = 0 //can be 0/1/2

.const CURSOR_BEEP_NOTE = $1
.const CURSOR_BEEP_OCTAVE = 1 //can be 0/1/2