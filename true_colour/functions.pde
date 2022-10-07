void colorGenerator() {
  CindexNum=int(random(6));
  colorP=random(0, 1);
  patternP=random(0, 1);

  if (colorP<0.5) {
    TindexNum=CindexNum;
  } else {
    do {
      TindexNum=int(random(6));
    } while (TindexNum==CindexNum);
  }
  
  if (CindexNum==TindexNum) {
    matched=true;
  } else {
    matched=false;
  }
  
  println("Matched: "+matched);
  println("CNum: "+CindexNum+"   TNum: "+TindexNum+"   P: "+ colorP);
  println("patternP: "+patternP);
}

void rectButtonTactile(int x, int y, int w, int h) {
  if (mouseX<x+w && mouseX>x && mouseY<y+h && mouseY>y) {
    strokeWeight(5);
  } else {
    strokeWeight(2);
  }
}

void checkAnswer() {
  if (matched==answerCorrect) {
    success.rewind();
    success.play();
    score++;
    tSize=50;
    textY=height/2;
    vy=-10;
  } else if (matched!=answerCorrect) {
    fail.rewind();
    fail.play();
    mode=GAMEOVER;
  }
}
