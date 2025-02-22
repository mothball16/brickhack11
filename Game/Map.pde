class Map implements IDrawable, Comparable {
  private final Tile[][] grid; 
  private int tileBuffer;
  
  public Map(int tileBuffer, String[][] mapData){
   this.tileBuffer = tileBuffer;
    grid = new Tile[mapData.length][mapData[0].length];
    for(int row = 0; row < mapData.length; row++){
      for(int col = 0; col < mapData[row].length; col++){
        grid[row][col] = TileFactory.Create(mapData[row][col]);
      }
    }  
  }
  
  
  public Tile[][] getGrid(){
    return grid;
  }
  
  public int GetPriority(){ return 1; }
  
  public void Display(){
    for(int row = 0; row < grid.length; row++){
      for(int col = 0; col < grid[row].length; col++){
        grid[row][col].DisplayAt(col * tileBuffer, row * tileBuffer,tileBuffer);
      }
    }
  } 
  
  
  public int GetWidth(){
    return grid[0].length; 
  }
  
  public int GetHeight(){
    return grid.length; 
  }
  
  public int compareTo(Object that){
    return this.GetPriority() - ((IDrawable) that).GetPriority();
  }
}
