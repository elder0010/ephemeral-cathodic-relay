//page 00
.text ("#SETPOS=0,0#")
.byte 0
:NewLine()

.text ("Hey")
.byte 0
:NewLine()

.text ("It's me, ")
.byte 0
:NewLine()

.text ("I really really hope you still got that one I left you, down there.")
.byte 0
:NewLine()

.text ("Well, if you're reading this it means you still have that 8296.")
.byte 0
:NewLine()

.text ("When I said it was built like a tank I was dead serious.")
.byte 0
:NewLine()

.text ("How ironic: history's first personal computer happens to be the last one working.")
.byte 0
:NewLine()

.text ("I have two news for you")
.byte 0
:NewLine()

.text ("First one is bad.#DELAY=20# Very bad.#DELAY=20#")
.byte 0
:NewLine()

.text ("They are on us. ")
.byte 0
:NewLine()

.text ("They managed to read every data, every image to predict our intentions ")
.byte 0
:NewLine()

.text ("They still don't have pictures of me, but they know that I exist. ")
.byte 0
:NewLine()

.text ("The last photo you got from me was the last one you'll ever have until we manage to meet again in person.")
.byte 0
:NewLine()

.text ("Second one: ")
.byte 0
:NewLine()

.text ("I like to think out of the box and I found a way to send you pictures of me anyway. ")
.byte 0
:NewLine()

.text ("Images that those machines can't see nor understand.")
.byte 0
:NewLine()

.text ("It's a little invention of mine.")
.byte 0
:NewLine()

.text ("I like to call them")
.byte 0
:NewLine()

//page 01
.text ("#NEWPAGE#")
.byte 0
:NewLine()

.text ("EPHEMERAL #DELAY=20# CATHODIC #DELAY=20# RELAY #DELAY=40#")
.byte 0
:NewLine()

.text ("t's ECR for short. 🙂")
.byte 0
:NewLine()

.text ("This bulky, gorgeous display of yours is a very powerful device and hides an incredible feature.")
.byte 0
:NewLine()

.text ("Even if a 8296 PET has no graphic modes and  only display characters with a 1 bit colour depth")
.byte 0
:NewLine()

.text ("I found a way to take advantage of the cathodic falloff of its CRT display")
.byte 0
:NewLine()

.text ("the 8296 tube is painted with unusually slow phosphors ")
.byte 0
:NewLine()

.text ("look how slow it is to make the cursor really disappear #DELAY=80#")
.byte 0
:NewLine()

.text ("Can you count how many shades of green you see before it disappears? #DELAY=80#")
.byte 0
:NewLine()

.text ("You can't!")
.byte 0
:NewLine()

.text ("They are endless, it's a true, non linear analog fade out ")
.byte 0
:NewLine()

.text ("That's where my idea came in.")
.byte 0
:NewLine()

.text ("I measured time and light of that fade out")
.byte 0
:NewLine()

.text ("and I made a conversion routine that converts time in a grayscale value")
.byte 0
:NewLine()

.text ("It's called the Cathodic Exposure Chart, CEC.")
.byte 0
:NewLine()

.text ("(Love high tech acronyms)")
.byte 0
:NewLine()

.text ("#IMAGE=0,500#")
.byte 0
:NewLine()

//page 02
.text ("Let's say that I want to represent 4 specific shades of gray")
.byte 0
:NewLine()

.text ("I just have to delay the character tracing by a specific amount of time to set the correct exposure")
.byte 0
:NewLine()

.text ("0#DELAY=40#1#DELAY=40#2#DELAY=40#3#DELAY=40#")
.byte 0
:NewLine()

.text ("Now I can exploit the phosphor falloff to act as an analog grayscale image generator")
.byte 0
:NewLine()

.text ("look at this example, it will be much easier to understand:")
.byte 0
:NewLine()

.text ("#IMAGE=1,500#")
.byte 0
:NewLine()

.text ("See? ")
.byte 0
:NewLine()

.text ("It's just done by sweeping a single line from the top to the bottom of the screen.")
.byte 0
:NewLine()

.text ("there are way more gray levels than we could achieve back in 2024 with those shitty RTX cards")
.byte 0
:NewLine()

.text ("This one is a horizontal one, look at the 80 columns in all of their glory!")
.byte 0
:NewLine()

.text ("#IMAGE=2,500#")
.byte 0
:NewLine()

.text ("You can achieve any kind of shading, just by delaying the brighter areas of the image")
.byte 0
:NewLine()

.text ("#IMAGE=3,500#")
.byte 0
:NewLine()

.text ("The only limit is that images are, as the name implies, ephemeral.")
.byte 0
:NewLine()

.text ("I thought that could be a problem with more complex images so I started to test this on some simple renders")
.byte 0
:NewLine()

