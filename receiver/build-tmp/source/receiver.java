import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import spacebrew.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class receiver extends PApplet {



String server="localhost";
String name="Destinations";
String description ="Listen for incoming destinations";

Spacebrew spacebrewConnection;

int[] destinations = new int[5];

public void setup() {
  size(600, 400);
  
  spacebrewConnection = new Spacebrew( this );
  
  // add each thing you publish to
  // spacebrewConnection.addPublish( "buttonPress", buttonSend ); 

  // add each thing you subscribe to
  spacebrewConnection.addSubscribe( "text", "string" );
  
  // connect!
  spacebrewConnection.connect("ws://"+server+":9000", name, description );
  
}

public void draw() {

}

//void mousePressed() {
//  spacebrewConnection.send( "buttonPress", buttonSend);
//}

public void onRangeMessage( String name, int value ){
  println("got int message "+name +" : "+ value);
  //  // check name by using equals
  //  if (name.equals("color") == true) {
  //      currentColor = value;
  //  }
}

public void onBooleanMessage( String name, boolean value ){
  println("got bool message "+name +" : "+ value);  
}

public void onStringMessage( String name, String value ){
  println("got string message "+name +" : "+ value); 

  switch (value){

    case "Hudson":
      destinations[0]++;
      break;
    case "Harlem":
      destinations[1]++;
      break;
    case "New Haven":
      destinations[2]++;
      break;
    case "Pascack Valley":
      destinations[3]++;
      break;
    case "Port Jervis":
      destinations[4]++;
      break;

  }
  println("Hudson: "+destinations[0]);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "receiver" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
