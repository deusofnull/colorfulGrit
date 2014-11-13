Mover mover; 
Mover mover2; 



void setup(){
 size(640,360);
 mover = new Mover();
 mover2 = new Mover();
}

void draw(){
 mover.update();
 mover.checkEdges();
 mover.display(); 
 
 mover2.update();
 mover2.checkEdges();
 mover2.display(); 
}

class Mover {
 PVector velocity;
 PVector location;
 
 Mover(){
  location = new PVector(random(width), random(height)); 
  velocity = new PVector(random(-5,5), random(-5,5));
 }
 
 void update(){
  location.add(velocity);
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
 
 void display(){
  stroke(0);
  fill(random(0,255), random(0,255), random(0,255));
  ellipse(location.x, location.y, 16,16); 
 }
  
}
