final color COLOR_RED = #FF0000;
final color COLOR_BLUE = #0000FF;
final color COLOR_GREEN = #00FF00;
final color COLOR_YELLOW = #FFFF00;


void todo(){
   throw new RuntimeException();
}

void todo(String s){
   throw new RuntimeException(s);
}


PVector random2DVector(){
   return new PVector(random(1), random(1));
}


void dprintln(String s){
   println(s);
}





void setupFonts(){
   textFont(createFont("Arial", 32));
}



void drawTriangle(PVector location, Triangle t, float angle ){
   dprintln("Triangle is: " + t.toString());
   angle += PI;
//   rectMode(CENTER);
//   pushMatrix();
//   translate(location.x, location.y);   
//   rotate(angle);
//   
//   rect(0, 0, 30, 30);
//   popMatrix();
   pushMatrix();
   translate(location.x, location.y);
   rotate(angle);   
   strokeWeight(2);
   stroke(255);
   beginShape();
   vertex(t.a.x, t.a.y);
   vertex(t.b.x, t.b.y);
   vertex(t.c.x, t.c.y);
   endShape(CLOSE);
   popMatrix();
}


void rectCornerVec(PVector topLeft, PVector bottomRight){
   rectMode(CORNERS);
   rect(topLeft.x, topLeft.y, bottomRight.x , bottomRight.y);
}
