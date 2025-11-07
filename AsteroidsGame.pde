Spaceship ship = new Spaceship();
boolean pressingW = false;
boolean pressingS = false;
boolean pressingA = false;
boolean pressingD = false;
void setup(){
  size(600,600);
}


void draw() {
  background(0);
  ship.show();
  ship.move();
  if (pressingW == true){
    ship.accelerate(0.25);
  }
  if (pressingS == true){
    ship.accelerate(-0.25);
  }
  if (pressingA == true){
    ship.turn(-5);
  }
  if (pressingD == true){
    ship.turn(5);
  }
}

public void keyPressed(){
  if (key == 'w'){
    pressingW = true;
  }
  if (key == 's'){
    pressingS = true;
  }
  if (key == 'a'){
    pressingA = true;
  }
  if (key == 'd'){
    pressingD = true;
  }
}

public void keyReleased(){
  if (key == 'w'){
    pressingW = false;
  }
  if (key == 's'){
    pressingS = false;
  }
  if (key == 'a'){
    pressingA = false;
  }
  if (key == 'd'){
    pressingD = false;
  }
}
