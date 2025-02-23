class Map extends GameElement {
  private final Tile[][] grid; 
  private final float[][] heightMap;
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
  
  public float GetHeightDiff(int rowA, int colA, int rowB, int colB){
        return Math.abs(heightMap[rowB][colB] - heightMap[rowA][colA]);
  }

  public float[][] LoadHeightMap(String filePath, String[][] mapData)
  {
      String[] lines = loadStrings(filePath);
      float[][] heightMap = new float[mapData.length][mapData[0].length];
      for(int i = 0; i < lines.length; i++){
        if(lines[i].charAt(0) == '/') continue;
        println("checking",i);
        String[] data = lines[i].replaceAll("\\s+","").split(",");
        for(int row = Integer.parseInt(data[1]); row < Integer.parseInt(data[1]) + Integer.parseInt(data[3]); row++){
          for(int col = Integer.parseInt(data[0]); col < Integer.parseInt(data[0]) + Integer.parseInt(data[2]); col++){
           
            heightMap[row][col] = Float.parseFloat(data[4]);
          }
        }
        
      }
      return heightMap;
  }
  
  public Map(TileFactory tileFactory, int tileBuffer, String filePath, String heightMapPath){
    super(1);
    String[][] mapData = LoadFile(filePath);
    heightMap = LoadHeightMap(heightMapPath, mapData);
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
  
  public float GetHeightDiff(int row, int col){
    Coordinates playerOn = GetTile(new Coordinates((int)player.x,(int)player.y));
    return Math.abs(heightMap[row][col] - heightMap[playerOn.getCol()][playerOn.getRow()]);
  }
  
  @Override
  public void Display(){
    Coordinates playerOn = GetTile(new Coordinates((int)player.x,(int)player.y));
    
    for(int row = 0; row < grid.length; row++){
      for(int col = 0; col < grid[row].length; col++){
        grid[row][col].DisplayAt(col * tileBuffer, row * tileBuffer,tileBuffer,GetHeightDiff(row,col));
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
