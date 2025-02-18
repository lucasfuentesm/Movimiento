float[] xPositions;
float[] yPositions;


float[] xSpeeds;
float[] ySpeeds;

void setup() {
  size(800, 800);
  background(0);
  noStroke();
  colorMode(HSB, 360, 100, 100);  // Usamos el modo HSB para los colores
  
  // Número de círculos que aparencen en la pantalla
  int Circulos = 200; 

  // Definir tamaño del arreglo
  xPositions = new float[Circulos];
  yPositions = new float[Circulos];
  xSpeeds = new float[Circulos];
  ySpeeds = new float[Circulos];

  for (int i = 0; i < Circulos; i++) {
    // Inicializamos nuestra burbuja en la mitad de la pantalla
    xPositions[i] = width / 2;
    yPositions[i] = height / 2;
    xSpeeds[i] = random(-2, 2);
    ySpeeds[i] = random(-5, 2);
  }
}

void draw() {
  background(0); 

  for (int i = 0; i < xPositions.length; i++) {
    // Color basado en la posición en X
    float colorCirculos = map(xPositions[i], 0, width, 0, 360);
    fill (colorCirculos, 80, 100);

    // Dibujar el círculo
    ellipse(xPositions[i], yPositions[i], 50, 50);

    // Mover el círculo
    xPositions[i] += xSpeeds[i];
    yPositions[i] += ySpeeds[i];

    // Rebotar en los bordes
    if (xPositions[i] < 0 || xPositions[i] > width) {
      xSpeeds[i] *= -1;
    }
    if (yPositions[i] < 0 || yPositions[i] > height) {
      ySpeeds[i] *= -1;
    }
  }
}
