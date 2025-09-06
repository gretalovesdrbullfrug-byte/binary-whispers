# Binary Grid Sketch (Processing)

This project is a **Processing sketch** that converts text phrases into binary and visualizes them as a grid of circles.  
Each phrase from a text file is transformed into its binary representation, then drawn as a grid where each bit is shown as a circle (filled for `1`, outlined for `0`).  
The sketch also exports each visualization as a `.png` image.

---

## ✨ Features
- Reads phrases from a text file (`data/nameofyourfile.txt`).
- Converts text into binary (8-bit per character).
- Draws binary as a grid of cells and circles.
- Generates `.png` images for each phrase automatically.

---

## 📂 Project Structure
 **BinaryGridSketch.pde** → The main code (must have the same name as the folder).  
- **data/nameofyourfile.txt** → A plain text file with the phrases you want to visualize.  

---

## ▶️ How to Run

1. **Download Processing** from [processing.org/download](https://processing.org/download).
2. Open the `text_to_binary.pde` file in the Processing IDE.
3. Make sure your input file is inside the `data/` folder.
4. Click the **Run ▶️ button** in Processing.
5. The sketch will:
   - Display the binary grid for each phrase.
   - Export images as `.png` files (one per phrase).

---

## 📸 Example Output
Each phrase generates a grid like this (binary → circles):  
<img width="1000" height="1000" alt="415" src="https://github.com/user-attachments/assets/3a2fa778-e6f8-4926-931c-f83635514fbf" />
<img width="1000" height="1000" alt="414" src="https://github.com/user-attachments/assets/3d35aea0-7fdd-41ae-aeaa-0b8ff328e4f8" />

## 🛠️ Requirements
- [Processing 4+](https://processing.org/download)

---

## 📜 License
This project is open-source. You’re free to use, modify, and share it.
