int [][] tabuleiro = new int[10][10];
int letra = 0, numero = 0;
int hit = 0, agua = 0, navios = 50, contNavios;
boolean ir = false;

void setup (){
  size(800, 600);

  for(int i = 0; i < 10; i++)
    for(int j = 0; j < 10; j++)
      tabuleiro[i][j] = 0;

  for(int i = 0; i < navios; i++){
    int a = int(random(10));
    int b = int(random(10));
    while(tabuleiro[a][b] != 0){
      a = int(random(10));
      b = int(random(10));
    }
    tabuleiro[a][b] = 10; //presença de navio
  }
  
  for(int i = 0; i < 10; i++)
    for(int j = 0; j < 10; j++) //se torna nescessario quando se 
      if(tabuleiro[i][j] == 10) //tem mais de um tipo de navio
        contNavios++;
}  

void draw (){
  //background(9, 7, 23);
  background(100, 20, 100);

  colisao();
  grid();

  //print_tabuleiro();
}

void print_tabuleiro(){
  for(int i = 0; i < 10; i++){
    println("");
    for(int j = 0; j < 10; j++){
      print(tabuleiro[j][i] + " ");
    }
  }
  println("");
  println("---------------------------");
}