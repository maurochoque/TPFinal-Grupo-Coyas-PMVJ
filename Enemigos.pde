class Enemigo {
  private PVector posicion;
  private PVector velocidad;
  private PVector velocidadOriginal; // guarda la velocidad original
  private int tamaño;
  private float tamañoB;
  private SpawnerBalas spawnerBalas;  
 // private ArrayList<Disparo> disparos;//cambiar por spawnerBalas
  private int intervaloDisparo;
  private int tiempoUDisparo;
  private float time=Time.getDeltaTime(frameRate);
  
  PImage img;
  PImage img2;
  PImage img3;
  float e2;
  float e3;
  public Enemigo(PVector posicion, PVector velocidad, int tamaño, int intervaloDisparo, SpawnerBalas spawnerBalas) {
    this.posicion = posicion.copy();
    this.velocidad = velocidad.copy();
    this.velocidadOriginal = velocidad.copy(); // inicia con la velocidad original, para guardar su valor
    this.tamaño = tamaño;
    this.tamañoB=20;
    this.intervaloDisparo = intervaloDisparo;
    this.tiempoUDisparo = 0;
    this.spawnerBalas = spawnerBalas; // usa la instancia pasada
    
    img= loadImage("Img/disparoEnemy.png");
    img2= loadImage("Img/AlienAzulSprite.png");
    img3= loadImage("Img/AlienRosaSprite.png");
   
  }
  
  public void actualizar() {
    posicion.add(velocidad);
    disparar();
    spawnerBalas.actualizarDisparos();/**/
    //actualizarDisparos();
  }
  
  public void display() {
    
    img3.resize(tamaño,tamaño);
    image(img3,posicion.x-12,posicion.y-12);
    
    spawnerBalas.displayDisparos();/**/
    
  }

  public void disparar() {
    float vel= 20*time;//improvisado mov en y * deltaTime
    if (millis() - tiempoUDisparo >= intervaloDisparo) {
      PVector posicionBala = posicion;//posicion.copy();
      PVector velocidadBala = new PVector(0,vel);
      spawnerBalas.agregarDisparo(posicionBala, velocidadBala, tamañoB, img);/**/
      //disparos.add(new Disparo(posicionBala, velocidadBala, 20,img));/*trabajar con spawnerBalas/Opcional*/
      tiempoUDisparo = millis();
    }
  }
  

  
  public boolean fueraDePantalla() {
    return posicion.y > height-40;
  }
  public boolean fueraDePantallaW() {
    return posicion.x > width;
  }
  
       // metodo para restaurar la velocidad original
   public void restaurarVelocidad() {
      velocidad.set(velocidadOriginal);
    }
   
  public PVector getPosicion(){
    return posicion;
  }
  public PImage getImg2(){
    return img2;
  }
  public void setImg2(PImage imgN){
    img2=imgN;
  }
  
  public PImage getImg3(){
    return img3;
  }
  public void setImg3(PImage imgN){
    img3=imgN;
  }
  public int getTamaño(){
    return tamaño;
  }
  public float getTamañoB(){
    return tamañoB;
  }
}
