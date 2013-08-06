/**
* This is projectile Collection (named model unfortunately)
*/
class ProjectilesCollectionModel
{
   private Projectile[] mProjectiles;
   private final int C_RAND_PROJECTILE_COUNT = 10; 
   
   private PVector[] mLocations;
  
  
   ProjectilesCollectionModel(int vWidth, int vHeight){
      mProjectiles = new Projectile[C_RAND_PROJECTILE_COUNT];
      mLocations = new PVector[mProjectiles.length];
      for(int i = 0; i < C_RAND_PROJECTILE_COUNT ; i++){
            mProjectiles[i] = makeRandomProjectile(vWidth, vHeight);
            mLocations[i] = mProjectiles[i].location;
      }
      
   } 
  
  
   /**
   * Makes projectile with random location within rect (0,0) - (ww,hh)
   * and random velocity
   */
   private Projectile makeRandomProjectile(float ww, float hh){
      int lifeTimeMillis = 10000; // 10 seconds
      PVector velocity = random2DVector();
      velocity.mult(random(1,4));
      return new Projectile(random(ww), random(hh), velocity, lifeTimeMillis ); 
   }
   
   /**
   * Returns array of available projectiles or NULL.
   * @returns NULL (if no projectiles available). 
   */
   PVector[] getProjectileLocations(){
       
       return mLocations;
   }
   
   
   /**
   * Code for cleaning up deada projectiles is not working. Be careful, mLocations is _referencing_ location 
   * vectors in mProjectiles.
   */
   void update(){
      if ( mProjectiles != null){
         for(int i = 0 ; i < mProjectiles.length ; i++){
            mProjectiles[i].update();
         }
      }
   }
   
   
   void add(Projectile pj){
      mProjectiles[0] = pj;
      mLocations[0] = pj.location;
   }
   
}
