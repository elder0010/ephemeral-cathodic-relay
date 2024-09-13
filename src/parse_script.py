import re

filename = "src/data/script.txt"
text_asm_file = "src/data/script.asm"
commands_asm_file = "src/data/commands.asm"

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
            
            line_without_commands = re.sub(r'(#[A-Z]+[=]?[0-9|,]*+[0-9]*#)', '', line)
            #print(f"Commands: {commands}")
            command_index_delta = 0
            if len(commands) != 0:
                #print(f"Found commands in line {line}")
                last_index = 0
                
                for command in commands:
                    index = line.find(command, last_index)
                    
                    last_index = index+len(command)

                    #data structure is a list of tuples with the command, page, line and index (in the line)
                    pages_commands_indexes[f"page_{current_page}"].append((command, current_page, line_ct, index-command_index_delta))
                    #print(f"{command} with index: {index-command_index_delta}")
                    command_index_delta += len(command)

                    if command == "#PAGE#":
                        current_page += 1
                        line_ct = -1
                        pages_commands_indexes[f"page_{current_page}"] = []

            split_line = []

            #print(f"Command indexes: {command_indexes}")

            #split_line will contain the line split (excluding the commands)
          
            text_asm += f'.text ("{line_without_commands.rstrip()}")\n'
            text_asm += f'.byte 0\n\n'
            line_ct += 1
        f_in.close()

        f_out = open(text_asm_file, "w")
        f_out.write(text_asm)
        f_out.close()

        return pages_commands_indexes
    

    def get_asm_command(self, command_string):
        found = False 
        command_string = command_string.replace("#", "")

        if ("SETPOS" in command_string):
            found = True
            command = f':SetPos({command_string.split("=")[1]})'
            #print (f"Command: {command}")

        if ("PAGE" in command_string):
            found = True
            command = f':Page()'
            #print (f"Command: {command}")

        if ("DELAY" in command_string):
            found = True
            command = f':Delay({command_string.split("=")[1]})'
            #print (f"Command: {command}")
        
        if ("IMAGE" in command_string):
            found = True
            command = f':Image({command_string.split("=")[1]})'
            #print (f"Command: {command}")

        if ("SETMARGIN" in command_string):
            found = True
            command = f':SetMargin({command_string.split("=")[1]})'

        if ("END" in command_string):
            found = True
            command = f':End()'

        if not found:
            raise Exception("Invalid command in script: " + command_string)
        
        return command

    def prepare_commands_file(self, pages_commands_indexes):

        print("--------------------")
        sequence_commands = []
        sequence_pages = []
        sequence_lines = []
        sequence_indexes = []

        for page in pages_commands_indexes:
            #print (f"Page: {page}")
            commands = pages_commands_indexes[page]
            #print (f"Commands: {commands}")
            for command in commands:
               # print (f"Command string: {command}")
                sequence_commands.append(self.get_asm_command(command[0]))
                sequence_pages.append(command[1])
                sequence_lines.append(command[2])
                sequence_indexes.append(command[3])
        
        print (f"Sequence commands: {sequence_commands}")
        print (f"Sequence pages: {sequence_pages}")
        print (f"Sequence lines: {sequence_lines}")
        print (f"Sequence indexes: {sequence_indexes}")

        commands_asm = f".const COMMANDS_NUMBER={len(sequence_commands)}\n"

        commands_asm += '\n.pc=commands_data "Commands data"\n'
        commands_asm += "\n//commands sequence\n"
        commands_asm += f'commands_sequence:\n'
        for i in range(len(sequence_commands)):
            commands_asm += f'{sequence_commands[i]}\n'

        commands_asm += "\n//pages sequence\n"
        commands_asm += f'commands_pages:\n'
        for i in range(len(sequence_pages)):
            commands_asm += f'.byte {sequence_pages[i]}\n'

        commands_asm += "\n//lines sequence\n"
        commands_asm += f'commands_lines:\n'
        for i in range(len(sequence_lines)):
            commands_asm += f'.byte {sequence_lines[i]}\n'

        commands_asm += "\n//indexes sequence\n"
        commands_asm += f'commands_indexes:\n'
        for i in range(len(sequence_indexes)):
            commands_asm += f'.byte {sequence_indexes[i]}\n'

        f_out = open(commands_asm_file, "w")
        f_out.write(commands_asm)
        f_out.close()
        return commands


pages_commands_indexes = ScriptParser().parse_text()
commands = ScriptParser().prepare_commands_file(pages_commands_indexes)
            
#print(pages_commands_indexes)
