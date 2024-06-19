class Player{
  private PVector pos;
  private PVector movi;
  private PVector v;//posible power up
  boolean mU, mD, mL, mR;
  float deltaTime = Time.getDeltaTime(frameRate);
  SpawnerBalas spawner;
  
  Player(PVector pos){
    this.pos=pos;
    //pos = new PVector(width/2,height-25);
    movi = new PVector(0,0);
    v= new PVector(250,250);
    mU = false;
    mD = false;
    mL = false;
    mR = false;
    spawner = new SpawnerBalas();

  }
  
  void display(){
    fill(0,200,50);
    square(pos.x+movi.x,pos.y+movi.y,25);
    
    spawner.displayDisparos();

    //println(pos.x,pos.y);
  }
  
  void move() {
  if (mU) {
    movi.y -= v.y*deltaTime;
  }
  if (mD) {
    movi.y += v.y*deltaTime;
  }
  if (mL) {
    movi.x -= v.x*deltaTime;
  }
  if (mR) {
    movi.x += v.x*deltaTime;
  }
   spawner.actualizarDisparos();//SI VA
}
   void disparar() {
    PVector posBala = new PVector(this.pos.x+movi.x,this.pos.y+movi.y);//PVector.add(pos, movi);
    PVector velBala = new PVector(0, -10);  // vlocidad de la bala
    spawner.agregarDisparo(posBala, velBala, 5);/*cambiar 5 por una variable*/
    //spawner.actualizarDisparos();
    //println(posBala);
  }
  
  void mActi() {
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
   //disparar();
  }

  void mRelaj() {
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
  public PVector getPos(){
    return PVector.add(pos, movi);
  }
  public PVector getMovi(){
    return movi;
  }
}
