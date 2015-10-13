import java.util.HashSet;

// Detect collitions between Breakers and Asteroids.  Remove the
// Asteroids involved in collisions, and replace them with smalller
// Asteroids.  Remove Breakers involved in collisions.
void handleCollisions() {
     // Asteroids which collided this timestep
  HashSet<Asteroid> collisions = new HashSet();

  // Breakers which collided this timestep.
  HashSet<Breaker> usedBreakers = new HashSet();

  // Keep track of which objects collided.  Don't delete them inside
  // the loop, because that messes up the Iterator.
  for (Breaker b : breakers) {
    for (Asteroid a : asteroids) {
      if (colliding(a, b)) {
        collisions.add(a);
        usedBreakers.add(b);
      }
    }
  }

  // Split or remove the Asteroids which collided
  for (Asteroid a : collisions) {
    asteroids.remove(a);
       if (a.canSplit()) {
         children = a.children();
         asteroids.add(children.a);
         asteroids.add(children.b);
       }
  }
  
  // Remove the Breakers which collided
  for (Breaker b : usedBreakers) {
    breakers.remove(b);
  }
}

// The number of (random) elements to create.
int initialAsteroids = 5;
int initialBreakers = 30;

ArrayList<Asteroid> asteroids = new ArrayList();
ArrayList<Breaker> breakers = new ArrayList();
Hero player;

// Store time (ms) of last update.
float t, last_t, dt;
Pair<Asteroid, Asteroid> children;

void setup() {

  // Make random Asteroids
  int i = 0;
  while(i < initialAsteroids) {
    asteroids.add(new Asteroid());
    i++;
  }

  // Randomly place Breakers
  i = 0;
  while(i < initialBreakers) {
    breakers.add(new Breaker());
    i++;
  }
  player = new Hero();
  size(500,500);
}

void draw() {
  clear();

  player.render();
  player.update();
  // Render all the Asteroids
  for(Asteroid a : asteroids) {
    a.render();
  }

  // Render all the Breakers
  for(Breaker b : breakers) {
    b.render();
  }

  // Update the positions of the Asteroids
  t = millis();
  dt = last_t - t;
  last_t = t;
  for(Asteroid a : asteroids) {
    a.update(dt);
  }
  
  handleCollisions();
}

float distance(PVector pv1, PVector pv2){
  return PVector.dist(pv1,pv2);
}

boolean colliding(Asteroid a, Breaker b){
   if (distance(a.center, b.center)<= a.radius()){
     return true;
   }else{
     return false;
   }
 }
 
 void keyPressed() {
  if (keyCode == LEFT) {
    player.setRotation(-.2);
  }
  if (keyCode == RIGHT) {
    player.setRotation(.2);
  }
  if (keyCode == UP) {
    player.setSpeed(cos(player.getRotation()),sin(player.getRotation()));
  }
  if (keyCode == DOWN) {
    player.setSpeed(cos(player.getRotation()),sin(player.getRotation()));
  }
 }
   
void keyReleased() {
  if (keyCode == LEFT) {
    player.setRotation(0);
  }
  if (keyCode == RIGHT) {
    player.setRotation(0);
  }
  if (keyCode == UP) {
    player.setSpeed(0,0);
  }
  if (keyCode == DOWN) {
    player.setSpeed(0,0);
  }
}