/*class Collectible extends GameElement {
  String[] items = {"GarbagePlate", "DiningDollars", "Waffles", "Cheeseburger"};
  int[] itemPoints = {400, 100, 150, 250};
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
      points -= itemPoints[indexPoint];
    }
  }
  
  void reAddItem() {
    if (!currentlyAdded) {
      points += itemPoints[indexPoint];
    }
  }

  
}*/

/**class Collectible extends GameElement implements IDrawable {
  PImage image;
  static int PICKUP = 24; 
  Tile location;
  int points;
  
  public Collectible(String image, int points, Tile location) {
    image = loadImage();
    this.location = location;
    this.points = points;
  }
  
  public void Display() {
    
  }
  
  /**public void Update() {
    if ((Player.GetX-
  }*/
  
  
//}
