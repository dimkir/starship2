RendererBase[] allRenderers;   // this is just "stores" for containing renderers

/**
* Just inits all the renderers avalable, so that we can hot-switch them during the game.
* this one is called from setup() before the game loop begins.
* Loads at least 1 renderer.
* @return returns default renderer.
*/
RendererBase initRenderersForTesting()
{
   //return new GeometricRenderer();
   return new HudRenderer();
      
}
