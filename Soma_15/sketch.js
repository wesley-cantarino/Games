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

var select = {
  mx : null,
  my : null,

  l : null,
  c : null,

  old_l : null,
  old_c : null,
  value : null,

  atua_l : null,
  atua_c : null
};

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

  select_cel();
  draw_table();
}

function alterar ()
{
  if(select.old_l != null)
  {
    tab[select.old_l][select.old_c] = tab[select.l][select.c];
    tab[select.l][select.c] = select.value;

    select.old_l = null;
    select.old_c = null;

    console.log(select.old_l);
  }
  else
  {
    select.old_l = select.l;
    select.old_c = select.c;

    select.value = tab[select.l][select.c];
  }

  if((select.old_l != null) && (tab[select.old_l][select.old_c] != tab[select.l][select.c]))
  {
    select.old_l = select.l;
    select.old_c = select.c;

    select.value = tab[select.l][select.c];
  }
}

function select_cel ()
{
  select.mx = mouseX;
  select.my = mouseY;
  //console.log(select.mx, select.my);

  if ((select.mx >= 0) && (select.mx < 100))
  {
    if ((select.my >= 0) && (select.my < 100))
    {
      select.l = 0;
      select.c = 0;

      if(mouseIsPressed)
      {
        alterar();
      }
    }
    else if ((select.my >= 100) && (select.my < 200))
    {
      select.l = 1;
      select.c = 0;

      if(mouseIsPressed)
      {
        alterar();
      }
    }
    else if ((select.my >= 200) && (select.my < 300))
    {
      select.l = 2;
      select.c = 0;

      if(mouseIsPressed)
      {
        alterar();
      }
    }
  }
  else if ((select.mx >= 100) && (select.mx < 200))
  {
    if ((select.my >= 0) && (select.my < 100))
    {
      select.l = 0;
      select.c = 1;

      if(mouseIsPressed)
      {
        alterar();
      }
    }
    else if ((select.my >= 100) && (select.my < 200))
    {
      select.l = 1;
      select.c = 1;

      if(mouseIsPressed)
      {
        alterar();
      }
    }
    else if ((select.my >= 200) && (select.my < 300))
    {
      select.l = 2;
      select.c = 1;

      if(mouseIsPressed)
      {
        alterar();
      }
    }
  }
  else if ((select.mx >= 200) && (select.mx <= 300))
  {
    if ((select.my >= 0) && (select.my < 100))
    {
      select.l = 0;
      select.c = 2;

      if(mouseIsPressed)
      {
        alterar();
      }
    }
    else if ((select.my >= 100) && (select.my < 200))
    {
      select.l = 1;
      select.c = 2;

      if(mouseIsPressed)
      {
        alterar();
      }
    }
    else if ((select.my >= 200) && (select.my < 300))
    {
      select.l = 2;
      select.c = 2;

      if(mouseIsPressed)
      {
        alterar();
      }
    }
  }
}

function draw_table ()
{
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
