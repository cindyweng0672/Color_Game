void gameOver(){
  //endGif
  image(endGif[endF], 0, 0, width, height);
  endF++;
  if (endF==endFrameNum-1) {
    endF=0;
  }
  
  //high score
  if(score>highScore){
    highScore=score;
  }
  
  fill(255);
  textSize(65);
  text("Game Over", width/2, height/2);
  
  textSize(20);
  text("Score: "+score, width/2, 500);
  text("High Score: "+highScore, width/2, 550);
  
  //restart button
  stroke(255);
  rectButtonTactile(width/2-75, 650, 150, 100);
  fill(255);
  rect(width/2-75, 650, 150, 100);
  fill(0);
  text("restart", width/2, 700);
  
  backgroundMusic.pause();
}

void gameOverClicks(){
  if(mouseX<width/2-75+150 && mouseX>width/2-75 && mouseY>650 && mouseY<750){
    mode=GAME;
    backgroundMusic.play();
    tSize=50;
    vy=-10;
    score=0;
    textY=height/2;
  }
}
