/*This program is listning to the CANBus 
 *and sends the data over the serial port to processing 
 */

// including required liberaries 
#include <KellyCAN.h>
#include <FlexCAN.h>
#include <CANcallbacks.h>
#include <ChallengerEV.h>


//wheels are indexed 1-4
const int wheelnumber = 3;




const int wheelnum = wheelnumber - 1;

const int brakeDacPin = 20;   
const int throttleDacPin = 21;
const int brSwOut = 14;         
const int thSwOut = 15;
const int reSwOut = 16;

const int redLightInPin = 22;
const int greenLightInPin = 23;

/* Think we don't need this
//pull the constants out of ChallengerEV.h
const uint32_t ManagerID  = wheel[wheelnum].managerID;  //messages to the wheel managers
const uint32_t KellyreqID = wheel[wheelnum].motorReqID; //messages to the kelly
const uint32_t KellyresID = wheel[wheelnum].motorResID; //messages from the kelly
const uint32_t dashID = wheel[wheelnum].dashID;  //telemetry messages from the wheel manager
*/

// I D K
FlexCAN CANbus(1000000);
CANcallbacks canbus(&CANbus);
KellyCAN motor(&canbus, KellyreqID, KellyresID);

/* neither this
//below are the messages defined in the datasheet.  The flash reads look a whole lot like memory offsets.
CAN_message_t known_messages[] = { 
  {KellyreqID,0,3,0,CCP_FLASH_READ,INFO_MODULE_NAME,8,0,0,0,0,0},
  {KellyreqID,0,3,0,CCP_FLASH_READ,INFO_SOFTWARE_VER,2,0,0,0,0,0},
  {KellyreqID,0,3,0,CCP_FLASH_READ,CAL_TPS_DEAD_ZONE_LOW,1,0,0,0,0,0},
  {KellyreqID,0,3,0,CCP_FLASH_READ,CAL_TPS_DEAD_ZONE_HIGH,1,0,0,0,0,0},
  {KellyreqID,0,3,0,CCP_FLASH_READ,CAL_BRAKE_DEAD_ZONE_LOW,1,0,0,0,0,0},
  {KellyreqID,0,3,0,CCP_FLASH_READ,CAL_BRAKE_DEAD_ZONE_HIGH,1,0,0,0,0,0},
  {KellyreqID,0,1,0,CCP_A2D_BATCH_READ1,0,0,0,0,0,0,0},
  {KellyreqID,0,1,0,CCP_A2D_BATCH_READ2,0,0,0,0,0,0,0},
  {KellyreqID,0,1,0,CCP_MONITOR1,0,0,0,0,0,0,0},
  {KellyreqID,0,1,0,CCP_MONITOR2,0,0,0,0,0,0,0},
  {KellyreqID,0,2,0,COM_SW_ACC,COM_READING,0,0,0,0,0,0},
  {KellyreqID,0,2,0,COM_SW_BRK,COM_READING,0,0,0,0,0,0},
  {KellyreqID,0,2,0,COM_SW_REV,COM_READING,0,0,0,0,0,0}
};
*/
void setup() {
  // put your setup code here, to run once:

}

void loop() {
  // put your main code here, to run repeatedly:

}
