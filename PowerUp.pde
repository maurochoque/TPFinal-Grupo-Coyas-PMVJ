class PowerUp {
  private int duracionCongelacion; // congelacion en milisegundos
  private int tiempoInicio;        // tiempo en el cual incio la congelación
  private boolean activo;     // bandera del powerup

  private boolean escudoActivo;
  private int duracionEscudo;
  private int tiempoInicioEscudo;
  private Calculos calculo;
      
      
      PImage img2;
  PImage img3;
  public PowerUp(int duracionCongelacion) {
    this.duracionCongelacion = duracionCongelacion;
    this.activo = false;
    
    this.escudoActivo = false;
    this.duracionEscudo = 3000; 
    this.calculo = new Calculos();
    
    img2= loadImage("Img/AlienAzulSprite.png");
    img3= loadImage("Img/AlienRosaSprite.png");
  }

  private void activar() {
    this.activo = true;
    this.tiempoInicio = millis();
  }

  private void desactivar(ArrayList<Enemigo> enemigos) {
    this.activo = false;
        restaurarEnemigos(enemigos); //restaura la velocidad de los enemigos
  }

  private void actualizar(SpawnerEnemigos spawnerEnemigos) {
    if (activo) {
      if (millis() - tiempoInicio >= duracionCongelacion) {//esto es falso hasta que se presione una vez " "
        desactivar(spawnerEnemigos.enemigos);
      } else {
        congelarEnemigos(spawnerEnemigos.enemigos);// en primer instancia entra al ELSE, despues al if y desactiva la bandera
      }
    }
      
  }
  
    void actualizar2(){/*necesario para manejar el escudo*/
      if (escudoActivo && millis() - tiempoInicioEscudo >= duracionEscudo) {
      escudoActivo = false;
    }
        }

  private void congelarEnemigos(ArrayList<Enemigo> enemigos) {
    for (Enemigo enemigo : enemigos) {
      enemigo.velocidad.set(0, 0);//esto convierte la velocidad(movimiento en 0) NO LA POSICION DE CADA ENEMIGO
      enemigo.setImg3(img2);
    }
  }
  private void restaurarEnemigos(ArrayList<Enemigo> enemigos) {
    for (Enemigo enemigo : enemigos) {
      enemigo.restaurarVelocidad();
      enemigo.setImg3(img3);
    }
  }
  
   public void activarEscudo() {
    this.escudoActivo = true;
    this.tiempoInicioEscudo = millis();
    
  }
      /* public boolean escudoA() {
    return escudoActivo;
  }*/
  public void displayEscudo(PVector posicionPlayer) {
    if (escudoActivo) {
      
      stroke(50, 255, 0);
      noFill();
      //translate(posicionPlayer.x,posicionPlayer.y);
      PVector referencia = new PVector(1,1); //referencia para clacular el escudo
      //PVector ref= new PVector(posicionPlayer.x,posicionPlayer.y);
      //float radio = 50; // radio del escudo
      PVector pc = calculo.productoVectorial(referencia, new PVector(1, 0)); // producto vectorial con vector fijo
      //PVector pp = calculo.productoVectorial(referencia,posicionPlayer);
      
      float area = pc.mag();
      
            // normaliza la magnitud para mantener el area fija
        float radioFijo = 50; // radio fijo del escudo
        float factorEscala = radioFijo * area;//se multiplica el area por un escalar
        
        circle(posicionPlayer.x+12, posicionPlayer.y+12, factorEscala);
      
    
    } else {
      strokeWeight(1);
    }
  }
     
}
