//feel free to improve this code for adding more functionalities.
//reference at https://processing.org/reference/libraries/serial/
import processing.serial.*;


int x=1;
int data=0;
int data_prev=0;
PImage photo;



void setup()
{  size(800,600);
   background (255);
   
   
  
   
    photo = loadImage("b.jpg");
    photo.resize(300,200);
   
   Serial pulse_data_port;
   println(Serial.list());
   pulse_data_port=new Serial(this, Serial.list()[0], 9600);
}
   
void draw()
{  image(photo, 500, 0);

   String s = "PULSE SENSOR OUTPUT";
   fill(0, 102, 153, 51);
   textSize(50);
   text(s, 100, 0, 500, 350);  // Text wraps within text box
}


void serialEvent(Serial pulse_data_port) 
{   
      
      data = 500-pulse_data_port.read();
      line(x-1,data_prev,x,data);
      
      x++;
      data_prev=data;
      
      if(x>799)
      {  x=0;
         background (255);
      }  
    
}
      
      

