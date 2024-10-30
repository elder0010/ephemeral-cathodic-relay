class TsCrunchAddressProcessor():

    #parse file line by line and get only the lines starting with "Output file":
    def get_output_lines(self, file_path):
        lines = []
        with open(file_path, 'r') as file:
            for line in file:
                if line.startswith("Output file"):
                    lines.append(line)
        return lines 
    
    def write_addresses(self, lines, list_name, output_file_path):
        addresses = []
        for line in lines:
            address = (line.split(", ")[1]).split(" - ")[0].strip()
            addresses.append(address)

        with open(output_file_path, 'w') as file:
            file.write(f'.var {list_name} = List().add(')
            file.write( ",".join(addresses))
            file.write(')')

        print("Generated address file: ", output_file_path)
        return addresses
    

tscrunch = TsCrunchAddressProcessor()

#Generate the list of addresses for the samples
lines = tscrunch.get_output_lines("src/data/sfx/tsx/tscrunch_out.txt")
addresses = tscrunch.write_addresses(lines, "samples_load_address_list", "src/data/sfx/tsx/samples_load_address_list.asm")

#Generate the list of addresses for the samples
lines = tscrunch.get_output_lines("src/data/img/tsx/tscrunch_out.txt")
addresses = tscrunch.write_addresses(lines, "images_load_address_list", "src/data/img/tsx/images_load_address_list.asm")