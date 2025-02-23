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
  
  public void moveAllGuards(){
    for(Guard guard : guards){
      guard.move();
    }
  }
} 
    
