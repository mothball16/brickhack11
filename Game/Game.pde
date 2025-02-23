DrawManager manager;
Map map;
String[][] mapData;
ArrayList<IInputListener> inputListeners;
ArrayList<IMouseListener> mouseListeners;
ArrayList<IDrawable> drawables;
GameState state;
int points = 0;
int timer = 100; // initialize with how long game lasts (temp val = 100) BOTH THESE VARIABLES(POINTS/TIMER) CAN BE ACCESSED FROM ANY CLASS


//file loaider
public String[][] LoadFile(String filePath){
     String[] lines = loadStrings(filePath);
     String[][] tileMap = new String[Integer.parseInt(lines[0].split(",")[0])][Integer.parseInt(lines[0].split(",")[1])];
     
     for(int i = 1; i < lines.length; i++){
       String[] data = lines[i].replaceAll("\\s+","").split(",");
       tileMap[i-1] = data;
     }
     return tileMap;
  }
  
void setup(){
  size(768,512);  

  state = GameState.MainMenu;
  inputListeners = new ArrayList<IInputListener>();
  mouseListeners = new ArrayList<IMouseListener>();
  drawables = new ArrayList<IDrawable>();

  manager = new DrawManager(mouseListeners,state);
  
  TileFactory.RegisterTile("d", new Tile(null,true,true));
  TileFactory.RegisterTile("e", new Tile("empty_tile.png", false,false));
  

  map = new Map(32,LoadFile("mapData.txt"));
  drawables.add(map);
  
  
  Guard guard = new Guard(map, 0, 0);
  guard.setGoal(mapData.length-1, mapData[0].length-1);
  //System.out.print(guard.toString());
}


void draw(){
  state = manager.Update(state);
  manager.DrawToScreen(drawables,state);

}

void keyPressed(){
  for(IInputListener listener : inputListeners){
    listener.OnKeyPressed(key); 
  }
}

void keyReleased(){
  for(IInputListener listener : inputListeners){
    listener.OnKeyReleased(key); 
  }
}

void mousePressed(){
  for(IMouseListener listener : mouseListeners){
    listener.OnMousePressed(); 
  }
}


void mouseReleased(){
  for(IMouseListener listener : mouseListeners){
    listener.OnMouseReleased();
  }
  
}
