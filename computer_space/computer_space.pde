import controlP5.*;
ControlP5 button;
RadioButton mnp;

star_family [] star = new star_family [200];

ship space_ship;
float comb = 200;
float dcombdt = -0.2;

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

  space_ship = new ship ();
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

    space_ship.mov();
    space_ship.draw();
  popMatrix();

  informacoes();
}
