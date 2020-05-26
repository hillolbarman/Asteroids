import java.util.List;

Spaceship spaceship;
List<Bullet> bullets;
List<Rock> rocks;
final int spaceshipOffset=75;
final int spaceshipMoveSpeed=10;
final int fireRate=7;
final int maxRockSize[]={spaceshipMoveSpeed, 25};
final int maxNoOfRocks=10;

class Map {
  Map() {
    spaceship=new Spaceship();
    bullets=new ArrayList<Bullet>();
    rocks=new ArrayList<Rock>();
  }
  void updateFrame() {
    createRocks();
    spaceship.drawObject();
    spaceship.fire();
    collectGarbage();
    System.out.println(bullets.size());
    for (Bullet b : bullets) {
      b.update();
      b.drawObject();
    }
    checkForHit();
    System.out.println(rocks.size());
    for (Rock r : rocks) {
      r.drawObject();
    }
  }
  void collectGarbage() {
    for (int i=bullets.size()-1; i>=0; i--) {
      if (bullets.get(i).x<0)
        bullets.remove(bullets.get(i));
    }
  }
  void createRocks() {
    if (rocks.size()==0) {
      for (int i=0; i<maxNoOfRocks; i++)
        rocks.add(new Rock());
    } else if (rocks.size()<maxNoOfRocks) {
      rocks.add(new Rock());
    }
  }
  void checkForHit() {
    if (bullets.size()!=0) {
      for (int i=bullets.size()-1; i>=0; i--) {
        if (rocks.size()!=0) {
          for (int j=rocks.size()-1; j>=0; j--) {
            if (dist(bullets.get(i).x, bullets.get(i).y, rocks.get(j).vector.x, rocks.get(j).vector.y)<rocks.get(j).radius) {
              System.out.println(true);
              bullets.remove(bullets.get(i));
              rocks.remove(rocks.get(j));
            }
          }
        }
      }
    }
  }
}
