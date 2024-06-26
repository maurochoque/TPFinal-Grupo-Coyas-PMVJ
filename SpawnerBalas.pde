class SpawnerBalas {
  private ArrayList<Disparo> disparos;
  
  public SpawnerBalas() {
    disparos = new ArrayList<Disparo>();
  }
  
  
  public void agregarDisparo(Disparo disparo) {//MISMO METODO RECIBE DIFERENTES PARAMETROS
     disparos.add(disparo);
    }
          
  public void agregarDisparo(PVector posicion, PVector velocidad, float tamano) {
    
    disparos.add(new Disparo(posicion, velocidad, tamano));
  }
  public void agregarDisparo(PVector posicion, PVector velocidad, float tamano,PImage img) {
    
    disparos.add(new Disparo(posicion, velocidad, tamano,img));
  }
  
  public void actualizarDisparos() {
    for (int i = disparos.size()-1; i >= 0; i--) {
      Disparo disparo = disparos.get(i);//disparos[i];
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
  
   public ArrayList<Disparo> getDisparos() {
        return disparos;
    }
}
