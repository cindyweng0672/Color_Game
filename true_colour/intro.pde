void intro() {
  image(gif[f], 0, 0, width, height);
  f++;
  if (f==frameNum-1) {
    f=0;
  }
  
  //text animation 
  textFont(font);
  textSize(65);
  fill(orange);
  text("True Colour", titlex, titley);
  
  if(add){
    titlex+=5;
  }else{
    titlex-=5;
  }
  
  if(titlex>width-240){
    add=false;
  }
  if(titlex<240){
    add=true;
  }
  
  //start button
  rectButtonTactile(300, 600, 200, 100);
  textFont(font);
  textSize(50);
  fill(255);
  rect(300, 600, 200, 100);
  fill(orange);
  text("Start", 400, 670);
}

void introClicks(){ //<>//
  if(mouseX<500 && mouseX>300 && mouseY<700 && mouseY>600){
    mode=GAME;
  }
}
