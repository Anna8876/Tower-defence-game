//This function draws the PLAY screen
int wavecounter = 0;
int cash = 500;
int lives = 3;

void play() {
  theme.pause();
  if (map == 1) {
    morningsong.play();
    path1();
    mobShow();
    bulletShow();
    ringsShow();
    towerShow();
    nextWave1();
    buildMode();
    speedy1();
    cash1();
    text("LIVE : "+lives, 505, 75);
  } else if (map == 2) {
    nightsong.play();
    path2();
    mobShow();
    bulletShow();
    towerShow();
    ringsShow();
    nextWave2();
    buildMode();
    speedy2();
    cash2();
    text("LIVE : "+lives, 505, 75);
  }

  if (lives <= 0) {
    mode = GAMEOVER;
  }
}



void mobShow() {
  //mob show
  int i = 0;
  while (i < mobs.size()) {
    Mob myMob = mobs.get(i);
    myMob.act();
    myMob.show();
    if (myMob.hp <= 0) {
      mobs.remove(i);
      dead.play();
      dead.rewind();
      cash = cash + myMob.value;
    } else {
      i++;
    }
  }
}

void bulletShow() {

  if (mobs.size()>0) {
    for (int i=0; i<bullets.size(); i++) {
      Bullet myBullet= bullets.get(i);
      myBullet.act();
      myBullet.show();

      if (myBullet.hp<=0) {
        bullets.remove(i);
      } else if (myBullet.x>1000||myBullet.y>800||myBullet.x<0||myBullet.y<0) {
        bullets.remove(i);
      }
    }
  }
}

void ringsShow() {
  for (int i=0; i< rings.size(); i++) {
    AoE_Ring myrings= rings.get(i);
    myrings.show();
    myrings.act();
  }
}



void towerShow() {
  for (int i = 0; i < towers.size(); i++) {
    Tower myTower = towers.get(i);
    if (mobs.size() >0) myTower.act();
    myTower.show();
  }
}

void buildMode() {
  if (map ==1) {
    build.show();
  } else if (map == 2) {
    build2.show();
  }
  if (build.clicked || build2.clicked) {
    mode = BUILD;
  }
}


void path1() {
  background(green);
  stroke(brown);
  strokeWeight(50);
  line(0, 160, 800, 160);
  line(800, 160, 800, 250);
  line(800, 250, 600, 250);
  line(600, 250, 600, 500);
  line(600, 500, 100, 500);
  line(100, 500, 100, 590);
  line(100, 590, width, 590);

  fill(grey);
  strokeWeight(0);
  rect(500, 740, width, 120);

  // node
  map1nodes[0].show();
  map1nodes[1].show();
  map1nodes[2].show();
  map1nodes[3].show();
  map1nodes[4].show();
  map1nodes[5].show();
}


void nextWave1() {
  //wave
  textFont(milky);
  textSize(45);
  fill(brown);
  text("WAVE: " + wavecounter, 120, 740);

  nextWave.show();

  if (nextWave.clicked && mobs.size()==0) {
    for (int i=0; i<=wavecounter; i++) {
      mobShow();
      mobs.add(new Mob(0-i*50, 160, 1, 0));
      mobs.add(new ChonkyMob(0-i*50, 160, 1, 0));
      mobs.add(new SpeedyMob(0-i*50, 160, 1, 0));
    }
    wavecounter++;
  }


  //for (int i=0; i<= mobs.size(); i++) {
  //  Mob myMob = mobs.get(i);
  //  if (myMob.y >= width) {
  //    lives--;
  //  }
  //}
}

void cash1() {
  cat.resize(200, 150);
  image(cat, 350, 740);
  fill(yellow);
  textSize(50);
  text("$"+cash, 480, 740);
}


void path2 () {
  background(dblue);
  stroke(cream);
  strokeWeight(50);

  line(0, 590, 700, 590);
  line(700, 590, 700, 260);
  line(700, 260, 460, 260);
  line(460, 260, 460, 400);
  line(460, 400, 100, 400);
  line(100, 400, 100, 160);
  line(100, 160, 900, 160);
  line(900, 160, 900, 590);
  line(900, 590, width, 590);

  fill(purple);
  strokeWeight(0);
  rect(500, 740, width, 120);

  // node
  map2nodes[0].show();
  map2nodes[1].show();
  map2nodes[2].show();
  map2nodes[3].show();
  map2nodes[4].show();
  map2nodes[5].show();
  map2nodes[6].show();
  map2nodes[7].show();
}


void nextWave2() {
  //println(11111111);
  //wave
  textFont(milky);
  textSize(45);
  fill(cream);
  text("WAVE: " + wavecounter, 120, 740);

  nextWave2.show();

  if (nextWave2.clicked && mobs.size()==0) {
    for (int i=0; i<=wavecounter; i++) {
      println(000000);
      mobs.add(new Mob(0-i*50, 590, 1, 0));
      mobs.add(new ChonkyMob(0-i*50, 590, 1, 0));
      mobs.add(new SpeedyMob(0-i*50, 590, 1, 0));
    }
    wavecounter++;
  }
}

void cash2() {
  whcat.resize(180, 150);
  image(whcat, 310, 745);
  fill(bred);
  textSize(50);
  text("$"+cash, 480, 740);
}


void speedy1() {
  speed1.show();
  if (speed1.clicked) {
    fastspeed = !fastspeed;
  }
}


void speedy2() {
  speed2.show();
  if (speed2.clicked) {
    fastspeed = !fastspeed;
  }
}
