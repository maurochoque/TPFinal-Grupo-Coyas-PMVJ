class Pantallas {
  
  
  private PImage e1;
  private PImage e2;
  private PImage e3;
  private PImage p;
  Calculos calculo;
  boolean banderaM;
  PVector posicion;
  float angulo = 0; 
float radio = 120; 
  /************ZONA CONSTRUCTORES*****************/
  
  /**CONSTRUCTOR POR DEFECTO*/
  public Pantallas() {
    //this.fotoFantasma=loadImage ("Img/fondoPantalla.png");//VARIABLE INSTANCIADA 
   this.e1=loadImage("Img/AlienAzulSprite.png");
   this.e2=loadImage("Img/AlienRosaSprite.png");
   this.e3=loadImage("Img/Enemy.png");
   this.p=loadImage("Img/NaveSprite.png");
   calculo=new Calculos();
   banderaM=false;
   posicion=new PVector(width/2,70);
  }

  /*************ZONA DE METODOS****************/

  /** METODO PARA DIBUJAR LA PRESENTACION (uso de frameCount)*/
  public void dibujar() {
  int m=1;
  background(0,0,15,50);
  e3.resize(50,50);
  //while (posicion.y >= 0 && posicion.y < 30) {
  if (posicion.x >= 25) {
    calculo.bajaW(posicion, m);
    image(e3, posicion.x*m - 20, posicion.y);
    
  }
  if (posicion.x >= 410) {
    calculo.aumW(posicion,m);
    //m=-1;
    image(e3, posicion.x*m - 20, posicion.y);
  }
  if(posicion.x <=75){
    calculo.rW(posicion,m);
    image(e3, posicion.x*m - 20, posicion.y);
  }
//println(posicion.x);
  
 // PVector movi=new PVector(posicion.x,posicion.y);
  int columnas = 4; 
  int filas = 4; 
  int espacio = 20; 
  int anchoS = e1.width + espacio;
  int altoS = e1.height + espacio;
  for (int i = 0; i < columnas; i++) {
    for (int j = 0; j < filas; j++) {
      int x = i * anchoS;
      int y = j * altoS;
      
      
      if ((i + j) % 2 == 0) {
        
          //calculo.bajaW(posicion, m);
        image(e1, x*m+190, y*m+170);
        
      } else {
        image(e2, x+190, y+170);
      }
    }
  }

    String frase="Presiona ENTER para comenzar";
    //textSize(50);
    String titulo="S P A C E   I N V A D E R S";
     textAlign(CENTER);
     for (int i = 0; i < 10; i++) {
    fill(255 - i-25 * 25); // cambia el color para simular la profundidad
    
    textSize(50);
    text(titulo, i+width/2, i+height-350);
  }
    fill(255);
  textSize(15);
    text(frase, width/2, height-150); // desplaza el texto en ambos ejes
     //text(frase,width/2,height-150);
   
    
    //text(miTexto2, width/2, height/2+80);
  }
  /*AGREGAR Y PONER LINDO LAS PANTALLAS*/
  public void dibujarGanar(){
    background(0,0,15,25);
    float pintar=millis();
    //textMode(CENTER);
    
    if(pintar%2==0){
      fill(193,203,6);
      textSize(25);
    }
    else{
      fill(255);
     //textSize(24);
    }
    String s="COMPLETASTE LA MISION";
    text(s,width/2,100);
   p.resize(50,50);
   e3.resize(25,25);
   
    //calcula coord de x e y para formar la orbita
  float x = 220 + cos(angulo) * radio;
  float y = height/2 + sin(angulo) * radio;
  image(p, x, y);
  image(e3,width/2-20,height/2);
  angulo += 0.03;//velocidad de la orbita
   
    //println(pos.y);
  }
  public void dibujarPerder(){
    background(0);
    float pintar=millis();
     if(pintar%2==0){
       background(200,0,0,15);
      fill(193,255,6);
      textSize(25);
    }
    else{
      fill(0,0,50,50);
     //textSize(24);
    }
    String s="PERDISTE";
    text(s,width/2,100);
    float x = 220 + cos(angulo) * radio;
    float y = height/2 + sin(angulo) * radio;
    e3.resize(50,50);
    p.resize(25,25);
    image(e3, x, y);
    image(p,width/2-20,height/2);
    angulo += 0.03;//velocidad de la orbita
  }
  
  

}
