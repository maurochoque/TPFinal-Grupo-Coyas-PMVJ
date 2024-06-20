Player p;
Enemy e;
SpawnerEnemigos spawnerEnemigos;

void setup(){
  size(500,500);
  p= new Player(new PVector (width/2,height-25));
  e= new Enemy(new PVector(width/2,30));
  spawnerEnemigos = new SpawnerEnemigos(int(random(500,1500))); // crea un enemigo cada 1seg

}

void draw(){
  
  background(250);
  p.display();
  p.move();
  Bordes.calcuBordes(p.getMovi(),500,500);
  e.display();
  e.moverCos();
  e.detecP(p);
  e.disparar();
  spawnerEnemigos.actualizarSpawner();
  spawnerEnemigos.displayEnemigos();
  //println(millis());
}

void keyPressed() {
  p.mActi(); 
}

void keyReleased() {
  p.mRelaj();
}
