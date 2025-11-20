class Star{
  private double myX, myY;
  public Star(){
    myX = Math.random()*600;
    myY = Math.random()*600;
  }
  public void show(){
    fill(255);
    ellipse((float)myX, (float)myY, 2,2);
  }
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myX -= ship.getXSpeed();    
    myY -= ship.getYSpeed();     

    //wrap around screen    
    if(myX >= width)
    {     
      myX = 0;    
      myY = (int)(Math.random()*height);
    }    
    else if (myX<0)
    {     
      myX = width;
      myY = (int)(Math.random()*height);
    }    
    if(myY >= height)
    {    
      myY = 0;
      myX = (int)(Math.random()*width);
    } 
    
    else if (myY < 0)
    {     
      myY = height;
      myX = (int)(Math.random()*width);
    }   
  } 
  public void hyperSpace(){
    myX = (int)(Math.random()*width);
    myY = (int)(Math.random()*height);
  }
}
