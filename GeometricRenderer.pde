class GeometricRenderer extends RendererBase
{

  final int C_GUN_LENGTH = 30; // in pixels
  final int C_PROJECTILE_RADIUS = 5;

  void renderFramePrepare()
  {
     // clear screen
     background(0);
  }
  
  void renderFrameFinalize(){
     textAlign(LEFT);
     text("Framerate: " + int(frameRate), 10 ,60 );
  }
  

  /**
   * Here we render ship, which will be represented by a triangle.  
   */
  void renderShip(ShipModel shipModel) {
    // first draw body.
    PVector shipOrigin = shipModel.getLocation();
    Triangle triangle = shipModel.getTriangle();
    float angle = shipModel.getAngle();
    drawTriangle(shipOrigin, triangle, angle);

    // draw ships origin as red rect
    rectMode(CENTER);
    fill(COLOR_RED);
    noStroke();
    rect(shipOrigin.x, shipOrigin.y, 16, 16);

    renderGun(shipModel);
  }

  /**
   * Gun is rendered as line pointed from the origin
   */
  void renderGun(ShipModel shipModel) {
    GunModel gunModel = shipModel.getGunModel();
    PVector shipOrigin = shipModel.getLocation();
    dprintln("Ship origin: " + shipOrigin);
    float gunAngle = gunModel.getAngle();
    dprintln("renderGun(): gunAngle = " + gunAngle);
    float gunLength = gunModel.getGunLength();
    float endX = cos(gunAngle) * gunLength;
    float endY = sin(gunAngle) * gunLength;   

    strokeWeight(4);
    stroke(COLOR_RED);
    line(shipOrigin.x, shipOrigin.y, shipOrigin.x + endX, shipOrigin.y + endY);
    ellipse(shipOrigin.x, shipOrigin.y, C_GUN_LENGTH /2, C_GUN_LENGTH / 2);
  }



  void  renderHud(HudModel hudModel)
  {
    PVector p0 = hudModel.getTopLeft();
    PVector p1 = hudModel.getBottomRight();
    fill(128);
    noStroke();
    rectCornerVec(p0, p1);

    float angle = hudModel.getShipDirectionAngle();
    // in the middle of the hud, let's display the angel.
    PVector hudCenter = hudModel.getHudCenter();
    fill(255);
    textAlign(CENTER);
    text("Direction angle: " + angle, hudCenter.x, hudCenter.y);
  }



  void renderProjectiles(ProjectileModel projectileModel) {
    fill(COLOR_BLUE);
    stroke(COLOR_YELLOW);
    PVector[] projectiles = projectileModel.getProjectileLocations();
    if ( projectiles != null) {
      for (int i = 0; i < projectiles.length ; i++) {
        PVector p = projectiles[i];
        ellipse(p.x, p.y, C_PROJECTILE_RADIUS * 2, C_PROJECTILE_RADIUS* 2);
      }
    }
  }
}

