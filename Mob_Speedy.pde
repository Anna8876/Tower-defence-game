class SpeedyMob extends Mob{
  
  SpeedyMob(float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d = 50;
    value = 5;
    speed = 2;
    hp = 5;
    maxhp = 5;
    img = speedy;
    w = 80;
    h = 50;
    value = 60;
  }
}
