//Some towers shoot bullets! If a mob is hit by a bullet,
//it does damage.

class Bullet {
  float x, y, vx, vy, d;
  int hp;

  Bullet(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 15;
    hp = 1;
  }

  void show() {
    stroke(red);
    strokeWeight(2);
    fill(#e63946);
    square(x, y, d);

    if (x < 0 || x > width || y < 0 || y > height) hp = 0;
  }

  void act() {
    if (fastspeed == true) {
      x = x + vx;
      y = y + vy;
    } else {
      x = x + 2*vx;
      y = y + 2*vy;
    }
  }
}
