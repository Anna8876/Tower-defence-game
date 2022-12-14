float colorcounter;
int C = 0;
int map;

void Cmap () {
  //background
  if (mouseX > width/2) {
    C = C - 2;
  } else {
    C = C + 2;
  }
  if (C > 255) {
    C = 255;
  } else if (C < 0) {
    C = 0;
  }
  background(C, C, C);

  //map picture tint
  if (mouseX > width/2) {
    //button
    tint(255, 50);
    morningmap.resize(380, 230);
    image(morningmap, width/4, 265);

    noTint();
    map1.show();
    mapcat.resize(450, 450);
    image(mapcat, 250, 580);

    nightmap.resize(380, 230);
    image(nightmap, 3*width/4, 540);
    map2.show();
    mapcat2.resize(350, 350);
    image(mapcat2, 750, 200);
  } else {
    tint(255, 50);
    nightmap.resize(380, 230);
    image(nightmap, 3*width/4, 540);

    noTint();
    map2.show();
    mapcat2.resize(350, 350);
    image(mapcat2, 750, 200);

    morningmap.resize(380, 230);
    image(morningmap, width/4, 265);
    map1.show();
    mapcat.resize(450, 450);
    image(mapcat, 250, 580);
  }


  if (map1.clicked) {
    map = 1;
    nodes = map1nodes;
    mode = PLAY;
  }

  if (map2.clicked) {
    map = 2;
    nodes = map2nodes;
    mode = PLAY;
  }
}
