Player p;
Enemy e;
SpawnerEnemigos spawnerEnemigos;
PImage fondo;
//PowerUp powerUp;
void setup(){
  size(500,700);
    //powerUp = new PowerUp(3000); 
  fondo = loadImage("Img/fondoG2.png");
  p= new Player(new PVector (width/2,height-25)); //powerUp);
  e= new Enemy(new PVector(width/2,30));
  spawnerEnemigos = new SpawnerEnemigos(int(random(500,1500))); // crea un enemigo cada 1seg
  
}

void draw(){
  image(fondo, 0, 0, width, height); 
  //background(250);
  p.display();
  p.move();
  Bordes.calcuBordes(p.getMovi(),500,500);
  e.display();
  e.moverCos();
  e.detecP(p);
  e.disparar();
  //e.disparoPower();
  spawnerEnemigos.actualizarSpawner();
  spawnerEnemigos.displayEnemigos();
  //println(millis());
  //println(frameRate);
  p.update(e.getDisparos());
  //p.update(spawnerEnemigos.actualizarSpawner());
}

void keyPressed() {
  p.mActi(); 
  spawnerEnemigos.activarPU();
     /* if (key == ' ') { // activa el power-up al presionar la barra espaciadora
        spawnerEnemigos.powerUp.activar();
      }*/
}

void keyReleased() {
  p.mRelaj();
}
