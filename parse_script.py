import re

filename = "textwriter/data/script.txt"
text_asm_file = "textwriter/data/script.asm"

f_in = open(filename, "r")
f_out = open(text_asm_file, "w")

text_lines = f_in.read().split("\n")

#print(text)
text_asm = ""
for line in text_lines:
    if "//" in line:
        text_asm += f'{line}\n'
        continue
    
    #Check if line contains commands
    commands = re.findall('(#[A-Z]+[=]?[0-9]?[,]?[0-9]?)',line)
    
    if len(commands) != 0:
        print(f"Found commands in line {line}")
        last_index = 0
        for command in commands:
            index = line.find(command, last_index)
            last_index = index+len(command)
            print(f"{command} with index: {index}")
            print("")

    #Todo: split the line in a sequence of lines / commands
    if len(line) != 0:
        text_asm += f'.text ("{line}")\n' 
        text_asm += f'.byte 0\n'
        text_asm += f':NewLine()\n'
        text_asm += f'\n'
        
        continue
    
#print (text_asm)

f_in.close()

f_out = open(text_asm_file, "w")
f_out.write(text_asm)
f_out.close()