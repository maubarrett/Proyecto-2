import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

color bestColor = color(random(255), random(255), random(255));
int screen;

ArrayList<Boundary> boundaries;
ArrayList<Box> boxes;
//-----------------------------------------------------------------
void setup() {
  size(600,600);
  screen = 1;
  smooth();

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -100);

  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();
  
  boundaries.add(new Boundary(0,0,10,1200));
  boundaries.add(new Boundary(0,0,1200,10));
  boundaries.add(new Boundary(0,600,1200,10));
  boundaries.add(new Boundary(600,0,10,1200));
  boundaries.add(new Boundary(150,150,10,100));
  boundaries.add(new Boundary(450,450,10,100));
  boundaries.add(new Boundary(450,150,100,10));
  boundaries.add(new Boundary(150,450,100,10));
}
//------------------------------------------------------------------
void draw(){
  if(screen == 1){
      box2d.setGravity(0,0);
  background(50,50,170);
  text("No toques las paredes", 190,50);
  text("Utiliza las teclas W A S D", 170, 90);
  text("Clic para crear caja", 210, 130);
  text("Comenzar con E", 220, 170);
  text(":)", 300, 300);
  text("Mauricio Zúñiga Bernal", 170, 500);
  fill(0);
  textSize(25);
  

  
  if(key == 'e'){
    screen = 2;
    }
  }


if(screen == 2){
  background(160,0,0);
  text("Reiniciar con I", 240, 50);
  fill(0);
  {            
  box2d.step();

  for (Boundary wall:boundaries) {
    wall.display();
  }

  for (Box b:boxes) {
    b.display();
  }
  for (int i=boxes.size()-1; i>=0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
        }
      }
    }
  }
  if(key == 'i'){
    screen = 1;
  }
}
//---------------------------------------------------------------------------
void mousePressed() {
  Box a = new Box(mouseX,mouseY);
  boxes.add(a);
/*  if(screen == 1){
   No me salió reiniciar todo :(  
  }
  */
}
void keyPressed(){
  if(key == 'w'){
    box2d.setGravity(0, 70);
  }
  if(key == 's'){
    box2d.setGravity(0, -70);
  }
  if(key == 'd'){
    box2d.setGravity(70, 0);
  }
  if(key == 'a'){
    box2d.setGravity(-70, 0);
  }
}
  