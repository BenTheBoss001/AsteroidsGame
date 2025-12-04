class Asteroid extends Floater{
  private double rotSpeed;
  private int size;
  public boolean dead;
  public Asteroid(){
    corners = 6;
    size = (int)(Math.random()*3)+7;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -1*((int)(Math.random()*size)+size);
    yCorners[0] = -1*((int)(Math.random()*size)+size);
    xCorners[1] = (int)(Math.random()*size)+size;
    yCorners[1] = -1*((int)(Math.random()*size)+size);
    xCorners[2] = (int)(Math.random()*size)+size;
    yCorners[2] = 0;
    xCorners[3] = (int)(Math.random()*size)+size;
    yCorners[3] = (int)(Math.random()*size)+size;
    xCorners[4] = -1*((int)(Math.random()*size)+size);
    yCorners[4] = (int)(Math.random()*size)+size;
    xCorners[5] = -1*((int)(Math.random()*size)+size);
    yCorners[5] =0;
    myColor = 172;
    myCenterX = Math.random()*600;
    myCenterY = Math.random()*600;
    myXspeed = Math.random()*2-1;
    myYspeed = Math.random()*2-1;
    myPointDirection = 0;
    rotSpeed = Math.random()*4-2;
    dead = false;
  }
  public void move(){
    turn(rotSpeed);
    super.move();
    myCenterX -= ship.getXSpeed();    
    myCenterY -= ship.getYSpeed();     
    
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
    //wrap around screen    
    if(myCenterX >width+25)
    {     
      myCenterX = -25;    
      //myCenterY = (int)(Math.random()*height);
    }    
    else if (myCenterX<-25)
    {     
      myCenterX = width+25;
      //myCenterY = (int)(Math.random()*height);
    }    
    if(myCenterY >height+25)
    {    
      myCenterY = -25;
      //myCenterX = (int)(Math.random()*width);
    } 
    
    else if (myCenterY < -25)
    {     
      myCenterY = height+25;
      //myCenterX = (int)(Math.random()*width);
    }  
  }
  public int getSize(){return size;}
  public double getXPos(){return myCenterX;}
  public double getYPos(){return myCenterY;}
  
  public void hyperSpace(){
    myCenterX = Math.random()*600;
    myCenterY = Math.random()*600;
  }
  
  public void collide(){
    if (Math.random() > 0.2){
      //myPointDirection = -1*ship.getDir();
      this.accelerate(Math.random()*3+1/*(((Math.abs(ship.getXSpeed())+Math.abs(ship.getYSpeed())/2)+(Math.abs(myXspeed)+Math.abs(myYspeed)/2)))/2*/);
    } else {
      dead = true;
    }
  }
}
