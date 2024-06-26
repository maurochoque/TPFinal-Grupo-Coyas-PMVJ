class Player{
  private PVector posicion;
  private PVector movimiento;
  private PVector v;//posible power up
  private boolean mU, mD, mL, mR;
  private float deltaTime = Time.getDeltaTime(frameRate);
  private SpawnerBalas spawner;
  
  private PowerUp powerUp;
  Calculos calculos;
  //Enemy e;
  
  PImage img;
  PImage imgPlayer;
  private int puntaje;
  private int vida;
  public Player(PVector pos){//, PowerUp powerUp){
    this.posicion=pos;
    //pos = new PVector(width/2,height-25);
    movimiento = new PVector(0,0);
    v= new PVector(250,250);
    mU = false;
    mD = false;
    mL = false;
    mR = false;
    spawner = new SpawnerBalas();
    powerUp = new PowerUp(3000); // duracion de congelacion de 3 segundos
    img=loadImage("Img/disparoPlayer.png");
    imgPlayer= loadImage("Img/NaveSprite.png");
    calculos=new Calculos();
    //SpawnerBalas balasEnemigos=e.getSpawner();
    puntaje=0;
    vida=10;
  }
  
  
  public void display(){
    imgPlayer.resize(25,25);
    image(imgPlayer,posicion.x+movimiento.x,posicion.y+movimiento.y);
    //fill(0,200,50);
    //noFill();
    //square(posicion.x+movimiento.x,posicion.y+movimiento.y,25);
    
    spawner.displayDisparos();
    powerUp.displayEscudo(getPos());
    //println(pos.x,pos.y);
    //text(puntaje,50,height-50);//muestra puntaje en pantalla
    textSize(20);
    fill(0,220,0);
    text(vida,50,height-100);
  }
  
  public void move() {
  if (mU) {
    movimiento.y -= v.y*deltaTime;
    }
    if (mD) {
      movimiento.y += v.y*deltaTime;
    }
    if (mL) {
      movimiento.x -= v.x*deltaTime;
    }
    if (mR) {
      movimiento.x += v.x*deltaTime;
    }
     spawner.actualizarDisparos();//SI VA
     powerUp.actualizar2();
   //display();//posible para limpiar clase principal
   
  }
   public void disparar() {
    PVector posBala = new PVector(this.posicion.x+movimiento.x,this.posicion.y+movimiento.y-25);//PVector.add(posicion, movimiento);
    PVector velBala = new PVector(0, -10);  // vlocidad de la bala
   // Disparo disparo= new Disparo(posBala, velBala, 5,f);
   // spawner.agregarDisparo(disparo);
     
    spawner.agregarDisparo(posBala, velBala, 25,img);/*cambiar 5 por una variable*/
    //spawner.actualizarDisparos();
    //println(posBala);
    
  }
  
  public void mActi() {
  if (key == 'w') {
    mU = true;
  }
  if (key == 's') {
    mD = true;
  }
  if (key == 'a') {
    mL = true;
  }
  if (key == 'd') {
    mR = true;
   }
   
   if (key == 'p') {
      powerUp.activarEscudo();
   }
   //disparar();
  }

  public void mRelaj() {
    if (key == 'w') {
      mU = false;
    }
    if (key == 's') {
      mD = false;
    }
    if (key == 'a') {
      mL = false;
    }
    if (key == 'd') {
      mR = false;
    }
    if (key == 'k') {
     disparar();// se llama al metodo al dejar de apretar el boton
    }
  }
  
   public void colision(ArrayList<Disparo> balasEnemigos) {
           /* if(powerUp.escudoActivo==true){
          vida-=0;
        }*/
        if (calculos.cPyD(this, balasEnemigos)) {
          if(powerUp.escudoActivo){
          vida-=0;
        } 
             //puntaje+=10;
            //println("colision");
        else{
          vida-=1;
        }
        
          //println("NONO");
        }

    }
      public void colision2(ArrayList<Enemigo> enemigos) {
      
        if (calculos.cPyE(this, enemigos)) {
           if(powerUp.escudoActivo){
          vida-=0;
        } 
         else{
           vida-=5;
          //println("NONO");
        }
          
            //println("colision");
        }
       

    }
  
    
  public PVector getPos(){
    return PVector.add(posicion, movimiento);
  }
  public PVector getMovi(){
    return movimiento;
  }
  public SpawnerBalas getSpawner(){
    return spawner;
  }
  public void setPuntaje(int aumento){
    puntaje+=aumento;
  }
  public int getPuntaje(){
    return puntaje;
  }
  public int getVida(){
    return vida;
  }
}
