void informacoes (){
  rectMode(CORNER);
  fill(#e6dfdf);
  rect(0, height - 100, width, 100);


  fill(#d4e23c);
  rect(50, height - 50, comb, 10);
  if((mousePressed) && (comb > 0))
    comb += dcombdt;

  fill(#1b1d1c);
  textAlign(CENTER);
  textSize(20);
  if (comb > 0){
    text("fuel", 150, height - 50);
  }
  else {
    text("no fuel", 150, height - 50);
  }

  noFill();
  stroke(#000000);
  rect(50, height - 50, 200, 10);

}
