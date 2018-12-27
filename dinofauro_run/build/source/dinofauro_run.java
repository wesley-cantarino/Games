import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class dinofauro_run extends PApplet {

class cloud_class {
  float X = random(1, 2) * 1400;
  int Y = PApplet.parseInt(random(1, 4)) * 25;
  int tamX = PApplet.parseInt(random(20, 40));
  int tamY = PApplet.parseInt(random(8, 14));

  public float show(){
    X -= 2.3f + random(1);  //velocidade
    if(X <= -50)
      X = random(1, 2) * 1400;

    return X;
  }
}

class linha_class {
  float X = PApplet.parseInt(random(140, 280)) * 5;
  float Y = PApplet.parseInt(random(37, 39)) * 5;
  float Xspeed = 2;

  public float show (){
    X -= Xspeed;
    if(X <= -30)
      X = PApplet.parseInt(random(700, 1400)) + 10;

    return X;
  }
}

class pulo_class {
  float Y = 160;
  float Yspeed = 2;
  int altura = 95;  //altura real 125
  boolean up = true;

  public void show (){
    if(up){
      Y -= Yspeed;
      if(Y <= altura)
        up = !up;
    }
    else {
      Y += Yspeed;
      if(Y >= 160){
        up = !up;
        pulo = !pulo;
      }
    }

    rect(30, Y, 20, 30, 15, 15, 15, 15);
  }
}

class obstaculo_class {
  float X = 700;
  float Y = random(135, 159);
  float Xspeed = 2;
  float Ytam = 195;

  public void show(){
    X -= Xspeed;
    if(X < 0){
      X = 700;
      Y = random(135, 159);
      Ytam = 195;
    }

    triangle(X, Y, X + 7, Ytam, X-7, Ytam);
    //rect(X, Y, 15, Ytam);
  }
}

cloud_class[] cloud = new cloud_class[20];
linha_class[] linhas = new linha_class[100];
pulo_class pulos = new pulo_class();
obstaculo_class obstaculos = new obstaculo_class();

boolean pulo = false;
boolean hit = false;
float pontos = 0;

public void setup (){
  

  for(int i = 0; i < cloud.length; i++)
    cloud[i] = new cloud_class();

  for(int i = 0; i < linhas.length; i++)
    linhas[i] = new linha_class();
}

public void draw (){
  if(hit){
    fill(164, 255, 145);
    noStroke();
    rect(width/2 - 25, height/2 - 25, 50, 50, 10, 10, 10, 10);
    noFill();
    stroke(0);
    strokeWeight(4);
    arc(width/2, height/2, 30, 30, sin(radians(270)), PI);

    pushMatrix();
    fill(0);
    translate(356, 85);
    rotate(radians(45));
    triangle(0, 0, -2, 3, 2, 3);
    popMatrix();

    text("R", width/2 - 6, height/2 + 7);

    if(keyPressed)
      if((key == 'r') || (key == 'R'))
        hit = !hit;
  }
  else {
    background(80);     //noite
    //background(180);    //dia

    chao();
    Funtion_cloud();

    if(keyPressed)
      if(key != 'r')
        pulo = true;

    dino();

    fill(203, 152, 38);
    obstaculos.show();

    colisao();
  }
}

public void Funtion_cloud(){
  fill(203, 212, 228);
  noStroke();

  for(int i = 0; i < cloud.length; i++){
    ellipse(cloud[i].X, cloud[i].Y, cloud[i].tamX, cloud[i].tamY);
    cloud[i].show();
  }
}

public void chao (){
  stroke(10);
  strokeWeight(3);
  line(0, 180, width, 180); //chão

  for(int i = 0; i < linhas.length; i++){
    rect(linhas[i].X, linhas[i].Y, 3, 1);
    linhas[i].show();
  }
}

public void dino (){
  fill(7, 171, 161);

  if(pulo){
    pulos.show();
  }
  else
    rect(30, 160, 20, 30, 15, 15, 15, 15);
}

public void colisao(){
  fill(255);
  textSize(20);
  pontos += obstaculos.Xspeed;

  text(PApplet.parseInt(pontos) + "pts", width - 100, 20);

  //println(obstaculos.X + " | " + (pulos.Y + 30) + " | " + obstaculos.Y);
  if((obstaculos.X == 30) && ((pulos.Y + 30) >=  obstaculos.Y)){
    pontos = 0;
    hit = !hit;
  }
}
  public void settings() {  size(700, 200); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "dinofauro_run" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
