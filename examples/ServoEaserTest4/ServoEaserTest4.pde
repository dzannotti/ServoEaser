//
// ServoEaserTest0.pde -- more complex example of using ServoEaser 
//                        this time with move lists
//
// 2011, TeamPneumo, Tod E. Kurt, http://todbot.com/blog/
//
//

#include <Servo.h>
#include "ServoEaser.h"

const int ledPin   = 13; 
const int servoPin  = 7;
const int buttonPin = 2;

int servoFrameMillis = 20;  // minimum time between servo updates

Servo servo1; 
ServoEaser servoEaser;

int myServoMovesCount = 8;
// configurable list of servo moves
ServoMove myServoMoves[] = {
// angle, duration
    {90,   800},
    {10,  1501},
    {45,   502},
    {20,   503},
    {135, 1000},
    {75,  1000},
    {105, 1000},
    {0,   3000},
};


//
void setup()
{
  Serial.begin(19200);
  Serial.println("ServoEasingTest4");

  pinMode( buttonPin, INPUT);
  digitalWrite( buttonPin, HIGH); // turn on internal pullup resistor

  servo1.attach( servoPin );
  servoEaser.begin( servo1, servoFrameMillis, 2 );

  Serial.println("waiting for button press.");
}

//
void loop()
{
  servoEaser.update();

  // on button press, play moves once
  if( digitalRead(buttonPin) == LOW   // button press
      //&& !servoEaser.isRunning()   // to trigger only if not running
      ) {
      Serial.println("playing servo moves...");
      servoEaser.play( myServoMoves, myServoMovesCount, 1 );
  }

}

