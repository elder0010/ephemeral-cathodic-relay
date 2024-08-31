.const basic_upstart = $401
.const VIA_PORT_B = $e840
.var screen = $8000

.const WHITE_PIXEL = $e0 
.const BLACK_PIXEL = $20 

.const colour = $14

.const square_ct = $15

.const square_x = $15 
.const square_y = $16 
.const erased_sq = $30

.const img_src = $16    //word
.const screen_dst = $18 //word

.const square_addr_zp = $16 //word

.const delays_cnt = $1a //word 
.const delays_max = $1c //word