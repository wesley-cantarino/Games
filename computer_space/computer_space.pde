star_family [] star = new star_family [200];

ship space_ship;

void setup (){
  fullScreen();
  //size(800, 600);

  colorMode(HSB);

  for(int i = 0; i < star.length; i++)
    star[i] = new star_family ();

  space_ship = new ship ();
}

void draw (){
  translate(width/2, height/2);

  /******visual**********/
  background(19, 18, 19);

  for(int i = 0; i < star.length; i++)
    star[i].draw();
  /******visual_END******/

  space_ship.mov();
  space_ship.draw();
}

/******visual**********/
class star_family {
  int d_min = 3, d_max = 4;
  float d = random(d_min, d_max);
  float d_plus = 0.005;
  boolean up = true;

  float x = random(-width/2, width/2);
  float y = random(-height/2, height/2);

  PVector pos = new PVector(x, y);

  void glow (){
    fill(250);
    noStroke();

    if (d > d_max)
      up = false;
    if (d < d_min)
      up = true;

    if (up)
      d += d_plus;
    else
      d -= d_plus;
  }

  void draw (){
    glow();
    ellipse(pos.x, pos.y, d, d);
  }
}
/******visual_END******/

class ship {
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  PVector ace = new PVector(0, 0);

  PVector mouse = new PVector(0, 0);
  PVector frent = new PVector (0, -1); //apontando para cima
  float angle = 0; //angle entre frente e posição

  void mov (){
    mouse.x = mouseX - width/2 - pos.x;
    mouse.y = mouseY - height/2 - pos.y;

    if(mousePressed)
      ace.add(mouse);

      ace.limit(6);
    vel.add(ace);
      vel.limit(4);
    pos.add(vel);

    /***verificar se ainda esta na tela***/
    if (pos.x > width/2)
      pos.x = -width/2;
    if (pos.x < -width/2)
      pos.x = width/2;
    if (pos.y > height/2)
      pos.y = -height/2;
    if (pos.y < -height/2)
      pos.y = height/2;
    /*******/
  }

  void norma (){
    angle = PVector.angleBetween (mouse, frent);

    if(mouse.x < 0)
      rotate(-angle);
    else
      rotate(angle);
  }

  void point_ship (){
    fill(#8795c7);

    float scal = 1.4;
    beginShape();
      vertex(0, 10 * scal);
      vertex(10 * scal, 20 * scal);

      vertex(0, -20 * scal);

      vertex(-10 * scal, 20 * scal);
      vertex(0, 10 * scal);
    endShape();
  }

  void draw (){
    pushMatrix();
      translate(pos.x, pos.y);

      norma ();

      point_ship ();
    popMatrix();
  }
}
