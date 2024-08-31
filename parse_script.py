import re

filename = "textwriter/data/script.txt"
text_asm_file = "textwriter/data/script.asm"


class ScriptParser:

    def parse_text(self):
        f_in = open(filename, "r")
        f_out = open(text_asm_file, "w")

        text_lines = f_in.read().split("\n")

        pages_commands_indexes = {}
        current_page = 0

        pages_commands_indexes[f"page_{current_page}"] = []

        #print(text)
        text_asm = ""
        line_ct = 0

        for line in text_lines:
            #print("--------------------")
            if "//" in line:
                text_asm += f'{line}\n'
                continue
            
            #Check if line contains commands
            commands = re.findall('(#[A-Z]+[=]?[0-9|,]*+[0-9]*#)',line)
            
            #print(f"Commands: {commands}")
            command_index_delta = 0
            if len(commands) != 0:
                #print(f"Found commands in line {line}")
                last_index = 0
                
                for command in commands:
                    index = line.find(command, last_index)
                    
                    last_index = index+len(command)
                    pages_commands_indexes[f"page_{current_page}"].append((command, current_page, line_ct, index-command_index_delta))
                    #print(f"{command} with index: {index-command_index_delta}")
                    command_index_delta += len(command)

                    if command == "#PAGE#":
                        current_page += 1
                        line_ct = 0
                        pages_commands_indexes[f"page_{current_page}"] = []

            split_line = []

            #print(f"Command indexes: {command_indexes}")

            #split_line will contain the line split (excluding the commands)
            if len(commands) > 0:
                partial_string = ""
                partial_string_started = True
                for i in range(len(line)):
                    char = line[i]
                    if char != "#" and partial_string_started: #If we are in a partial string, command not started
                        partial_string += char
                        continue
                    elif char == "#": #command started or ended
                        if partial_string_started: #command started
                            split_line.append(partial_string)
                            partial_string = ""
                            partial_string_started = False
                        else: #command ended
                            partial_string_started = True
                            continue
            else:
                split_line.append(line)

            for i in range(len(split_line)):
                text_asm += f'.text ("{split_line[i].rstrip()}")\n' 
                text_asm += f'.byte 0\n'
                #text_asm += f':NewLine()\n'
                text_asm += f'\n'
            
            line_ct += 1
        f_in.close()

        f_out = open(text_asm_file, "w")
        f_out.write(text_asm)
        f_out.close()

        return pages_commands_indexes

pages_commands_indexes = ScriptParser().parse_text()
            
print(pages_commands_indexes)
