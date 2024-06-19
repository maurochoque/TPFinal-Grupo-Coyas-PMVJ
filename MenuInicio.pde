class MenuInicio {
  TPFinalPMVJ main;
  int buttonWidth = 200;
  int buttonHeight = 50;
  int buttonX;
  int buttonYStart = 200;
  int buttonSpacing = 20;

  String[] buttonLabels = {"Iniciar Juego", "Opciones", "Salir"};
  int buttonCount = buttonLabels.length;

  MenuInicio(TPFinalPMVJ main) {
    this.main = main;
    buttonX = (width - buttonWidth) / 2; // Posiciona los botones en el centro horizontalmente
    textAlign(CENTER, CENTER); // Centra el texto dentro de los botones
  }

  void drawMenu() {
    background(50, 100, 150); // Color de fondo
    fill(255);
    textSize(32);
    text("Menú Principal", width / 2, 100); // Título del menú

    // Dibuja los botones
    for (int i = 0; i < buttonCount; i++) {
      if (isMouseOverButton(i)) {
        fill(200); // Color de botón cuando el ratón está encima
      } else {
        fill(150); // Color de botón normal
      }
      rect(buttonX, buttonYStart + i * (buttonHeight + buttonSpacing), buttonWidth, buttonHeight); // Dibuja el botón

      fill(0); // Color del texto del botón
      textSize(20);
      text(buttonLabels[i], buttonX + buttonWidth / 2, buttonYStart + i * (buttonHeight + buttonSpacing) + buttonHeight / 2); // Texto del botón
    }
  }

  void handleMousePressed() {
    // Detecta si se ha hecho clic en algún botón en el menú
    for (int i = 0; i < buttonCount; i++) {
      if (isMouseOverButton(i)) {
        handleButtonClick(i);
      }
    }
  }

  boolean isMouseOverButton(int index) {
    // Comprueba si el ratón está sobre el botón especificado
    int buttonY = buttonYStart + index * (buttonHeight + buttonSpacing);
    return mouseX > buttonX && mouseX < buttonX + buttonWidth && mouseY > buttonY && mouseY < buttonY + buttonHeight;
  }

  void handleButtonClick(int index) {
    // Ejecuta la acción correspondiente al botón clicado
    switch (index) {
      case 0:
        println("Iniciar Juego");
        main.startGame(); // Llama al método startGame en el archivo principal
        break;
      case 1:
        println("Salir");
        exit(); // Sale del programa
        break;
    }
  }
}
