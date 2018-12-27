import controlP5.*;
ControlP5 button;
RadioButton mnp;

star_family [] star = new star_family [200];

fire_gun [] triger = new fire_gun [10];
int number = 0;
int muni = 120;

ship space_ship;
float life = 10;
float dano = -1;
float comb = 200; //quantidade de combustivel
float dcombdt = -0.2; //taxa de queima d(comb)/dt

int ast = 10;
asteroid_family [] asteroid = new asteroid_family [ast];

void setup (){
  fullScreen();
  //size(800, 600);
  colorMode(HSB);
  frameRate(60);

  button = new ControlP5(this);
  /*mnp = button.addRadioButton("radioButton")
              .setPosition(20, height - 60)
              .setSize(40,20)
              .setColorForeground(color(120))
              .setColorActive(color(255))
              .setColorLabel(color(255))
              .setItemsPerRow(5)
              .setSpacingColumn(50)
              .addItem("50",1)
              ;*/

  for(int i = 0; i < star.length; i++)
    star[i] = new star_family ();

  for(int i = 0; i < triger.length; i++)
    triger[i] = new fire_gun ();

  space_ship = new ship ();

  for(int i = 0; i < asteroid.length; i++)
    asteroid[i] = new asteroid_family ();
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

    for(int i = 0; i < asteroid.length; i++){
      for(int j = 0; j < triger.length; j++){
        if((dist(asteroid[i].pos.x, asteroid[i].pos.y, triger[j].pos.x, triger[j].pos.y) < 20) && (!asteroid[i].explosion)){
          asteroid[i].explosion = true;
          ast -= 1;
        }

        if(!asteroid[i].explosion){
          asteroid[i].mov();
          asteroid[i].draw();
        }
      }

      if((dist(asteroid[i].pos.x, asteroid[i].pos.y, space_ship.pos.x, space_ship.pos.y) < 30) && (!asteroid[i].explosion)){
        life += dano;
      }
    }
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
