static class TileFactory {
   private static HashMap<String,Tile> registry = new HashMap<String,Tile>();
 
 
   public static void RegisterTile(String id, Tile tile){
     registry.put(id, tile);
   }
   
   public static Tile Create(String id)
   {
     if(registry.get(id) == null){
       print("you didnt register the tile id");
       return null;
     }
     try {
       return registry.get(id).clone();
     } catch (CloneNotSupportedException ex){
       return null;
     }
   }
     
  
  
  
  
}
