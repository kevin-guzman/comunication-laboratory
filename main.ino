// CurieSoftwareSerial for arc32 - Version: Latest 
#include <SoftwareSerial.h>


const int msg1 = 1;
const int msg2 = 2;
const int sync = 0xA0;_

// Serial ports
const byte rxPin = 10;
const byte txPin = 11;

// Set up a new SoftwareSerial object
SoftwareSerial mySerial (rxPin, txPin);


void setup() {
    pinMode(rxPin, INPUT);
    pinMode(txPin, OUTPUT);
    
    // Set the baud rate for the SoftwareSerial object
    mySerial.begin(9600);
}

void loop() {
    mySerial.write(sync); 
    delay(40);
}