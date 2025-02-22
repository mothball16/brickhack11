abstract class Button : IDrawable {
  PImage img;
  public Button(String img, int w, int h){
    this.img = loadImage(img);
    img.resize(w, h);
    
  }
  
  
  
  
}
