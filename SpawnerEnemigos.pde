class SpawnerEnemigos {
  ArrayList<Enemigo> enemigos;
  int intervaloSpawn;
  int tiempoUSpawn;

  SpawnerEnemigos(int intervaloSpawn) {
    enemigos = new ArrayList<Enemigo>();
    this.intervaloSpawn = intervaloSpawn;
    this.tiempoUSpawn = 0;
  }

  void actualizarSpawner() {
    if (millis() - tiempoUSpawn >= intervaloSpawn) {
      agregarEnemigo();
      tiempoUSpawn = millis(); //actualiza tiempoUSpawn al valor del ultimo spawn
    }
    actualizarEnemigos();
  }

  void agregarEnemigo() {
    float x = random(width);
    PVector posicion = new PVector(x, 0);
    PVector velocidad = new PVector(random(-2,2), 2);  //velocidad de enemigo
    int tamaño = 25;
    int intervaloDisparo = 2000;  //tiempo entre cada disparo
    enemigos.add(new Enemigo(posicion, velocidad, tamaño, intervaloDisparo));
  }

  void actualizarEnemigos() {
    for (int i = enemigos.size() - 1; i >= 0; i--) {
      Enemigo enemigo = enemigos.get(i);
      enemigo.actualizar();
      if (enemigo.fueraDePantalla()) {
        enemigos.remove(i);
      }
    }
  }

  void displayEnemigos() {
    for (Enemigo enemigo : enemigos) {
      enemigo.display();
    }
  }
}
