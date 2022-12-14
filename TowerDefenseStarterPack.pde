import processing.sound.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Tower Defense Game
//Anna Fan
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
final int MAP = 4;
final int REMOVE = 5;
int mode;

//Tower types
final int GUN = 0;
final int AOE = 1;
final int SNIPER = 2;

final int[] price = {5, 25, 50};

//Pallette
color white = #ffffff;
color black = #000000;
color green = #ccd5ae;
color orange = #fec89a;
color red = #fec5bb;
color pink = #fae1dd;
color blue = #caf0f8;
color brown = #cb997e;
color grey = #e8e8e4;
color yellow = #ffb703;
color dblue = #023e8a;
color cream = #fefae0;
color dgreen = #1b4332;
color purple = #dee2ff;
color bred = #ff6b6b;

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start, nextWave, nextWave2, build, build2, play, play1, gun, AoE, sniper, remove;
Button map1, map2, gun1, AoE1, sniper1, remove1, restart, speed1, speed2;

//Collections of objects
Node[] map1nodes;
Node[] map2nodes;
Node[] nodes;
ArrayList <Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;
ArrayList<AoE_Ring> rings;

//Images and Gifs
Gif gif;
PImage normal, speedy, chonky, intro, introcolor, intro2, mouth, cat, cat2;
PImage nodemap1, nodemap2, mapcat, mapcat2, whcat, whcat2, morningmap, nightmap, overw, overb;

//Fonts
PFont milky, night;

//sound
AudioIn mic;
Amplitude amp;

//sound variable
Minim minim;
AudioPlayer nightsong, theme, morningsong, dead, coming, gameover;

// ===================== SETUP =========================

void setup() {
  size(1000, 800);
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();

  //sound
  mic = new AudioIn (this, 0);
  mic. start();
  amp = new Amplitude (this);
  amp. input(mic);

  //minim
  minim = new Minim(this);
  nightsong = minim.loadFile("Forest Glide.mp3");
  morningsong = minim.loadFile("morning.mp3");
  theme = minim.loadFile("theme.mp3");
  dead = minim.loadFile("dead.wav");
  coming = minim.loadFile("coming.wav");
  gameover = minim.loadFile("gameover.mp3");

}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  gif = new Gif("gif/frame_", "_delay-0.02s.gif", 240, 1, width/2, height/2, width, height);
  normal = loadImage("normal.png");
  chonky = loadImage("chonky.png");
  speedy = loadImage("speedy.png");
  intro = loadImage("intro.png");
  introcolor = loadImage("color.png");
  intro2 = loadImage("intro2.png");
  mouth = loadImage("mouth.png");
  cat = loadImage("cat.png");
  cat2 = loadImage("cat2.png");
  nodemap1 = loadImage("node.png");
  nodemap2 = loadImage("nodecat.png");
  mapcat = loadImage("mapcat.png");
  mapcat2 = loadImage("mapcat2.png");
  whcat = loadImage("wcat.png");
  whcat2 = loadImage ("wcat2.png");
  morningmap = loadImage("morning.png");
  nightmap = loadImage("night.png");
  overw = loadImage("overw.png");
  overb = loadImage("overb.png");


  //Load Fonts
  milky= createFont ("Milky.otf", 200);

  //Create Collections of Objects
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
  rings = new ArrayList<AoE_Ring>();
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 550, 200, 100, #F0E9CE, #f1faee);
  map1 = new Button("morning", width/4, 100, 380, 125, yellow, brown);
  map2 = new Button("night", 3*width/4, 700, 380, 125, dblue, cream);

  //PLAY - Next Wave, To Build Mode
  nextWave = new Button("NEXT", 800, 740, 100, 100, green, brown);
  nextWave2 = new Button("NEXT", 800, 740, 100, 100, dblue, cream);
  speed1 = new Button ("SPEED", 930, 740, 100, 100, green, brown);
  speed2 = new Button ("SPEED", 930, 740, 100, 100, dblue, cream);
  
  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
  build = new Button ("BUILD", 670, 740, 100, 100, green, brown);
  build2 = new Button("BUILD", 670, 740, 100, 100, dblue, cream);
  play = new Button ("PLAY", 670, 740, 100, 100, green, brown);
  play1 = new Button ("PLAY", 670, 740, 100, 100, dblue, cream);
  gun = new Button ("GUN", 540, 740, 100, 100, green, brown);
  AoE = new Button ("AoE", 410, 740, 100, 100, green, brown);
  sniper = new Button ("SNIPER", 280, 740, 100, 100, green, brown);
  remove = new Button ("REMOVE", 150, 740, 100, 100, green, brown);
  gun1 = new Button ("GUN", 540, 740, 100, 100, dblue, cream);
  AoE1 = new Button ("AoE", 410, 740, 100, 100, dblue, cream);
  sniper1 = new Button ("SNIPER", 280, 740, 100, 100, dblue, cream);
  remove1 = new Button ("REMOVE", 150, 740, 100, 100, dblue, cream);


  //GAMEOVER - Reset
  restart = new Button ("RESTART", width/2, height/2, 200, 100, #F0E9CE, #f1faee);
}

void makeNodes() {
  //Plot the nodes on the map
  map1nodes = new Node[6];
  map1nodes[0] = new Node(800, 160, 0, 1);
  map1nodes[1] = new Node(800, 250, -1, 0);
  map1nodes[2] = new Node(600, 250, 0, 1);
  map1nodes[3] = new Node(600, 500, -1, 0);
  map1nodes[4] = new Node(100, 500, 0, 1);
  map1nodes[5] = new Node(100, 590, 1, 0);

  map2nodes = new Node[8];
  map2nodes[0] = new Node(700, 590, 0, -1);
  map2nodes[1] = new Node(700, 260, -1, 0);
  map2nodes[2] = new Node(460, 260, 0, 1);
  map2nodes[3] = new Node(460, 400, -1, 0);
  map2nodes[4] = new Node(100, 400, 0, -1);
  map2nodes[5] = new Node(100, 160, 1, 0);
  map2nodes[6] = new Node(900, 160, 0, 1);
  map2nodes[7] = new Node(900, 590, 1, 0);
}


// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else if (mode == BUILD) {
    build();
  } else if (mode == MAP) {
    Cmap();
  } else if (mode == REMOVE) {
    Remove();
  }
  fill(brown);
  text(mouseX + ", " + mouseY, mouseX, mouseY-20);
}
