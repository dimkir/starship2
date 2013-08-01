import processing.net.*;

class NetShipModel extends ShipModel
{
   private Client mClient;
   private final int C_PORT = 10002;
   private final int C_MAX_WELCOME_WAIT_TIME_MILLIS = 3000; // 2 seconds.
   
   /**
   * Inits model of the ship, which is synchronized with server. 
   *
   * Extends the model of the ship. Except that location and angle is received and
   * synchronized with the Server.
   */
   NetShipModel(String serverAddress, TheDispatcher theDispatcher){
       super(theDispatcher);
       
       mClient = new Client(spaceShips.this, serverAddress, C_PORT);
       if ( mClient == null ){
          throw new RuntimeException("Cannot connect to server [" + serverAddress + "]");
       }
       // now we need to get the location.
       String serverWelcomeMessage = getWelcomeMessageOrThrow(mClient, C_MAX_WELCOME_WAIT_TIME_MILLIS);
       PVector shipLoc = parseServerResponseToLocation(serverWelcomeMessage);
       if ( shipLoc == null){
          throw new RuntimeException("Error parsing first response from server");
       }
       
       setLocation(shipLoc);
       
   }
 
  /**
  * Parses. Returns null on error.
  */
  PVector parseServerResponseToLocation(String serverLocationResponse){
     String[] lines = split(serverLocationResponse, "\n");
     
     // sets serverLocation response to the value of firs non-commetn string.
     String firstNonCommentLine = null;
     for(int i = 0;  i < lines.length ; i++){
          if ( !lines[i].startsWith("#") ){
             firstNonCommentLine = lines[i];
             break;
          }
     }
     if ( firstNonCommentLine == null ){
        throw new RuntimeException("Could not find non-comment lines in the server response");
     }
     
     String[] parts = split(firstNonCommentLine, ' ');
     dprintln("Received non-commment line from server: [" + firstNonCommentLine +"]");
     dprintarln(parts);
     if ( !parts[0].toLowerCase().equals("ship_location") ){
        return null;
     }
     float xx = parseFloat(parts[1]);
     float yy = parseFloat(parts[2]);
     return new PVector(xx, yy);
  } 
   
   
   /**
   * Tries to get welcome message from server (with the location command).
   * Or throws RuntimeException() if the timeout is gone.
   */
   private String getWelcomeMessageOrThrow(Client client, int maxWaitTimeMillis){
       int endTime = millis() + maxWaitTimeMillis;
       
       // this loop is an ugly hack, but it should be called differently.
       while ( millis() < endTime ){
           
           try
           {
              if ( client.available() > 0 ){
                 String msg = client.readString();
                 return msg;
              }
              Thread.sleep(100);
              
           }
           catch(InterruptedException iee){
              iee.printStackTrace();
              throw new RuntimeException(iee);
           }
       }
       throw new RuntimeException("NetShipModel.getWelcomeMessageOrThrow() couldn't get welcome message from server during " + maxWaitTimeMillis + " millsecnods");
   }
   
   
   void update()
   {
      super.update(); // update all the rubbish like guns and stuff.
      
      updateLocationFromNet();
   }
   
   private void updateLocationFromNet(){
       if ( mClient.available()  > 0 ){
          String msg = mClient.readString();
           // this will return location if that was location command
           PVector shipLoc = parseServerResponseToLocation(msg);
           if ( shipLoc != null ){
               setLocation(shipLoc);             
           }
       }
   }
}
