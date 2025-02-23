abstract class Collectibles extends GameElement {
  String[] items = {"garbage plate", "dining dollars", "waffles", "cheeseburger"};
  int[] itemPoints = {75, 5, 14, 40};
  int indexPoint;
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
      points -= itemsPoints[indexPoint];
    }
  }
  
  void reAddItem() {
    if (!currentlyAdded) {
      points += itemsPoints[indexPoint];
    }
  }

  
}
