class Bullet
{
  float x,y;
  final int bulletSpeed=10,bulletLength=5;
  Bullet() {
    this.x=spaceship.x;
    this.y=spaceship.y;
  }
  void update() {
    //System.out.println(this.x+" "+this.y);
    this.x-=bulletSpeed;
  }
  void drawObject() {
    push();
    strokeWeight(4);
    stroke(0,255,0);
    line(y,x,y,x+bulletLength);
    pop();
  }
}
