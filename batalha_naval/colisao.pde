void colisao(){
  if(ir){
    if(tabuleiro[numero][letra] == 10){
      tabuleiro[numero][letra] = 2; //dado
      hit++;
    }
    else if(tabuleiro[numero][letra] == 0){
      tabuleiro[numero][letra] = 1; //água
      agua++;
    }
    ir = false;
  }
}
