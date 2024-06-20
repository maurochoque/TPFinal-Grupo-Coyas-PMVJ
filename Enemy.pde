class Enemy{
  private PVector posicion;
  private PImage imagen;
  private int power=1;
  Calculos cal;
  
  private float tiempoUltimoDisparo = 0;
  private float intervaloDisparo = 1000; 
  
  private float tiempoUltimoDisparoPower = 0;
  private float intervaloDisparoPower = 4000; // dispara cada 10 segundos
  
  SpawnerBalas spawner;

  //float time=Time.getDeltaTime(frameRate);//
  public Enemy(PVector posicion){
    this.posicion = posicion;
    //this.imagen = loadImage("yoshi_sprite.png");
    cal=new Calculos();
    spawner = new SpawnerBalas();

  }
  
  public void display(){
    fill(255);
    circle(this.posicion.x,this.posicion.y,25);
    spawner.displayDisparos();

    //PImage sprite = imagen.get(425,340,90,20);
    //sprite.resize(180,40);
    //image(sprite,this.posicion.x,this.posicion.y);
    
  }
  public void detecP(Player player){
    PVector pV = new PVector(this.posicion.x,1).normalize();
    
    //line(this.posicion.x,this.posicion.y,player.getPos().x,player.getPos().y);
    PVector dist= cal.distancia(this.posicion,player.getPos());
     
    float angulo=cal.calcularAngulo(pV,dist);
    //println(angulo);
    
   if(dist.x>5 && dist.y<230){
     power=5;
     stroke(255,11,0);
     line(this.posicion.x,this.posicion.y,player.getPos().x,player.getPos().y);
    
    }
    else{
      power=1;
      stroke(0);
    }
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
     float tiempoT=millis();
     
     // dspara bala normal cada segundo
    if (tiempoT - tiempoUltimoDisparo >= intervaloDisparo) {
      PVector posicionBala = posicion.copy();
      PVector velocidadBala = new PVector(0, 3); // velocidad de la bala
      spawner.agregarDisparo(posicionBala, velocidadBala, 5);
      tiempoUltimoDisparo = millis(); // actualiza el tiempo del ultimo disparo
    }
    
     // disparar bala grande cada 4 segundos
    if (tiempoT - tiempoUltimoDisparoPower >= intervaloDisparoPower) {
      PVector posicionBalaP = posicion.copy();
      PVector velocidadBalaP = new PVector(random(-1, 1), 3); 
            
      spawner.agregarDisparo(posicionBalaP, velocidadBalaP, 25); 
      tiempoUltimoDisparoPower = millis(); 
      
            
      
      println("aguaa");
    }

  }
  
    /*public void disparar() {
    PVector posicionBala = posicion.copy();//copy() es una copia de posicion original, si se cambia posicion en algun momento esta posicion con copy(), no se ve afectada
    PVector velocidadBala = new PVector(0, 3);  // Velocidad de la bala
    spawner.agregarDisparo(posicionBala, velocidadBala, 5);/*MODIFICAR VelocidadBala POR VARIABLE//
  }*/
  
  public PVector getPosicion(){
    return this.posicion;
  }
}
