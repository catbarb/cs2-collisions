class Hero{
} 

Hero(){
}

void polygon (float x, float y) {
  float angle = TWO_PI /3;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * 15;
    float sy = y + sin(a) * 15;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void render(){
  polygon(width/2,height/2);
}