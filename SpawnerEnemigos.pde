class SpawnerEnemigos {
  private ArrayList<Enemigo> enemigos;
  private int intervaloSpawn;
  private int tiempoUSpawn;
  private PowerUp powerUp;
  private SpawnerBalas spawnerBalas;
  //SpawnerBalas f;
  private float time=Time.getDeltaTime(frameRate);
  private Calculos cal;
  public SpawnerEnemigos(int intervaloSpawn) {
    enemigos = new ArrayList<Enemigo>();
    this.intervaloSpawn = intervaloSpawn;
    this.tiempoUSpawn = 0;
        this.powerUp = new PowerUp(3000);
        this.spawnerBalas = new SpawnerBalas(); // crea una instancia compartida de SpawnerBalas
        //this.f= this.getSpawner();
        cal= new Calculos();
  }

  public void actualizarSpawner() {
    if (millis() - tiempoUSpawn >= intervaloSpawn) {
      agregarEnemigo();
      tiempoUSpawn = millis(); //actualiza tiempoUSpawn al valor del ultimo spawn
    }
    actualizarEnemigos();
    spawnerBalas.actualizarDisparos(); // actualiza los disparos aquí
  }

  public void agregarEnemigo() {
    
    float x = random(width);
    PVector posicion = new PVector(x, 0);
    PVector velocidad = new PVector(random(-80,80)*time, random(80,130)*time);  //velocidad de enemigo
    int tamaño = 25;
    int intervaloDisparo = 2000;  //tiempo entre cada disparo
    enemigos.add(new Enemigo(posicion, velocidad, tamaño, intervaloDisparo, spawnerBalas)); // pasa el SpawnerBalas compartido
    //enemigos.add(new Enemigo(posicion, velocidad, tamaño, intervaloDisparo));
  }

  public void actualizarEnemigos() {
    for (int i = enemigos.size() - 1; i >= 0; i--) {
      Enemigo enemigo = enemigos.get(i);
      enemigo.actualizar();
      if (enemigo.fueraDePantalla() || enemigo.fueraDePantallaW()) {//se agrego para eliminar enemigos cuando salen del width 
        enemigos.remove(i);
      }
    }
        powerUp.actualizar(this); // actualiza el estado del power-up
  }

  public void displayEnemigos() {
    for (Enemigo enemigo : enemigos) {
      enemigo.display();
    }
    spawnerBalas.displayDisparos(); // muestra los disparos aquí
  }
  
  public void activarPU(){
    if (key == ' ') { // activa el power-up al presionar la barra espaciadora
        powerUp.activar();
      }
  }
  public SpawnerBalas getSpawner(){
    return spawnerBalas;
  }
  
    public void colision(ArrayList<Disparo> balasP, Player player) {
      
        if (cal.cPDyE2(balasP ,this)) {
          player.setPuntaje(10);
           
           
        }
        else{
          //println("NONO");
        }

    }
  
   
  public ArrayList<Enemigo> getEnemigos() {
    return enemigos;
}
}
