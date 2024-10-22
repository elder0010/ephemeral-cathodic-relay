//page 00
.text ("")
.byte 0

.text ("Hey.")
.byte 0

//page 01
.text ("")
.byte 0

.text ("It's me.")
.byte 0

.text ("")
.byte 0

//page 02
.text ("")
.byte 0

.text ("I really REALLY hope you still got that one I left you, down there.")
.byte 0

//page 03
.text ("")
.byte 0

.text ("Well, if you’re reading this it means you survived the drone strike and that you still have that 8296.")
.byte 0

//page 04
.text ("")
.byte 0

.text ("When I said it was built like a tank I was dead serious.")
.byte 0

//page 05
.text ("")
.byte 0

.text ("How ironic, history’s first personal computer happens to beone of the last ones still working.")
.byte 0

//page 06
.text ("")
.byte 0

.text ("Now, let's get to work.I have two news for you.")
.byte 0

//page 07
.text ("")
.byte 0

.text ("First one is bad.")
.byte 0

//page 08
.text ("")
.byte 0

.text ("Very bad.")
.byte 0

//page 09
.text ("")
.byte 0

.text ("They are on us.")
.byte 0

//page 10
.text ("")
.byte 0

.text ("They managed to read every data, every image to predict our intentions")
.byte 0

//page 11
.text ("")
.byte 0

.text ("They still don’t have pictures of me, but they know that I exist.")
.byte 0

//page 12
.text ("")
.byte 0

.text ("The last photo you got from me was the last one you’ll ever have until we manage to meet again in person.")
.byte 0

//page 13
.text ("")
.byte 0

.text ("Second one:")
.byte 0

//page 14
.text ("")
.byte 0

.text ("I like to think out of the boxI found a way we can send each other pictures anyway.")
.byte 0

//page 15
.text ("")
.byte 0

.text ("Images that those stupid machines can’t see nor recognize.")
.byte 0

//page 16
.text ("")
.byte 0

.text ("A little invention of mine.")
.byte 0

//page 17
.text ("")
.byte 0

.text ("I like to call it")
.byte 0

//page 18
.text ("")
.byte 0

.text ("EPHEMERALCATHODICRELAY")
.byte 0

//page 19
.text ("")
.byte 0

.text ("It's E.C.R., for short :)")
.byte 0

//page 20
.text ("")
.byte 0

.text ("TLDR: This bulky, gorgeous display of yours is a very powerful device.It hides an incredible feature.A feature that was overlooked for more than 50 years.")
.byte 0

//page 21
.text ("")
.byte 0

.text ("Even if a 8296 PET has no graphic modesand only displays characters with a 1 bit colour depth")
.byte 0

//page 22
//#PAGE#
//#SETMARGIN=12,04##DELAY=16#I found a way to take advantage of the cathodic falloff of its CRT display.#DELAY=64#
//page 23
.text ("")
.byte 0

.text ("The 8296 tube is painted with unusually slow phosphors.")
.byte 0

//page 24
.text ("")
.byte 0

.text ("Look how slow it is to make the cursor really disappear.")
.byte 0

//page 25
.text ("")
.byte 0

.text (".")
.byte 0

//page 26
.text ("")
.byte 0

.text ("Can you count how many shades of green you see before it disappears?")
.byte 0

//page 25
.text ("")
.byte 0

.text ("....")
.byte 0

//page 26
.text ("")
.byte 0

.text ("You can’t!")
.byte 0

//page 27
.text ("")
.byte 0

.text ("They are endless, it’s a true, non linear, analog fade out.")
.byte 0

//page 28
.text ("")
.byte 0

.text ("That’s where my idea came in.")
.byte 0

//page 29
.text ("")
.byte 0

.text ("I analyzed every aspect of that fade out...")
.byte 0

//page 30
.text ("")
.byte 0

.text ("...and made a conversion routine that converts")
.byte 0

//page 31
//#PAGE#
//#SETMARGIN=012,38##DELAY=16#T I M E#DELAY=64#
////page 32
//#PAGE#
//#SETMARGIN=011,38##DELAY=16#into#SETMARGIN=012,35##DELAY=16#L I G H T.#DELAY=128#
////page 33
//#PAGE#
//#SETMARGIN=012,04##DELAY=16#It’s called the CATHODIC EXPOSURE CHART, C.E.C.#DELAY=64##SETMARGIN=013,04#(yeah, I really love high tech acronyms)#DELAY=64# 
//page 34
.text ("")
.byte 0

.text ("TEMP: SCALA TEMPO E GRIGI")
.byte 0

//page 35
.text ("")
.byte 0

.text ("Let’s say that I want to represent 4 specific shades of gray.")
.byte 0

//page 36
.text ("")
.byte 0

.text ("I just have to delay the character tracing by a specific amount of timeto set the correct exposure.")
.byte 0

.text ("")
.byte 0

//page 37
.text ("")
.byte 0

.text ("1234")
.byte 0

//page 38
.text ("")
.byte 0

.text ("Now I can exploit the phosphor falloff,use it as an analog grayscale image generator")
.byte 0

//page 39
.text ("")
.byte 0

.text ("Look at this example, it will be much easier to understand:")
.byte 0

//page 40 GRADIENT V
.text ("")
.byte 0

