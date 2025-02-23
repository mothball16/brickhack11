Map map;
String[][] mapData;
ArrayList<IInputListener> listeners;
ArrayList<IDrawable> drawables;
GameState state;

void setup(){
  state = GameState.MainMenu;
  size(800,600);
  listeners = new ArrayList<IInputListener>();
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
  background(200);
  
  for(IDrawable drawable : drawables){
    drawable.Display();
  }
}

void keyPressed(){
  for(IInputListener listener : listeners){
    listener.OnKeyPressed(key); 
  }
  
}

void keyReleased(){
  for(IInputListener listener : listeners){
    listener.OnKeyReleased(key); 
  }
}
