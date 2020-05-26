import java.util.List;

Spaceship spaceship;
List<Bullet> bullets;
final int spaceshipOffset=75;
final int spaceshipMoveSpeed=10;
final int fireRate=7;
final int maxRockSize[]={1,20};

class Map {
  Map() {
    spaceship=new Spaceship();
    bullets=new ArrayList<Bullet>();
  }
  void updateFrame() {
    spaceship.drawObject();
    spaceship.fire();
    for(Bullet b:bullets) {
      b.update();
      b.drawObject();
    }
  }
  void collectGarbage() {
    for(Bullet b:bullets)
      if(b.x<0)
        bullets.remove(b);
  }
}
