static class Camera {
  private static float x;
  private static float y;
  private static float smoothingFactorMax = 0.1;
  private static float smoothingFactorMin = 0.05;
  private static float numLerp(float a, float b, float t){
     return a + (b - a) * t;
  }
  
  
  public static int GetX(){
    return (int) x; 
  }
  
  public static int GetY(){
    return (int) y; 
  }
  
  
  public static void Update(int nx, int ny){
    x = numLerp(x, nx, numLerp(smoothingFactorMin, smoothingFactorMax, Math.min(1,Math.abs(x - nx)/40)));
    y = numLerp(y, ny, numLerp(smoothingFactorMin, smoothingFactorMax, Math.min(1,Math.abs(y - ny)/40)));
  }
  
}
