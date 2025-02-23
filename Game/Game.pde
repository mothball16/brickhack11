DrawManager manager;
Map map;
String[][] mapData;
ArrayList<IInputListener> inputListeners;
ArrayList<IMouseListener> mouseListeners;
ArrayList<IDrawable> drawables;
TileFactory tileFactory;
Player player;
GameState state;
int points = 0;
int timer = 100; // initialize with how long game lasts (temp val = 100) BOTH THESE VARIABLES(POINTS/TIMER) CAN BE ACCESSED FROM ANY CLASS


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
  
void setup(){
  size(768,512);  
  tileFactory = new TileFactory("tileset.png","tileData.txt");

  //init vars
  state = GameState.MainMenu;
  inputListeners = new ArrayList<IInputListener>();
  mouseListeners = new ArrayList<IMouseListener>();
  drawables = new ArrayList<IDrawable>();
  manager = new DrawManager(mouseListeners,state);
  player = new Player(new Coordinates(20,20));
  
  //load content
  map = new Map(tileFactory,32,LoadFile("mapData.txt"));
  
  drawables.add(map);
  inputListeners.add(player);
  drawables.add(player);
  
  //Guard guard = new Guard(map, 0, 0);
  //guard.setGoal(new Coordinates(326, 272));
  //System.out.print(guard.toString());
  
}


void draw(){
  state = manager.Update(state);
  manager.DrawToScreen(drawables,state);  
}

void keyPressed(){
  for(IInputListener listener : inputListeners){
    listener.OnKeyAction(Character.toLowerCase(key), true); 
  }
}

void keyReleased(){
  for(IInputListener listener : inputListeners){
    listener.OnKeyAction(Character.toLowerCase(key), false); 
  }
}

void mousePressed(){
  for(IMouseListener listener : mouseListeners){
    listener.OnMouseAction(true); 
  }
}


void mouseReleased(){
  for(IMouseListener listener : mouseListeners){
    listener.OnMouseAction(false);
  }
  
}
