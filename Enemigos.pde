class Enemigo {
  private PVector posicion;
  private PVector velocidad;
  private PVector velocidadOriginal; // guarda la velocidad original
  private int tamaño;
  private SpawnerBalas spawnerBalas;  
 // private ArrayList<Disparo> disparos;//cambiar por spawnerBalas
  private int intervaloDisparo;
  private int tiempoUDisparo;
  private float time=Time.getDeltaTime(frameRate);
  
  PImage img;
  public Enemigo(PVector posicion, PVector velocidad, int tamaño, int intervaloDisparo, SpawnerBalas spawnerBalas) {
    this.posicion = posicion.copy();
    this.velocidad = velocidad.copy();
    this.velocidadOriginal = velocidad.copy(); // inicia con la velocidad original, para guardar su valor
    this.tamaño = tamaño;
    this.intervaloDisparo = intervaloDisparo;
    this.tiempoUDisparo = 0;
    this.spawnerBalas = spawnerBalas; // usa la instancia pasada
    //this.spawnerBalas = new SpawnerBalas();/**/
    //this.disparos = new ArrayList<Disparo>();
    img= loadImage("Img/disparoEnemy.png");
  }
  
  public void actualizar() {
    posicion.add(velocidad);
    disparar();
    spawnerBalas.actualizarDisparos();/**/
    //actualizarDisparos();
  }
  
  public void display() {
    fill(255, 0, 0);
    ellipse(posicion.x, posicion.y, tamaño, tamaño);
    spawnerBalas.displayDisparos();/**/
    //displayDisparos();
  }
  
  public void disparar() {
    float vel= 20*time;//improvisado mov en y * deltaTime
    if (millis() - tiempoUDisparo >= intervaloDisparo) {
      PVector posicionBala = posicion.copy();
      PVector velocidadBala = new PVector(0,vel);
      spawnerBalas.agregarDisparo(posicionBala, velocidadBala, 20, img);/**/
      //disparos.add(new Disparo(posicionBala, velocidadBala, 20,img));/*trabajar con spawnerBalas/Opcional*/
      tiempoUDisparo = millis();
    }
  }
  
  /*public void actualizarDisparos() {
    for (int i = disparos.size() - 1; i >= 0; i--) {
      Disparo disparo = disparos.get(i);
      disparo.actualizar();
      if (disparo.fueraDePantalla()) {
        disparos.remove(i);
      }
    }
  }*/
  
  /*public void displayDisparos() {
    for (Disparo disparo : disparos) {
      disparo.display();
    }
  }*/
  
  public boolean fueraDePantalla() {
    return posicion.y > height;
  }
  public boolean fueraDePantallaW() {
    return posicion.y > width;
  }
  
       // metodo para restaurar la velocidad original
   public void restaurarVelocidad() {
      velocidad.set(velocidadOriginal);
    }
    /*public ArrayList<Disparo> getDisparos() {
    return spawnerBalas.getDisparos();
  }*/
  
  /*public SpawnerBalas getSpawner(){
    return spawnerBalas;
  }*/
  public PVector getPosicion(){
    return posicion;
  }
    
}
