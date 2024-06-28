class Pantallas {
  
  
  private PImage fotoFantasma;
  
  //VARIABLE QUE SE UTILIZA PARA DAR MOVIMIENTO A LAS IMAGENES
  private float movX;
  
  //VARIABLE QUE SE UTILIZA PARA DAR MOVIMIENTO A LAS IMAGENES
  private float movY;
  
  //VARIABLES QUE SE UTILIZAN, EN COMBINACION CON PARA DAR EFECTO AL FONDO DE PANTALLA
  private color fondoNegro;
  private color fondoGris;
  
  /************ZONA CONSTRUCTORES*****************/
  
  /**CONSTRUCTOR POR DEFECTO*/
  public Pantallas() {
    this.fotoFantasma=loadImage ("Img/fondoPantalla.png");//VARIABLE INSTANCIADA 
    this.movX=0;
    this.movY=0;
    this.fondoNegro=color(0);
    this.fondoGris=color(90,87,87,15);
  }

  /*************ZONA DE METODOS****************/

  /** METODO PARA DIBUJAR LA PRESENTACION (uso de frameCount)*/
  public void dibujar() {

    image(fotoFantasma,0,0);
    fotoFantasma.resize(width,height);
     textSize(15);
    String frase="Presiona ENTER para comenzar";
     textAlign(CENTER);//FORMATO DEL TEXTO
     text(frase,width/2,height-150);
    /*if (frameCount%2==0) {//CONDICIONAL CUANDO frameCount ES NUMERO PAR SE PONE UN FONDO NEGRO
        background(fondoNegro);
    } else {              //SI ES IMPAR EL FONDO SE VUELVE GRIS
      background(fondoGris);
      image(fotoFantasma, movX+frameCount, movY+frameCount);          //CON LA FUNCION "image" COLOCAMOS LOS FANTASMAS,
      image(fotoFantasma, movX+frameCount+150, movY+frameCount-100);  //EN DIFERENTES POSICIONES,
      image(fotoFantasma, movX-frameCount+50, movY-frameCount+400);   //Y DIFERENTES MOVIMIENTOS
      image(fotoFantasma, 500+frameCount, 50);
      if ((frameCount>width-300)&&(frameCount>height+50)) {//CUANTO LOS frameCount PASEN UN CIERTO LIMITE, 
          frameCount=0;                                      //frameCount volveran a empezar desde 0
      }
    }*/
    //textSize(45);//TAMAÑO DEL TEXTO
   
    //fill(255, frameCount);//COLOR DE LA PROXIMA FIGURA CON TRASPARENCIA, QUE SE VA REDUCIENDO
    //String miTexto = "Prision De Los Espiritus";//VARIABLE QUE CONTIENE EL TEXTO
    ///text(miTexto, width/2, height/2);//FUNCION "text" PARA COLOCAR UNA VARIABLE TIPO "STRING" Y EN QUE POSICION SE DIBUJA(x,y)

    //textSize(20);
    //textAlign(CENTER);
    //fill(255);
    String miTexto2 = "Presiona ENTER para JUGAR";
    //text(miTexto2, width/2, height/2+80);
  }
  
  
  /*********METODOS ACCESORES***************/
  /**METODO QUE DEVUELVE EL VALOR DE LA VARIABLE "fotoFantasma"*/
  public PImage getfotoFantasma() {
    return fotoFantasma;
  }
  /**METODO PARA CAMBIAR "fotoFantasma" SI ES NECESARIO*/
  public void setfotoFantasma(PImage fotoFantasma) { 
    this.fotoFantasma=fotoFantasma;
  }
}
