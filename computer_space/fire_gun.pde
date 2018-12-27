class fire_gun {
  PVector pos_old = new PVector(0, 0);
  PVector pos_aux = new PVector(0, 0);

  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);

  PVector ace = new PVector(0, 0);

  boolean explosion = false;

  void fire (){
    pos.x = 0; pos.y = 0;
    pos_old.x = 0; pos_old.y = 0;
    pos_aux.x = 0; pos_aux.y = 0;
    vel.x = 0; vel.y = 0;
    explosion = false;

    pos.add(space_ship.pos);
      pos_old.add(pos); //salva a posição inicial
    vel.add(space_ship.vel);

    ace.add(space_ship.mouse);
    ace.normalize ();
    ace.mult(0.2);
  }

  void mov (){
    if(!explosion){
      vel.add(ace);
      pos.add(vel);

      pos_aux = pos.copy();
      pos_aux.sub(pos_old);

      /***verificar se ainda esta na tela***
      if (pos.x > width/2)
        pos.x = -width/2;
      if (pos.x < -width/2)
        pos.x = width/2;

      if (pos.y > height/2 - 100)
        pos.y = -height/2;
      if (pos.y < -height/2)
        pos.y = height/2 - 100;
        *******/
    }
  }

  void fire_draw (){
    if((pos_aux.mag() < 1000) && (!explosion)){
        fill(#27bb44);
        ellipse(pos.x, pos.y, 10, 10);
    }
    else {
      explosion = true;
    }
  }
}
