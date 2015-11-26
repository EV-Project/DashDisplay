/*This program is listning to the CANBus 
 *and sends the data over the serial port to processing 
 */

// including required liberaries 
//#include <KellyCAN.h>
#include <FlexCAN.h>
#include <CANcallbacks.h>
#include <ChallengerEV.h>

//wheels are indexed 1-4
//const int wheelnumber = 3;




//const int wheelnum = wheelnumber - 1;

//pull the constants out of ChallengerEV.h

const uint32_t dashID1 = wheel[1].dashID;  //telemetry messages from the wheel manager
const uint32_t dashID2= wheel[2].dashID;  //telemetry messages from the wheel manager
const uint32_t dashID3 = wheel[3].dashID;  //telemetry messages from the wheel manager
const uint32_t dashID4 = wheel[4].dashID;  //telemetry messages from the wheel manager

// I D K
FlexCAN CANbus(1000000);
CANcallbacks canbus(&CANbus);


bool redLightBit = false;
bool greenLightBit = false;
float RPM;
float voltage;
float current;
float throttle;
float brake;

void wheel1ProcessMessage (CAN_message_t &message){

  
}

void wheel2ProcessMessage (CAN_message_t &message){

  
}
void wheel3ProcessMessage (CAN_message_t &message){

  
}
void wheel4ProcessMessage (CAN_message_t &message){

  
}
void pedalsProcessMessage (CAN_message_t &message){

  
}


// a function to get the data returned by each wheel and do some averaging


void setup() {
  // 

  Serial.begin(9600);
  Serial.println("Dash Display");

  CANbus.begin();

  CAN_filter_t dashFilter1;
  dashFilter1.rtr = 0;
  dashFilter1.ext = 0;
  dashFilter1.id = dashID1;

  CAN_filter_t dashFilter2;
  dashFilter2.rtr = 0;
  dashFilter2.ext = 0;
  dashFilter2.id = dashID2;

  CAN_filter_t dashFilter3;
  dashFilter3.rtr = 0;
  dashFilter3.ext = 0;
  dashFilter3.id = dashID3;

  CAN_filter_t dashFilter4;
  dashFilter4.rtr = 0;
  dashFilter4.ext = 0;
  dashFilter4.id = dashID4;
  

  CANbus.setFilter(dashFilter1,0);
  CANbus.setFilter(dashFilter2,0);
  CANbus.setFilter(dashFilter3,0);
  CANbus.setFilter(dashFilter4,0);

//fill the remaining filters to prevent ack.
  for (int i = 2; i < 8; ++i)
  {
    CANbus.setFilter(dashFilter1,i);
  }
}

void loop() {
  // check for new message
  CAN_message_t message;

  while(canbus.receive(message)) {
    for( int i=0; i<7; i++){
      Serial.print(message.buf[i]);
    }
    Serial.println();
  }
  

       
}

    
  
  


