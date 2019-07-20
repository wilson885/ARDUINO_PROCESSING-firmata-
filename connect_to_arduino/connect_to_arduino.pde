import processing.serial.*;
import cc.arduino.*;

Arduino _arduino; 
int sensorvalue;

float sensorget(int potpin)
{
  sensorvalue =_arduino.analogRead(potpin);
  sensorvalue=sensorvalue/4;
  return sensorvalue;
}
void setup()
{
  size(400,400,P3D);
  _arduino=new Arduino(this,Arduino.list()[1],57600);
}
void draw()
{ 
  background(0);
  //rotateX(PI/10);
  translate(width/2-60,height/2-90,0);
  for(int i=0; i<9; i++)
  {
    pushMatrix();
    if(i<3)
    {
      translate(i%3*60,0,0);
    }
    if(i>2&&i<6)
    {
      translate(i%3*60,100,0);
    }
    if(i>5&&i<9)
    {
      translate(i%3*60,200,0);
    }
    stroke(255,255,255);
    strokeWeight(1);
    noFill();
    box(sensorget(i)/5,sensorget(i)/5,10);
    text("A"+str(i),0,0);
    popMatrix();
  }
  
}