class Loader {
  
  public String[][] LoadFile(String filePath){
     String[] lines = loadStrings(filePath);
     String[][] tileMap = new String[Integer.parseInt(lines[0].split(",")[0])][Integer.parseInt(lines[0].split(",")[1])];
     
     for(int i = 1; i < lines.length; i++){
       String[] data = lines[i].split(",");
       tileMap[i-1] = data;
     }
     return tileMap;
  }
  

}
