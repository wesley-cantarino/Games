void grid (){
  noStroke();

  for(int i = 0; i < 10; i++){
    for(int j = 0; j < 10; j++){
      if((tabuleiro[i][j] == 0) || (tabuleiro[i][j] == 10))
        fill(245);  //branco. estado desconhecido
      else if(tabuleiro[i][j] == 1)
        fill(80, 60, 207);  //azul. água
      else if(tabuleiro[i][j] == 2)
        fill(200, 20, 80);  //vermelho. acerto/dano

      rect(160 + 50*i, 70 + 50*j, 45, 45);
    }
  }

  fill(255);
  textSize(25);
  int t = 50;
  text("A", 130, 100 + 0*t);
  text("B", 130, 100 + 1*t);
  text("C", 130, 100 + 2*t);
  text("D", 130, 100 + 3*t);
  text("E", 130, 100 + 4*t);
  text("F", 130, 100 + 5*t);
  text("G", 130, 100 + 6*t);
  text("H", 130, 100 + 7*t);
  text("I", 130, 100 + 8*t);
  text("J", 130, 100 + 9*t);

  for(int i = 0; i < 10; i++)
    text(i, 175 + 50*i, 60);

  ellipse(110, 90 + letra*t, 15, 15);
  ellipse(182 + numero*50, 20, 15, 15);
  
  text("hit: " + hit + "/" + contNavios, 5, 35);
  text("agua: " + agua, 5, 75);
}