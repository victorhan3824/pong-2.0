//aflqv
///bgmrw
////chnsx
/////djoty
//////ekpuz

void gameover() {
  textSize(0.3571428571428571*height);
  fill(medGreen);
  if (redScore == 3) text("RED\nWIN!",width/2,height/2);
  if (blueScore == 3) text("BLUE\nWIN!",width/2,height/2);
}

void gameoverClick() {
  mode = INTRO;
  blueScore = redScore = 0;
}
