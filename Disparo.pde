class Disparo {
  PVector pos;
  PVector vel;
  float tamaño;
  
  Disparo(PVector posicion, PVector velocidad, float tamaño) {
    this.pos = posicion.copy();//posicion; //si posicion tiene algun cambio afecta, con copy() se tiene una copia de los valores originales(sin posibles cambios)
    this.vel =velocidad.copy();//velocidad;//
    this.tamaño = tamaño;
  }
  
  void actualizar() {
    pos.add(vel);
  }
  
  void display() {
    fill(255);
    ellipse(pos.x, pos.y, tamaño, tamaño);
  }
  
  boolean fueraDePantalla() {
    return (pos.x < 0||pos.x > width|| pos.y < 0 || pos.y > height);
  }
}
