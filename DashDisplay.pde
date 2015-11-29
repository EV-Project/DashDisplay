
//imports the Serial comminiocation

import processing.serial.*;
// a string to store each line of Serial communication
String data = "";
Serial port;


// Variables used to store the angles for acceleration, braking, speed, amp
float A_acc = 90;
float A_bra = 90;
float A_spe = 180;
float A_amp = 180;
float A_vol = 0;

// Strings to store unpacked messages from Serial  
  String RPM        = "0";
  String voltage    = "0";
  String current    = "0";
  String throttle   = "0";
  String brake      = "0";
  String telemBits  = "0";




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
   
  font = createFont("LucidaBright",100);
  textFont(font,50);
  smooth();
}


void draw(){
  // sets the background colour
  background(0);
  
  if (port.available() > 0) {
    data = port.readStringUntil('\n');
  }
  
  if (data != ""){
    int offset = data.indexOf("U*"); //this is our Header (0x552A)
    if(offset>=0){
      switch(data.substring(offset+3, offset+4)){
        case "A":
          RPM = data.substring(offset+3, data.indexOf('\n'));
          break;
        case "B":
          voltage   = data.substring(offset+3, data.indexOf('\n'));
          break;
        case "C":
          current   = data.substring(offset+3, data.indexOf('\n'));
          break;
        case "D":
          throttle  = data.substring(offset+3, data.indexOf('\n'));
          break;
        case "E":
          brake     = data.substring(offset+3, data.indexOf('\n'));
          break;
        case "F":
          telemBits = data.substring(offset+3, data.indexOf('\n'));
          break;
        default:
          //not recognised
      }
    }
  } 
  
  
  A_spe = ((Float.valueOf(RPM).floatValue()));
  A_vol = ((Float.valueOf(voltage).floatValue()));
  A_amp = ((Float.valueOf(current).floatValue()));
  A_acc = ((Float.valueOf(throttle).floatValue()));
  A_bra = ((Float.valueOf(brake).floatValue()));
 

   
    // motor status
      stroke(#454844);
      strokeWeight(3.5);
      fill(255);
      //motor 1
      ellipse(250,200,270,270);
      float m1 = 0;
         while (m1 < 360){
           stroke(0);
           strokeWeight(.9);
           lineAngle(250,200,radians(m1),135);
           
           m1 +=5;
         }
      stroke(#454844);
      strokeWeight(3.5);
      fill(255);         
      ellipse(250,200,230,230);
          
      //motor 2
      ellipse(250,550,270,270);
      float m2 = 0;
        while(m2 <360){
          stroke(0);
          strokeWeight(.9);
          lineAngle(250,550,radians(m2), 135);
          m2 +=5;
        }
      stroke(#454844);
      strokeWeight(3.5);
      fill(255);         
      ellipse(250,550,230,230);
      
      //motor 3
      ellipse(1900,200,270,270);
      float m3 = 0;
        while(m3 <360){
          stroke(0);
          strokeWeight(.9);
          lineAngle(1900,200,radians(m3), 135);
          m3 +=5;
        }
      stroke(#454844);
      strokeWeight(3.5);
      fill(255);         
      ellipse(1900,200,230,230);      
      
      
      //motor 4
      ellipse(1900,550,270,270);
      float m4 = 0;
        while(m4 <360){
          stroke(0);
          strokeWeight(.9);
          lineAngle(1900,550,radians(m4), 135);
          m4 +=5;
        }
      stroke(#454844);
      strokeWeight(3.5);
      fill(255);         
      ellipse(1900,550,230,230);      
      
      
    //kelly controller status indicators Red
      fill(255,0,0); // three variables will determine the colour accordingly
        ellipse(90,250,25,25);
        ellipse(90,600,25,25);
        ellipse(2060,250,25,25);
        ellipse(2060,600,25,25);
      
    //kelly controller status indicators Green
      fill(0,255,0); // three variables will determine the colour accordingly
        ellipse(90,150,25,25);
        ellipse(90,500,25,25);
        ellipse(2060,150,25,25);
        ellipse(2060,500,25,25);  
              
    // battery charge level
    
      noFill();
      stroke(255,255,255);
      rect(580,100,1000,100);
      
      if (A_vol > 400){
      stroke(0,255,0);  
      fill(0,255,0); //green
      rect(580,100,A_vol,100);
      } 
      if (A_vol < 400 && A_vol > 150){
      stroke(255,243,3);  
      fill(255,243,3); //yellow
      rect(580,100,A_vol,100);
      }
      if (A_vol < 150){
      stroke(255,0,0);  
      fill(255,0,0); // red
      rect(580,100,A_vol,100);
      }
      
      // showing the battery level in % value
      float PA_vol = 0;
      PA_vol = (A_vol/10);
      
      text ("Battery = %", 600,300);
      text (PA_vol, 850,300);
      
      
     // box can be used for messages etc.
       
       noFill();
       rect(580,250,1000,200);
        
    // Gate for speedo etc.
        fill(#97ECF5);
        stroke(255);
        arc(1080,1300,1650,1650,(PI+(HALF_PI-PI/2)), TWO_PI); // background 
     
         fill(0);
         arc(1080,1300,1600,1600,(PI+(HALF_PI-PI/2)), TWO_PI); //acceleration and braking slot
                  
            stroke(#FFEB03);
            strokeWeight(6);
              lineAngle(1080,1300,radians(A_acc),790); //acceleration-Curve
         
         stroke(149,38,148);
         strokeWeight(1);
         fill(0);
         arc(1080,1300,1500,1500,(PI+(HALF_PI-PI/2)), TWO_PI); //acceleration and braking slot
         
                   
            stroke(#03FF5D);
            strokeWeight(6);
              lineAngle(1080,1300,radians(A_bra),740); //braking-Curve
         
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
              
              // to hide the lines @ 0 and 180 degrees
              stroke(0);
              fill(0);
              ellipse(1080,1300,310,310);
         
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
          



}


// this function is used to plot a line on an angle 
void lineAngle(int x, int y, float angle, float length){
  line(x, y, (x+cos(angle)*length), (y-sin(angle)*length));
}