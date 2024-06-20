class PowerUp {
  int duracionCongelacion; // congelacion en milisegundos
  int tiempoInicio;        // tiempo en el cual incio la congelación
  boolean activo;          // bandera del powerup

  PowerUp(int duracionCongelacion) {
    this.duracionCongelacion = duracionCongelacion;
    this.activo = false;
  }

  void activar() {
    this.activo = true;
    this.tiempoInicio = millis();
  }

  void desactivar(ArrayList<Enemigo> enemigos) {
    this.activo = false;
        restaurarEnemigos(enemigos); //restaura la velocidad de los enemigos
  }

  void actualizar(SpawnerEnemigos spawnerEnemigos) {
    if (activo) {
      if (millis() - tiempoInicio >= duracionCongelacion) {//esto es falso hasta que se presione una vez " "
        desactivar(spawnerEnemigos.enemigos);
      } else {
        congelarEnemigos(spawnerEnemigos.enemigos);// en primer instancia entra al ELSE, despues al if y desactiva la bandera
      }
    }
  }

  void congelarEnemigos(ArrayList<Enemigo> enemigos) {
    for (Enemigo enemigo : enemigos) {
      enemigo.velocidad.set(0, 0);//esto convierte la velocidad(movimiento en 0) NO LA POSICION DE CADA ENEMIGO
    }
  }
  void restaurarEnemigos(ArrayList<Enemigo> enemigos) {
    for (Enemigo enemigo : enemigos) {
      enemigo.restaurarVelocidad();
    }
  }
}
