Map map;
String[][] mapData;
ArrayList<IInputListener> listeners;
ArrayList<IDrawable> drawables;

void setup(){
  size(800,600);
  listeners = new ArrayList<IInputListener>();
  drawables = new ArrayList<IDrawable>();
  TileFactory.RegisterTile("default", new Tile(false));
  TileFactory.RegisterTile("empty", new Tile("empty_tile.png", false));
  map = new Map(32);
  mapData = new String[][]{
  {"default", "empty", "default"},
  {"default", "default", "default"},
  {"default", "empty", "default"}
};
  map.Load(mapData);
  drawables.add(map);
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
