#define PUSH_BUTTON 7
#define MOTOR_PIN 13

int prev_state = HIGH;
int analog_trash_hold=400;


void setup()
{
  pinMode(A0, INPUT);
  Serial.begin(9600);
  pinMode(PUSH_BUTTON, INPUT_PULLUP);
  pinMode(MOTOR_PIN, OUTPUT);
  digitalWrite(MOTOR_PIN, LOW);

}

void loop()
{
  int ang_input= analogRead(A0);
  int current_state = digitalRead(PUSH_BUTTON);

  if(ang_input<analog_trash_hold)
  {
  }
  else
  {
      if(prev_state==HIGH)
    {
      if(prev_state!=current_state)
        {
          digitalWrite(MOTOR_PIN, HIGH);
          while(ang_input>analog_trash_hold)
          {
            ang_input=analogRead(A0);
          }
          digitalWrite(MOTOR_PIN, LOW);
        }
    }
  
  }
  prev_state=current_state;


}
