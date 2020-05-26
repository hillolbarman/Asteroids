class UI {
  int score;
  UI() {
    score=0;
  }
  void updateScore() {
    score+=1;
    if (score%20==0) {
      maxNoOfRocks+=2;
      if (maxNoOfRocks%20==0 && fireRate>=5)
        fireRate--;
       System.out.println(score+" "+maxNoOfRocks+" "+fireRate);
    }
  }
  void displayUI() {
    textAlign(LEFT);
    textSize(16);
    text("Score: "+Integer.toString(score), 5, 20);
  }
  void showGameOver() {
    background(0);
    textSize(32);
    textAlign(CENTER);
    text("GAME OVER!!", width/2, height/2);
    textSize(24);
    text("Score: "+Integer.toString(score), width/2, height/2+48);
    textSize(16);
    text("Press <SPACE> to play again..", width/2, (height/2+48+24+16));
    textSize(16);
    text("Press <ESC> to exit game..", width/2, (height/2+48+24+16+16+8));
  }
}
