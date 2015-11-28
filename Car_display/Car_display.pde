
//imports the Serial comminiocation

import processing.serial.*;
// a string to store each line of Serial communication
 String data = "1";
Serial port;


// Variables used to store the angles for acceleration, breaking, speed, amp
float A_acc = 90;
float A_bre = 90;
float A_spe = 180;
float A_amp = 180;
float A_vol = 0;

// Strings to store unpacked messages from Serial  
  String RPM        = "1";
  String voltage    = "1";
  String current    = "1";
  String throttle   = "1";
  String brake      = "1";
  String telemBits  = "1";




// Creating the font object
PFont font;

void setup(){
  // sets the size of the CANVAS (my computer resulotion)
  size(2160,1440);
  
//Port is the variable that stores the new serial communication 
//from selected COM port @ 250000 baud
  port = new Serial(this, Serial.list()[0], 250000);
//clears the first reading  
  port.clear();
// reads the serial till end of the line  
   data = port.readStringUntil('\n');
// initially the string will be empty
    data  = null;
  
  
  smooth();
}

void draw(){
  // sets the background color
  background(0);
  
   while (port.available() > 0) {
  data = port.readStringUntil('\n');
  }
  
  if (data != null){
  //
  
 
   RPM       = data.substring(0, data.indexOf('A'));
   voltage   = data.substring(data.indexOf("A") + 1, data.indexOf('B'));
   current   = data.substring(data.indexOf("B") + 1, data.indexOf('C'));
   throttle  = data.substring(data.indexOf("C") + 1, data.indexOf('D'));
   brake     = data.substring(data.indexOf("D") + 1, data.indexOf('E'));
   telemBits = data.substring(data.indexOf("E") + 1, data.indexOf('\n'));
  } 
  
  
  A_spe = ((Float.valueOf(RPM).floatValue()));
  A_vol = ((Float.valueOf(voltage).floatValue()));
  A_amp = ((Float.valueOf(current).floatValue()));
  A_acc = ((Float.valueOf(throttle).floatValue()));
  A_bre = ((Float.valueOf(brake).floatValue()));
 

   
    // motor statuse  
      stroke(#454844);
      strokeWeight(3.5);
      fill(255,255,255);
      ellipse(250,200,270,270);
      ellipse(250,550,270,270);
      ellipse(1900,200,270,270);
      ellipse(1900,550,270,270);
      
    //kelly contrller statuse indicators Red   
      fill(255,0,0); // three variables will determin the collor accordingly
        ellipse(90,250,25,25);
        ellipse(90,600,25,25);
        ellipse(2060,250,25,25);
        ellipse(2060,600,25,25);
      
    //kelly contrller statuse indicators Green          
      fill(0,255,0); // three variables will determin the collor accordingly
        ellipse(90,150,25,25);
        ellipse(90,500,25,25);
        ellipse(2060,150,25,25);
        ellipse(2060,500,25,25);  
              
    // battery charge level
    
      noFill();
      stroke(255,255,255);
      rect(580,100,1000,100);
      
      if (A_vol > 400){
      fill(0,255,0); //green
      rect(580,100,A_vol,100);
      } 
      if (A_vol < 400 && A_vol > 150){
      fill(255,243,3); //yellow
      rect(580,100,A_vol,100);
      }
      if (A_vol < 150){
      fill(255,0,0); // red
      rect(580,100,A_vol,100);
      }
     // box can be used for messages etc.
       
       fill(255);
       rect(580,250,1000,200);
        
    // Gate for speedo etc.
        fill(#97ECF5); 
        arc(1080,1300,1650,1650,(PI+(HALF_PI-PI/2)), TWO_PI); // background 
     
         fill(0);
         arc(1080,1300,1600,1600,(PI+(HALF_PI-PI/2)), TWO_PI); //acceleration and breaking slot
                  
            stroke(#FFEB03);
            strokeWeight(6);
              lineAngle(1080,1300,radians(A_acc),790); //acceleration-Curve
         
         stroke(149,38,148);
         strokeWeight(1);
         fill(0);
         arc(1080,1300,1500,1500,(PI+(HALF_PI-PI/2)), TWO_PI); //acceleration and breaking slot              
         
                   
            stroke(#03FF5D);
            strokeWeight(6);
              lineAngle(1080,1300,radians(A_bre),740); //breaking-Curve
         
         stroke(250,244,197);
         fill(0);
         arc(1080,1300,1400,1400,(PI+(HALF_PI-PI/2)), TWO_PI); // speedometer
         
         //****    ****\\
         stroke(255);
         strokeWeight(1);
         float i = 0;
         
         while (i < 180){
           lineAngle(1080,1300,radians(i),700);
           i +=2;
         }
         
         

        stroke(0); 
        fill(0);
        arc(1080,1300,1330,1330,(PI+(HALF_PI-PI/2)), TWO_PI); //            
         
         float a = 0;
         stroke(255);
         strokeWeight(5);
         
         while (a < 180){
           lineAngle(1080,1300,radians(a),700);
           a +=10;
         }
         
        stroke(0); 
        fill(0);
        arc(1080,1300,1300,1300,(PI+(HALF_PI-PI/2)), TWO_PI); //   
        
        
            stroke(255,0,0);
            strokeWeight(10);
              lineAngle(1080,1300,radians(A_spe),650); //speed-Curve
         
         stroke(250,244,197); 
         fill(#6A3EFF);
         arc(1080,1300,310,310,(PI+(HALF_PI-PI/2)), TWO_PI); //ampmeter
         
         float x = 0;
         while (x < 180){
           stroke(255);
           strokeWeight(1);
           lineAngle(1080,1300,radians(x),155);
           x +=10;
         }
         
         stroke(250,244,197);
         fill(#6A3EFF);
         arc(1080,1300,250,250,(PI+(HALF_PI-PI/2)), TWO_PI); //ampmeter
         
           stroke(3,252,250);
           strokeWeight(6);
            lineAngle(1080,1300,radians(A_amp),115); //ampmeter-Curve              
              
         stroke(0);
         fill(0);
         arc(1080,1310,40,40,(PI+(HALF_PI-PI/2)), TWO_PI);  // Center Dot          
          



} /*
void serialEvent(Serial port){
  // read the serial till the end of the line
  
  while (port.available() > 0) {
  data = port.readStringUntil('\n');
  }
  
  if (data != null){
  //
  
 
   RPM       = data.substring(0, data.indexOf('A'));
   voltage   = data.substring(data.indexOf("A") + 1, data.indexOf('B'));
   current   = data.substring(data.indexOf("B") + 1, data.indexOf('C'));
   throttle  = data.substring(data.indexOf("C") + 1, data.indexOf('D'));
   brake     = data.substring(data.indexOf("D") + 1, data.indexOf('E'));
   telemBits = data.substring(data.indexOf("E") + 1, data.indexOf('\n'));
  } 
}

*/

// this function is used to plot a line on an angle 
void lineAngle(int x, int y, float angle, float length)
{
  line(x, y, (x+cos(angle)*length), (y-sin(angle)*length));
}