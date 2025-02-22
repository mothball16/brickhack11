class Map implements IDrawable {
  Tile[][] grid;
  int tileBuffer;
  
  Map(Tile[][] grid, int tileBuffer){
    this.grid = grid;
    this.tileBuffer = tileBuffer;
  }
  
  void display(){
    for(int row = 0; row < grid.length; row++){
      for(int col = 0; col < grid[row].length; col++){
        grid[row][col].displayAt(col * tileBuffer, row * tileBuffer);
      }
    }
    
    
    
    
    
  }
  
  
}
