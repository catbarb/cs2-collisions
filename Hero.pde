class Hero{
   PVector center;  // position of center, in screen coordinates
   PVector v;  // velocity, per second, in screen coordinates
   float red;
   float blue;
   float green;
   float rotation;
   float YSpeed;
   float XSpeed;

Hero(){
   center = new PVector(width/2,height/2);
   red = random(0, 255);
   blue = random(0, 255);
   green = random(0, 255);
   rotation = 0;
   YSpeed = 0;
  }

void render(){
  pushMatrix();
  translate(center.x,center.y);
  rotate(rotation);
  stroke(150);
  fill(red,blue,green);
  triangle(0,-10,5,5,-5,5);
  popMatrix();
}

void update(){
  center.copy().rotate(rotation);
  center.x = center.x+XSpeed;
  center.y = center.y+YSpeed; 
}

void setRotation(float newRotation){
  rotation = rotation+newRotation;
}

void setSpeed(float newYSpeed, float newXSpeed){
  YSpeed = newYSpeed;
  XSpeed = newXSpeed;

}

float getRotation(){
  return rotation;
}
}