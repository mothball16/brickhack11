abstract class Collectibles extends GameElement {
  String[] items = {"garbage plate", "dining dollars", "waffles", "cheeseburger"};
  int[] itemPoints = {75, 5, 14, 40};
  int indexPoint;
<<<<<<< HEAD
  //gameStateManager pointControl = new gameStateManager();
=======
  boolean currentlyAdded;

>>>>>>> e60e75b0841d0dd6cfac77369d19655a59700c52
  
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
