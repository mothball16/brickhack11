
public class Animation
{
    private int framesPerKF;
    public boolean looped;
    public int timer, currentFrame, frames;
    public PImage spritesheet;
    public int anchorX, anchorY,frameWidth,frameHeight;

    public double Length, FrameDuration;
    
    public Animation(String filePath, int frames, int frameWidth, int frameHeight, int fpkf, boolean looped)
    {
        this.framesPerKF = fpkf;
        this.spritesheet = loadImage(filePath);
        this.looped = looped;
        this.frames = frames;
        this.frameWidth = frameWidth;
        this.frameHeight = frameHeight;

        
        anchorX = frameWidth/2;
        anchorY = frameHeight;
        
    }
    public void ToStart(){
      timer = 0; 
    }
    
    public int GetDuration(){
      return framesPerKF * frames;
    }
    
    public PImage GetCurImage(){
      return spritesheet.get(timer / framesPerKF * frameWidth, 0, frameWidth, frameHeight);
    }
    
    
    public void Update(){
      timer++;
      print(timer);
      if(looped) timer %= GetDuration(); 
    }
  
    public void Display(int x, int y, float scale){
      image(GetCurImage(),x - anchorX * scale, y - anchorY * scale, frameWidth * scale, frameHeight * scale);
    }


}
