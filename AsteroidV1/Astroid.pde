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
  }
  //else if(key==ENTER)
  //  spaceship.fire();
  else if(key == 32)
    setup();
}
