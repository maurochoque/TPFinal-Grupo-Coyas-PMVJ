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
   public PVector distancia(PVector enemy, PVector player) {
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
  /*PONER EN INTERFAZ LOS METODOS SIMILARES*/
 public boolean cPyD(Player player, ArrayList<Disparo> balasEnemigos) {
        ArrayList<Disparo> sortedBalas = new ArrayList<Disparo>(balasEnemigos);
        //sortedBalas.sort((a1, a2) -> Float.compare(a1.getPosicion().x, player.getPos().x));
        sortedBalas.sort((a1, a2) -> Float.compare(a1.getPosicion().x, a2.getPosicion().x));
        PVector posPlayer= player.getPos(); 
        int tamañoPlayer= player.getTamaño();
        /********CODIGO SIMILAR A TODAS LAS COLISIONES*************/
         boolean colision = false;
           for (int i = 0; i < sortedBalas.size(); i++) {
              Disparo a = sortedBalas.get(i);
            for (int j = i + 1; j < sortedBalas.size(); j++) {
             Disparo b = sortedBalas.get(j); 
      
             if (player.getPos().x > a.getPosicion().x + a.getTamaño())break; // No puede haber colisión más allá de esto //b.getPosicion().x
        
                // Verificación precisa
            if (dist(a.getPosicion().x, a.getPosicion().y, posPlayer.x, posPlayer.y ) < (a.getTamaño()  / 2 + tamañoPlayer / 2)) {//b.getPosicion().x, b.getPosicion().y //b.getTamaño()
               //println(a.posicion.y,a,frameRate);
               colision = true;
               sortedBalas.remove(a);
               a.posicion.y=-50;//elimina la bala al posicionarla fuera de pantalla
                
            }
          else{
            //println("NO");
       
      }
    }
  }
      
        return colision;
    }
    
    
    
    public boolean cPyE(Player player, ArrayList<Enemigo> enemigos) {
      ArrayList<Enemigo> sortedEnemigos = new ArrayList<Enemigo>(enemigos);
        //sortedBalas.sort((a1, a2) -> Float.compare(a1.getPosicion().x, player.getPos().x));
        sortedEnemigos.sort((a1, a2) -> Float.compare(a1.getPosicion().x, a2.getPosicion().x));
        PVector posPlayer= player.getPos(); 
        int tamañoPlayer= player.getTamaño();
        /********CODIGO SIMILAR A TODAS LAS COLISIONES*************/
         boolean colision = false;
           for (int i = 0; i < sortedEnemigos.size(); i++) {
              Enemigo a = sortedEnemigos.get(i);
            for (int j = i + 1; j < sortedEnemigos.size(); j++) {
             Enemigo b = sortedEnemigos.get(j); 
      
             if (player.getPos().x > a.getPosicion().x + a.getTamaño())break; // No puede haber colisión más allá de esto //b.getPosicion().x
        
                // Verificación precisa
            if (dist(a.getPosicion().x, a.getPosicion().y, posPlayer.x, posPlayer.y ) < (a.getTamaño()  / 2 + tamañoPlayer / 2)) {//b.getPosicion().x, b.getPosicion().y //b.getTamaño()
               //println(a.posicion.y,a,frameRate);
               colision = true;
               sortedEnemigos.remove(a);
               a.posicion.y=-50;//elimina la bala al posicionarla fuera de pantalla
               //println(a.posicion);
            }
          else{
            //println("NO");
       
      }
    }
  }
   
        return colision;
    }
    
    public boolean cPDyE(ArrayList<Disparo> disparoP, Enemy enemy) {//, SpawnerEnemigos spawnerEnemigos
    boolean colision = false;

    
    PVector posEnemy = enemy.getPosicion();
    for (Disparo bala : disparoP) {
        PVector posBala = bala.getPosicion().copy();//bala.getPosicion();
        float distancia = posEnemy.dist(posBala);
        if (distancia < 25) {
            colision = true;
            //posEnemy.y=-100;
            
           //break;
        }
    }

    
    

    return colision;
}



public boolean cPDyE2(ArrayList<Disparo> disparoP, SpawnerEnemigos spawner) {//, SpawnerEnemigos spawnerEnemigos
      
    
      /************FUNCIONA similar al codigo anterior, pero con sweep and prune****************/
      ArrayList<Disparo> sortedDisparos = new ArrayList<Disparo>(disparoP);
    ArrayList<Enemigo> sortedEnemigos = new ArrayList<Enemigo>(spawner.getEnemigos());

    sortedDisparos.sort((a1, a2) -> Float.compare(a1.getPosicion().x, a2.getPosicion().x));
    sortedEnemigos.sort((b1, b2) -> Float.compare(b1.getPosicion().x, b2.getPosicion().x));

    boolean colision = false;
    int j = 0;

    for (int i = 0; i < sortedEnemigos.size(); i++) {
        Enemigo enemigo = sortedEnemigos.get(i);
        /**Primer filtro**/
        while (j < sortedDisparos.size() && sortedDisparos.get(j).getPosicion().x < enemigo.getPosicion().x - enemigo.getTamaño()) {// enemigo.getTamaño()/2
            j++;
        }
        
        for (int k = j; k < sortedDisparos.size(); k++) {
            Disparo disparo = sortedDisparos.get(k);
        /*Segundo filtro*/
            if (disparo.getPosicion().x > enemigo.getPosicion().x + enemigo.getTamaño()) {
                break;
            }
        /**Colision precisa**/
            if (dist(enemigo.getPosicion().x, enemigo.getPosicion().y, disparo.getPosicion().x, disparo.getPosicion().y) < (enemigo.getTamaño() / 2 + disparo.getTamaño() / 2)) {
                colision = true;
                //sortedEnemigos.remove(i);
                enemigo.getPosicion().y = -100;
                disparo.getPosicion().y = -100;
            }
        }
    }

    return colision;
}
  

 
}
