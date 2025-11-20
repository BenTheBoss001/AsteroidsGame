class Spaceship extends Floater{
  public Spaceship(){
    corners = 16;
    xCorners = new int[]{8, 8, -2, -2, 16, 16, -2, -2, 8, 8, -4, -8, -9, -9, -8, -4};
    yCorners = new int[]{12, 10, 7, 3, 1, -1, -3, -7, -10, -12, -12, -8, -4, 4, 8, 12};
    myColor = 255;
    myCenterX = 300;
    myCenterY = 300;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }
  
  public void hyperSpace(){
    myXspeed = 0;
    myYspeed = 0;
    //myCenterX = Math.random()*600;
    //myCenterY = Math.random()*600;
    myPointDirection = Math.random()*360;
  }
  public void limitSpeed(){
    if (myXspeed > 10){
      myXspeed = 10;
    }
    if (myXspeed < -10){
      myXspeed = -10;
    }
    if (myYspeed > 10){
      myYspeed = 10;
    }
    if (myYspeed < -10){
      myYspeed = -10;
    }
  }
  public double getXSpeed(){return myXspeed;}
  public double getYSpeed(){return myYspeed;}
  
  public double getXPos(){return myCenterX;}
  public double getYPos(){return myCenterY;}
  
  public double getDir(){return myPointDirection;}
  
  public void collide(){
    myXspeed = -1*(myXspeed/2);
    myYspeed = -1*(myYspeed/2);
  }
}
