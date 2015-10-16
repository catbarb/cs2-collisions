class Breaker {
  final PVector center;

  Breaker(PVector c) {
    center = c;
  }

  // Create a Breaker with a random position, uniformly distributed
  // over the area of the window.
  Breaker() {
    center = new PVector(random(width), random(height));
  }
  
  //allows other functions to acess the size of the bracker.
  float radius() {
    return 5;
  }
  
  //draws the breaker
  void render() {
    fill(255);
    stroke(0);
    ellipse(center.x, center.y, 5, 5);
  }
}