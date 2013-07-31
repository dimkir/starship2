/*
* This is model of a projectile.
*/
class Projectile
{
    PVector location;
    final float mLinearDamping = 0.001; // stop
    PVector mVelo;
    int mLifeTimeMillis;
    int mLifeEnd; 
    boolean mIsDead = false;
    
    final int C_DEF_LIFETIME_MILLIS  = 10000;
    
    /**
    * This is 4 parameter constructor. (Only one, so JavaScript won't have ambiguity)
    */
    Projectile(float xx, float yy, PVector velo, int lifeTimeMillis){
       location = new PVector(xx, yy);
       mVelo = velo;
       startLifetime(lifeTimeMillis);     
    }
    
    void startLifetime(){
       startLifetime(C_DEF_LIFETIME_MILLIS);
    }
    
    void startLifetime(int lifeTimeMillis){
       mLifeTimeMillis = lifeTimeMillis;
       mLifeEnd = millis() + lifeTimeMillis;
         
    }
    
    /**
    * This is 3 parameter constructor.
    * There can be only one 3-parameter constructor, so that JavaScript doesn't become ambiguous.
    */
    Projectile(PVector loc, float angle, float speed){
       location = loc.get();
       mVelo = createVeloFrom(angle, speed);
       startLifetime();
    } 
    
    
    private PVector createVeloFrom(float angle, float speed){
       float xx = cos(angle) * speed;
       float yy = sin(angle) * speed;
       return new PVector(xx, yy);
    }
    
    void update(){
       if ( millis() >= mLifeEnd ){
          mIsDead = true;
          return;
       }
       // update location (and whether it's dead or not);
       // should I update if it is dead?
       location.add(mVelo);
       mVelo.mult(1.0 - mLinearDamping);
         
    }
    
    
    boolean isDead(){
       return mIsDead; // is calculated each update()
    }
}
