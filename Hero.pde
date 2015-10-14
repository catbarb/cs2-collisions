//This creates a triangle that can move around the screen

class Hero{
   PVector center;  // the position of center, in screen coordinates
   PVector v;  // the velocity, per second, in screen coordinates
   float red; // the red color
   float blue; // the blue color
   float green; // the green color
   float rotation; // the roation of the triangle that is the player in radians
   float YSpeed; // the number of screen coordinates that the triange moves along the y axis
   float XSpeed; //the number of screen coordinates that the triange moves along the x axis

Hero(){
   center = new PVector(width/2,height/2); //starts the player in the center of the screen
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
  return rotation-radians(90);
}
}