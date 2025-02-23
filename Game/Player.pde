public class Player extends GameElement implements IInputListener {
  Animation upWalk, downWalk, rightWalk, leftWalk, upIdle, leftIdle, downIdle, rightIdle;
  Animation currentAnim, lastAnim;
  float x, y;
  boolean up,down,left,right,moving;
  int speed;
  Direction dir;
  public Player(Coordinates coords){
    super(3);
    x = coords.getRow();
    y = coords.getCol();
    dir = Direction.Bottom;
    speed = 5;
    //int frames, int frameWidth, int frameHeight, int fpkf, boolean looped
    upIdle = new Animation("upIdle.png", 1, 16, 32, 10, true);
    upWalk = new Animation("upWalk.png", 2, 16, 32, 10, true);
    downIdle = new Animation("downIdle.png", 1, 16, 32, 10, true);
    downWalk = new Animation("downWalk.png", 2, 16, 32, 10, true);
    leftIdle = new Animation("leftIdle.png", 1, 16, 32, 10, true);
    leftWalk = new Animation("leftWalk.png", 2, 16, 32, 10, true);
    rightIdle = new Animation("rightIdle.png", 1, 16, 32, 10, true);
    rightWalk = new Animation("rightWalk.png", 2, 16, 32, 10, true);
    lastAnim = downIdle;
    currentAnim = downIdle;

  }
  
  public int GetX(){
    return (int)x; 
  }

  public int GetY(){
    return (int)y; 
  }
  
  public void Update(Map map){
    dir = Move(map);
    currentAnim.Update();
    currentAnim = ChooseAnimation();
  }
  
  @Override
  public void Display(){
    currentAnim.Display(GetX(),GetY(),2);
    lastAnim = currentAnim;
  }
  
  public void OnKeyAction(char input, boolean pressed){
    switch(input){
      case 'w':
        up = pressed;
        break;
      case 's':
        down = pressed;
        break;
      case 'a':
        left = pressed;
        break;
      case 'd':
        right = pressed;
        break;
    }
  }
  
  
  private Direction Move(Map map){
    moving = true;
    float nx = (left ? -1 : 0) + (right ? 1 : 0);
    float ny = (up ? -1 : 0) + (down ? 1 : 0);
    System.out.println("X: " + x + ", Y: " + y);
    float mult = (float) Math.sqrt(ny*ny + nx*nx);
    if(mult == 0){
      moving = false; 
      return null;  
    }
     
     nx /= mult;
     ny /= mult;
     
     Coordinates xTile = map.GetTile(new Coordinates((int) (x + nx * speed), (int) y));
     if(!map.getGrid()[xTile.getRow()][xTile.getCol()].GetCollidable()){
       x += nx * speed;
     }
     Coordinates yTile = map.GetTile(new Coordinates((int) x, (int) (y + ny * speed)));
     if(!map.getGrid()[yTile.getRow()][yTile.getCol()].GetCollidable()){
       y += ny * speed;
     }
     
     if(ny < 0) return Direction.Top;
     if(ny > 0) return Direction.Bottom;
     if(nx < 0) return Direction.Left;
     if(nx > 0) return Direction.Right;
     return dir;
  }
  
  private Animation ChooseAnimation(){
    if(dir == null) return downIdle;
    switch(dir){
      case Top:
      return (moving ? upWalk : upIdle);
      case Bottom:
      return (moving ? downWalk : downIdle);
      case Left:
      return (moving ? leftWalk : leftIdle);
      case Right:
      return (moving ? rightWalk : rightIdle);
    }
    return downIdle;
  }
  
}
