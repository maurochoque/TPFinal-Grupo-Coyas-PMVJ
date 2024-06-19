Player p;
Enemy e;
void setup(){
  size(500,500);
  p= new Player(new PVector (width/2,height-25));
  e= new Enemy(new PVector(width/2,30));
}

void draw(){
  
  background(250);
  p.display();
  p.move();
  Bordes.calcuBordes(p.getMovi(),500,500);
  e.display();
  e.moverCos();
  e.detecP(p);
 
}

void keyPressed() {
  p.mActi(); 
}

void keyReleased() {
  p.mRelaj();
}
