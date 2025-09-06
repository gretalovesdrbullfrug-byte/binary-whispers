# Binary Whisper Decoder

A small web app to decode binary messages hidden in square grid images (e.g. 1000×1000 px black/white “whispers”).

[Working version](https://gretalovesdrbullfrug-byte.github.io/binary-whispers/)


## Features
- Drag & drop or click to upload an image.
- Adjustable **Cells per line**, **Inner ratio**, and **Threshold bias** for fine-tuning.
- Supports **row-major** and **column-major** reading orders.
- Tests both **dark=1** and **light=1** detection modes.
- Auto-detects best **bit offset** alignment.
- Decodes to **ASCII text** (English), with:
  - Printable characters shown directly.
  - Non-ASCII bytes shown as `·` placeholders so you can see where decoding failed.

## Usage
1. Open [`index.html`](index.html) in your browser.
2. Drag & drop a square grid image (e.g. 1000×1000 px) into the drop zone.
3. Adjust parameters in the top control bar if the message is not clear.
4. The decoded message and debug info will appear in a modal popup.

## Controls
- **Cells/line** → number of grid cells horizontally (image is assumed square).
- **Inner ratio** → ignores the grid line borders and samples only the inner part of each cell. Decrease inner ratio, for better results. Big phrase inner ratio = 0.67
- **Threshold bias** → shifts brightness detection up or down if black/white contrast is weak.
- **Order** → choose row-major, col-major, or auto detection.
- **Offset bits** → manually adjust bit alignment (0–7) if auto detection fails.

## Hosting
You can host this page easily:
- **Local**: just double-click `index.html` to open in your browser.
- **GitHub Pages**: push this repo to GitHub and enable Pages in repo settings.

## License
MIT — free to use, modify, and share.
