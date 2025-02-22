

public abstract class GameElement implements IDrawable, Comparable{
  protected int priority;
  
  public GameElement(int p){
    this.priority = p;
  }
  
  public int GetPriority(){
    return priority;
  }
  
  public int compareTo(Object that){
    if(that instanceof IDrawable){
      return this.GetPriority() - ((IDrawable) that).GetPriority();
    } else {
      System.err.println("Object passed as an argument is not comparable with GameElement");
      System.exit(1);
      return 0;
    }
  }
  
  public abstract void Display();
  
}
  
  
