String[] frases;           // every text in file
int idxFrase = 0;          // index actual text
String binario = "";       // binary code
color corCirculo;          // unique colour
boolean pronto = false;    // only draw after load

void setup() {
  size(1000, 1000);
  background(#f5f5f5);
  corCirculo = color(random(50, 255), random(50, 255), random(50, 255));
  
  // Read every text in file
  // Put text file in the folder "data" of the sketch
  frases = loadStrings("nameofyourfile.txt"); //add the name of your file here
  
  // Filter empty lines (=== ...)
  ArrayList<String> lista = new ArrayList<String>();
  for (String l : frases) {
    l = l.trim();
    if (l.length() > 0 && !l.startsWith("===")) {
      lista.add(l);
    }
  }
  frases = lista.toArray(new String[lista.size()]);
  
  println("Total of phrases loaded: " + frases.length);
  
  // begins with the first phrase
  processarFraseAtual();
}

void draw() {
  if (pronto) {
    background(#f5f5f5);
    desenharGrid();
    noLoop();
    //saveFrame("whisper-####.png");   // exports numbered PNG (choose this or bellow)
    saveFrame(nomeFicheiro(frases[idxFrase]));   // exports PNG with phrase
    delay(1000);
    proximaFrase();
  }
}

// processs the actual phrase (converts it in binary and defines Ok)
void processarFraseAtual() {
  if (idxFrase >= frases.length) {
    println("Todas as frases processadas!");
    return;
  }
  binario = fraseParaBinario(frases[idxFrase]);
  corCirculo = color(random(50, 255), random(50, 255), random(50, 255));
  pronto = true;
}

// moves to next phrase
void proximaFrase() {
  idxFrase++;
  if (idxFrase < frases.length) {
    pronto = false;
    loop();
    processarFraseAtual();
  } else {
    println("Done!");
  }
}

// converts phrase in a binary string
String fraseParaBinario(String f) {
  String bin = "";
  for (int i=0; i<f.length(); i++) {
    int c = f.charAt(i);
    String b = binary(c, 8);  // every char = 8 bits
    bin += b;
  }
  return bin;
}

// creates valid file for each phrase
String nomeFicheiro(String f) {
  String nome = f.trim().toLowerCase();
  nome = nome.replaceAll("\\s+", "_");           // spaces -> underscore
  nome = nome.replaceAll("[^a-zA-Z0-9_-]", "");  // removes punctuation marks and symbols
  if (nome.length() == 0) nome = "saida";        // fallback to empty
  return nome + ".png";
}

// creates grid
void desenharGrid() {
  int n = binario.length();

  int cols = ceil(sqrt(n));
  int rows = ceil(n / float(cols));

  float cellW = width / float(cols);
  float cellH = height / float(rows);
  float diam = min(cellW, cellH) * 0.6;

  stroke(#050505);   // fix color in grid
  for (int r=0; r<rows; r++) {
    for (int c=0; c<cols; c++) {
      int idx = r * cols + c;
      float x = c * cellW;
      float y = r * cellH;

      // célula
      noFill();
      rect(x, y, cellW, cellH);

      // draws circle if has bit
      if (idx < n) {
        char bit = binario.charAt(idx);
        if (bit == '1') {
          stroke(corCirculo);
          fill(corCirculo);
        } else {
          stroke(corCirculo);
          noFill();
        }
        ellipse(x + cellW/2, y + cellH/2, diam, diam);
        stroke(#050505);  // volta a cor da grelha
      }
    }
  }
}
