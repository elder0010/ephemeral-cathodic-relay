from PIL import Image
from PIL import ImageOps
import glob

INVERT_IMAGES = False

class ImageProcessor:
    images = []
    def __init__(self):
        self.get_images()

    def get_images(self):
        print("Source images list:")
        self.images = glob.glob('src/data/img/original/linear/*.png')
        print(self.images)
        return True
    
    def invert(self, image_path, image_index):
        source_image = Image. open ( image_path ).convert('RGB', palette=Image.ADAPTIVE)

        if INVERT_IMAGES:
            dest_image = ImageOps.invert(source_image)
        else:
            dest_image = source_image

        dest_path = f"src/data/img/converted/img_{image_index:02}.png"
        dest_image.save( dest_path )
        print(f"Converted image saved to: {dest_path}")
        print(" ")

image_converter = ImageProcessor()
for i in range(0, len(image_converter.images)):
    print("Processing image: ", image_converter.images[i])
    image_converter.invert(image_converter.images[i], i)

