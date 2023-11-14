int ThermistorPin1 = A0;
int ThermistorPin2 = A1;
int Vo1;
int Vo2;
float R1 = 10000;
float logR2_1, R2_1, logR2_2, R2_2, Tc, Th,dT;
float c1 = 1.284850279e-03, c2 = 2.076544735e-04, c3 = 2.004280704e-07;

const int numReadings = 20;

int readings[numReadings];      // the readings from the analog input
int readIndex = 0;              // the index of the current reading
int total = 0;                  // the running total
int average = 0;                // the average

int readings1[numReadings];      // the readings from the analog input
int readIndex1 = 0;              // the index of the current reading
int total1 = 0;                  // the running total
int average1 = 0;                // the average


void setup() {
  Serial.begin(9600);
  for (int thisReading = 0; thisReading < numReadings; thisReading++) {
    readings[thisReading] = 0;
  }
delay(1);
}

void loop() {
  total = total - readings[readIndex];
  readings[readIndex] = analogRead(ThermistorPin1);
  total = total + readings[readIndex];
  readIndex = readIndex + 1;

  if (readIndex >= numReadings) {
    readIndex = 0;
  }

  // calculate the average:
  Vo1 = total / numReadings;
//  Vo1 = analogRead(ThermistorPin1);
  R2_1 = R1 * (1023.0 / (float)Vo1 - 1.0);
  logR2_1 = log(R2_1);
  Th = (1.0 / (c1 + c2*logR2_1 + c3*logR2_1*logR2_1*logR2_1));
  Th = Th - 273.15;
  Serial.print(Th);
  delay(1);

  Serial.print(",");
  total1 = total1 - readings1[readIndex1];
  readings1[readIndex1] = analogRead(ThermistorPin2);
  total1 = total1 + readings1[readIndex1];
  readIndex1 = readIndex1 + 1;

  if (readIndex1 >= numReadings) {
    readIndex1 = 0;
  }

  // calculate the average:
  Vo2 = total1/ numReadings;
  Vo2 = analogRead(ThermistorPin2);
  R2_2 = R1 * (1023.0 / (float)Vo2 - 1.0);
  logR2_2 = log(R2_2);
  Tc = (1.0 / (c1 + c2*logR2_2 + c3*logR2_2*logR2_2*logR2_2));
  Tc = Tc - 273.15;
  Serial.println(Tc);
  dT = Th - Tc;
//
////  Serial.print("Temperature Cold: "); 
////  Serial.print(Tc);
////  Serial.println(" C"); 
////  Serial.print("Temperature Hot: "); 
////  Serial.print(Th);
////  Serial.println(" C"); 
//Serial.println(dT);
delay(200);
//delay(5);
}
