/**
* Just absraction of triangle.
*/
static class Triangle
{
  
   public PVector a, b, c;
  
   static Triangle spawnRandom(){
      PVector aa = new PVector(0, 20);
      PVector bb = new PVector(-10, -10);
      PVector cc = new PVector(10,-10);
      return (new Triangle(aa, bb, cc)).mult(3.0);
   } 
  
   Triangle mult(float v){
      a.mult(v);
      b.mult(v);
      c.mult(v);
      return this; // for chaining
   }

   Triangle(PVector aa, PVector bb, PVector cc){
      a = aa.get();
      b = bb.get();
      c = cc.get();
   }
   
   

   // this is kinda messy   
   void add(PVector v){
      a.add(v);
      b.add(v);
      c.add(v);
   }
   
   String toString(){
      return a.toString();
   }
   
}
