//WrapBeats v3
//August 2016
//By Lucy Matchett
//Modified by Alice Barbe and Youna Hoshi

import ddf.minim.*; //import sound library
import processing.serial.*; //import the Serial library so can read from arudino input via serial communication

int end = 10;    // the number 10 is ASCII for linefeed (end of serial.println), later we will look for this to break up individual messages
String serial;   // declare a new string called 'serial' 
Serial port;     // The serial port, this is a new instance of the Serial class (an Object)

//define integer numberOfPins
int numberOfPins = 7;
//initialize configuration array which will contain audio sample objects
AudioSample [] configuration = new AudioSample[numberOfPins];
  
//initialize an instancce of minim
Minim minim;

//Declare audioSample variables for different sounds
AudioSample piano1;
AudioSample piano2;
AudioSample piano3;
AudioSample piano4;
AudioSample piano5;
AudioSample piano6;
AudioSample piano7;

AudioSample pipes1;
AudioSample pipes2;
AudioSample pipes3;
AudioSample pipes4;
AudioSample pipes5;
AudioSample pipes6;
AudioSample pipes7;

AudioSample kit1;
AudioSample kit2;
AudioSample kit3;
AudioSample kit4;
AudioSample kit5;
AudioSample kit6;
AudioSample kit7;

//create configuration arrays
AudioSample [] pianoConfig = {piano1, piano2, piano3, piano4, piano5, piano6, piano7};
AudioSample [] pipesConfig = {pipes1, pipes2, pipes3, pipes4, pipes5, pipes6, pipes7};  
AudioSample [] kitConfig = {kit1, kit2, kit3, kit4, kit5, kit6, kit7};
  
//This counter will determine if you have changed instruments
int counter;
//Threshold for capacitive sensing
int threshold = 110;
//Delay for instrument
int delay_num = 150;
int delay_organ_num = 150;



void setup() {
  //create a new instance of minim
  minim = new Minim(this);
  
  //load sound.wav files from data folder and assign them to the initialized variables
  piano1 = minim.loadSample( "piano-a.wav", 512);
  piano2 = minim.loadSample( "piano-b.wav", 512);
  piano3 = minim.loadSample( "piano-c.wav", 512);
  piano4 = minim.loadSample( "piano-d.wav", 512);
  piano5 = minim.loadSample( "piano-e.wav", 512);
  piano6 = minim.loadSample( "piano-f.wav", 512);
  piano7 = minim.loadSample( "piano-g.wav", 512);
   
  pipes1 = minim.loadSample( "HeavyPipesF-01.wav", 512);
  pipes2 = minim.loadSample( "HeavyPipesF-02.wav", 512);
  pipes3 = minim.loadSample( "HeavyPipesF-03.wav", 512);
  pipes4 = minim.loadSample( "HeavyPipesC-01.wav", 512);
  pipes5 = minim.loadSample( "HeavyPipesC-02.wav", 512);
  pipes6 = minim.loadSample( "HeavyPipesC-03.wav", 512);
  pipes7 = minim.loadSample( "HeavyPipesC-04.wav", 512);
   
  kit1 = minim.loadSample( "HHCLOSE1.wav", 512);
  kit2 = minim.loadSample( "HHOPEN2.wav", 512);
  kit3 = minim.loadSample( "SNARE1.wav", 512);
  kit4 = minim.loadSample( "TOM2.wav", 512);
  kit5 = minim.loadSample( "TOM3.wav", 512);
  kit6 = minim.loadSample( "Bdrum1.wav", 512);
  kit7 = minim.loadSample( "COWBELL1.wav", 512);
  
  //serial reading code
  //when testing, this next line should be the ONLY line to cause an error: ArrayIndexOutOfBoundsExcpetion: 0
  port = new Serial(this, Serial.list()[0], 9600); // initializing the object by assigning a port and baud rate (must match that of Arduino)
  port.clear();  // function from serial library that throws out the first reading, in case we started reading in the middle of a string from Arduino
  serial = port.readStringUntil(end); // function that reads the string from serial port until a println and then assigns string to our string variable (called 'serial')
  serial = null; // initially, the string will be null (empty)
  
  counter = 1; //set the default instrument to 1 when the code starts
} //end setup

void draw() {
 
  //if there is data coming from the serial port read it/ store it
  while (port.available() > 0) { 
    serial = port.readStringUntil(end);
  } //end while
  
  //if the string is not empty, do this
  if (serial != null) { 
    //capsense Input form Arduino, each value is seperated and split depending on the ','
    //and then saved in seperate cells of the array so we can access each 
    String[] nailSensorInput = split(serial, ','); 
    //can help to print these to console at this point to check it's working
    // println(nailSensorInput[]); 
        
    //convert the string inputs that are stored in the photoresistorInput array to ints so we can use them numerically
    int PRInt [];//Array that we will store the the photoresistor Input from Arduino after we have converted it to int
    PRInt = int(nailSensorInput);
    
    //println(PRInt);
  
    //*****************************CHANGE INSTRUMENT
    if(PRInt[7] > threshold ) {
      configuration = pianoConfig;
    } //end if
    else if (PRInt[8] > threshold ) {
      configuration = pipesConfig;
    } //end if
    else if (PRInt[9] > threshold ) { 
       configuration = kitConfig;
    } //end if
   
    //****************************PLAY NOTES

    for (int x = 0; x <= numberOfPins; x++) {
      if(PRInt[x] > threshold) {
        configuration[x].trigger();
        delay(delay_num);
      } //end if
    }//end for
  
  } //end if serial != null
}//end draw