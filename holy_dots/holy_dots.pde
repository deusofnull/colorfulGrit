
Mover mover; 
Mover mover2; 
  int r = 0;
  int g = 0;
  int b = 0;

void setup(){
 size(640*2,360*2);
 mover = new Mover();
 mover2 = new Mover();
 
}

void draw(){
 //background(random(0,255), random(0,255), random(0,255));
 mover.update();
 mover.checkEdges();
 mover.display(); 
 //mover.checkVelocity();
 
 mover2.update();
 mover2.checkEdges();
 mover2.display(); 
 //mover2.checkVelocity();
 
 }
 
 

class Mover {
 PVector velocity;
 PVector location;
 PVector acceleration;
 PVector mousexy;
 PVector direction;
 
 
 float topspeed;
 
 Mover(){
  location = new PVector(random(width), random(height)); 
  //velocity = new PVector(random(-5,5), random(-5,5));
  velocity = new PVector(0,0);
  acceleration = new PVector(random(-0.1,0.1),random(-0.1,0.1) );
 
   
 }
 
 void update(){
  mousexy = new PVector(mouseX, mouseY);
  
  direction = PVector.sub(mousexy,location);
  
  direction.normalize();
  
  direction.mult(5.0);
  
  //acceleration = direction;
  
  acceleration = PVector.random2D();
  
  velocity.add(acceleration);
  location.add(velocity);
  checkVelocity();
  
 }
 
 void checkEdges(){
  if (location.x > width){
     location.x = 0;
   }
  else if (location.x < 0){
     location.x = width; 
  }
  
  if (location.y > height){
     location.y = 0;
  }
  else if (location.y < 0){
     location.y = height; 
 }
}

void checkVelocity(){
  if (velocity.x > topspeed){
    velocity.x = random(-1,1);
    //print ("velocity.x > topspeed, resetting x velocity \n");
  } 
  if (velocity.y > topspeed){
    velocity.y = random(-1,1);
    //print ("velocity.y > topspeed, resetting y velocity \n");
  } 
  
  
}
 
 void display(){
  stroke(0);
  
  
  //fill(random(0,255), random(0,255), random(0,255));
  fill(r,g,b);
  r++;
  g++;
  b++;
  ellipse(location.x, location.y, 16,16); 
  
if (r == 255) {
    r = 0;
    g = 0;
    b = 0;
 }
 }
}
