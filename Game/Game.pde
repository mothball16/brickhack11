GameStateManager manager;
Map map;
String[][] mapData;
ArrayList<IInputListener> inputListeners;
ArrayList<IMouseListener> mouseListeners;
ArrayList<IDrawable> drawables;
GameState state;
int points = 0;
int timer = 100; // initialize with how long game lasts (temp val = 100) BOTH THESE VARIABLES(POINTS/TIMER) CAN BE ACCESSED FROM ANY CLASS

void setup(){
  size(800,600);  

  state = GameState.MainMenu;
  manager = new GameStateManager();
  inputListeners = new ArrayList<IInputListener>();
  mouseListeners = new ArrayList<IMouseListener>();
  drawables = new ArrayList<IDrawable>();
  
  TileFactory.RegisterTile("d", new Tile(true));
  TileFactory.RegisterTile("e", new Tile("empty_tile.png", false));
  
  mapData = new String[][]{
  {"e", "d", "d","d", "d", "d","d", "d", "e",},
  {"e", "e", "e","e", "e", "e","e", "e", "e",},
  {"e", "d", "e","d", "e", "d","d", "e", "e",},
  {"e", "e", "e","e", "e", "e","e", "e", "e",},
  {"d", "e", "d","d", "e", "d","e", "d", "e",},
  {"d", "e", "e","e", "e", "d","e", "e", "e",},
  {"d", "e", "e","e", "e", "d","e", "e", "e",},
  {"d", "e", "d","d", "e", "d","e", "d", "e",},
  {"e", "e", "e","e", "e", "e","e", "e", "e",},
  {"e", "d", "e","d", "e", "d","d", "e", "e",},
  {"e", "e", "e","e", "e", "e","e", "e", "e",},
};

  map = new Map(32,mapData);
  drawables.add(map);
<<<<<<< HEAD
  
  
  Guard guard = new Guard(map.getGrid(), 0, 0);
=======
  Guard guard = new Guard(map, 0, 0);
>>>>>>> 436015d5c02e4ea9cdf2263d6e487a5d25970ee4
  guard.setGoal(mapData.length-1, mapData[0].length-1);
  System.out.print(guard.toString());
}


void draw(){
  background(200);

  for(IDrawable drawable : drawables){
    drawable.Display();
  }
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
