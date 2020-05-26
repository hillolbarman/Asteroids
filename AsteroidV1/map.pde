import java.util.List;

UI ui;
Spaceship spaceship;
List<Bullet> bullets;
List<Rock> rocks;
final int spaceshipOffset=75;
final int spaceshipMoveSpeed=10;
int fireRate=12;
final int maxRockSize[]={spaceshipMoveSpeed, 25};
int maxNoOfRocks=10;

class Map {
  Map() {
    ui=new UI();
    spaceship=new Spaceship();
    bullets=new ArrayList<Bullet>();
    rocks=new ArrayList<Rock>();
  }

  void updateFrame() {
    createRocks();
    spaceship.drawObject();
    spaceship.fire();
    collectGarbage();
    for (Bullet b : bullets) {
      b.update();
      b.drawObject();
    }
    checkForHit();
    for (Rock r : rocks) {
      r.collision();
      r.update();
      r.drawObject();
    }
    ui.displayUI();
    if (spaceship.checkCollision()) {
      ui.showGameOver();
      noLoop();
    }
  }


  void collectGarbage() {
    for (int i=bullets.size()-1; i>=0; i--) {
      if (bullets.get(i).x<0)
        bullets.remove(bullets.get(i));
    }
    for (int i=rocks.size()-1; i>=0; i--) {
      if (rocks.get(i).vector.x<-maxRockSize[1] || rocks.get(i).vector.x>height || rocks.get(i).vector.y<0 || rocks.get(i).vector.y>width )
        rocks.remove(rocks.get(i));
    }
  }
  void createRocks() {
    for (int i=rocks.size(); i<maxNoOfRocks; i++)
      rocks.add(new Rock());
  }
  void checkForHit() {
    if (bullets.size()!=0) {
      for (int i=bullets.size()-1; i>=0; i--) {
        if (rocks.size()!=0) {
          for (int j=rocks.size()-1; j>=0; j--) {
            if (j==rocks.size() || i==bullets.size())  continue;
            if (dist(bullets.get(i).x, bullets.get(i).y, rocks.get(j).vector.x, rocks.get(j).vector.y)<rocks.get(j).radius) {
              ui.updateScore();
              bullets.remove(bullets.get(i));
              rocks.remove(rocks.get(j));
            }
          }
        }
      }
    }
  }
}
