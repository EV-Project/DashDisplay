

int potPin = 0;

void setup()
{
  //Create Serial Object (250000 Baud)
  Serial.begin(250000);

}

void loop()
{
  int pot = map(analogRead(potPin), 0, 1023, 178,214);
  Serial.print(pot, DEC);
  Serial.print(",");
  int SinPot = map(analogRead(sin(potPin)),0, 1023, 1650, 300);
  Serial.println(SinPot, DEC);
  
  delay(50);
  
}


