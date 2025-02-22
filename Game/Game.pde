Map map;
String[][] mapData;

void setup(){
  size(800,600);
  TileFactory.RegisterTile("default", new Tile(false));
  TileFactory.RegisterTile("empty", new Tile("empty_tile.png", false));
  map = new Map(16);
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
