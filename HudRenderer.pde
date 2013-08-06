/**
* This is "advanced renderer" attempt. (Basically bad name
* it's "advancedRenderer" rather than "hud" renderer.git 
* Basically the idea of this renderer is to allow gradual
* improvement of the original one. 
* Step by step we override some methods to improve everything.
* and
*/


class HudRenderer extends GeometricRenderer
{
 

  private PImage mImgBackground;  
  private PImage mImgShipOff;
  private PImage mImgShipYellow;
  private PImage mImgShipWhite;
  
  /** image filename constants */

  /* @pjs preload="Alien-HeavyCruiser-lights-off.png,Alien-HeavyCruiser-lights-white.png,Alien-HeavyCruiser-lights-yellow.png"; */  
  
  
  /* @pjs preload="planet_900x600.png"; */
  
  final static private String C_SHIP_IMAGE_OFF    = "Alien-HeavyCruiser-lights-off.png";
  final static private String C_SHIP_IMAGE_WHITE  = "Alien-HeavyCruiser-lights-white.png";
  final static private String C_SHIP_IMAGE_YELLOW = "Alien-HeavyCruiser-lights-yellow.png";
  
  final static private String C_HUD_IMAGE = "hud_800x600a.png";
  
  final static private String C_BACKGROUND_IMAGE = "planet_900x600.png";
  
  private PImage[] mShipFrames;
  private int mCurFrame = -1;
  
  private PImage mHud;
  
  final static private float C_SHIP_SCALE_FACTOR = 0.3f; 
  
  private int mNextAnimationStepTime = -1;
  private int mAnimationStepDelay = 250; // milliseconds
  
  
  HudRenderer(){
     
     
    
      // load images for the starships
      loadStarshipImages();
     
      // load hud image (overlay)
      mHud = loadImage(C_HUD_IMAGE);
      
      // load background image.
      mImgBackground = loadImage(C_BACKGROUND_IMAGE);
      
      setNextAnimationStepInFutureAfter(mAnimationStepDelay);
   
  }
  
  
  private void setNextAnimationStepInFutureAfter(int delay){
       mNextAnimationStepTime = millis() + delay;
  }
  
  private boolean isAnimationDelayElapsed(){
     return ( millis() >= mNextAnimationStepTime );
  }
  
 
  private PImage getCurrentShipFrame(){
     return mShipFrames[mCurFrame];
  }
  
  void renderFramePrepare()
  {
     //super.renderFramePrepare();
     imageMode(CORNER);
     image(mImgBackground, 0, 0);
     
  }  
  
  
  private void loadStarshipImages(){
     loadStarshipImages(C_SHIP_SCALE_FACTOR);
  }
  
  
  
  
  private void loadStarshipImages(float scaleFactor){
     mImgShipOff = loadImageAndScale(C_SHIP_IMAGE_OFF, scaleFactor);
     mImgShipYellow = loadImageAndScale(C_SHIP_IMAGE_YELLOW, scaleFactor);
     mImgShipWhite = loadImageAndScale(C_SHIP_IMAGE_WHITE, scaleFactor);
     mShipFrames  = new PImage[3];
     mShipFrames[0] = mImgShipOff;
     mShipFrames[1] = mImgShipWhite;
     mShipFrames[2] = mImgShipYellow;
     mCurFrame = 0;
  }
  
  private void shipNextFrame()
  {
     mCurFrame++;
     mCurFrame %= mShipFrames.length;
  }
  
  
  
  void renderShip(ShipModel shipModel) {
     super.renderShip(shipModel);
     
     if ( isAnimationDelayElapsed() ){
        shipNextFrame();
        setNextAnimationStepInFutureAfter(mAnimationStepDelay);
     }
     PVector p = shipModel.getLocation();
     pushMatrix();
     imageMode(CENTER);
     translate(p.x, p.y);
     rotate(shipModel.getAngle());
     image(getCurrentShipFrame(), 0, 0);
     popMatrix();
  }  
  
  void renderGun(ShipModel shipModel){
     super.renderGun(shipModel);
  }
  
  void  renderHud(HudModel hudModel)
  {  
     PVector p = hudModel.getTopLeft();
     textAlign(LEFT);
     text("Hello", p.x, p.y);
     imageMode(CENTER);
     image(mImgShipYellow, p.x, p.y);
     imageMode(CORNER);
     image(mHud, 0,0);
     //super.renderHud(hudModel);
  }
  
  
  
  
  void renderFrameFinalize(){
     super.renderFrameFinalize();
  }
  
  
}
