/*
 _          __  _____        ___   _____        _____   _____       ___   _____   _____  
| |        / / |  _  \      /   | |  _  \      |  _  \ | ____|     /   | |_   _| /  ___/ 
| |  __   / /  | |_| |     / /| | | |_| |      | |_| | | |__      / /| |   | |   | |___  
| | /  | / /   |  _  /    / / | | |  ___/      |  _  { |  __|    / / | |   | |   \___  \ 
| |/   |/ /    | | \ \   / /  | | | |          | |_| | | |___   / /  | |   | |    ___| | 
|___/|___/     |_|  \_\ /_/   |_| |_|          |_____/ |_____| /_/   |_|   |_|   /_____/ 

 _____  __    __       _       _   _   _____  __    __           ___  ___       ___   _____   _____   _   _   _____   _____   _____  
|  _  \ \ \  / /      | |     | | | | /  ___| \ \  / /          /   |/   |     /   | |_   _| /  ___| | | | | | ____| |_   _| |_   _| 
| |_| |  \ \/ /       | |     | | | | | |      \ \/ /          / /|   /| |    / /| |   | |   | |     | |_| | | |__     | |     | |   
|  _  {   \  /        | |     | | | | | |       \  /          / / |__/ | |   / / | |   | |   | |     |  _  | |  __|    | |     | |   
| |_| |   / /         | |___  | |_| | | |___    / /          / /       | |  / /  | |   | |   | |___  | | | | | |___    | |     | |   
|_____/  /_/          |_____| \_____/ \_____|  /_/          /_/        |_| /_/   |_|   |_|   \_____| |_| |_| |_____|   |_|     |_|   
December 2013
*/  

//import the capSense Library
#include <CapacitiveSensor.h>  

//these are the photoresistor inputs 2 is the common send the second number is the other digital input the sensor is attached to
CapacitiveSensor   cs_2_3 = CapacitiveSensor(2,3);
CapacitiveSensor   cs_2_4 = CapacitiveSensor(2,4);        // 10M resistor between pins 2 & 3, pin 3 is sensor pin, add a wire and or foil if desired
CapacitiveSensor   cs_2_5 = CapacitiveSensor(2,5);        // 10M resistor between pins 2 & 4, pin 4 is sensor pin, add a wire and or foil
CapacitiveSensor   cs_2_6 = CapacitiveSensor(2,6);        // 10M resistor between pins 2 & 5, pin 5 is sensor pin, add a wire and or foil
CapacitiveSensor   cs_2_7 = CapacitiveSensor(2,7);        // 10M resistor between pins 2 & 6, pin 6 is sensor pin, add a wire and or foil
CapacitiveSensor   cs_2_8 = CapacitiveSensor(2,8);        // 10M resistor between pins 2 & 7, pin 7 is sensor pin, add a wire and or foil
CapacitiveSensor   cs_2_9 = CapacitiveSensor(2,9);        // 10M resistor between pins 2 & 8, pin 8 is sensor pin, add a wire and or foil
CapacitiveSensor   cs_2_10 = CapacitiveSensor(2,10);      // 10M resistor between pins 2 & 9, pin 9 is sensor pin, add a wire and or foil
CapacitiveSensor   cs_2_11 = CapacitiveSensor(2,11);      // 10M resistor between pins 2 & 10, pin 10 is sensor pin, add a wire and or foil
CapacitiveSensor   cs_2_12 = CapacitiveSensor(2,12);      // 10M resistor between pins 2 & 11, pin 11 is sensor pin, add a wire and or foil

void setup() {
Serial.begin(9600); //Begin Serial Communication with a baud rate of 9600 this much match the serial that you enter into processing
}

void loop() {
  
  // Store the value input of each sensor in each of these variables
  long CapSense1 =  cs_2_3.capacitiveSensor(30);
  long CapSense2 =  cs_2_4.capacitiveSensor(30);
  long CapSense3 =  cs_2_5.capacitiveSensor(30);
  long CapSense4 =  cs_2_6.capacitiveSensor(30);
  long CapSense5 =  cs_2_7.capacitiveSensor(30);
  long CapSense6 =  cs_2_8.capacitiveSensor(30);
  long CapSense7 =  cs_2_9.capacitiveSensor(30);
  long CapSense8 =  cs_2_10.capacitiveSensor(30);
  long CapSense9 =  cs_2_11.capacitiveSensor(30);
  long CapSense10 =  cs_2_12.capacitiveSensor(30);
  
 /*The Serial.print() doesn't have a space
   the ',' is used to parse the values in processing
   the last value does not require the ',' 
   but make sure you have a blank Serial.println(); follwoing it*/
   
  // put into DEC form for parsing in processing
  //this is how you will get processing to read you sensor inputs and split them up!
  
  Serial.print(CapSense1, DEC); 
  Serial.print(",");
  Serial.print(CapSense2, DEC);
  Serial.print(",");
  Serial.print(CapSense3, DEC);
  Serial.print(",");
  Serial.print(CapSense4, DEC);
  Serial.print(",");
  Serial.print(CapSense5, DEC);
  Serial.print(",");
  Serial.print(CapSense6, DEC);
  Serial.print(",");
  Serial.print(CapSense7, DEC);
  Serial.print(",");
  Serial.print(CapSense8, DEC);
  Serial.print(",");
  Serial.print(CapSense9, DEC);
  Serial.print(",");
  Serial.print(CapSense10, DEC);
  Serial.print(",");
  Serial.print(CapSense1, DEC);
  Serial.println();
  
  delay(100);
}
