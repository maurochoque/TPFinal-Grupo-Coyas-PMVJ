class Calculos{
  float time=Time.getDeltaTime(frameRate);
  float cose=cos(time);
  float seno=sin(time);
  //float po= 1;
  void bajaW(PVector pos, int po){
   pos.x=pos.x+(cose*po);//* por un escalar ej (10*cose)
  } 
  void aumW(PVector pos, int po){
   cose=-cose;
   pos.x=pos.x+(cose*po);
  
  } 
  void rW(PVector pos, int po){
   cose=-cose;
   pos.x=pos.x+(cose*po);
  
  } 
  /*controlar y usar seno*/
   void bajaH(PVector pos, int po){
   pos.y=pos.y+(cose*po);
  
   
  } 
  void aumH(PVector pos, int po){
   cose=-cose;
   pos.y=pos.y+(cose*po);
  
  } 
  
  void rH(PVector pos, int po){
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
  float calcularAngulo(PVector v1, PVector v2) {
    float dot = v1.dot(v2);
    float mag1 = v1.mag();
    float mag2 = v2.mag();
    float angulo= acos(dot / (mag1 * mag2));
    float anguloG= degrees(angulo);
    return anguloG;
  }
 
}
