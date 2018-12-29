star_family [] star = new star_family [200];

fire_gun [] triger = new fire_gun [10];
int number = 0;
int muni = 120;

ship space_ship;
float life = 10;
float dano = -1;
float comb = 200; //quantidade de combustivel
float dcombdt = -0.2; //taxa de queima d(comb)/dtpr

star_big_family [] star_big = new star_big_family [3];

PImage spacecraft_img;
PImage spacecraft_fire_img;

PImage sun_img;

void setup (){
  fullScreen();
  //size(800, 600);
  colorMode(HSB);
  frameRate(60);

  for(int i = 0; i < star.length; i++)
    star[i] = new star_family ();

  for(int i = 0; i < triger.length; i++)
    triger[i] = new fire_gun ();

  space_ship = new ship ();

  for(int i = 0; i < star_big.length; i++)
    star_big[i] = new star_big_family ();

  spacecraft_img = loadImage("spacecraft_img.png");
  spacecraft_fire_img = loadImage("spacecraft_img_fire.png");

  sun_img = loadImage("sun_img.png");
}

void draw (){
  noStroke();

  pushMatrix();
    translate(width/2, height/2);

    /******visual**********/
    background(19, 18, 19);

    for(int i = 0; i < star.length; i++)
      star[i].draw();
    /******visual_END******/

    for(int i = 0; i < triger.length; i++){
      triger[i].mov();
      triger[i].fire_draw();
    }

    space_ship.mov();
    space_ship.draw();

    for(int i = 0; i < star_big.length; i++)
      star_big[i].draw();
  popMatrix();

  informacoes();
}

void mousePressed (){
  if(muni > 0){
    triger[number].fire();
    muni -= 1;

    number += 1;
    if(number > triger.length - 1)
      number = 0;
  }
}
