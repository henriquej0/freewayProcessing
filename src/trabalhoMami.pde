color corFundo = color(150, 150, 150);
color corLinhaBranca = color(255, 255, 255);
color corLinhaAmarela = color(255, 255, 106);
float larguraMundo = 960;
float alturaMundo = 800;
float grossuraLinhas = 4;
float xMundo = 0;
float yMundo = 100;
int numLinhas = 10;
float alturaFaixa = 0;
Player p;
Carro[] carros;
int larguraCarro = 50;
int alturaCarro = 30;

boolean pause = false;

void setup() {
  size(960, 1000);
  pixelFont = createFont("PublicPixel.ttf", 128);
  textFont(pixelFont);
  p = new Player(51, 38, 3, "player.png");
  carros = new Carro[8];
  mostraMundo(numLinhas, xMundo, yMundo, larguraMundo, alturaMundo);
  for (int i = 0; i< carros.length; i++) {
    float yFaixa = yMundo +  (i +1) * alturaFaixa + (alturaFaixa/2 - alturaCarro/2)+ grossuraLinhas * (i +1);
    carros[i] = new Carro(larguraCarro, alturaCarro, yFaixa, random(4, 10)); //largura, altura, Y, vekcudade
  }
}
void draw() {
  mostraMundo(numLinhas, xMundo, yMundo, larguraMundo, alturaMundo);
  DesenhaPlacar();
  if (pause) {
    p.FuncoesPlayer(true);
    for (int i= 0; i< carros.length; i++) {
      carros[i].FuncoesCarro(true);
    }
  } else {
    p.FuncoesPlayer(false);
    for (int i= 0; i< carros.length; i++) {
      carros[i].FuncoesCarro(false);
    }
    ChecaColisao();
    Vitoria();
  }
}
void mostraMundo(int numFaixas, float x, float y, float largura, float altura) {
  background(144, 139, 145);
  //A metade que vamos usar para desenhar as faixas desconsidera um espaço de 3 linhas, sendo 2 delas reais e um espaço
  float metadeAlturaAjustada = (altura/2.0) - (grossuraLinhas * 2);
  //println(metadeAlturaAjustada);
  desenhaFaixas(numFaixas/2, x, y, largura, metadeAlturaAjustada, false);

  desenhaFaixas(numFaixas/2, x, y + altura/2 + grossuraLinhas * 4, largura, metadeAlturaAjustada, true);
}
void desenhaFaixas(int numFaixas, float x, float y, float largura, float altura, boolean invertido) {
  //A altura das faixas é igual à altura total que preciso desenhar dividido por 2
  alturaFaixa = altura/numFaixas;
  for (int i = 0; i < numFaixas; i++) {
    fill(corFundo);
    noStroke();
    //Cada linha é desenhada levando em conta as linhas anteriores e o espaço
    float yFaixa = y + i * alturaFaixa + grossuraLinhas * i;
    //rect(x, yFaixa, largura, alturaFaixa);
    color corLinha;
    if (i != numFaixas - 1) {
      corLinha = corLinhaBranca;
      desenhaLinhas(numLinhas, largura, x, yFaixa + alturaFaixa, grossuraLinhas, corLinha);
    } else {
      if (!invertido) {
        desenhaLinhas(numLinhas, largura, x, yFaixa + alturaFaixa, grossuraLinhas, color(255, 255, 106));
      } else {
        desenhaLinhas(numLinhas, largura, x, y, grossuraLinhas, color(255, 255, 106));
      }
    }
  }
}

void desenhaLinhas(int numLinhas, float largura, float x, float y, float grossuraLinha, color corLinha) {
  //A largura das linhas é igual ao tamanho total que preciso desenhar dividido por 2
  //Porém, como ainda tem os espaços, que são do mesmo tamanho da linha, eu multipliquei o número de linhas por 2 para contar com eles
  float larguraLinha = largura/(numLinhas * 2);
  //Salvei o espaço numa variável pra ficar mais fácil de ler
  float espacoLinha = larguraLinha;
  for (int i = 0; i < numLinhas; i++) {
    stroke(corLinha);
    strokeWeight(grossuraLinha);
    //Cada linha é desenhada levando em conta as linhas anteriores e o espaço
    float xLinha = x + espacoLinha + (espacoLinha * i) + (i * larguraLinha);
    line(xLinha, y, xLinha+larguraLinha, y);
  }
}
