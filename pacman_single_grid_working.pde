int radius = 10; // Bestemmer radiussen på pacman mund
int direction = 1; 
int direction2 = 0;
int hastighed = 20; 

// Buus er en fucking chef

float x = 280;
float y = 280;

void setup() {
  size(560, 560);
  ellipseMode(RADIUS);
  frameRate(8);
}

void draw() {
  background(255);
  smooth ();
  noStroke();
  bane();
  retning();
  //render();
  tjekkanter();
  fill(255,255,0);
  circle(x,y,10);
}

void retning() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      x = x - hastighed;
      direction = -1;
      direction2 = 0;
    } else if (keyCode == RIGHT) {  
      x = x + hastighed;
      direction = 1;
      direction2 = 0;
    } else if (keyCode == UP) {
      y = y - hastighed;
      direction = 0;
      direction2 = -1;
    } else if (keyCode == DOWN) { 
      y = y + hastighed;
      direction = 0;
      direction2 = 1;
    }
  }
}


void render() {
  for ( int i=-1; i < 2; i++) {
    for ( int j=-1; j < 2; j++) {
      //Bestemmer hvilken retning pacman kigger mod ved hjælp af PI funktionen som man kan rotere med de andre PI funktioner
      if ( direction == -1) { 
        rotate(PI);
      }
      if ( direction2 == 1) { 
        rotate(HALF_PI);
      }
      if ( direction2 == -1) { 
        rotate( PI + HALF_PI );
      }
      //Bestemmer størrelsen på pacmans mund ved hjælp af en arc
      fill(255, 255, 0);
      arc(x,y, radius, radius, map((millis() % 500), 0, 500, 0, 0.52), map((millis() % 500), 0, 500, TWO_PI, 5.76) );
      println(x,y);

    }
  }
}



void bane() {
  for (int i = 15; i < width - 10; i = i+20) {
    for (int j = 15; j < height - 10; j = j+20) {
      fill(0);
      rect(i, j, 10, 10);
    }
  }
}

void tjekkanter() {
  //Tjekker for om pacman går over kanten
  if (x > width - 20) {
    x = width - 20;
  } else if (x < 20) {
    x = 20;
  }
  if (y > height - 20) {
    y = height - 20;
  } else if (y < 20) {
    y = 20;
  }
}
