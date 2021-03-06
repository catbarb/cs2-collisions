class Asteroid {
  final int size;  // number of sides
  PVector center;  // position of center, in screen coordinates
  final PVector v;  // velocity, per second, in screen coordinates

  Asteroid(int s, PVector c, PVector v_) {
    size = s;
    center = c;
    v = v_;
  }



  // Create a new Asteroid with a random position & velocity.  The
  // position is uniformly distributed over the window area.  The
  // velocity is in a random direction, always with magnitude 100
  // pixels/second.
  Asteroid() {
    size = 8;
    center = new PVector(random(width), random(height));
    v = new PVector(100, 0);
    v.rotate(random(TWO_PI));
  } 

  // Update the position of the Asteroid according to its velocity.
  // The argument dt is the elapsed time in milliseconds since the
  // last update.  Modifies the Asteroid.
  public void update(float dt) {
    PVector dv = v.copy();
    dv.mult(dt/1000);
    center.add(dv);
    center.x = (center.x + width) % width;
    center.y = (center.y + width) % height;
  }

  //childShape is a method of the Asteroid class which returns the number of sides of 
  //the Asteroids that are created when this Asteroid is split.
  int childShape() {
    return size-1;
  }

  //canSplit is a method of the Asteroid class which returns true if the Asteroid has 
  //more than 4 sides, and false otherwise. This ensures that square Asteroids which 
  //hit a Breaker are removed, without children.
  boolean canSplit() {
    if (size > 4) {
      return true;
    } else {
      return false;
    }
  }

  //radius is a method of the Asteroid class which returns the radius of the Asteroid. 
  //The radius is related to the number of sides by the following table. You can use 
  //these exact values, or an equation which approximates them.
  float radius() {
    if (size == 4) {
      return 10;
    }
    if (size == 5) {
      return 12.7;
    }
    if (size == 6) {
      return 16;
    }
    if (size == 7) {
      return 20.2;
    } else {
      return 25.4;
    }
  }

  // Draw a polygon with the current style.  `polygon(x, y, r, n)`
  // draws a n-sided polygon with its circumcenter at (x,y), with a
  // distance r from the center to each vertex.
  private void polygon (float x, float y, float radius, int npoints) {
    float angle = TWO_PI / npoints;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }

  //render is a method of the Asteroid class that draws the Asteroid.
  void render() {
    fill(255);
    stroke(0);
    polygon(center.x, center.y, radius(), size);
  }

  //childVelocities is a method of the Asteroid class that returns the velocities of the 2 
  //new Asteroids created when one hits a Breaker. Each velocity should have magnitude 1.1 
  //times that of the parent Asteroid. One should point 30° clockwise of the parent 
  //velocity, and one should point 30° counterclockwise. You may find the Pair class 
  //helpful.
  Pair<PVector, PVector> childVelocities() {
    PVector childVelocity1 = v.copy();
    PVector childVelocity2 = v.copy();

    childVelocity1.mult(1.1);
    childVelocity1.rotate(radians(30));
    childVelocity2.mult(1.1);
    childVelocity2.rotate(radians(-30));

    Pair<PVector, PVector> childVelocities = new Pair (childVelocity1, childVelocity2); 
    return childVelocities;
  }

  //children is a method of the Asteroid class that returns the two Asteroids created when 
  //one hits a Breaker. The velocities & number of sides of the children are defined by 
  //childShape and childVelocities, above. The position of the children is the same as that 
  //of the parent. Use the Pair class to return two Asteroids.
  Pair children() {
    Asteroid child1 = new Asteroid(childShape(), this.center.copy(), childVelocities().a);
    Asteroid child2 = new Asteroid(childShape(), this.center.copy(), childVelocities().b);

    Pair<Asteroid, Asteroid> children = new Pair (child1, child2); 
    return children;
  }
}