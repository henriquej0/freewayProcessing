boolean moveCima, moveBaixo, moveDireita, moveEsquerda;
class Player {
  PImage img;
  float x;
  float y;
  float larg;
  float alt;
  float velocidade;
  String imgName;

  Player(float larg, float alt, float velocidade, String imgName) {
    this.larg = larg;
    this.alt = alt;
    this.velocidade = velocidade;
    img = loadImage(imgName);
    y = yMundo + alturaMundo - alt;
    x = larguraMundo/2.0;
  }
  void FuncoesPlayer(boolean apenasImagem) {
    DesenhaPlayer();
    if (apenasImagem) return;

    MovePlayer();
  }
  void DesenhaPlayer() {
    image(img, x, y, larg, alt);
    fill(255);
    //text("x: "+(int)x+" y: "+y, x, y-5);
  }
  void MovePlayer() {
    //Movimento vertical
    if (moveCima) {
      y-= velocidade;
    }
    if (moveBaixo) {
      y+= velocidade;
    }
    if (y > yMundo + alturaMundo - alt) {
      y = yMundo + alturaMundo - alt;
    }
    if (y < yMundo) {
      y = yMundo;
    }
    //Movimento horizontal
    if (moveEsquerda) {
      x-= velocidade;
    }
    if (moveDireita) {
      x+= velocidade;
    }
    if (x > xMundo + larguraMundo - larg) {
      x = xMundo + larguraMundo - larg;
    }
    if (x <= xMundo) {
      x = 0;
    }
  }
}

void keyPressed() {
  if (keyCode == 'W' || keyCode == UP) {
    moveCima = true;
  }
  if (keyCode == 'S' || keyCode == DOWN) {
    moveBaixo = true;
  }
  if (keyCode == 'A' || keyCode == LEFT) {
    moveEsquerda = true;
  }
  if (keyCode == 'D' || keyCode == RIGHT) {
    moveDireita = true;
  }
  Pause();
}

void keyReleased() {
  if (keyCode == 'W' || keyCode == UP) {
    moveCima = false;
  }
  if (keyCode == 'S' || keyCode == DOWN) {
    moveBaixo = false;
  }
  if (keyCode == 'A' || keyCode == LEFT) {

    moveEsquerda = false;
  }
  if (keyCode == 'D' || keyCode == RIGHT) {
    moveDireita = false;
  }
}
