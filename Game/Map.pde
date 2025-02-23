class Map extends GameElement {
  private final Tile[][] grid; 
  private final int[][] heightMap;
  private int tileBuffer;
  
  
  //file loaider
  public String[][] LoadFile(String filePath){
     String[] lines = loadStrings(filePath);
     String[][] tileMap = new String[Integer.parseInt(lines[0].split(",")[0])][Integer.parseInt(lines[0].split(",")[1])];
     
     for(int i = 1; i < lines.length; i++){
       String[] data = lines[i].replaceAll("\\s+","").split(";");
       tileMap[i-1] = data;
     }
     return tileMap;
  }

  public int[][] LoadHeightMap(String filePath)
  {
      return new int[1][1];
  }
  
  public Map(TileFactory tileFactory, int tileBuffer, String filePath, String heightMapPath){
    super(1);
    String[][] mapData = LoadFile(filePath);
    heightMap = LoadHeightMap(heightMapPath);
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
        grid[row][col].DisplayAt(col * tileBuffer, row * tileBuffer,tileBuffer,1);
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
