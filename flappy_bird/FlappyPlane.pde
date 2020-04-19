
PImage bg, plane;
int bgX, pX, pY, gravity, score;
Pipe pipe1;
Pipe[] pipeArray;
boolean game;


void setup(){
  size(600,400);
  bg = loadImage("./images/bg.png");
  plane = loadImage("./images/plane.png");
  pX = 40;
  score = 0;
  pipeArray = new Pipe[4];
  for(int i = 0; i<pipeArray.length; i++){
    pipeArray[i] = new Pipe(width + i*200);
  }
}

void draw(){
  if(game){  
    moveBG();
    movePlane();
    for(Pipe thePipe: pipeArray){
      thePipe.draw();
    }
    showScore();
  }
}

void moveBG(){
  image(bg,bgX,0,width,height);
  image(bg,bgX+width,0,width,height);
  bgX -=5;
  if(bgX<=-width){
    bgX=0;
    score++;
  }
}

void movePlane(){
  image(plane,pX,pY,45,30);
  pY += gravity;
  gravity += 2;
  if(pY >= height){
    gravity = -3;
    //pY += gravity;
  }
  if(pY <= 0){
    gravity = 2;
    pY += gravity;
  }
}

void showScore(){
  textSize(32);
  text("Score: ",10,30);
}



 void keyPressed(){
   gravity = -12;
   pY += gravity;
   if(!game){
     game = true;
   }
 }
