//This function draws the INTRO screen.

void intro() {
  theme.play();

  //sound
  noStroke();
  fill(#F0E9CE);
  rect(500, 400, width, height);
  image(mouth, 0, 400);
  image(mouth, 700, 400);


  float diameter = map (amp.analyze(), 0, 0.1, 180, width);
  fill(red);
  ellipse(width/2, height/2, diameter*3, diameter*3);
   fill(pink);
  ellipse(width/2, height/2, diameter*2, diameter*2);
  fill(blue);
  ellipse(width/2, height/2, diameter, diameter);

  //monster
  image(intro, 500, 120);
  image(intro2, 500, 700);

  //font
  textFont(milky);
  fill(#f1faee);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("Tower", 500, 290);
  text("Defense", 500, 390);

  //button
  start.show();
  if (start.clicked) {
    mode = MAP;
  }
}
