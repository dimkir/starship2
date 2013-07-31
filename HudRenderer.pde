class HudRenderer extends GeometricRenderer
{
   
  void  renderHud(HudModel hudModel)
  {  
     PVector p = hudModel.getTopLeft();
     textAlign(LEFT);
     text("Hello", p.x, p.y);
     super.renderHud(hudModel);
  }
}
