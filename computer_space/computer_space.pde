star_family [] star = new star_family [200];
ship space_ship;

void setup (){
  fullScreen();
  //size(800, 600);

  for(int i = 0; i < star.length; i++)
    star[i] = new star_family ();

  space_ship = new ship ();
}

void draw (){
  background(19, 18, 19);

  for(int i = 0; i < star.length; i++)
    star[i].draw();

  space_ship.mov();
  space_ship.draw();
}

class star_family {
  int d_min = 3, d_max = 4;
  float d = random(d_min, d_max);
  float d_plus = 0.1;
  boolean up = true;

  float x = random(0, width);
  float y = random(0, height);

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

class ship {
  PVector pos = new PVector(width/2, height/2);
  PVector vel = new PVector(0, 0);
  PVector ace = new PVector(0, 0);
  PVector mouse = new PVector(0, 0);

  void mov (){
    /* //usando o mouser
    if (dist(mouseX, mouseY, pos.x, pos.y) > 10){
      mouse.x = mouseX;
      mouse.y = mouseY;

      ace.add(mouse.sub(pos));
      ace.normalize();

      vel.add(ace);
      vel.limit(10);

      pos.add(vel);
    }

    else {
      ace.x = 0; vel.x = 0;
      ace.y = 0; vel.y = 0;
    }*/

    if ((key == 'w') || (key == 'W')){
      ace.x = 0; ace.y = -1;
    }
    else if ((key == 's') || (key == 'S')){
      ace.x = 0; ace.y = 1;
    }
    else if ((key == 'a') || (key == 'A')){
      ace.x = -1; ace.y = 0;
    }
    else if ((key == 'd') || (key == 'D')){
      ace.x = 1; ace.y = 0;
    }
    else {
      ace.x = 0; ace.y = 0;
      vel.x = 0; vel.y = 0;
    }

    if (pos.x > width)
      pos.x = 0;
    if (pos.x < 0)
      pos.x = width;
    if (pos.y > height)
      pos.y = 0;
    if (pos.y < 0)
      pos.y = height;

    vel.add(ace);
    vel.limit(6);

    pos.add(vel);
  }

  void draw (){
    fill(20, 80, 120);
    ellipse(pos.x, pos.y, 20, 20);
  }
}
