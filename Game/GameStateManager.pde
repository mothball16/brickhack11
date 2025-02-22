class gameStateManager {
  int timer = 100; // initialize with how long game lasts (temp val = 100
  int points = 0;
  void display(GameState state) {
    timer--;
    if (timer == 0) {
      state = GameState.GameOver;
    }
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
