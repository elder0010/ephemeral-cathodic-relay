#pads the sound effects files to the same size by adding null bytes
import os
import glob

class SfxPadder:
    def __init__(self, folder_path):
        self.folder_path = folder_path
        self.padded_folder_path = os.path.join(folder_path, "padded")
        os.makedirs(self.padded_folder_path, exist_ok=True)

    def pad_files(self):
        files = glob.glob(os.path.join(self.folder_path, "*.raw"))
        max_size = max(os.path.getsize(f) for f in files)

        for file_path in files:
            file_name = os.path.basename(file_path)
            padded_file_path = os.path.join(self.padded_folder_path, file_name)
            with open(file_path, 'rb') as f:
                data = f.read()
            with open(padded_file_path, 'wb') as f:
                f.write(data.ljust(max_size, b'\x00'))

        print(f"All samples files padded to {max_size} bytes and saved in {self.padded_folder_path}")

sfx_folder = "src/data/sfx/raw"
sfx_padder = SfxPadder(sfx_folder)
sfx_padder.pad_files()