class_ball ball;
int tam = 250;
class_eat [] eat = new class_eat[tam];

boolean vict = false; //end game
int cont = 0; //pontos
int time = 0; //time of game

PImage bground;

void setup (){
  fullScreen(P3D);

  colorMode(HSB);
  textAlign(CENTER, CENTER);
  textSize(20);

  bground = loadImage("background.jpg");

  ball = new class_ball(random(50, width- 50), random(50, height - 50));

  for(int i = 0; i < eat.length; i++)
    eat [i] = new class_eat();
}

void draw (){
  //background(#110f18);
  image(bground, 0, 0);

  for(int i = 0; i < eat.length; i++)
    eat[i].draw_eat();

  ball.mov_ship();
  ball.doeat();
  ball.draw_ship();

  text("Score: "+ cont + "/" + tam + "  time: " + time + "s", 160, height - 40);
}
