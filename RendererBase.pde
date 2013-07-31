abstract class RendererBase
{
    abstract void renderFramePrepare();
    abstract void renderShip(ShipModel shipModel);
    abstract void renderProjectiles(ProjectileModel projectileModel);
    abstract void renderHud(HudModel hudModel);
    abstract void renderFrameFinalize();
}
