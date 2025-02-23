import java.util.ArrayList;

class GuardManager{
  ArrayList<Guard> guards;
  
  public GuardManager(ArrayList<Guard> list){
    guards = list;
  }
  
  public GuardManager(){
    this(new ArrayList<Guard>());
  }
  
  public void addGuard(Guard guard){
    guards.add(guard);
    
  }
  
  public boolean removeGuard(Guard guard){
    return guards.remove(guard);
  }
  
  public Guard createGuard(Map map, LinkedList<Coordinates> patrol){
    Guard guard = new Guard(map, patrol.peek().getRow(), patrol.peek().getCol(), patrol);
    addGuard(guard);
    return guard;
  }
  
  public void moveAllGuards(Coordinates player){
    for(Guard guard : guards){
      guard.move();
      guard.canSeePlayer(player);
    }
  }
} 
    
