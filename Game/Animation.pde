
/*

public class Animation
{
    private int fps;
    private Rectangle[] sourceRects;

    public boolean looped;
    public int frames;
    public PImage spritesheet:
    public int anchorX, anchorY;

    public double Length, FrameDuration;
    
    public Animation(String filePath, int frames, int frameWidth, int frameHeight, int fps, boolean looped)
    {
        this.fps = fps;

        this.spritesheet = loadImage(filePath);
        this.looped = looped;
        this.frames = frames;

        
        anchorX = frameWidth/2;
        anchorY = frameHeight;
        
        
    }
    

    /// <summary>
    /// utility method for initializing the source rectangles
    /// </summary>
    /// <param name="source"></param>
    /// <param name="numFrames"></param>
    /// <param name="width"></param>
    /// <param name="height"></param>
    /// <returns></returns>
    private Rectangle[] InitFrames(Texture2D source, int numFrames, int width, int height)
    {
        Rectangle[] frameContainer = new Rectangle[numFrames];
        int framesPerRow = source.Width / width;
        for (int i = 0; i < Frames; i++)
        {
            int col = i % framesPerRow * width;
            int row = i / framesPerRow * height;
            frameContainer[i] = new Rectangle(col, row, width, height);
        }
        return frameContainer;
    }

    /// <summary>
    /// tie a sound effect to a frame of the animation
    /// </summary>
    /// <param name="sfx"></param>
    /// <param name="frame"></param>
    /// <returns></returns>
    public Animation AddSFX(SoundEffect sfx, int frame)
    {
        if (sfxFrames.TryGetValue(frame, out List<SoundEffect> value))
            value.Add(sfx);
        else
            sfxFrames[frame] = [sfx];

        return this;
    }

}*/
