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
   red = random(0, 255); //sets a random red color value
   blue = random(0, 255); //sets a random blue color value
   green = random(0, 255); //sets a random green color value
   rotation = 0; //starts rotation at 0
   YSpeed = 0; //starts speed at 0
  }

//Draws the ship/triangle.
void render(){
  pushMatrix();
  translate(center.x,center.y);
  rotate(rotation);
  stroke(150);
  fill(red,blue,green);
  triangle(0,-10,5,5,-5,5);
  popMatrix();
}

//sets the new x and y positions of the ship as it moves.
void update(){
  center.copy().rotate(rotation);
  center.x = center.x+XSpeed;
  center.y = center.y+YSpeed; 
}

//changes the direction that the ship/triangle is facing.
void setRotation(float newRotation){
  rotation = rotation+newRotation;
}

//defines the speed that the ship moves at.
void setSpeed(float newYSpeed, float newXSpeed){
  YSpeed = newYSpeed;
  XSpeed = newXSpeed;

}

//turns the rotation amount into a value that other fuctions can use 
//reative to the position that the triangle is facing.
float getRotation(){
  return rotation-radians(90);
}
}
