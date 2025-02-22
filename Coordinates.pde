class Coordinates{
  private int x;
  private int y;
  
  public Coordinates(int xCor, int yCor){
    x = xCor;
    y = yCor;
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
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
    return (x*x*x*1000000) + (y*y*y);
  }
}
  
