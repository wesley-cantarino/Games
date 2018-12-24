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

    if((mousePressed) && (comb > 0)){
      ace.add(mouse);
        ace.limit(0.1);
      vel.add(ace);
      vel.limit(16);
    }

    pos.add(vel);

    /***verificar se ainda esta na tela***/
    if (pos.x > width/2)
      pos.x = -width/2;
    if (pos.x < -width/2)
      pos.x = width/2;

    if (pos.y > height/2 - 100)
      pos.y = -height/2;
    if (pos.y < -height/2)
      pos.y = height/2 - 100;
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
    float scal1 = 4;
    float scal2 = 1.4;

    if((mousePressed) && (comb > 0)){
      fill(#f05641);
      ellipse(0, 20 * scal2 + 10, 20 * scal2 - 5, 20 * scal2 - 5);

      fill(#f0c941);
      arc(0, 20 * scal2, 20 * scal2, 20 * scal2, 0, PI);
      triangle(0, 10 * scal2, 10 * scal2, 20 * scal2 + 1, -10 * scal2, 20 * scal2 + 1);
    }

    fill(#8795c7);

    beginShape();
      vertex(0, 10 * scal2);
      vertex(10 * scal2, 20 * scal2);

      vertex(0, -20 * scal2);

      vertex(-10 * scal2, 20 * scal2);
      vertex(0, 10 * scal2);
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
