class Disparo {
  private PVector posicion;
  private PVector velocidad;
  private float tamaño;
  
  private boolean reflectante;
  private float tiempoReflexion;

  private Calculos calculo;/**/
  PImage img;
  //PImage f;
  public Disparo(PVector posicion, PVector velocidad, float tamaño) {
    this.posicion = posicion.copy();//posicion; //si posicion tiene algun cambio afecta, con copy() se tiene una copia de los valores originales(sin posibles cambios)
    this.velocidad =velocidad.copy();//velocidad;//
    this.tamaño = tamaño;
    
    this.reflectante = false;
    this.tiempoReflexion = 0;
    calculo= new Calculos();
      //f=loadImage("Img/disparoPlayer.jpeg");
    
  }
  
   public Disparo(PVector posicion, PVector velocidad, float tamaño, PImage img) {
    this.posicion = posicion.copy();//posicion; //si posicion tiene algun cambio afecta, con copy() se tiene una copia de los valores originales(sin posibles cambios)
    this.velocidad =velocidad.copy();//velocidad;//
    this.tamaño = tamaño;
    
    this.reflectante = false;
    this.tiempoReflexion = 0;
    calculo= new Calculos();
      //f=loadImage("Img/disparoPlayer.jpeg");
    this.img=img;
  }

  
  public void actualizar() {
    
      if(reflectante && millis() - tiempoReflexion > 10000) {
        reflectante = false;
       }
       if(reflectante) {
        verificarBordes();
       }
    //println(millis());
    posicion.add(velocidad);
  }
  
   public void verificarBordes() {
        if (posicion.x <= 5 || posicion.x >= width-25) {
          PVector normal = new PVector(1, 0);
          velocidad = calculo.reflejar(velocidad, normal);//velocidad = reflejar(velocidad, normal);
          
      }
              
    
         if (posicion.y <= 5 || posicion.y >= height-50) {
            //println("chocaa");
            PVector normal = new PVector(0, 1);
            velocidad = calculo.reflejar(velocidad, normal);//reflejar(velocidad, normal);  
            }
          }
     
  
  public void display() {
    
    if (img != null) {
      image(img, posicion.x, posicion.y, tamaño, tamaño);
      //println("carga img");
    } else {
      
      fill(255);
      rect(posicion.x, posicion.y, tamaño, tamaño);
    }
  }
  
  public boolean fueraDePantalla() {
    return (posicion.x < 0||posicion.x > width|| posicion.y < 0 || posicion.y > height-45); 
  }
  
   public PVector getPosicion() {
        return posicion;
    }
    public float getTamaño() {
        return tamaño;
    }

}
