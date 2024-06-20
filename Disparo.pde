class Disparo {
  PVector posicion;
  PVector velocidad;
  float tamaño;
  

    Calculos calculo;/**/
  Disparo(PVector posicion, PVector velocidad, float tamaño) {
    this.posicion = posicion.copy();//posicion; //si posicion tiene algun cambio afecta, con copy() se tiene una copia de los valores originales(sin posibles cambios)
    this.velocidad =velocidad.copy();//velocidad;//
    this.tamaño = tamaño;
      calculo= new Calculos();

    
  }
  

  
  void actualizar() {
    posicion.add(velocidad);
     // Lógica de rebote si la bala está en modo rebote
   
    
  }
  
  void display() {
    fill(255);
    ellipse(posicion.x, posicion.y, tamaño, tamaño);
  }
  
  boolean fueraDePantalla() {
    return (posicion.x < 0||posicion.x > width|| posicion.y < 0 || posicion.y > height);
  }
  
  
}
