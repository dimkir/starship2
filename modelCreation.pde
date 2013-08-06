ShipModel shipModel;
ProjectileModel projectileModel;
HudModel hudModel;
TheDispatcher theDispatcher;



final String C_SERVER_IP = "127.0.0.1";
//final String C_SERVER_IP = "192.168.0.20";
void initModelsForTesting()
{
    theDispatcher = new TheDispatcher();
    //shipModel = new ShipModel(100, width-100, 100,  height - 100, theDispatcher); // inits ship in some location?
    shipModel = new NetShipModel(C_SERVER_IP, theDispatcher);
    
    projectileModel = new ProjectileModel(width, height); // inits some random projectiles with random directions.
 
    theDispatcher.setShipModel(shipModel);
    theDispatcher.setProjectileModel(projectileModel);
    hudModel = new HudModel(width, height, theDispatcher);
    theDispatcher.setHudModel(hudModel);
    
}

