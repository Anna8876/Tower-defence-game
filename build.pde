//This function draws the BUILD screen
int counter = 0;

void build() {
  if (map ==1) {
    zhuangshi();
    buildbutton();
  } else if (map ==2) {
    zhuangshi2();
    buildbutton ();
  }

  //handle buildChlicks
  if (gun.clicked||gun1.clicked) {
    if (cash >=100) {
      cash = cash - 100;
      towers.add(new Tower(GUN));
    }
  }
  if (AoE.clicked||AoE1.clicked) {
    if (cash >= 80) {
      cash = cash - 80;
      towers.add(new Tower(AOE));
    }
  }
  if (sniper.clicked||sniper1.clicked) {
    if (cash >=120) {
      cash = cash - 120;
      towers.add(new Tower(SNIPER));
    }
  }
}

void zhuangshi () {

  path1();
  towerShow();

  //build text
  textSize(100);
  counter = counter + 1;
  if (counter < 25) {
    fill(brown);
    text("BUILD", 505, 75);
    fill(yellow);
    text("BUILD", 500, 70);
  }
  if (counter == 50) {
    counter = 0;
  }
  fill(yellow);
  textSize(50);
  text("LIVE : "+lives, 100, 75);
  textSize(100);

  //image
  cat2.resize(250, 220);
  image(cat2, 900, 590);
  fill(yellow);
  textSize(50);
  text("$"+cash, 820, 735);
}

void zhuangshi2 () {

  path2();
  towerShow();

  //build text
  textSize(100);
  counter = counter + 1;
  if (counter < 25) {
    fill(orange);
    text("BUILD", 505, 75);
    fill(bred);
    text("BUILD", 500, 70);
  }
  if (counter == 50) {
    counter = 0;
  }
  
  textSize(50);
  fill(bred);
  text("LIVE : "+lives, 100, 75);
  textSize(100);
  
  //image
  whcat2.resize(300, 260);
  image(whcat2, 150, 640);
  fill(bred);
  textSize(50);
  text("$"+cash, 820, 735);
}



void buildbutton () {
  //button
  if (play.clicked || play1.clicked) {
    mode = PLAY;
  }
  if (remove.clicked || remove1.clicked) {
    mode = REMOVE;
  }
  if (map ==1 ) {
    gun.show();
    AoE.show();
    sniper.show();
    remove.show();
    play.show();
  } else if (map ==2) {
    gun1.show();
    AoE1.show();
    sniper1.show();
    remove1.show();
    play1.show();
  }
}
