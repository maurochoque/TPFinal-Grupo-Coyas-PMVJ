class Enemigo {
  PVector posicion;
  PVector velocidad;
  int tamaño;
  ArrayList<Disparo> disparos;
  int intervaloDisparo;
  int tiempoUDisparo;
  
  Enemigo(PVector posicion, PVector velocidad, int tamaño, int intervaloDisparo) {
    this.posicion = posicion.copy();
    this.velocidad = velocidad.copy();
    this.tamaño = tamaño;
    this.intervaloDisparo = intervaloDisparo;
    this.tiempoUDisparo = 0;
    this.disparos = new ArrayList<Disparo>();
  }
  
  void actualizar() {
    posicion.add(velocidad);
    disparar();
    actualizarDisparos();
  }
  
  void display() {
    fill(255, 0, 0);
    ellipse(posicion.x, posicion.y, tamaño, tamaño);
    displayDisparos();
  }
  
  void disparar() {
    if (millis() - tiempoUDisparo >= intervaloDisparo) {
      PVector posicionBala = posicion.copy();
      PVector velocidadBala = new PVector(0, 3);  // Velocidad de la bala
      disparos.add(new Disparo(posicionBala, velocidadBala, 5));
      tiempoUDisparo = millis(); // Actualiza el tiempo del último disparo
    }
  }
  
  void actualizarDisparos() {
    for (int i = disparos.size() - 1; i >= 0; i--) {
      Disparo disparo = disparos.get(i);
      disparo.actualizar();
      if (disparo.fueraDePantalla()) {
        disparos.remove(i);
      }
    }
  }
  
  void displayDisparos() {
    for (Disparo disparo : disparos) {
      disparo.display();
    }
  }
  
  boolean fueraDePantalla() {
    return posicion.y > height;
  }
}
