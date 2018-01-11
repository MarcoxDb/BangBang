class Cannone{
  private
    float X, Y, A;
  public
    Cannone(float x, float y){
      this.X=x;
      this.Y=y;
    }
    void display1(float a){
      a=45-a;
      this.A=a;
      pushMatrix();
      translate(X,Y);
      fill(#645B5A);
      //noStroke();
      strokeWeight(1);
      stroke(0);
      pushMatrix();
      rotate(radians(-45+A));
      ellipse(0,0,30,30);
      rectMode(CENTER);
      rect(15,0,30,30);
      popMatrix();
      fill(0);
      triangle(0,-5,15,20,-15,20);
      strokeWeight(3);
      stroke(#3B3635);
      point(0,0);
      popMatrix();
      //pal[0]= new Palla();
      //pal[0].display1(X,Y,20,a);
    }
    
    void display2(float a){
      a=45-a;
      this.A=a;
      pushMatrix();
      translate(X,Y);
      fill(#645B5A);
      //noStroke();
      strokeWeight(1);
      stroke(0);
      pushMatrix();
      rotate(radians(-135-A));
      ellipse(0,0,30,30);
      rectMode(CENTER);
      rect(15,0,30,30);
      popMatrix();
      fill(0);
      triangle(0,-5,15,20,-15,20);
      strokeWeight(3);
      stroke(#3B3635);
      point(0,0);
      popMatrix();
 //     pal[1]= new Palla();
   //   pal[1].display2(X,Y,20,a);
    }
}