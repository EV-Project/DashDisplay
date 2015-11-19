

int potPin = 0;
int pot2Pin = 2;

// setting the LED pins

int LED1 = 3;
int LED2 = 5;
int LED3 = 6;
int LED4 = 9;
int LED5 = 10;
int LED6 = 11;

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
  int SinPot = map(analogRead(pot2Pin),0, 1023, 1650, 300);
  Serial.println(SinPot, DEC);
  
  delay(50);

//*******LED indicator for battery charge level********

    if (SinPot < 1650 && SinPot > 1425){
        analogWrite(LED1, HIGH);
        analogWrite(LED2, HIGH);
        analogWrite(LED3, HIGH);
        analogWrite(LED4, HIGH);
        analogWrite(LED5, HIGH);
        analogWrite(LED6, HIGH);
    }
    if (SinPot < 1425 && SinPot > 1200){
        analogWrite(LED1, LOW);
        analogWrite(LED2, HIGH);
        analogWrite(LED3, HIGH);
        analogWrite(LED4, HIGH);
        analogWrite(LED5, HIGH);
        analogWrite(LED6, HIGH);
      
    }
    if (SinPot < 1200 && SinPot > 975){
        analogWrite(LED1, LOW);
        analogWrite(LED2, LOW);
        analogWrite(LED3, HIGH);
        analogWrite(LED4, HIGH);
        analogWrite(LED5, HIGH);
        analogWrite(LED6, HIGH);
      
    }
    if (SinPot < 975 && SinPot > 750){
        analogWrite(LED1, LOW);
        analogWrite(LED2, LOW);
        analogWrite(LED3, LOW);
        analogWrite(LED4, HIGH);
        analogWrite(LED5, HIGH);
        analogWrite(LED6, HIGH);      
    }  
    if (SinPot < 750 && SinPot > 525){
        analogWrite(LED1, LOW);
        analogWrite(LED2, LOW);
        analogWrite(LED3, LOW);
        analogWrite(LED4, LOW);
        analogWrite(LED5, HIGH);
        analogWrite(LED6, HIGH);      
    }
    if (SinPot < 525 && SinPot > 300){
        analogWrite(LED1, LOW);
        analogWrite(LED2, LOW);
        analogWrite(LED3, LOW);
        analogWrite(LED4, LOW);
        analogWrite(LED5, LOW);
        analogWrite(LED6, HIGH);      
      
    }      
}


