import spacebrew.*;

String server="localhost";
String name="Destinations";
String description ="Listen for incoming destinations";

Spacebrew spacebrewConnection;

int[] destinations = new int[5];

PFont p;

void setup() {
  size(700, 400);

  p = loadFont("Edmondsans-Medium-24.vlw");

  for (int i = 0; i < destinations.length; i++){
    destinations[i] = 0;
}
  
  spacebrewConnection = new Spacebrew( this );
  
  // add each thing you publish to
  // spacebrewConnection.addPublish( "buttonPress", buttonSend ); 

  // add each thing you subscribe to
  spacebrewConnection.addSubscribe( "text", "string" );
  
  // connect!
  spacebrewConnection.connect("ws://"+server+":9000", name, description );
  
}

void draw() {
  background(25);

  textFont(p, 18);

  fill(255);
  text("Hudson", 50, height-30);
  text("Harlem", 180, height-30);
  text("New Haven", 310, height-30);
  text("Pascack Valley", 440, height-30);
  text("Port Jervis", 570, height-30);
  
  fill(#CC6699);
  rect(50, height-50-destinations[0]*10, 50, destinations[0]*10);
  
  fill(#33CCFF);
  rect(180, height-50-destinations[1]*10, 50, destinations[1]*10);
  
  fill(#FFFF66);
  rect(310, height-50-destinations[2]*10, 50, destinations[2]*10);
  
  fill(#99CC66);
  rect(440, height-50-destinations[3]*10, 50, destinations[3]*10);
  
  fill(#9999CC);
  rect(570, height-50-destinations[4]*10, 50, destinations[4]*10);
  

}

//void mousePressed() {
//  spacebrewConnection.send( "buttonPress", buttonSend);
//}

void onRangeMessage( String name, int value ){
  println("got int message "+name +" : "+ value);
  //  // check name by using equals
  //  if (name.equals("color") == true) {
  //      currentColor = value;
  //  }
}

void onBooleanMessage( String name, boolean value ){
  println("got bool message "+name +" : "+ value);  
}

void onStringMessage( String name, String value ){
  println("got string message "+name +" : "+ value); 

  if (value.equals("Hudson")){
    destinations[0]++;
  }
  if (value.equals("Harlem")){
    destinations[1]++;
  }
  if (value.equals("New Haven")){
    destinations[2]++;
  }
  if (value.equals("Pascack Valley")){
    destinations[3]++;
  }
  if (value.equals("Port Jervis")){
    destinations[4]++;
  }

  
}