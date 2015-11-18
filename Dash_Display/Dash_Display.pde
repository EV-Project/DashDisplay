//imports the Serial communication
import processing.serial.*;
Serial port;

 String pot = "1";
 String SinPot = "1";
 String data = "";
 int index = 0;
 PFont font;
 float angle = 0;
 float lengh = 0;

float speed = 0.015;
float a;

Float BL;

 void setup () {
// Seting the size of the plane   
 size(5000, 4000);
//assigning the serial val to the variable port 
  port = new Serial(this, "COM8", 250000);
  port.bufferUntil('\n');
//loading the font and assigning to a variable  
  font = createFont("ArialUnicodeMS", 100);
  textFont(font, 100);
  smooth();

 }
 void draw () {
//Set the back ground color   
    background(0);

    
//****Speedo*****    
    
// Reading the value of the pot and displaying on the screen (Observation)    
    fill(#F23D3D);
    text(pot, 80, 200);
//Displaying the word "Degrees"    
    fill(#F23D3D);
    text("Degrees", 300 ,200);
// draw the main gate for the speedo (Uses an ellips and rectangle)    
    fill(#020205);
    stroke(255);
    strokeWeight(5);
    ellipse(1000,800, 1000, 1000);
//
    fill(255);
    stroke(255);
    strokeWeight(5);
    line(500,800,1500,800);
    
    fill(0);
    stroke(0);
    rect(495,805, 1010,500);
//assigning the pot value  to the variable angle     
  angle = ((Float.valueOf(pot).floatValue()));

//showing the speed calculated with the unit "KpH" Will be asked from CAN Bus later on 
    fill(#F23D3D);
    text((angle-178), 680, 900); 
    fill(#11BC54);
    text("KpH", 1080,900);
//draw the line that rotates on an angle to the specific center     
  fill(#EBFC03);
  stroke(#EBFC03);
  strokeWeight(5);
  lineAngle(1000,800,angle*1200,450);
 
//*****Battery Level*****
  BL = ((Float.valueOf(SinPot).floatValue()));
      text(SinPot,400,1100); 
      
      stroke(#00FF0E);
      strokeWeight(30);
      line(300, 1200, BL, 1200);
  
      
 }

 void serialEvent (Serial port) 
 {
   data = port.readStringUntil('\n');
   
  // index = data.indexOf('\n');
   
   pot = data.substring(0, data.indexOf(','));
   SinPot = data.substring(data.indexOf(",") + 1, data.indexOf('\n'));
   
 }
 
 
void lineAngle(int x, int y, float angle, float length)
{
  line(x, y, x+cos(angle)*length, y-sin(angle)*length);
}