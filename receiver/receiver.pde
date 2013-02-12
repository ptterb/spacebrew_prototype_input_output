import spacebrew.*;

String server="localhost";
String name="Destinations";
String description ="Listen for incoming destinations";

Spacebrew spacebrewConnection;

int[] destinations = new int[5];

void setup() {
  size(600, 400);

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

  rect(50, height-50-destinations[0]*10, 50, destinations[0]*10);

  rect(150, height-50-destinations[1]*10, 50, destinations[1]*10);

  rect(250, height-50-destinations[2]*10, 50, destinations[2]*10);

  rect(350, height-50-destinations[3]*10, 50, destinations[3]*10);

  rect(450, height-50-destinations[4]*10, 50, destinations[4]*10);

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