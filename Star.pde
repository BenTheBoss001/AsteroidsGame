class Star{
  private int myX, myY;
  public Star(){
    myX = (int)(Math.random()*600);
    myY = (int)(Math.random()*600);
  }
  public void show(){
    fill(255);
    ellipse(myX, myY, 2,2);
  }
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myX -= ship.getXSpeed();    
    myY -= ship.getYSpeed();     

    //wrap around screen    
    if(myX >width)
    {     
      myX = 0;    
    }    
    else if (myX<0)
    {     
      myX = width;    
    }    
    if(myY >height)
    {    
      myY = 0;    
    } 
    
    else if (myY < 0)
    {     
      myY = height;    
    }   
  } 
  public void hyperSpace(){
    myX = (int)(Math.random()*600);
    myY = (int)(Math.random()*600);
  }
}
