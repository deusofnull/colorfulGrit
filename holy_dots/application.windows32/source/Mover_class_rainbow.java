import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Mover_class_rainbow extends PApplet {

Mover mover; 
Mover mover2; 



public void setup(){
 size(640,360);
 mover = new Mover();
 mover2 = new Mover();
}

public void draw(){
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
 
 public void update(){
  location.add(velocity);
 }
 
 public void checkEdges(){
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
 
 public void display(){
  stroke(0);
  fill(random(0,255), random(0,255), random(0,255));
  ellipse(location.x, location.y, 16,16); 
 }
  
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Mover_class_rainbow" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
