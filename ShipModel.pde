class ShipModel
{
   private PVector location;
   private float angle;
   private GunModel mGunModel;
   
   final int SECONDS = 1000; // milliseconds
   final int C_MIN_SHOT_DELAY_MILLIS = 1 * SECONDS;
   final int C_MAX_SHOT_DELAY_MILLIS = 3 * SECONDS;
   
   private TheDispatcher mTheDispatcher;
   
   int mNextShotEarliestTime;
   
   protected ShipModel(TheDispatcher vDispatcher){
      mTheDispatcher = vDispatcher;
      location = new PVector(); // just not to have 0 location.
                                // but techincalliy it's undefined now.
      initGunModel(); //                                 
   }
   
   
   /**
   * This is dummy constructor which constructs 
   * ships in the 4th quadrant.
   */
   ShipModel(int x0, int vWidth, int x1, int vHeight, TheDispatcher vDispatcher){
      mTheDispatcher = vDispatcher;
      location = new PVector(random(x0, vWidth), random(x1, vHeight));
      initGunModel();
   }
   
   
   private void initGunModel(){
      mGunModel = new GunModel();
      mNextShotEarliestTime = millis() + randomDelayBetweenShots();
   }
   
   
   
   /**
   * This is the main thing.
   */
   public PVector getLocation(){
       return location;
   }
   
   /**
   * Copies the value of v into location vector. 
   */
   public void setLocation(PVector v){
      location.set(v);
   }
   
   /**
   * Returns triangle "carcassus" of the ship (the center of the triangle is in the "origin" 0.0)
   * Relatively to (0,0)
   * So you need to "translate it" by location vector, to display it at right loctin.
   */
   Triangle getTriangle(){
      Triangle t = Triangle.spawnRandom();
       return t;
   }
   
   public float getAngle(){
      return angle;
   }
   
   GunModel getGunModel(){
      return mGunModel;
   }
   
   void update(){
      angle += 0.001;
      while ( angle > PI *2 ){
         angle -= PI;
      }
      
      if ( millis() >= mNextShotEarliestTime ){
         makeShot(); // spawns a projectile and passes it to the the projectile model (via dispatcher)
         mNextShotEarliestTime = millis() + randomDelayBetweenShots();
      }
      mGunModel.update();
   }
   
  void makeShot(){
     dprintln("Ship is firing!");
     float projectileVelocity = random(2,5);
     mTheDispatcher.createProjectile(getLocation(), mGunModel.getAngle(), projectileVelocity ); 
  }
  
  
  /**
  * Delegate, returns delay between shots.
  */
  private int randomDelayBetweenShots(){
     return (int) random(C_MIN_SHOT_DELAY_MILLIS, C_MAX_SHOT_DELAY_MILLIS);
  }   
   
}



// ===============================================
// Gun model
// ===============================================


class GunModel
{
  
    private float mGunLength = 20;
  
    
    private float mAngle = random(PI);
    float getAngle()
    {
       return mAngle;
    }
    
    void update(){
       mAngle += 0.003;
    }
    
    float getGunLength(){
       return mGunLength;
    }
}
