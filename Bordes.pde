static class Bordes {
  static void calcuBordes(PVector pos, int ancho, int alto) {
    if (pos.x < -ancho/2) {
      pos.x = -ancho/2;
    } 
    else if (pos.x > ancho/2 - 25) { 
      pos.x = ancho/2 - 25;
    }

    if (pos.y < -alto/2 + 25) {  
      pos.y = -alto/2 + 25;
    } 
    else if (pos.y > 0) {
      pos.y = 0;
    }
  }
}
