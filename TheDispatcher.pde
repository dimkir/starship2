/**
* All of the models which are not related via direct parent-child link,
* can communicate with each other only through this TheDispatcher object.
* This way this class will be very simple, but will have the highest level of coupling
* in the system. This is why we will comply with "Introduce coupling into simpliest units" principle.
*/
class TheDispatcher
{
    private ShipModel mShipModel;
    private ProjectilesCollectionModel mProjectilesCollectionModel;
    private HudModel mHudModel;
    
    void setShipModel(ShipModel sm){
       mShipModel  =sm;
    }
    
    void setProjectilesCollectionModel(ProjectilesCollectionModel pm){
       mProjectilesCollectionModel = pm;
    }
    
    void setHudModel(HudModel hm){
       mHudModel = hm;
    }
    
    float getShipAngle(){
       return mShipModel.getAngle();
    }    
    
    
    void createProjectile(PVector startPoint, float angle, float speed){
       Projectile pj = new Projectile(startPoint, angle, speed);
       mProjectilesCollectionModel.add(pj);
    }
    
}
