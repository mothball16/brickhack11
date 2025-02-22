Map map;
String[][] mapData;
ArrayList<IInputListener> listeners;
ArrayList<IDrawable> drawable;

void setup(){
  size(800,600);
  TileFactory.RegisterTile("default", new Tile(false));
  TileFactory.RegisterTile("empty", new Tile("empty_tile.png", false));
  map = new Map(32);
  mapData = new String[][]{
  {"default", "empty", "default"},
  {"default", "default", "default"},
  {"default", "empty", "default"}
};
  map.Load(mapData);
}


void draw(){
  background(200);
  map.Display();
  
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
