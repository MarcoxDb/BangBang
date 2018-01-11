class Campo{
 // private
  public
    void nuvola(float x,float y){
      strokeWeight(1);
      stroke(0);
      //noStroke();
      fill(255);
      pushMatrix();
      translate(x,y);
      ellipse(0,-20,40,40);
      ellipse(0,20,40,40);
      ellipse(-30,-15,30,30);
      ellipse(-30,15,30,30);
      ellipse(-50,-10,20,20);
      ellipse(-50,10,20,20);
      ellipse(-60,0,20,20);
      ellipse(30,-15,30,30);
      ellipse(30,15,30,30);
      ellipse(45,0,20,20);
      noStroke();
      ellipse(0,0,62,62);
      ellipse(-44,0,35,35);
      ellipse(36,0,26,26);
      popMatrix();
    }
    
    void moveNuvola(){
      
    }
    
    void cielo(float[] x,float[] y){
      fill(#F0CF13);
      ellipseMode(CENTER);
      strokeWeight(1);
      stroke(0);
      pushMatrix();
      translate(x[0],y[0]);
      ellipse(0,0,40,40);
      triangle(0,-50,-5,-25,5,-25);
      for(int i = 0; i < 11; i++){
        rotate(radians(30));
        triangle(0,-50,-5,-25,5,-25);
      }
      popMatrix();
      
      for(int i = 1; i < 6; i++)
        image(r,x[i]+=random(-0.5,0.5),y[i]+=random(-1,1),36,15);
      for(int i = 6; i < 9; i++){
        if(x[i]>width+70) x[i]=-70;
        nuvola(x[i]+=0.1,y[i]);
      }
    }
    void display(float[] x,float[] y){
      strokeWeight(1);
      fill(#2A9812);
      //rectMode(CENTER);
      rect(318,380,644,200);
      this.cielo(x,y);
    }
}  