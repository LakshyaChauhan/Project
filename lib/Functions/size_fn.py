import os
from flask import Flask, request

app = Flask(__name__)

@app.route('/image-size', methods=['POST'])
def get_image_size():
    if 'image' not in request.files:
        return 'No image file provided', 400

    image_file = request.files['image']
    image_file.save('temp_image.jpg')  # Save the image temporarily

    try:
        # Get the size of the image file
        size = os.path.getsize('temp_image.jpg')
        # Convert the size to a human-readable format
        size_in_kb = size / 1024
        if size_in_kb >= 1024:
            size_in_mb = size_in_kb / 1024
            return f"{size_in_mb:.2f} MB"
        else:
            return f"{size_in_kb:.2f} KB"
    except OSError:
        return "Unknown"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)