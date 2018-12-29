class star_big_family {
  PVector pos = new PVector(random(-width/2, width/2), random(-height/2, height/2));
  PVector d = new PVector(40, 40);

  void draw (){
    imageMode(CENTER);
    image(sun_img, pos.x, pos.y, 50, 50);

    /******
    fill(#b6a532);
    noStroke();
    ellipse(pos.x, pos.y, d.x, d.y);
    ******/
  }
}