//page 41
.text ("")
.byte 0

.text ("See?")
.byte 0

//page 42
.text ("")
.byte 0

.text ("It’s just done by sweeping a single linefrom the top to the bottom of the screen.")
.byte 0

//page 43
.text ("")
.byte 0

.text ("There are way more gray levels than we could achieveback in 2024 with those shitty RTX cards")
.byte 0

//page 44
.text ("")
.byte 0

.text ("This one is a horizontal one,look at the 80 columns in all of their glory!")
.byte 0

//page 45 GRADIENT H
.text ("")
.byte 0

//page 46
.text ("")
.byte 0

.text ("You can achieve any kind of shading,just by delaying the brighter areas of the image")
.byte 0

//page 46 GRADIENT R
.text ("")
.byte 0

//page 47
.text ("")
.byte 0

.text ("The only limit is that images are, as the name implies,ephemeral.")
.byte 0

//page 48
.text ("")
.byte 0

.text ("I thought that could be a problem with more complex imagesso I started to test this on some simple renders.")
.byte 0

//page 49 SPHERE
.text ("")
.byte 0

//page 50
.text ("")
.byte 0

.text ("I was blown away:it worked!")
.byte 0

//page 51
.text ("")
.byte 0

.text ("The falloff time is just enough to appreciate the imagesand that peculiar 8296 scanline surely helps fooling the eye!")
.byte 0

//page 52
.text ("")
.byte 0

.text ("Now that I think about it...you can even export em with your analog camera...or using any other photographic process.")
.byte 0

//page 53
.text ("")
.byte 0

.text ("E.C.R. are the new daguerrotypes!")
.byte 0

//page 54 SKULL
.text ("")
.byte 0

//page 55
//#PAGE#
//#SETMARGIN=012,04##DELAY=16#That was scary,#DELAY=32# :)#DELAY=64#
//page 56
.text ("")
.byte 0

.text ("When they are about to fade away they look like a ghost,trapped in the machine, do they?")
.byte 0

//page 57
.text ("")
.byte 0

.text ("Try to snap a photo of the next picture.")
.byte 0

//page 58
.text ("")
.byte 0

.text ("Ready?")
.byte 0

//page 59 PET
.text ("")
.byte 0

//page 60
.text ("")
.byte 0

.text ("Hahaha, that was META AF, right?")
.byte 0

//page 61
.text ("")
.byte 0

.text ("When those cyber fucks will analyze this software I sent youthey will find nothing. No patterns to exploit.")
.byte 0

//page 62
.text ("")
.byte 0

.text ("Just meaningless, random 1 bit character.Scattered all over the place")
.byte 0

//page 63
.text ("")
.byte 0

.text ("Even emulating this very machinethey will never understand what this is all about.")
.byte 0

//page 64
.text ("")
.byte 0

.text ("It’s a world first, now go try to find that in your datasets, statistical zombies.")
.byte 0

//page 65 GNGZOMBIE
.text ("")
.byte 0

//page 66
.text ("")
.byte 0

.text ("Sorry, I got carried :)")
.byte 0

//page 67
.text ("")
.byte 0

.text ("Back to our mission:")
.byte 0

//page 68
.text ("")
.byte 0

.text ("this is the code you need to open that server case.")
.byte 0

//page 69
.text ("")
.byte 0

.text ("I will now display it in a noise generated E.C.R. take a note in a safe place:")
.byte 0

//page 70 ELDER0010
.text ("")
.byte 0

//page 71
.text ("")
.byte 0

.text ("Ok, now that we discovered a safe way to communicate...")
.byte 0

//page 72
.text ("")
.byte 0

.text ("...we’re done with the boring stuff.")
.byte 0

//page 73
.text ("")
.byte 0

.text ("Today we have a pretty amazing sky, up here:")
.byte 0

//page 74 SKY
.text ("")
.byte 0

//page 75
.text ("")
.byte 0

.text ("Sun is still a bright shining star.")
.byte 0

//page 76 HAND
.text ("")
.byte 0

//page 77
.text ("")
.byte 0

.text ("The world outside is still worth your battlefor independent digital information.")
.byte 0

//page 78 FLOWER
.text ("")
.byte 0

//page 79 ROME
.text ("")
.byte 0

//page 80 ROME
.text ("")
.byte 0

//page 81 TREE
.text ("")
.byte 0

//page 82
.text ("")
.byte 0

.text ("I know it’s hard to keep sane when everything around youis an artificial mockery.")
.byte 0

//page 83
.text ("")
.byte 0

.text ("But please, please don’t give up.")
.byte 0

//page 84
.text ("")
.byte 0

.text ("You are our last resort.")
.byte 0

//page 85
.text ("")
.byte 0

.text ("Drones are almost here, we gotta move.")
.byte 0

//page 86
.text ("")
.byte 0

.text ("I’ll leave you with the last trick: if you squint a little bit it works even better.")
.byte 0

//page 86
.text ("")
.byte 0

.text ("Try that, now.")
.byte 0

//page 87 TREE
.text ("")
.byte 0

//page 88
.text ("")
.byte 0

.text ("I love you.")
.byte 0

//page 89
.text ("")
.byte 0

.text ("XXX")
.byte 0

.text ("")
.byte 0

