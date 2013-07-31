class HudModel
{
  
   private TheDispatcher mTheDispatcher;
   int ww;
   int hh;
   
   final int C_HUD_HEIGHT = 80;
   
   float mShipAngle;
   
   PVector topLeft;
   PVector bottomRight;
   PVector centerPoint;
  
   HudModel(int vWidth, int vHeight, TheDispatcher theDispatcher){
       topLeft = new PVector(0, vHeight - C_HUD_HEIGHT);
       bottomRight = new PVector(vWidth, vHeight);
       centerPoint  = bottomRight.get();
       centerPoint.sub(topLeft);
       centerPoint.div(2.0);
       centerPoint.add(topLeft);
       
       update();
   }
  
  
  
  
   PVector getTopLeft(){
      return topLeft;
   }
   
   PVector getBottomRight(){
      return bottomRight;
   }
   
   
   float getShipDirectionAngle(){
      return mShipAngle;
   }
   
   
   PVector getHudCenter(){
       return centerPoint;
   }
   
   void update()
   {
       mShipAngle = theDispatcher.getShipAngle();
   }
   
}
