RendererBase currentRenderer; // this one is used to access current renderer in the render_models(); 

void setup(){ 
   size(800,600);
   initModelsForTesting();
   currentRenderer = initRenderersForTesting(); // just inits renders and sets currentRenderer
   setupFonts();
}

void draw(){
   update_models();
   render_models();
}


void update_models(){
   shipModel.update();
   projectileModel.update();
   hudModel.update();
}


void render_models(){
    currentRenderer.renderFramePrepare(); // basically clear screen before
    currentRenderer.renderShip(shipModel);
    currentRenderer.renderProjectiles(projectileModel);
    currentRenderer.renderHud(hudModel);
    currentRenderer.renderFrameFinalize(); // maybe we want to finalize or draw mouse cursor or smth
}



