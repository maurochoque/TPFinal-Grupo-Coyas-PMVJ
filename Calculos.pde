class Calculos{
  private float time=Time.getDeltaTime(frameRate);
  private float cose=cos(time);
  private float seno=sin(time);
  //float po= 1;
  
  public Calculos(){
    
  }
  
  public void bajaW(PVector pos, int po){
   pos.x=pos.x+(cose*po);//* por un escalar ej (10*cose)
  } 
  public void aumW(PVector pos, int po){
   cose=-cose;
   pos.x=pos.x+(cose*po);
  
  } 
  public void rW(PVector pos, int po){
   cose=-cose;
   pos.x=pos.x+(cose*po);
  
  } 
  /*controlar y usar seno*/
   public void bajaH(PVector pos, int po){
   pos.y=pos.y+(cose*po);
  
   
  } 
  public void aumH(PVector pos, int po){
   cose=-cose;
   pos.y=pos.y+(cose*po);
  
  } 
  
  public void rH(PVector pos, int po){
   cose=-cose;
   pos.y=pos.y+(cose*po);
  } 
   /*Resta Vectores*/
   PVector distancia(PVector enemy, PVector player) {
    PVector distancia = PVector.sub(player, enemy);
    //distancia.normalize();
    return distancia;
  }
  /*Calculo angulo/producto punto */
  public float calcularAngulo(PVector v1, PVector v2) {
    float dot = v1.dot(v2);//devuelve un numero, es la + de la * entre los elementos de cada vector (x,y,z)
    float mag1 = v1.mag();//la magnitud de un vector = aplicando pitagoras a sus elementos
    float mag2 = v2.mag();
    /*  angulo = arcose (producto entre vectores / multiplicacion de modulos de vectores)*/
    float angulo= acos(dot / (mag1 * mag2));//formula para sacar el angulo
    /*****/
    float anguloG= degrees(angulo);//pasa el valor a grados
    return anguloG;
  }
  /*REFLEXION*/
  public PVector reflejar(PVector direccion, PVector normal) {
    normal.normalize();
    PVector reflejada = PVector.sub(direccion, PVector.mult(normal, 2 * direccion.dot(normal)));
    return reflejada;
  }
  
   public PVector productoVectorial(PVector v1, PVector v2) {
    float cx = v1.y * v2.z - v1.z * v2.y;
    float cy = v1.z * v2.x - v1.x * v2.z;
    float cz = v1.x * v2.y - v1.y * v2.x;
  //float area = v1.x * v2.y - v1.y * v2.x;
  
  /******OTRA FORMULA calcula directo el area****/
    float area= v1.x*v2.y - v1.y*v2.x;
    //println(cx, cy, cz, area);
    return new PVector(cx, cy, cz);
  }
  
 public boolean cPyD(Player player, ArrayList<Disparo> balasEnemigos) {
        PVector posPlayer = player.getPos(); 
        
        boolean colision = false;

        for (Disparo bala : balasEnemigos) {
            PVector posBala = bala.getPosicion().copy();//posicion actual del disparo

            float distancia = posPlayer.dist(posBala); // calcula distancia entre juygador y el disparo
          //println(bala.getPosicion(),posPlayer,distancia);
          println(distancia);
            if (distancia < 25) { 
                colision = true;
                bala.posicion.y=-100;//elimina la bala al ponerla fuera del size por el metodo de Disparo.fueradePantalla
                //println(posBala.y);
                //println("150550"); 
              }
                else{
                  //println("SSSS");
                }
                //break; // para salir del bucle
        }
        return colision;
    }
  
 
}
