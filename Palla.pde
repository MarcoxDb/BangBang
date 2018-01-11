final float g = 9.81;
class Palla{
  private
    float x0, y0, x, y, V0, ang, t;
    float Vx,Vy;
  public
    Palla(float _x0,float _y0){
        this.x0=_x0;
        this.y0=_y0;
        this.x = 0;
        this.y = 0;
        this.t=0;
      }
      
    void display1(){
      fill(0, 0, 255);
      ellipseMode(CENTER);
      //rotate(radians(180));
      pushMatrix();
      //translate(0,500);
      ellipse(x0+x, y0+y, 20, 20);
      popMatrix();
    }
    
     void display2(){
       fill(255,0,0);
       ellipseMode(CENTER);
       //rotate(radians(180));
       pushMatrix();
       //translate(1000,500);
       ellipse(x0+x,y0+y, 20, 20);
       popMatrix();
     }

    void move1(float _V0, float _ang){
      V0=_V0;
      ang=radians(_ang);
      Vx = V0*cos(ang);
      Vy = V0*sin(ang);
      x = Vx*t;
      y = -((Vy*t)-(g/2*sq(t)));
      t += 1/frameRate*5;
    }
    
    void move2(float _V0, float _ang){
      V0=_V0;
      ang=radians(_ang);
      Vx = V0*cos(ang);
      Vy = V0*sin(ang);
      x = -Vx*t;
      y = -((Vy*t)-(g/2*sq(t)));
      t += 1/frameRate*5;
    }
    
     void run1(float _V0, float _ang){
       display1();
       move1(_V0, _ang);
     }
     
     void run2(float _V0, float _ang){
       display2();
       move2(_V0, _ang);
     }
}