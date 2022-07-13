int pontosJogador = 0;
PFont pixelFont;
void ChecaColisao() {
  if (p == null) return;
  for (int i = 0; i< carros.length; i++) {
    if (carros[i] != null) {
      if (carros[i].x <= p.x + p.larg &&
        carros[i].x + carros[i].larg >= p.x &&
        carros[i].y < p.y+ p.alt &&
        carros[i].y + carros[i].alt > p.y) {
        Derrota();
      }
    }
  }
}
void Vitoria() {
  if (p.y < yMundo + p.alt / 2 ) {
    pontosJogador++;
    p.y = yMundo + alturaMundo - p.alt;
    p.DesenhaPlayer();
    //pause = true;
  }
}
void Derrota() {
  pontosJogador--;
  if (pontosJogador < 0) pontosJogador = 0;
  p.y = yMundo + alturaMundo - p.alt;
  p.DesenhaPlayer();
  //pause = true;
}

void DesenhaPlacar() {
  textSize(72);
  //textMode(CENTER);
  fill(233, 105, 113);
  text(pontosJogador, xMundo + larguraMundo/2 - 40, yMundo-20);
}

void Pause() {
  if (key == ENTER) {
    pause = !pause;
    println("Pause");
  }
}
