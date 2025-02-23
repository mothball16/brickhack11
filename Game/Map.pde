class Map extends GameElement {
  private final Tile[][] grid; 
  private int tileBuffer;
  
  public Map(TileFactory tileFactory, int tileBuffer, String[][] mapData){
    super(1);
    this.tileBuffer = tileBuffer;
    grid = new Tile[mapData.length][mapData[0].length];
    for(int row = 0; row < mapData.length; row++){
      for(int col = 0; col < mapData[row].length; col++){
        grid[row][col] = tileFactory.Create(Integer.parseInt(mapData[row][col]));
      }
    }  
  }
  
  
  public Tile[][] getGrid(){
    return grid;
  }
  
  @Override
  public void Display(){
    for(int row = 0; row < grid.length; row++){
      for(int col = 0; col < grid[row].length; col++){
        grid[row][col].DisplayAt(col * tileBuffer, row * tileBuffer,tileBuffer);
      }
    }
  } 
  
  //get the center of the tile at row, col
  public Coordinates GetTilePos(int row, int col){
    return new Coordinates(
    (int) ((row + 0.5) * tileBuffer), 
    (int) ((col + 0.5) * tileBuffer));
  }
  
  public Coordinates GetTile(Coordinates c){
    return new Coordinates(
    (int) c.getRow()/tileBuffer, 
    (int) c.getCol()/tileBuffer);
  }
  
  public boolean sameTile(Coordinates tile1, Coordinates tile2){
    return GetTile(tile1).equals(GetTile(tile2)); 
  }
  
  public int getTileBuffer(){
    return tileBuffer;
  }
  
  public int GetWidth(){
    return grid[0].length; 
  }
  
  public int GetHeight(){
    return grid.length; 
  }
  
  @Override
  public int compareTo(Object that){
    return this.GetPriority() - ((IDrawable) that).GetPriority();
  }
}
