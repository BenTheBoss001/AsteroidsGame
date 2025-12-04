Spaceship ship = new Spaceship();
Star [] stars = new Star[200];
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
boolean pressingW = false;
boolean pressingS = false;
boolean pressingA = false;
boolean pressingD = false;
int  bulletTimer = 0;
int spawnTimer = 0;
int iFrames = 0;
void setup(){
  size(600,600);
  for (int i = 0; i < stars.length; i++){
    stars[i] = new Star();
  }
  for (int i = 0; i < (int)(Math.random()*5)+3; i++){
    asteroids.add(new Asteroid());
  }
}


void draw() {
  fill(24, 16, 74,150);
  rect(-50,-50,650,650);
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
  if (spawnTimer >= 600){
    asteroids.add(new Asteroid());
    spawnTimer = 0;
  }
  spawnTimer++;
  bulletTimer--;
  for (int i = 0; i < asteroids.size(); i++){
    asteroids.get(i).move();
    asteroids.get(i).show();
    if (iFrames == 0 && dist((float)ship.getXPos(), (float)ship.getYPos(), (float)asteroids.get(i).getXPos(), (float)asteroids.get(i).getYPos()) <= asteroids.get(i).size+15) {
      ship.collide();
      asteroids.get(i).collide();
      iFrames = 60;
      if (asteroids.get(i).dead == true && iFrames == 0){
        asteroids.remove(i);
      }
    }
    if (iFrames > 0){
        iFrames--;
    }
    
  }
  for (int i = 0; i < bullets.size(); i++){
    bullets.get(i).show();
    bullets.get(i).move();
    if (bullets.get(i).checkDead()){
      bullets.remove(i);
    }
  }
  
  for (int i = asteroids.size()-1; i >= 0; i--){
    for (int j = bullets.size()-1; j >= 0; j--){
      if (dist((float)bullets.get(j).getXPos(), (float)bullets.get(j).getYPos(), (float)asteroids.get(i).getXPos(), (float)asteroids.get(i).getYPos()) <= 20) {
        asteroids.remove(i);
        bullets.remove(j);
        break;
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
    for (int i = 0; i < asteroids.size(); i++){
      asteroids.get(i).hyperSpace();
    }
    for (int i = 0; i < bullets.size(); i++){
      bullets.remove(i);
    }
    for (int i = 0; i < stars.length; i++){
    stars[i].hyperSpace();
    }
  }
  if (key == ' '){
    if (bulletTimer <= 0){
      bullets.add(new Bullet(ship));
      bulletTimer = 10;
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
