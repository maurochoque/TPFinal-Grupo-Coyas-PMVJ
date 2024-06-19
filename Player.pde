class Player{
  private PVector pos;
  private PVector movi;
  private PVector v;//posible power up
  boolean mU, mD, mL, mR;
  float deltaTime = Time.getDeltaTime(frameRate);
  
  Player(PVector pos){
    this.pos=pos;
    //pos = new PVector(width/2,height-25);
    movi = new PVector(0,0);
    v= new PVector(250,250);
    mU = false;
    mD = false;
    mL = false;
    mR = false;
  }
  
  void display(){
    fill(0,200,50);
    square(pos.x+movi.x,pos.y+movi.y,25);
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
  }
  public PVector getPos(){
    return PVector.add(pos, movi);
  }
  public PVector getMovi(){
    return movi;
  }
}
