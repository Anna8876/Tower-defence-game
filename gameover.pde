//This function draws the GAMEOVER screen.

void gameOver() {
  morningsong.pause();
  nightsong.pause();
  gameover.play();
  
  //zs
  gif.show();
  restart.show();
  overw.resize(300, 300);
  image(overw, width*3/4+50, height/4);
  overb.resize(350, 300);
  image(overb, width/4-50, height*3/4);
  text("You Won " + wavecounter +" Rounds !", width/4, height/4-100);
  text("Play Again!", width*3/4, height*3/4 +100);
  
  
  //reset
  if(restart.clicked) {
    reset();
  }
}



void reset() {
  mode = MAP;
  lives = 3;
  cash = 500;
  wavecounter = 0;
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  rings = new ArrayList<AoE_Ring>();
  gameover.pause();
}
