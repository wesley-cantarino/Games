class class_ball {
  int d = 10;
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(random(-10, 10), random(-10, 10));
  PVector mouse = new PVector(0, 0);
  PVector c = new PVector(random(0, 255), 255, 255);

  class_ball (float x, float y){
      pos.x = x;
      pos.y = y;
  }

  void mov_ship (){
    mouse.x = mouseX;
    mouse.y = mouseY;

    mouse.sub(pos);
    vel.add(mouse);
    vel.limit(2.5);

    if(dist(pos.x, pos.y, mouseX, mouseY) <= d/6){
      vel.x = 0;
      vel.y = 0;
    }

    if ((pos.x > width) || (pos.x < 0))
      vel.x = 0;
    if ((pos.y > height) || (pos.y < 0))
      vel.x = 0;

    pos.add(vel);
  }

  void doeat(){
    for(int i = 0; i < eat.length; i++){
      if((dist(pos.x, pos.y, eat[i].pos.x, eat[i].pos.y) <= d/2) &&
         (eat[i].life == true)){
        eat[i].life = false;
        d += 1;

        cont += 1;

        time = int(millis())/1000;
        if((cont == eat.length) && (!vict)){
          vict = true;
          time = int(millis())/1000;
        }
      }
    }
  }

  void draw_ship (){
    noStroke();
    fill(c.x, c.y, c.z);
    ellipse(pos.x, pos.y, d, d);

    //if(vict == true){
      //fill(map(pos.y, 0, height, 0, 255), 255, 255);
      //text("victory, " + time + "s", pos.x, pos.y);
    //}
  }
}

/************************/

class class_eat {
  boolean life = true;
  PVector pos = new PVector(random(5, width - 5), random(5, height - 5));
  float d = int(random(5, 10));

  int dr = 1; //dr/dt
  float dd = 0.004; //dd/dt

  int rising = int(random(100, 150));
  boolean up = true;

  void draw_eat (){
    if (life == true){
      noStroke();
      fill(map(pos.y, 0, height, 0, 255), 255, 255, rising);
      ellipse(pos.x, pos.y, d, d);

      if (up){
        rising += dr;
        d += dd;
      }
      else{
        rising -= dr;
        d -= dd;
      }

      if(rising > 255)
        up = false;
      else if(rising < 100)
        up = true;
    }
  }
}
