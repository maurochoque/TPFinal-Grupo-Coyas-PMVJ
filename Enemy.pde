class Enemy{
  private PVector posicion;
  private PImage imagen;
  private int power=1;
  Calculos cal;
  //float time=Time.getDeltaTime(frameRate);//
  public Enemy(PVector posicion){
    this.posicion = posicion;
    //this.imagen = loadImage("yoshi_sprite.png");

    cal=new Calculos();
  }
  
  public void display(){
    fill(255);
    circle(this.posicion.x,this.posicion.y,25);
    
    //PImage sprite = imagen.get(425,340,90,20);
    //sprite.resize(180,40);
    //image(sprite,this.posicion.x,this.posicion.y);
    
  }
  public void detecP(Player player){
    PVector pV = new PVector(this.posicion.x,1).normalize();
    
    //line(this.posicion.x,this.posicion.y,player.getPos().x,player.getPos().y);
    PVector dist= cal.distancia(this.posicion,player.getPos());
     
    float angulo=cal.calcularAngulo(pV,dist);
    println(angulo);
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
     
    if(this.posicion.x >= 150){
      cal.bajaW(this.posicion,power);
    }
    if(this.posicion.x > 350){
      cal.aumW(this.posicion,power);
    }
    
    if(this.posicion.x <= 150){
      cal.rW(this.posicion,power);
    }
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

  }
  
  public PVector getPosicion(){
    return this.posicion;
  }
}
