Map map;
List<Integer> scores;
void setup()
{
  size(720, 640);
  scores=new ArrayList<Integer>();
  scores.add(0);
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
      //spaceship.update("left");
      move="left";
    } else if (keyCode == RIGHT) {
      //spaceship.update("right");
      move="right";
    }
    else if(key==ESC) {
      System.exit(0);
    }
  }
  else if(key == 32) {
    loop();
    map=new Map();
  }
}

void keyReleased() {
  move="";
}

//void mousePressed() {
//  loop();  // Holding down the mouse activates looping
//  setup();
//}
