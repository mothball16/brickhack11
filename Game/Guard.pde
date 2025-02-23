import java.util.HashMap;
import java.util.ArrayList;
import java.util.LinkedList;
import java.lang.Math;

class Guard extends GameElement{
  
  Animation upWalk, downWalk, rightWalk, leftWalk, downIdle;
  Animation currentAnim, lastAnim;
  Direction dir;
  
  
  
  private Map map;
  private Tile grid[][];
  private HashMap<Coordinates, Coordinates> path = null;
  private Coordinates coords;
  private Coordinates goalCoords;
  
  private int speed = 3;
  private double guardAngle = 0.0;
  private int vision; 
  private double lightAngle = 45.0; //number of degrees from the direction the guard is looking (mirrored across the center, so the total angle is doubled
  private Coordinates screenCoords;
  private LinkedList<Coordinates> patrolSpots;
  private boolean alerted = false;
  
  
  
  public Guard(Map gameMap, int row, int col, LinkedList<Coordinates> patrol){
    super(3);
    map = gameMap;
    grid = map.getGrid();
    vision = 5 * map.getTileBuffer();
    coords = new Coordinates(row, col);
    screenCoords = map.GetTilePos(coords.getRow(), coords.getCol());
    dir = Direction.Bottom;
    setGoal(map.GetTilePos(patrol.peek().getRow(), patrol.peek().getCol()));
    patrolSpots = patrol;
    
    upWalk = new Animation("guard_upWalk.png", 2, 32, 32, 10, true);
    downIdle = new Animation("guard_downIdle.png", 1, 32, 32, 10, true);
    downWalk = new Animation("guard_downWalk.png", 2, 32, 32, 10, true);
    leftWalk = new Animation("guard_leftWalk.png", 2, 32, 32, 10, true);
    rightWalk = new Animation("guard_rightWalk.png", 2, 32, 32, 10, true);
    lastAnim = downIdle;
    currentAnim = downIdle;
  }
  
  public Guard(Map gameMap, int row, int col){
    this(gameMap, row, col, new LinkedList<Coordinates>());
  }
  
  private Animation ChooseAnimation(){
    if(dir == null) return downIdle;
    switch(dir){
      case Top:
      return upWalk;
      case Bottom:
      return downWalk;
      case Left:
      return leftWalk;
      case Right:
      return rightWalk;
    }
    return downIdle;
  }
  
  @Override
  public void Display(){
    //rect(coords.x, coords.y, 20,20);
    currentAnim.Display(screenCoords.getCol(),screenCoords.getRow(),2);
    lastAnim = currentAnim;
  }
  
  public void Update(){
    dir = move();
    currentAnim.Update();
    currentAnim = ChooseAnimation();
  }
  
  boolean setGoal(Coordinates c){//FOR SCREEN COORDINATES
    if(validCoords(c)){
      goalCoords = c;
      HashMap<Coordinates, Coordinates> thing = getPath();
      path = thing == null ? path : thing;
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
  println(row,col);
    if(grid != null && row < grid.length && row >= 0 
    && col >= 0 && col < grid[0].length
    && !grid[row][col].GetCollidable()){
      return true;
    } else {
      return false;
    }
  }
  boolean validCoords(Coordinates c){//FOR SCREEN COORDINATES
    //print(c.getCol(), c.getRow());
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
    System.out.println(this.toString());
    System.out.println(patrolSpots.peek().toString());
    
  }
  
  public Coordinates getPos(){
    return screenCoords;
  }
  
  public void setPos(Coordinates c){
    if(validCoords(c)){
      screenCoords = c;
    }
  }
  
  public Direction move(){
    int x = speed * (path.get(coords).getRow() - coords.getRow()); 
    int y = speed * (path.get(coords).getCol() - coords.getCol());
    screenCoords = new Coordinates(screenCoords.getRow() + x, screenCoords.getCol() + y);
    Coordinates c = map.GetTilePos(path.get(coords).getRow(), path.get(coords).getCol());
    if(map.sameTile(screenCoords, c)){
      coords = path.get(coords);
    }
    if(coords.equals(map.GetTile(goalCoords)) && !alerted){
      cycleSpots();
    } else if(coords.equals(map.GetTile(goalCoords))){
      endAlert();
    }
    
    if(x > 0 && y > 0){
      guardAngle = 45;
      return Direction.Right;
    } if(x < 0 && y > 0){
      guardAngle = 135;
      return Direction.Left;
    } if(x > 0 && y < 0){
      guardAngle = 315;
      return Direction.Right;
    } if(x < 0 && y < 0){
      guardAngle = 225;
      return Direction.Left;
    } if(x > 0){
      guardAngle = 0;
      return Direction.Right;
    } if(x < 0){
      guardAngle = 180;
      return Direction.Left;
    } if(y > 0){
      guardAngle = 90;
      return Direction.Bottom;
    } else{
      guardAngle = 270;
      return Direction.Top;
    }
    
  }
  
  public double distanceFormula(double row, double col){
    return Math.sqrt(row*row + col*col);
    
  }
  
  public double getAngle(Coordinates player){
    double lightRow = Math.sin(Math.toRadians(guardAngle))*vision;
    double lightCol = Math.cos(Math.toRadians(guardAngle))*vision;
    
    double playerRow = player.getRow() - screenCoords.getRow();
    double playerCol = player.getCol() - screenCoords.getCol();
    double numerator = (playerRow)*(lightRow) + (playerCol)*(lightCol);
    double denominator = distanceFormula(playerRow, playerCol) * distanceFormula(lightRow, lightCol);
    return Math.abs(Math.toDegrees(Math.acos(numerator/denominator)));
  }
  
  public boolean canSeePlayer(Coordinates player){
    double angle = getAngle(player);
    double dist = distanceFormula(player.getRow() - screenCoords.getRow(), player.getCol() - screenCoords.getCol());
    if(dist < vision && (angle < lightAngle || (360-angle) < lightAngle)){
      int rows = (player.getRow() - screenCoords.getRow()) / map.getTileBuffer();
      int cols = (player.getCol() - screenCoords.getCol()) / map.getTileBuffer();
      /**for(int i = 0; i < map.getTileBuffer(); i++){
        Coordinates c = map.GetTile(new Coordinates(
        screenCoords.getRow() + rows * (i+1),
        screenCoords.getCol() + cols * (i+1) ));
        if(grid[c.getRow()][c.getCol()].GetCollidable()){
          return false;
        }
        
      }*/
      System.out.println("Hello");
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
        if(path.containsKey(new Coordinates(i, j))){
          str += "X";
        } else {
          str += grid[i][j].GetCollidable() ? "*" : ".";
        }
      }
      str += "\n";
    }
    return str;
  }
  
}
