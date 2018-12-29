class star_family {
  float d_min = random(1, 3), d_max = random(3, 5);
  float d = random(d_min, d_max);
  float d_plus = 0.005;
  boolean up = true;

  float x = random(-width/2, width/2);
  float y = random(-height/2, height/2 - 100);

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
