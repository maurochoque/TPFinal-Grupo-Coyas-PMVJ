class SpawnerBalas {
  ArrayList<Disparo> disparos;
  
  SpawnerBalas() {
    disparos = new ArrayList<Disparo>();
  }
  
  void agregarDisparo(PVector posicion, PVector velocidad, float tamano) {
    
    disparos.add(new Disparo(posicion, velocidad, tamano));
  }
  
  void actualizarDisparos() {
    for (int i = disparos.size()-1; i >= 0; i--) {
      Disparo disparo = disparos.get(i);//disparos[i];
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
}
