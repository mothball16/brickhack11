class Coordinates{
  private int x;
  private int y;
  
  public Coordinates(int row, int col){
    x = row;
    y = col;
  }
  
  int getRow(){
    return x;
  }
  
  int getCol(){
    return y;
  }
  
  @Override
  boolean equals(Object o){
    if(o instanceof Coordinates){
      Coordinates that = (Coordinates) o;
      return this.x == that.getX() && this.y == that.getY();
    } else{
      return false;
    }
  }
  
  @Override
  int hashCode(){
    return (x*1000) + (y);
  }
}
  
