class TileFactory {
   
   private Tile[] registry;
   PImage tilemap;
   
   public TileFactory(String tileMapFilePath, String tileDataFilePath){
     
     tilemap = loadImage(tileMapFilePath);

     String[] lines = loadStrings(tileDataFilePath);
     registry = new Tile[500];
     for(int i = 0; i < lines.length; i++){
       String[] data = lines[i].split(" ");
       switch(data.length){
        case 2:
          RegisterTile(
          Integer.parseInt(data[0].trim()), 
          new Tile(tilemap.get((Integer.parseInt(data[0].trim())) * 8, 0, 8, 8), (data[1] == "f" ? false : true), false,Integer.parseInt(data[0].trim())));
          break;
        case 3:
          for(int j = Integer.parseInt(data[0].trim()); j <= Integer.parseInt(data[1].trim()); j++){
            RegisterTile(j, 
            new Tile(tilemap.get((j) * 8,0,8,8), (data[2] == "f" ? false : true), false,j));
          }
          break;
       }
     }
     
     for(int i = 0; i <registry.length; i++) {
       if(registry[i] == null){
         print(i);
       }
     }
    
  }
   
   
   public void RegisterTile(int id, Tile tile){
     registry[id] = tile;
   }
   
   public Tile Create(int id)
   {
     if(registry[id] == null){
       print("you didnt register the tile id", id);
       return null;
     }
     try {
       return registry[id].clone();
     } catch (CloneNotSupportedException ex){
       return null;
     }
   }
     
  
  
  
  
}
