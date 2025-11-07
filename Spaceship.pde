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
}
