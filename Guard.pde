import HashMap;
import ArrayList;

class Guard{
  int grid[][];
  Coordinates coords;
  Coordinates goalCoords;
  
  public Guard(int board[][], int row, int col){
    grid = board;
    coords = new Coordinates(row, col);
  }
  
  boolean setGoal(int row, int col){
    if (grid != null && row <= grid.length && row >= 0 
    && col >= 0 && col <= grid[0].length){
      goalCoords = new Coordinates(row, col);
      return true;
    } else{
      return false;
    }
  }
  
  boolean setCoordinates(int row, int col){
    if (grid != null && row <= grid.length && row >= 0 
    && col >= 0 && col <= grid[0].length){
      goalCoords = new Coordinates(row, col);
      return true;
    } else{
      return false;
    }
  }
  
  Coordinates getCoords(){
    return coords;
  }
  
  
  
}
  
