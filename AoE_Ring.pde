
//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a
//short period of time.

class AoE_Ring {
  float x, y, d, vd;

  AoE_Ring (float _x, float _y, float _vd) {
    x = _x;
    y = _y;
    d = 250;
    vd = _vd;
  }

  void show() {
    stroke(red);
    strokeWeight(2);
    fill(blue);
    circle(x, y, d);
  }

  void act() {
    d = d + vd;
    if (d >= 1) {
      d = 0;
    }
  }
}


  
