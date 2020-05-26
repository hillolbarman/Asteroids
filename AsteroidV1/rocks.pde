class Rock {
  PVector vector, velocity;
  float radius, speed;
  Rock() {
    vector=new PVector(-maxRockSize[1], random(width));
    radius=random(maxRockSize[0], maxRockSize[1]);
    velocity=PVector.random2D();
    speed=random(1, 5);
    velocity.setMag(speed);
  }
  void update() {
    vector.x+=velocity.x;
    vector.y+=velocity.y;
  }
  void drawObject() {
    push();
    stroke(175);
    fill(75);
    circle(this.vector.y, this.vector.x, this.radius*2);
    pop();
  }
  void collision() {
    for (Rock r : rocks) {
      if (r!=this) {
        if (dist(this.vector.x, this.vector.y, r.vector.x, r.vector.y)<=(this.radius+r.radius)) {
          resolveCollision(r);
        }
      }
    }
  }
  PVector rotate(PVector velocity,float angle) {
    PVector newVel=new PVector();
    newVel.x= (float)(velocity.x * Math.cos(angle) - velocity.y * Math.sin(angle));
    newVel.y= (float)(velocity.x * Math.sin(angle) + velocity.y * Math.cos(angle));
    return newVel;
  }
  void resolveCollision(Rock r) {
    float xVelocityDiff = this.velocity.x - r.velocity.x;
    float yVelocityDiff = this.velocity.y - r.velocity.y;
    
    float xDist = r.vector.x - this.vector.x;
    float yDist = r.vector.y - this.vector.y;
    
    if (xVelocityDiff * xDist + yVelocityDiff * yDist >= 0) {
      float angle = (float)-Math.atan2(r.vector.y - this.vector.y, r.vector.x - this.vector.x);
      float m1=this.radius;
      float m2=r.radius;
      PVector u1=rotate(this.velocity,angle);
      PVector u2=rotate(r.velocity,angle);
      PVector v1=new PVector(u1.x * (m1 - m2) / (m1 + m2) + u2.x * 2 * m2 / (m1 + m2), u1.y );
      PVector v2=new PVector(u2.x * (m1 - m2) / (m1 + m2) + u1.x * 2 * m2 / (m1 + m2), u2.y );
      u1=rotate(v1,-angle);
      u2=rotate(v2,-angle);
      
      this.velocity.x=u1.x;
      this.velocity.y=u1.y;
      r.velocity.x=u2.x;
      r.velocity.y=u2.y;
    }
  }
}
