

CRT_BLOCK_WIDTH = 8
CRT_BLOCK_HEIGHT = 18

CONVERTED_WIDTH = 80
CONVERTED_HEIGHT = 25

from PIL import Image
from PIL import ImageOps
import glob
print(glob.glob('src/data/images/source/*.png'))


class ImageConverter:
    images = []
    def __init__(self):
        self.get_images()

    def get_images(self):
        print("Source images list:")
        self.images = glob.glob('src/data/images/source/*.png')
        print(self.images)
        return True
    
    def get_pixels_value(self, image_path, image_index):
        # creating a image object
        source_image = Image.open(image_path).convert('RGB')
        source_image = ImageOps.invert(source_image)
        source_pixels = source_image.load()

        destination_image = Image.new('RGBA', (CONVERTED_WIDTH, CONVERTED_HEIGHT), (0, 0, 0, 255))
        destination_pixels = destination_image.load()


        for y in range(0, CONVERTED_HEIGHT):
            for x in range(0, CONVERTED_WIDTH):
                block_x = x*CRT_BLOCK_WIDTH
                block_y = y*CRT_BLOCK_HEIGHT

                destination_pixels[x, y] = source_pixels[block_x, block_y]

        dest_path = f"src/data/images/converted/img_{image_index:02}.png"

        

        destination_image.save(dest_path)
        print(f"Converted image saved to {dest_path}")

image_converter = ImageConverter()

for i in range(0, len(image_converter.images)):
    image_converter.get_pixels_value(image_converter.images[i], i)