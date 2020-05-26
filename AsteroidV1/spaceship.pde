class Spaceship 
{
  float x, y;
  int size=spaceshipOffset/3;
  Spaceship() {
    this.x=height-spaceshipOffset;
    this.y=width/2;
  }
  void update(String direction) {
    if (direction.equalsIgnoreCase("left"))   {
      if(this.y-spaceshipMoveSpeed>0+size/2-spaceshipMoveSpeed)
        this.y-=spaceshipMoveSpeed;
    }
    if (direction.equalsIgnoreCase("right"))  {
      if(this.y+spaceshipMoveSpeed<width-size/2+spaceshipMoveSpeed)
      this.y+=spaceshipMoveSpeed;
    }
  }
  void drawObject() {
    triangle(y, x, y+size/2, x+size, y-size/2, x+size);
  }
  void fire() {
    if(frameCount%fireRate==0) {
      bullets.add(new Bullet());
    }
  }
}
