abstract class Collectibles extends GameElement {
  String[] items = {"garbage plate", "dining dollars", "waffles", "cheeseburger"};
  int[] itemsPoints = {75, 5, 14, 40};
  int indexPoint;
  gameStateManager pointControl = new gameStateManager();
  
  public Collectibles(String item ) {
    super(3);
    for(int i = 0; i <= items.length - 1; i++) {
      if (items[i].equals(item)) {
        indexPoint = i;
        break;
      }
    }
  }

  
}
