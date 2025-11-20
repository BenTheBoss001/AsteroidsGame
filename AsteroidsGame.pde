Spaceship ship = new Spaceship();
Star [] stars = new Star[200];
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
boolean pressingW = false;
boolean pressingS = false;
boolean pressingA = false;
boolean pressingD = false;
void setup(){
  size(600,600);
  for (int i = 0; i < stars.length; i++){
    stars[i] = new Star();
  }
  for (int i = 0; i < (int)(Math.random()*5)+1; i++){
    asteroids.add(new Asteroid());
  }
}


void draw() {
  fill(24, 16, 74,150);
  rect(0,0,600,600);
  ship.show();
  ship.limitSpeed();
  //ship.move();
  if (pressingW == true){
    ship.accelerate(0.125);
  }
  if (pressingS == true){
    ship.accelerate(-0.125);
  }
  if (pressingA == true){
    ship.turn(-5);
  }
  if (pressingD == true){
    ship.turn(5);
  }
  for (int i = 0; i < stars.length; i++){
    stars[i].show();
    stars[i].move();
  }
  for (int i = 0; i < asteroids.size(); i++){
    asteroids.get(i).move();
    asteroids.get(i).show();
    if (dist((float)ship.getXPos(), (float)ship.getYPos(), (float)asteroids.get(i).getXPos(), (float)asteroids.get(i).getYPos()) <= asteroids.get(i).size+15) {
      ship.collide();
      asteroids.get(i).collide();
      if (asteroids.get(i).iFrames > 0){
        asteroids.get(i).iFrames--;
      }
      if (asteroids.get(i).dead == true && asteroids.get(i).iFrames == 0){
        asteroids.remove(i);
      }
    }
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
  if (key == 'h'){
    ship.hyperSpace();
    for (int i = 0; i < stars.length; i++){
    stars[i].hyperSpace();
  }
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
