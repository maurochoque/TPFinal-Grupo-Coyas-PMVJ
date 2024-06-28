class Enemy{
  private PVector posicion;
  private PImage imagen;
  private int power=1;
  private Calculos cal;
  
  private float tiempoUltimoDisparo = 0;
  private float intervaloDisparo = 1000; 
  
  private float tiempoUltimoDisparoPower = 0;
  private float intervaloDisparoPower = 4000; // dispara cada 10 segundos
  
  private SpawnerBalas spawner;
  
  PImage img;
  
  PImage imgPW;
  //float time=Time.getDeltaTime(frameRate);//
  public Enemy(PVector posicion){
    this.posicion = posicion;
    //this.imagen = loadImage("yoshi_sprite.png");
    cal=new Calculos();
    spawner = new SpawnerBalas();
    img= loadImage("Img/disparoEnemy.png");
    imgPW = loadImage("Img/disparoEnemyPW.png");
  }
  
  public void display(){
    fill(255);
    circle(this.posicion.x,this.posicion.y,25);
    spawner.displayDisparos();

    //PImage sprite = imagen.get(425,340,90,20);
    //sprite.resize(180,40);
    //image(sprite,this.posicion.x,this.posicion.y);
    
  }
 
    public void actualizarDisparos() {
        spawner.actualizarDisparos();
    }

    public ArrayList<Disparo> getDisparos() {
        return spawner.getDisparos();
    }
  
  
  public void detecP(Player player){
    PVector pV = new PVector(this.posicion.x,0).normalize();
    
    //line(this.posicion.x,this.posicion.y,player.getPos().x,player.getPos().y);
    PVector dist= cal.distancia(this.posicion,player.getPos());
     
    float angulo=cal.calcularAngulo(pV,dist);
    //println(angulo);
    
   if(dist.y <= 600){ //(dist.x>5 && dist.y<230){
     power=15;//player al acercarse aumenta movimiento de enemy
     stroke(255,11,0);
     line(this.posicion.x,this.posicion.y,player.getPos().x,player.getPos().y);
    //println(dist);
    
    }
    else{
      power=1;
      stroke(0);
    }
    /*******COMBINAR CON LA BALA POWERUP***********/
    if(angulo > 110 || angulo < 70){
      line(this.posicion.x,this.posicion.y,player.getPos().x,player.getPos().y);
    }
    
  }
  
  public void moverCos(){
     
    if(this.posicion.x >= 25){
      cal.bajaW(this.posicion,power);
    }
    if(this.posicion.x > 475){
      cal.aumW(this.posicion,power);
    }
    
    if(this.posicion.x <= 25){
      cal.rW(this.posicion,power);
    }
    spawner.actualizarDisparos();
  }
  
  public void moverSeno(){
   
    if(this.posicion.y >= 0){
      cal.bajaH(this.posicion,power);
    }
    if(this.posicion.y > 620){
      cal.aumH(this.posicion,power);
    }
    
    if(this.posicion.y <= 0){
      cal.rH(this.posicion,power);
    }
    spawner.actualizarDisparos();
    
  }
   public void disparar() {
     float tiempoT=millis();/*CREAR ESTA VARIABLE EN INTERFAZ*/
     
     // dspara bala normal cada segundo
    if (tiempoT - tiempoUltimoDisparo >= intervaloDisparo) {//EN PRINCIPIO NO SE CUMPLE PERO tiempoT aumenta segun el tiempo 1000=1segundo
      PVector posicionBala = posicion.copy();//this.posicion;
      PVector velocidadBala = new PVector(0, 3); // velocidad de la bala
      spawner.agregarDisparo(posicionBala, velocidadBala, 25,img);
      tiempoUltimoDisparo = millis(); // actualiza el tiempo del ultimo disparo
    }
    
     // disparar bala grande cada 4 segundos
    if (tiempoT - tiempoUltimoDisparoPower >= intervaloDisparoPower) {
      PVector posicionBalaP = posicion.copy();
      PVector velocidadBalaP = new PVector(random(-5, 5), random(0,3));//"direccion" hacia donde saldra la bala grande
      Disparo disparo = new Disparo(posicionBalaP, velocidadBalaP, 30,imgPW);
      disparo.reflectante = true;
      disparo.tiempoReflexion = millis();
      spawner.agregarDisparo(disparo);
      //spawner.agregarDisparo(posicionBalaP, velocidadBalaP, 25); 
      tiempoUltimoDisparoPower = millis(); 
      //println("se crea");
    }
  }
    public void colision(ArrayList<Disparo> balasP, Player player) {
      
        if (cal.cPDyE(balasP ,this)) {
             player.setPuntaje(1000);
            //println("colision");
        }
        else{
          //println("NONO");
        }

    }
  
  public PVector getPosicion(){
    return this.posicion;
  }
  public void setPosicion(PVector pos){
    posicion=pos;
  }
  
  public SpawnerBalas getSpawner(){
    return spawner;
  }
}
