class Disparo {
  private PVector posicion;
  private PVector velocidad;
  private float tamaño;
  
  private boolean reflectante;
  private float tiempoReflexion;

  private Calculos calculo;/**/
  
  public Disparo(PVector posicion, PVector velocidad, float tamaño) {
    this.posicion = posicion.copy();//posicion; //si posicion tiene algun cambio afecta, con copy() se tiene una copia de los valores originales(sin posibles cambios)
    this.velocidad =velocidad.copy();//velocidad;//
    this.tamaño = tamaño;
    
    this.reflectante = false;
    this.tiempoReflexion = 0;
    calculo= new Calculos();

    
  }
  

  
  public void actualizar() {
    
      if(reflectante && millis() - tiempoReflexion > 10000) {
        reflectante = false;
       }
       if(reflectante) {
        verificarBordes();
       }
    
    posicion.add(velocidad);
  }
  
   public void verificarBordes() {
        if (posicion.x <= 25 || posicion.x >= width-25) {
          PVector normal = new PVector(1, 0);
          velocidad = calculo.reflejar(velocidad, normal);//velocidad = reflejar(velocidad, normal);
      }
              
     /********REVISAR PORQUE NO REBOTA EN LA PARTE BAJA (MAS CERCANA AL PLAYER)*******/
     /*CORREGIDO AUMENTE DURACION DE VIDA DE LA BALA*/
     /*REVISAR PORQUE NO REBOTA EN LA PARTE INFERIOR*/
         if (posicion.y <= 0 || posicion.y >= height) {
            println("chocaa");
            PVector normal = new PVector(0, 1);
            velocidad = calculo.reflejar(velocidad, normal);//reflejar(velocidad, normal);  
            }
          }
       /*******REFLEXION ******/
       /*PVector reflejar(PVector direccion, PVector normal) {
           normal.normalize();
           return PVector.sub(direccion, PVector.mult(normal, 2 * direccion.dot(normal)));
         }*/
  
  public void display() {
    fill(255);
    ellipse(posicion.x, posicion.y, tamaño, tamaño);
  }
  
  public boolean fueraDePantalla() {
    return (posicion.x < 0||posicion.x > width|| posicion.y < 0 || posicion.y > height);
  }
  
  
}
