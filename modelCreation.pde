ShipModel shipModel;
ProjectileModel projectileModel;
HudModel hudModel;
TheDispatcher theDispatcher;



void initModelsForTesting()
{
    theDispatcher = new TheDispatcher();
    shipModel = new ShipModel(100, width-100, 100,  height - 100, theDispatcher); // inits ship in some location?
    projectileModel = new ProjectileModel(width, height); // inits some random projectiles with random directions.
 
    theDispatcher.setShipModel(shipModel);
    theDispatcher.setProjectileModel(projectileModel);
    hudModel = new HudModel(width, height, theDispatcher);
    theDispatcher.setHudModel(hudModel);
    
}

