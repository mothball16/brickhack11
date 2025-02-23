DrawManager manager;
Map map;
String[][] mapData;
ArrayList<IInputListener> inputListeners;
ArrayList<IMouseListener> mouseListeners;
ArrayList<IDrawable> drawables;
Guard guard;
TileFactory tileFactory;
Player player;
GameState state;
int points = 0;
int timer = 100; // initialize with how long game lasts (temp val = 100) BOTH THESE VARIABLES(POINTS/TIMER) CAN BE ACCESSED FROM ANY CLASS
GuardManager guardManager = new GuardManager();



void setup(){
  size(768,512, P2D);  
  tileFactory = new TileFactory("tileset.png","tileData.txt");
  noSmooth();
  ((PGraphicsOpenGL)g).textureSampling(3);
 

  //init vars
  state = GameState.MainMenu;
  inputListeners = new ArrayList<IInputListener>();
  mouseListeners = new ArrayList<IMouseListener>();
  drawables = new ArrayList<IDrawable>();
  manager = new DrawManager(mouseListeners,state);
  player = new Player(new Coordinates(20,40));
  /**LinkedList<Coordinates> path = new LinkedList<>();
  path.add(new Coordinates(5, 1));
  path.add(new Coordinates(20, 1));
  path.add(new Coordinates(5, 28));
  path.add(new Coordinates(20, 28));*/
  
  //load content
  map = new Map(tileFactory,32,"mapData.txt","heightData.txt");
  /**Guard guard = new Guard(map, 4, 1, path);
  System.out.println(guard.setGoal(10, 2));
  System.out.println(guard.toString());
  guardManager.addGuard(guard);*/

  player = new Player(new Coordinates(70,160));
  
  //load content
  map = new Map(tileFactory,32,"mapData.txt","heightMapData.txt");
  
  drawables.add(map);
  inputListeners.add(player);
  drawables.add(player);
  //drawables.add(guard);
  
  
/*
  guard = new Guard(map, 10, 10);
  drawables.add(guard);
  guard.setGoal(new Coordinates(326, 272));
  */
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
