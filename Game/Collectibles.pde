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


class Collectible implements IDrawable {
  PImage image;
  int points,x,y, sX, sY;
  
  
  public Collectible(String image, int points, int sX, int sY) {
    this.image = loadImage(image);
    this.points = points;
    
    this.sX = sX;
    this.sY = sY;  
  }
  
  public void UpdateLocation(int x, int y){
    this.x = x;
    this.y = y;
  }

  public void Display(){
    image(image,x - sX/2,y - sY/2, sX, sY);
  }
  
  public int GetPriority(){return 1;}
  
  
}
