class Enemigo {
  private PVector posicion;
  private PVector velocidad;
  private PVector velocidadOriginal; // guarda la velocidad original
  private int tamaño;
  private ArrayList<Disparo> disparos;
  private int intervaloDisparo;
  private int tiempoUDisparo;
  
  public Enemigo(PVector posicion, PVector velocidad, int tamaño, int intervaloDisparo) {
    this.posicion = posicion.copy();
    this.velocidad = velocidad.copy();
    this.velocidadOriginal = velocidad.copy(); // inicia con la velocidad original, para guardar su valor
    this.tamaño = tamaño;
    this.intervaloDisparo = intervaloDisparo;
    this.tiempoUDisparo = 0;
    this.disparos = new ArrayList<Disparo>();
  }
  
  public void actualizar() {
    posicion.add(velocidad);
    disparar();
    actualizarDisparos();
  }
  
  public void display() {
    fill(255, 0, 0);
    ellipse(posicion.x, posicion.y, tamaño, tamaño);
    displayDisparos();
  }
  
  public void disparar() {
    if (millis() - tiempoUDisparo >= intervaloDisparo) {
      PVector posicionBala = posicion.copy();
      PVector velocidadBala = new PVector(0, 3);  
      disparos.add(new Disparo(posicionBala, velocidadBala, 5));
      tiempoUDisparo = millis();
    }
  }
  
  public void actualizarDisparos() {
    for (int i = disparos.size() - 1; i >= 0; i--) {
      Disparo disparo = disparos.get(i);
      disparo.actualizar();
      if (disparo.fueraDePantalla()) {
        disparos.remove(i);
      }
    }
  }
  
  public void displayDisparos() {
    for (Disparo disparo : disparos) {
      disparo.display();
    }
  }
  
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
}
