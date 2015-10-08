class Hero{
   PVector center;  // position of center, in screen coordinates
   PVector v;  // velocity, per second, in screen coordinates
   float red;
   float blue;
   float green;
   float rotation;
   float YSpeed;

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
  center.y = center.y+YSpeed; 
}

void setXRotation(float newRotation){
  rotation = rotation+newRotation;
}
void setYSpeed(float newSpeedy){
  YSpeed = newSpeedy;
}

}