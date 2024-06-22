class Player{
  private PVector posicion;
  private PVector movimiento;
  private PVector v;//posible power up
  private boolean mU, mD, mL, mR;
  private float deltaTime = Time.getDeltaTime(frameRate);
  private SpawnerBalas spawner;
  
  private PowerUp powerUp;
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
    powerUp = new PowerUp(3000); // duración de congelación de 3 segundos
  }
  
  public void display(){
    fill(0,200,50);
    square(posicion.x+movimiento.x,posicion.y+movimiento.y,25);
    
    spawner.displayDisparos();
    powerUp.displayEscudo(getPos());
    //println(pos.x,pos.y);
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
    PVector posBala = PVector.add(posicion, movimiento);//new PVector(this.posicion.x+movimiento.x,this.posicion.y+movimiento.y);
    PVector velBala = new PVector(0, -10);  // vlocidad de la bala
    spawner.agregarDisparo(posBala, velBala, 5);/*cambiar 5 por una variable*/
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
  public PVector getPos(){
    return PVector.add(posicion, movimiento);
  }
  public PVector getMovi(){
    return movimiento;
  }
}
