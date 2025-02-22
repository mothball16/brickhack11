class gameStateManager {

  void update(GameState state) {
    while (state != GameState.GameOver) {
      switch (state) {
        case MainMenu:
          // MainMenu Logic
          break;
        case Playing:
          // Game logic
          break;
        case Paused:
          // Pause logic
          break;
      }
    }
  }

  void display(GameState state) {
    switch (state) {
    case MainMenu:
      //fill, textalign, textsize, text
      break;
    case Playing:
      //fill, textalign, textsize, text
      break;
    case Paused:
      //fill, textalign, textsize, text
      break;
    case GameOver:
      //fill, textalign, textsize, text
      break;
    }
  }
}
