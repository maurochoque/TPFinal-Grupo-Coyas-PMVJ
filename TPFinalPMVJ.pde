Pantallas inicio;

Player p;
Enemy e;
SpawnerEnemigos spawnerEnemigos;
PImage fondo;
//PowerUp powerUp;
private String pantallaInicio;
void setup(){
  size(500,700);
  inicio=new Pantallas();
    //powerUp = new PowerUp(3000); 
  fondo = loadImage("Img/fondoG2.png");
  //p= new Player(new PVector (width/2,height-25)); //powerUp);
  //e= new Enemy(new PVector(width/2,30));
  //spawnerEnemigos = new SpawnerEnemigos(int(random(500,1500))); // crea un enemigo cada 0.5 o 1.5
  
  pantallaInicio = MaquinaEstados.INICIO;
  inicializarEstadoInicio();
}

void draw(){
  
  switch(pantallaInicio) {//CONDICIONAL MULTIPLE, DEPENDE A LA MAQUINA DE ESTADO SE DIBUJA
        case MaquinaEstados.INICIO://CASO EN QUE "MaquinaEstados.INICIO:" SEA TRUE
          {
            inicio.dibujar();/*PARA MAQUINA DE ESTADOS*/
            //inicioPantalla.play();//MUSICA DE LA PANTALLA DE INICIO
            break;//OBLIGATORIO EN EL "switch" PARA EVITAR QUE SIGA INTERANDO DICHO CONDICIONAL
          }
          case MaquinaEstados.JUGAR:{
             estadoJugar();
            
            break;
          }
          case MaquinaEstados.JUGARNIVEL2:{
            estadoJugarNivel2();
            p.setPuntaje(0);
            break;
          }
          case MaquinaEstados.JUGARNIVEL3:{
            estadoJugarNivel3();
            p.setPuntaje(0);
            //estadoIntermedio();
            break;
            //inicializarEstadoJugar();
            //estadoJugar();
            //pantallaInicio=MaquinaEstados.INICIO;
            //inicio.dibujar();CUANDO SE GANA
          }
          case MaquinaEstados.GANAR:{
            estadoGanar();
            break;
          }
  }
  
  /*image(fondo, 0, 0, width, height); 
  
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
  e.colision(p.getSpawner().getDisparos(),p);
  spawnerEnemigos.colision(p.getSpawner().getDisparos(),p);*/
}

void keyPressed() {
  if (keyCode==ENTER) {                  //REVISAR, ME FUNCIONO ASI, DENTRO DE LA FUNCION,
    pantallaInicio= MaquinaEstados.JUGAR;//    keyPressed no me funcionaba
    inicializarEstadoJugar();
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

  if (p.getPuntaje() >= 50) {
    pantallaInicio = MaquinaEstados.JUGARNIVEL2;
    inicializarEstadoJugarNivel2();
    
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
  
  e.colision(p.getSpawner().getDisparos(), p);
  p.colision(e.getDisparos());
  p.colision(spawnerEnemigos.getSpawner().getDisparos());
  
  if (p.getPuntaje() >= 1000) {
    pantallaInicio = MaquinaEstados.JUGARNIVEL3;
    
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
  if(p.getPuntaje() >= 1200){/*********AJUSTAR PARAMETROS PARA EL CAMBIO DE ESTADOS*********/
  e.colision(p.getSpawner().getDisparos(),p);
  pantallaInicio = MaquinaEstados.GANAR;

  
  }
  spawnerEnemigos.colision(p.getSpawner().getDisparos(),p);
 
}

void estadoGanar() {
   inicio.dibujarGanar();
}
