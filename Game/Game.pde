DrawManager manager;
Map map;
String[][] mapData;
ArrayList<IInputListener> inputListeners;
ArrayList<IMouseListener> mouseListeners;
ArrayList<IDrawable> drawables;
GameState state;

void setup(){
  size(768,512);  

  state = GameState.MainMenu;
  inputListeners = new ArrayList<IInputListener>();
  mouseListeners = new ArrayList<IMouseListener>();
  manager = new DrawManager(mouseListeners,state);

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
  
  
  Guard guard = new Guard(map, 0, 0);
  guard.setGoal(mapData.length-1, mapData[0].length-1);
  System.out.print(guard.toString());
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
