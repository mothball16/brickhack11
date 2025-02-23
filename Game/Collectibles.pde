abstract class Collectibles extends GameElement {
  String[] items = {"garbage plate", "dining dollars", "waffles", "cheeseburger"};
  int[] itemPoints = {400, 100, 150, 250};
  int indexPoint;
  //gameStateManager pointControl = new gameStateManager();
  boolean currentlyAdded;
  
  public Collectibles(String item) {
    super(3);
    for(int i = 0; i <= items.length - 1; i++) {
      if (items[i].equals(item)) {
        indexPoint = i;
        break;
      }
    }
    points += itemPoints[indexPoint];
    currentlyAdded = true;
  }
  
  void removeItem() {
    if (currentlyAdded) {
      points -= itemPoints[indexPoint];
    }
  }
  
  void reAddItem() {
    if (!currentlyAdded) {
      points += itemPoints[indexPoint];
    }
  }

  
}
