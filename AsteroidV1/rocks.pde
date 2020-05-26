class Rock {
  PVector vector,direction;
  float radius;
  Rock() {
    vector=new PVector((int)(Math.random()*height/2),(int)(Math.random()*width));
    radius=(float)(Math.random()*(maxRockSize[1]-maxRockSize[0]))+maxRockSize[0];
    //direction=new PVector();
  }
  void drawObject() {
    circle(this.vector.y,this.vector.x,this.radius*2);
  }
}
