





void setup(){
  // sets the size of the CANVAS (my computer resulotion)
  size(2160,1440);
  
  
  smooth();
}

void draw(){
  // sets the background color
  background(0);
  
    {  
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
    
      fill(0,0,255);
      stroke(255,255,255);
      
        rect(580,100,1000,90);
        
    // Gate for speedo etc.
      fill(#97ECF5); 
     arc(1080,1300,1650,1500,(PI+(HALF_PI-PI/2)), TWO_PI); // background 
     
      fill(255);
       arc(1080,1300,1600,1450,(PI+(HALF_PI-PI/2)), TWO_PI); //acceleration and breaking slot
       
       fill(0);
        arc(1080,1300,1400,1250,(PI+(HALF_PI-PI/2)), TWO_PI); // speedometer
        
          fill(#6A3EFF);
            arc(1080,1300,300,300,(PI+(HALF_PI-PI/2)), TWO_PI); //ampmeter
            
          stroke(#6A3EFF);
          fill(0);
            arc(1080,1300,30,30,(PI+(HALF_PI-PI/2)), TWO_PI);  // Center Dot          
        
        
    // lines for accrelaration, breraking, speedometer and ampmeter
        stroke(#FFEB03);
        strokeWeight(6);
          line(1080,675,1080,725); //acceleration
          
        stroke(#03FF5D);
        strokeWeight(6);
          line(1080,725,1080,775); //breaking
          
        stroke(255,0,0);
        strokeWeight(10);
          line(1080,1400,500,775); //speedometer
          
        stroke(3,252,250);
        strokeWeight(6);
          line(1080,1400,1080,1300); //ampmeter
   
    
    }


}