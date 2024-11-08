import glob

class PetsciiProcessor:
    images = []
    BLANK_CHAR = "32" 
   # PETSCII_SCREEN = 34816 #0x8800
    PETSCII_SCREEN = 0x8800

    def __init__(self):
        self.get_images()

    def get_images(self):
        print("Source PETSCII list:")
        self.images = glob.glob('src/data/petscii/source/*.c')
        print(self.images)
        return True
    
    def get_row_values(self, row, row_index):
        res = {}

        base_offset = row_index * 80 

        for i in range(0, len(row)):
            value = row[i]
            if value != self.BLANK_CHAR:
                res['$%x' %(base_offset+i+self.PETSCII_SCREEN)] = value

        return res
    
    def process(self, image_path, image_index):
        
        skip_lines = [0,26,27]
        data = []
        with open(image_path, 'r') as file:
        # Read each line in the file
            line_number = 0
            row_index = 0
            for line in file:
                # Print each line

                if line_number not in skip_lines:
                    row_values = line.strip().split(',')[:-1]
                    row_data = self.get_row_values(row_values, row_index)
                    row_index += 1
                    
                    if(len(row_data) > 0):
                        data.append(row_data)


                line_number += 1
                #print(line.strip())

        #print(data)

        #dest_path = f"src/data/images/converted/img_{image_index:02}.png"
        #dest_image.save( dest_path )
        #print(f"Converted image saved to: {dest_path}")
        #print(" ")
        return data
    def generate_asm(self, data, image_index):
        header = f"//PETSCII image {image_index}\n"
        address_list = ".var petscii_address_list = List()\n"
        values_list = ".var petscii_values_list = List()\n"

        for row in data:
            for key in row:
                #print(f"{key} = {row[key]}")
                address_list += f".eval petscii_address_list.add({key})\n"
                values_list += f".eval petscii_values_list.add({row[key]})\n"
            #print("")
        
        #print (address_list)
        #print (values_list)
        with open(f"src/data/petscii/converted/petscii_{image_index:02}.asm", "w") as file:
            file.write(header)
            file.write(address_list)
            file.write("\n")
            file.write(values_list)
            file.close()

        
        pass
petscii_processor = PetsciiProcessor()
for i in range(0, len(petscii_processor.images)):
    print("Processing PETSCII:", petscii_processor.images[i])
    data = petscii_processor.process(petscii_processor.images[i], i)
    petscii_processor.generate_asm(data, i)
