Campo cp = new Campo();
Cannone[] c = new Cannone[2];
Palla[] pl = new Palla[2];
PImage r;
float[] x = new float[9];
float[] y = new float[9];
final int statoMenu = 0, statoGame = 1;
int scelta = statoMenu;
int player = 1;
boolean fire = false;
void setup(){
  size(640,480);
  //fullScreen();
  //background(#3AADCE);
  r = loadImage("data/image/rondine1.jpg");
  for(int i = 0; i < 9; i++){
    x[i] = random(20,620);
    y[i] = random(10,200);
  }
  c[0] = new Cannone(100,260);
  c[1] = new Cannone(540,260);
  pl[0] = new Palla(100,260);
  pl[1] = new Palla(540,260);
  velocita1 = 50; angolo1 = 45;
  velocita2 = 50; angolo2 = 45;
}
float velocita1 = 50, angolo1 = 45;
float velocita2 = 50, angolo2 = 45;
void draw(){
  background(#3AADCE);
  cp.display(x,y);
  seleziona();
  if(scelta==0){
    menu();
  }
  if(fire==true){
    if(player == 1){
      pl[0].run1(velocita1,angolo1);
      if(pl[0].x+pl[0].x0>width || pl[0].x+pl[0].x0<0 || pl[0].y+pl[0].y0> height){
         player = 2;
         pl[0] = new Palla(100,260);
         fire=false;
      }else if(dist(pl[0].x+pl[0].x0,pl[0].y+pl[0].y0,540,260) < 30){
         fill(0,0,255/*random(255),random(255),random(255)*/);
         textSize(30);
         text("Player 1 win",width/2-80,height/2);
         noLoop();
      }
    }
    else if(player == 2){
      pl[1].run2(velocita2,angolo2);
        if(pl[1].x+pl[1].x0>width /*|| pl[1].x>0*/ || pl[1].y+pl[1].y0>height){
          player = 1;
          pl[1] = new Palla(540,260);
          fire=false;
        } else if(dist(pl[1].x+pl[1].x0,pl[1].y+pl[1].y0,100,260) < 30){
          fill(255,0,0);
          textSize(30);
          text("Player 2 win",width/2-80,height/2);
          noLoop();
      }
    }
  }
  c[0].display1(angolo1);
  c[1].display2(angolo2);
}
//------------------------------------------------------------------------
//void keyPressed(){
//}

void keyReleased()
{
  if ((key == 'q' || key == 'Q') && scelta==statoGame){
      scelta = statoMenu;
      //setup();
      print("K");
  }
}
//void mouseClicked(){
//}

void mouseReleased()
{
  if((mouseX>170 && mouseX<470) && (mouseY>45 && mouseY<195) && scelta==statoMenu)
  {
    print("R");
    player = 1;
    fire = false;
    scelta=statoGame;
    setup();
  }
  int x;
  if(player==1) x = 0;
  else x = 480;
  if((mouseX>20+x && mouseX<60+x) && (mouseY>310 && mouseY<330) && scelta==statoGame)
  {
    print("-v"); 
    if(player == 1) velocita1 -= 1;
    else velocita2 -= 1;
  }else if((mouseX>100+x && mouseX<140+x) && (mouseY>310 && mouseY<330) && scelta==statoGame)
  {
    print("+v");
    if(player == 1) velocita1 += 1;
    else velocita2 += 1;
    
  }else if((mouseX>20+x && mouseX<60+x) && (mouseY>330 && mouseY<350) && scelta==statoGame)
  {
     print("-a");
     if(player==1) angolo1 -= 1;
     else angolo2 -= 1;
  }else if((mouseX>100+x && mouseX<140+x) && (mouseY>330 && mouseY<350) && scelta==statoGame)
  {
    print("+a");
    if(player==1) angolo1 += 1;
    else angolo2 += 1;
  }
  
  if(dist(mouseX,mouseY,100+x-20,390)<30 && scelta==statoGame){
    print("F");
    fire = true;
    //if(player==1) pl[0].run1(velocita1,angolo1);
    //else pl[1].run2(velocita2,angolo2);
  }
}

void menu(){
  strokeWeight(3);
  stroke(0);
  fill(255,255,0);
  //rectMode(CENTER);
  rect(320,240,350,450);
  fill(255,0,0);
  rect(320,120,300,150);
  //textMode(CENTER);
  textSize(30);
  fill(0);
  text("NEW GAME",240,130);
  textSize(15);
}

void seleziona(){
  int x;
  if(player==1) x = 0;
  else x = 480;
  strokeWeight(1);
  stroke(0);
  rectMode(CENTER);
  fill(255);
  rect(100+x,320,80,20);
  rect(100+x,340,80,20);
  if(player==1) fill(0,0,255);
  else fill(255,0,0);
  ellipse(100+x-20,390,60,60);
  rect(40+x,320,40,20);
  rect(120+x,320,40,20);
  rect(40+x,340,40,20);
  rect(120+x,340,40,20);
  fill(0);
  stroke(0);
  triangle(35+x,320,45+x,315,45+x,325);
  triangle(125+x,320,115+x,315,115+x,325);
  triangle(35+x,340,45+x,335,45+x,345);
  triangle(125+x,340,115+x,335,115+x,345);
  if(player==1){
    text((int)velocita1,70+x,325);
    text((int)angolo1,70+x,345);
    text("velocità",70+x+80,325);
    text("angolo",70+x+80,345);
  }
  else{
    text((int)velocita2,70+x,325);
    text((int)angolo2,70+x,345);
    text("velocità",70+x-120,325);
    text("angolo",70+x-110,345);
  }
  text("FIRE",65+x,395);
}