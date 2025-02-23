import java.util.HashMap;
import java.util.ArrayList;
import java.util.LinkedList;
import java.lang.Math;

class Guard extends GameElement{
  
  private Map map;
  private Tile grid[][];
  private HashMap<Coordinates, Coordinates> path = null;
  private Coordinates coords;
  private Coordinates goalCoords;
  
  private int speed = 3;
  private double angle = 0;
  private int vision = 5 * map.getTileBuffer();
  private double lightAngle = 45.0; //number of degrees from the direction the guard is looking (mirrored across the center, so the total angle is doubled
  private Coordinates screenCoords;
  private LinkedList<Coordinates> patrolSpots;
  private boolean alerted = false;
  
  
  
  public Guard(Map gameMap, int row, int col, LinkedList<Coordinates> patrol){
    super(3);
    map = gameMap;
    grid = map.getGrid();
    coords = new Coordinates(row, col);
    screenCoords = map.GetTilePos(coords.getRow(), coords.getCol());
  }
  
  public Guard(Map gameMap, int row, int col){
    this(gameMap, row, col, new LinkedList<Coordinates>());
  }
  
  @Override
  public void Display(){
    rect(coords.x, coords.y, 20,20);
  }
  
  boolean setGoal(Coordinates c){//FOR SCREEN COORDINATES
    if(validCoords(c)){
      goalCoords = c;
      path = getPath();
      return true;
    } else{
      return false;
    }
  }
  boolean setGoal(int row, int col){//FOR ARRAY INDEXES
    return setGoal(map.GetTilePos(row, col));
  }
    
  
  boolean setCoordinates(Coordinates c){
    if(validCoords(c)){
      goalCoords = c;
      return true;
    } else{
      return false;
    }
  }
  boolean setCoordinates(int row, int col){
    return setCoordinates(new Coordinates(row, col));
  }
  
  
  boolean validCoords(int row, int col){//FOR ARRAY INDEXES
    if(grid != null && row < grid.length && row >= 0 
    && col >= 0 && col < grid[0].length
    && !grid[row][col].GetCollidable()){
      return true;
    } else {
      return false;
    }
  }
  boolean validCoords(Coordinates c){//FOR SCREEN COORDINATES
    Coordinates gCoords = map.GetTile(c);
    return validCoords(gCoords.getRow(), gCoords.getCol());
  }
  
  
  
  Coordinates getCoords(){
    return coords;
  }
  
  HashMap<Coordinates, Coordinates> getPath(){
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
        if(neighbor.equals(map.GetTile(this.goalCoords))){
          goal = true;
          current = neighbor;
          break;
        }
      }
      if(goal) break;
    }
    System.out.println(this.goalCoords);
    System.out.println(map.GetTile(this.goalCoords));
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
  
  public boolean isAlerted(){
    return alerted;
  }
  
  public boolean alert(Coordinates player){
    if(!alerted){
      alerted = true;
      setGoal(player);
      return true;
    } else{
      setGoal(player);
      return false;
    }
  }
  
  public void endAlert(){
    alerted = false;
    setGoal(patrolSpots.peek());
  }
  
  public void cycleSpots(){
    patrolSpots.add(patrolSpots.remove(0));
    setGoal(map.GetTilePos(patrolSpots.peek().getRow(), patrolSpots.peek().getCol()));
  }
  
  public Coordinates getPos(){
    return screenCoords;
  }
  
  public void setPos(Coordinates c){
    if(validCoords(c)){
      screenCoords = c;
    }
  }
  
  public void move(){
    int x = screenCoords.getRow() + speed * (path.get(coords).getRow() - coords.getRow()); 
    int y = screenCoords.getCol() + speed * (path.get(coords).getCol() - coords.getCol());
    screenCoords = new Coordinates(x, y);
    Coordinates c = map.GetTilePos(path.get(coords).getRow(), path.get(coords).getCol());
    if(Math.abs(screenCoords.getRow() - c.getRow()) < speed && Math.abs(screenCoords.getCol() - c.getCol()) < speed){
      coords = path.get(coords);
    }
    if(coords.equals(map.GetTile(goalCoords)) && !alerted){
      cycleSpots();
    }
  }
  
  public double distanceFormula(double row, double col){
    double distRows = row - screenCoords.getRow();
    double distCols = col - screenCoords.getCol();
    return Math.sqrt(distRows*distRows + distCols*distCols);
    
  }
  
  public double getAngle(Coordinates player){
    double lightRow = Math.sin(angle)*vision - screenCoords.getRow();
    double lightCol = Math.cos(angle)*vision - screenCoords.getCol();
    double playerRow = player.getRow() - screenCoords.getRow();
    double playerCol = player.getCol() - screenCoords.getCol();
    double numerator = (playerRow)*(lightRow) + (playerCol)*(lightCol);
    double denominator = distanceFormula(playerRow, playerCol) * distanceFormula(lightRow, lightCol);
    return Math.abs(Math.toDegrees(Math.acos(numerator/denominator)));
  }
  
  public boolean canSeePlayer(Coordinates player){
    double angle = getAngle(player);
    double dist = distanceFormula((player.getRow() - screenCoords.getRow()), (player.getCol() - screenCoords.getCol()));
    if(dist < vision && (angle < lightAngle || (360-angle) < lightAngle)){
      return alert(player);
    } else{
      return false;
    }
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
