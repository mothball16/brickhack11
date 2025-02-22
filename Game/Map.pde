class Map implements IDrawable {
  Tile[][] grid; 
  int tileBuffer;
  
  Map(int tileBuffer){
    this.tileBuffer = tileBuffer;
  }
  
  public void Load(String[][] mapData){
    grid = new Tile[mapData.length][mapData[0].length];
    for(int row = 0; row < mapData.length; row++){
      for(int col = 0; col < mapData[row].length; col++){
        
        grid[row][col] = TileFactory.Create(mapData[row][col]);
      }
    }
  }
  
  
  
  public void Display(){
    for(int row = 0; row < grid.length; row++){
      for(int col = 0; col < grid[row].length; col++){
        grid[row][col].DisplayAt(col * tileBuffer, row * tileBuffer,tileBuffer);
      }
    }
  } 
}
