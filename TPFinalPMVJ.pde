import ddf.minim.*;
Pantallas inicio;
Player p;
Enemy e;
SpawnerEnemigos spawnerEnemigos;
PImage fondo;
boolean banderaI;
//PowerUp powerUp;
String pantallaInicio;
int rTiempo;
boolean colisionActiva;

Minim minim;
AudioPlayer musicaI;
AudioPlayer musicaJugar;
AudioPlayer musicaEnemy;
AudioPlayer musicaGanar;
AudioPlayer musicaPerder;
void setup(){
  size(500,700);
  minim = new Minim(this);
  inicio=new Pantallas();
    //powerUp = new PowerUp(3000); 
  fondo = loadImage("Img/fondoG2.png");
  //p= new Player(new PVector (width/2,height-25)); //powerUp);
  //e= new Enemy(new PVector(width/2,30));
  //spawnerEnemigos = new SpawnerEnemigos(int(random(500,1500))); // crea un enemigo cada 0.5 o 1.5
  
  pantallaInicio = MaquinaEstados.INICIO;
  inicializarEstadoInicio();
  banderaI=false;
  
  musicaI = minim.loadFile("Audio/musica1.mp3");
  musicaJugar= minim.loadFile("Audio/musicaJugar.mp3");
  musicaEnemy=minim.loadFile("Audio/musicaEnemy.mp3");
  musicaGanar=minim.loadFile("Audio/musicaGanar.mp3");
  musicaPerder=minim.loadFile("Audio/musicaPerder.mp3");
}

void draw(){
  
  switch(pantallaInicio) {//CONDICIONAL MULTIPLE, DEPENDE A LA MAQUINA DE ESTADO SE DIBUJA
        case MaquinaEstados.INICIO://CASO EN QUE "MaquinaEstados.INICIO:" SEA TRUE
          {
            
            inicio.dibujar();
            //estadoGanar();
            musicaI.play();
            
            break;
          }
          case MaquinaEstados.JUGAR:{
            /********buscar solucion al reiniciar no empieza de 0 la musicaJugar*************/
            musicaEnemy.pause();
            musicaPerder.pause();
            musicaGanar.pause();
            musicaI.pause();
             estadoJugar();
             musicaJugar.play();
            break;
          }
          case MaquinaEstados.JUGARNIVEL2:{
            musicaJugar.pause();
            estadoJugarNivel2();
            p.setPuntaje(0);
            musicaEnemy.play();
            break;
          }
          case MaquinaEstados.JUGARNIVEL3:{
            //musicaEnemy.pause();
            estadoJugarNivel3();
            p.setPuntaje(0);
            //musicaEnemy.play();
            //musicaEnemy.setVolume(-2);
            //musicaJugar.play();
            //estadoIntermedio();
            
            break;
            //inicializarEstadoJugar();
            //estadoJugar();
            //pantallaInicio=MaquinaEstados.INICIO;
            //inicio.dibujar();CUANDO SE GANA
          }
          case MaquinaEstados.GANAR:{
            //musicaI.pause();
            musicaEnemy.pause();
            estadoGanar();
            musicaGanar.play();
            break;
          }
          case MaquinaEstados.PERDER:{
            musicaI.pause();
            musicaJugar.pause();
            musicaEnemy.pause();
            estadoPerder();
            musicaPerder.play();
            break;
          }
  }
  //println(millis());
  
}

void keyPressed() {
  if (keyCode==ENTER && banderaI == false) {                  //REVISAR, ME FUNCIONO ASI, DENTRO DE LA FUNCION,
    pantallaInicio= MaquinaEstados.JUGAR;//    keyPressed no me funcionaba
    inicializarEstadoJugar();
    banderaI=true;//evita que al apretar ENTER vuelva al estado del principio
  }
  p.mActi(); 
  spawnerEnemigos.activarPU();
     /* if (key == ' ') { // activa el power-up al presionar la barra espaciadora
        spawnerEnemigos.powerUp.activar();
      }*/
}

void keyReleased() {
  p.mRelaj();
}

void inicializarEstadoInicio() {
  p = new Player(new PVector(width / 2, height - 25));
  e = new Enemy(new PVector(width / 2, 30));
  spawnerEnemigos = new SpawnerEnemigos(int(random(500, 1500)));
  rTiempo = millis();
  colisionActiva = true;
}
/*******AUXILIAR PARA SIMULAR REMOVE DE OBJETOS*********/
void destruirObjetos() {
  p = null;
  e = null;
  spawnerEnemigos = null;
}

void inicializarEstadoJugar(){
  p = new Player(new PVector(width / 2, height - 25));
  spawnerEnemigos = new SpawnerEnemigos(int(random(500, 1500)));
}
void inicializarEstadoJugarNivel2() {
  
  e = new Enemy(new PVector(width / 2, 30));
}

void estadoJugar() {
  image(fondo, 0, 0, width, height); 
  p.display();
  p.move();
  Bordes.calcuBordes(p.getMovi(), 500, 500);
  spawnerEnemigos.actualizarSpawner();
  spawnerEnemigos.displayEnemigos();
  p.colision(e.getDisparos());
  p.colision(spawnerEnemigos.getSpawner().getDisparos());
  p.colision2(spawnerEnemigos.enemigos);
  spawnerEnemigos.colision(p.getSpawner().getDisparos(), p);

  if (p.getPuntaje() >= 150) {
    pantallaInicio = MaquinaEstados.JUGARNIVEL2;
    //inicializarEstadoJugarNivel2();
  }
  if(p.getVida()<=0){
    pantallaInicio=MaquinaEstados.PERDER;
  }
}

void estadoJugarNivel2() {
  image(fondo, 0, 0, width, height); 
  p.display();
  p.move();
  Bordes.calcuBordes(p.getMovi(), 500, 500);
  e.display();
  e.moverCos();
  e.detecP(p);
  e.disparar();
  //e.colision(p.getSpawner().getDisparos(), p);
  p.colision(e.getDisparos());
  p.colision(spawnerEnemigos.getSpawner().getDisparos());
  if (millis() - rTiempo > 60000) { // despues de 1 minuto se vuelve tangible
    colisionActiva = !colisionActiva; 
    //rTiempo = millis(); 
    e.colision(p.getSpawner().getDisparos(), p);
    //println("colision");
  }
  if (p.getPuntaje() >= 1000) {/*manejador para pasar de estado NO SE MUESTRA EN PANTALLA PUNTAJE (opcional manejar con tiempo)*/
    pantallaInicio = MaquinaEstados.JUGARNIVEL3; 
  }
  if(p.getVida()<=0){
    pantallaInicio=MaquinaEstados.PERDER;
  }
}
void estadoJugarNivel3() {
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
  p.colision(e.getDisparos());
  p.colision(spawnerEnemigos.getSpawner().getDisparos());
  p.colision2(spawnerEnemigos.enemigos);
  //p.colision(spawnerEnemigos.actualizarSpawner());
  if(p.getPuntaje() >= 2000){//OBJETIVOS DEL JUEGO
  e.colision(p.getSpawner().getDisparos(),p);
  pantallaInicio = MaquinaEstados.GANAR;

  
  }
  if(p.getVida()<=0){
    pantallaInicio=MaquinaEstados.PERDER;
  }
  spawnerEnemigos.colision(p.getSpawner().getDisparos(),p);
 
}

void estadoGanar() {
   inicio.dibujarGanar();
   banderaI=false;
}
void estadoPerder() {
    if(p.getVida()<=0 ){
      inicio.dibujarPerder();
    }
    banderaI=false;
   
}
