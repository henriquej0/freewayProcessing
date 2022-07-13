class Carro {
  float x;
  float y;
  float larg;
  float alt;
  float velocidade;
  boolean indoDireita;
  color cor;

  Carro(float larg, float alt, float y, float velocidade) {
    this.larg = larg;
    this.alt = alt;
    this.velocidade = velocidade;
    this.y = y;
    int randNumero = (int)random(0, 4);
    indoDireita = randNumero % 2 == 0;
    if (indoDireita) {
      x = xMundo;
    } else {
      x = larguraMundo;
    }
    cor = color((int)random(0, 257), (int)random(0, 257), (int)random(0, 257)  );
  }
  void FuncoesCarro(boolean apenasImagem) {
    DesenhaCarro();
    if (apenasImagem) return;
    MoveCarro();
  }
  void DesenhaCarro() {
    //corpo
    fill(cor);
    noStroke();
    //carroceria
    rect(x, y, larg, alt);
    fill(0);
    float altRoda = larg*0.1;
    float largRoda = larg*0.2;
    float distRoda = larg*0.15;
    //rodas de cima
    rect(x + distRoda, y -altRoda, largRoda, altRoda);
    rect(x + larg - (distRoda + largRoda), y -altRoda, largRoda, altRoda);
    //rodas de baixo
    rect(x + distRoda, y + alt, largRoda, altRoda);
    rect(x + larg - (distRoda + largRoda), y + alt, largRoda, altRoda);
    //espelhos
    fill(155,136,144);
    rect(x + distRoda, y + alt * .25, larg*0.7, alt*.5);
    if (indoDireita) {
      rect(x + distRoda*2, y + alt * 0.1, larg*0.3, alt*.8);
      fill(cor);
      rect(x + distRoda*2, y + alt * 0.2, larg*0.3, alt*.6);
    } else {
      rect(x + larg - larg*0.3 -distRoda*2, y + alt * 0.1, larg*0.3, alt*.8);
      fill(cor);
      rect(x + larg- larg*0.3 - distRoda*2, y + alt * 0.2, larg*0.3, alt*.6);
    }
  }
  void MoveCarro() {
    if (indoDireita) {
      x+= velocidade;
    } else {
      x-= velocidade;
    }
    if (indoDireita) {
      if (x > xMundo + larguraMundo + larg) {
        x = xMundo;
      }
    } else {
      if (x < xMundo - larg) {
        x = xMundo + larguraMundo;
      }
    }
  }
}
