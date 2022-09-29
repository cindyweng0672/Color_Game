void game(){
  textSize(50);
  //black-wrongr
  noStroke();
  fill(0);
  rect(0, 0, width/2, height);
  fill(255); 
  text("Don't Match", width/4, 100);
  
  //white-right
  fill(255);
  rect(width/2, 0, width/2, height);
  fill(0);
  text("Match", width/4*3, 100);
  
  fill(0);; 
  text("Score: "+score, width/4*3, 700);
  
  //question
  if(tSize<200){
    tSize+=2;
  }else{
    mode=GAMEOVER;
  }
  
  textSize(tSize);
  fill(pallete[CindexNum]);
  text(colorName[TindexNum], width/2, height/2); //<>//
}

void gameClicks(){
  if(mouseX>0 && mouseX<width/2 && mouseY>0 && mouseY<height){
    answerCorrect=false;
  }else if(mouseX>width/2 && mouseX<width && mouseY>0 && mouseY<height){
    answerCorrect=true;
  }
  
  checkAnswer();
  
  colorGenerator();
} //<>//

void gameKey(){
  if(keyCode==RIGHT){
    answerCorrect=true;
  }else if(keyCode==LEFT){
    answerCorrect=false;
  }
  
  checkAnswer();
  
  colorGenerator();
}
