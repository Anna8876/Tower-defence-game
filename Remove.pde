void Remove() {
  ZS();
  BB();
  if(remove.clicked) {
    towers = new ArrayList<Tower>();
    cash = 500;
  }
  //for (int i = 0; i < towers.size(); i++) {
  // if(towers.get(i).clicked){
  //if (towers.get(i).clickedInside(mouseX, mouseY)) {
  //towers.remove(i);
  //}
  //}
}


void ZS () {
  path1();
  towerShow();

  //build text
  textSize(100);
  counter = counter + 1;
  if (counter < 25) {
    fill(brown);
    text("REMOVE", 505, 75);
    fill(yellow);
    text("REMOVE", 500, 70);
  }
  if (counter == 50) {
    counter = 0;
  }

  //image
  cat2.resize(250, 220);
  image(cat2, 900, 590);
  fill(yellow);
  textSize(50);
  text("$"+cash, 820, 735);
  if (gun.clicked||gun1.clicked) {
    cash = cash - 100;
    towers.add(new Tower(GUN));
  }
}

void BB() {
  //button
  if (play.clicked || play1.clicked) {
    mode = BUILD;
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
