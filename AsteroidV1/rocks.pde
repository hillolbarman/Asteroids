class Rocks {
  PVector vector,direction;
  float radius;
  Rocks() {
    vector=new PVector((int)Math.random()*height,(int)Math.random()*width);
    radius=Math.random()*9+1;
    direction=new PVector()
  }
}
