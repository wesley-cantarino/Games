var tab =
[
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
];
/*
    C0 C1 C2
 l0  1  2  3
 l1  4  5  6
 l2  7  8  9
*/

function draw_table ()
{
  for(var i = 0; i < 3; i++)
  {
    for (var j = 0; j < 3; j++)
    {
      //console.log(i, j, "valor: ", tab[i][j]);
    }
  }
}

function setup ()
{
  createCanvas(300, 300);

  colorMode(RGB);
}

function windowResized ()
{
  resizeCanvas(windowWidth, windowHeight);
}

function draw ()
{
  background(71, 207, 212);

  for(var i = 0; i < 3; i++)
  {
    for (var j = 0; j < 3; j++)
    {
      push();
        translate(j*100, i*100);

        fill(237, 237, 237);
        strokeWeight(2);
        rect(0, 0, 100, 100);

        fill(30, 30, 30);
        textSize(30);
        textAlign(CENTER, CENTER);
        text(tab[i][j], 50, 50);
      pop();
    }
  }
}
