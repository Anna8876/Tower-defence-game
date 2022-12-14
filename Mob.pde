//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!
boolean fastspeed = true;

class Mob {
  float x, y, vx, vy, d;
  float hp, maxhp;
  int value, w, h;
  float speed;
  PImage img;

  Mob (float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 50;
    speed = 1;
    hp = 10;
    maxhp = 10;
    img = normal;
    w = 60;
    h = 50;
    value = 50;
  }

  void show () {
    fill(red);
    strokeWeight(3);
    img.resize(w, h);
    image(img, x, y);

    //draw bar
    float drawWidth = (hp / maxhp) * 100;
    noFill();
    rect(x, y-70, 100, 20);
    fill(bred);
    rectMode(CORNER);
    rect(x-50, y-80, drawWidth, 20);
    rectMode(CENTER);
  }

  void act() {
    if (fastspeed == true) {
      x = x + vx*speed;
      y = y + vy*speed;
    } else {
      x = x + 2*vx*speed;
      y = y + 2*vy*speed;
    }

    if (x> width) {
      lives--;
    }

    int i = 0;
    while ( i < nodes.length) {
      if (dist(nodes[i].x, nodes[i].y, x, y) < 4) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
      i++;
    }

    i = 0;
    while (i < bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.d/2) {
        hp = hp - 1;
        bullets.remove(i);
      }
      i++;
    }

    i = 0;
    while (i < mobs.size()) {
      Mob myMob = mobs.get(i);
      if (myMob.x > width) {
        mobs.remove(i);
      }
      i++;
    }

    while (i < rings.size()) {
      AoE_Ring myrings = rings.get(i);
      if (dist(myrings.x, myrings.y, x, y) < 160) {
        hp = hp - 0.0001;
      }
      i++;
    }
  }
}
