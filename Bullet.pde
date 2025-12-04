class Bullet extends Floater{
  boolean dead;
  public Bullet(Spaceship theShip){
    corners = 4;
    xCorners = new int[]{1, 1, -8, -8};
    yCorners = new int[]{1, -1, -1, 1};
    myColor = #FF0000;
    myCenterX = theShip.getXPos();
    myCenterY = theShip.getYPos();
    //myXspeed = theShip.getXSpeed();
    //myYspeed = theShip.getYSpeed();
    myPointDirection = theShip.getDir();
    accelerate(8);
    dead = false;
  }
  public void move(){
    super.move();
    if (myCenterX > width - 5 || myCenterX < 0 + 5 || myCenterY > height - 5 || myCenterY < 0 + 5){
      dead = true;
    }
  }
  public double getXPos(){return myCenterX;}
  public double getYPos(){return myCenterY;}
  
  public boolean checkDead(){
    return dead;
  }
}
