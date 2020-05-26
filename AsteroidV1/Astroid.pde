Map map;
void setup()
{
  size(720, 640);
  map=new Map();
}

void draw()
{
  background(0);
  map.updateFrame();
}

void keyPressed() 
{  
  if (key == CODED) {
    if (keyCode == LEFT) {
      spaceship.update("left");
    } else if (keyCode == RIGHT) {
      spaceship.update("right");
    }
    else if(key==ESC) {
      System.exit(0);
    }
  }
  else if(key == 32) {
    loop();
    setup();
  }
}

//void mousePressed() {
//  loop();  // Holding down the mouse activates looping
//  setup();
//}
