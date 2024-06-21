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
    float dot = v1.dot(v2);
    float mag1 = v1.mag();
    float mag2 = v2.mag();
    float angulo= acos(dot / (mag1 * mag2));
    float anguloG= degrees(angulo);
    return anguloG;
  }
  /*REFLEXION*/
  public PVector reflejar(PVector direccion, PVector normal) {
    normal.normalize();
    PVector reflejada = PVector.sub(direccion, PVector.mult(normal, 2 * direccion.dot(normal)));
    return reflejada;
  }
 
}
