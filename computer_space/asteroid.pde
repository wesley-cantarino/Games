class asteroid_family {
  boolean explosion = false;

  PVector pos = new PVector(random(-width/2, width/2), random(-height/2, height/2));
  PVector vel = new PVector(random(-1, 1), random(-1, 1));

  void mov (){
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

  void draw (){
    fill(#8bb066);
    ellipse(pos.x, pos.y, 40, 40);
  }
}
