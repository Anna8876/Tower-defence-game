//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

boolean building;

class Tower {
  final int PLACING =0;
  final int PLACED = 1;

  float x, y;
  int cooldown, threshold;
  int towermode, towertype;
  int price;

  Tower(int type) {
    x = mouseX;
    y = mouseY;
    cooldown = 0;
    towermode = PLACING;
    towertype = type;
    if (towertype == GUN) {
      if (fastspeed == true) {
        threshold = 50;
      } else {
        threshold = 25;
      }
    }
    if (towertype == AOE) {
      if (fastspeed == true) {
        threshold = 30;
      } else {
        threshold = 15;
      }
    }
    if (towertype == SNIPER) {
      if (fastspeed == true) {
        threshold = 90;
      } else {
        threshold = 45;
      }
    }
  }

    void show() {
      if (towertype == GUN) showGUNtower();
      if (towertype == AOE) showAOEtower();
      if (towertype == SNIPER) showSNIPERtower();
    }


    void showGUNtower() {
      stroke(red);
      strokeWeight(4);
      fill(blue);
      if (towermode == PLACED) {
        square(x, y, 50);
      } else if (towermode == PLACING) {
        square(mouseX, mouseY, 40);
        if (mousePressed && mouseY < 650) {
          towermode = PLACED;
          x = mouseX;
          y =mouseY;
        }
      }
    }


    void showAOEtower() {
      stroke(red);
      strokeWeight(4);
      fill(blue);
      if (towermode == PLACED) {
        circle(x, y, 50);
      } else if (towermode == PLACING) {
        fill(#edf2fb);
        circle(mouseX, mouseY, 250);
        fill(blue);
        circle(mouseX, mouseY, 40);
        if (mousePressed && mouseY < 650) {
          towermode = PLACED;
          x = mouseX;
          y =mouseY;
        }
      }
    }


    void showSNIPERtower() {
      stroke(red);
      strokeWeight(4);
      fill(blue);
      if (towermode == PLACED) {
        triangle(x-30, y+30, x+30, y +30, x, y-30);
      } else if (towermode == PLACING) {
        triangle(mouseX-25, mouseY+25, mouseX+25, mouseY +25, mouseX, mouseY-25);
        if (mousePressed && mouseY < 650) {
          towermode = PLACED;
          x = mouseX;
          y =mouseY;
        }
      }
    }


    void act() {

      if (towertype == GUN) actGUNtower();
      if (towertype == AOE) actAOEtower();
      if (towertype == SNIPER) actSNIPERtower();
    }

    void actGUNtower() {
      if (towertype == GUN) {

        cooldown++;
        if (cooldown >= threshold) {

          cooldown = 0;
          if (mobs.size()>0) {

            bullets.add(new Bullet(x, y, 0, -10));
            bullets.add(new Bullet(x, y, 0, 10));
            bullets.add(new Bullet(x, y, 10, 0));
            bullets.add(new Bullet(x, y, -10, 0));
          }
        }
      }
    }


    void actAOEtower() {

      if (towertype == AOE) {
        cooldown++;
        if (cooldown >= threshold) {
          cooldown = 0;
          if (mobs.size()>0) {
            rings.add(new AoE_Ring(x, y, 1));
          }
        }
      }
    }

    void actSNIPERtower() {

      if (towertype == SNIPER) {
        cooldown++;
        if (mobs.size()>0 && mode == PLAY) {
          strokeWeight(5);
          stroke(bred);
          line(x, y, mobs.get(0).x, mobs. get(0).y);
          if (cooldown >= threshold) {
            mobs.get(0).hp --;
            cooldown = 0;
          }
        }
      }
    }
  }
