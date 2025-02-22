import java.util.HashMap;
import java.util.ArrayList;
import java.util.LinkedList;

class Guard extends GameElement{
  Tile grid[][];
  HashMap<Coordinates, Coordinates> path = null;
  Coordinates coords;
  Coordinates goalCoords;
  
  public Guard(Tile board[][], int row, int col){
    super(3);
    grid = board;
    coords = new Coordinates(row, col);
  }
  
  @Override
  public void Display(){
    
  }
  
  boolean setGoal(int row, int col){
    if(validCoords(row, col)){
      goalCoords = new Coordinates(row, col);
      path = getPath();
      return true;
    } else{
      return false;
    }
  }
  
  boolean setCoordinates(int row, int col){
    if(validCoords(row, col)){
      goalCoords = new Coordinates(row, col);
      return true;
    } else{
      return false;
    }
  }
  
  
  
  boolean validCoords(int row, int col){
    if(grid != null && row < grid.length && row >= 0 
    && col >= 0 && col < grid[0].length
    && !grid[row][col].GetCollidable()){
      return true;
    } else {
      return false;
    }
  }
  
  Coordinates getCoords(){
    return coords;
  }
  
  private HashMap<Coordinates, Coordinates> getPath(){
    LinkedList<Coordinates> queue = new LinkedList();
    Coordinates current = this.coords;
    queue.add(current);
    HashMap<Coordinates, Coordinates> seen = new HashMap<>();
    boolean goal = false;
    while(queue.size() != 0){
      current = queue.remove(0);
      for( Coordinates neighbor : getNeighbors(current)){
        if(!seen.containsKey(neighbor)){
          seen.put(neighbor, current);
          queue.add(neighbor);
        }
        if(neighbor.equals(this.goalCoords)){
          goal = true;
          current = neighbor;
          break;
        }
      }
      if(goal) break;
    }
    HashMap<Coordinates, Coordinates> path = new HashMap<>();
    while(!current.equals(this.coords)){
      path.put(seen.get(current), current);
      current = seen.get(current);
    }
    return path;
    
    
  }
  
  private ArrayList<Coordinates> getNeighbors(Coordinates coords){
    ArrayList<Coordinates> neighbors = new ArrayList();
    int x = 0;
    int y = 0;
    for(int i = 0; i < 2; i++){
      for(int j = -1; j <= 1; j += 2){
        x = i == 0 ? 0 : j;
        y = i == 0 ? j : 0;
        if(validCoords(coords.getRow() + x, coords.getCol() + y)){
          neighbors.add(new Coordinates(coords.getRow() + x, coords.getCol() + y));
        }
      }
    }
    for(int i = -1; i <= 1; i += 2){
      for(int j = -1; j <= 1; j += 2){
        if(validCoords(coords.getRow() + i, coords.getCol() + j)){
          neighbors.add(new Coordinates(coords.getRow() + i, coords.getCol() + j));
        }
      }
    }
    return neighbors;
  }
  
  @Override
  String toString(){
    String str = "";
    for(int i = 0; i < this.grid.length; i++){
      for(int j = 0; j < this.grid[0].length; j++){
        str += path.containsKey(new Coordinates(i, j)) ? "X" : "*";
      }
      str += "\n";
    }
    return str;
  }
  
}
