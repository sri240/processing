public class Pipe{

  PImage ptop, pbot;
  int pipeX = width;
  int pipeY = 0;
  float spaceBetween;
  public Pipe(int x){
    ptop = loadImage("./images/pipeTop.png");
    pbot = loadImage("./images/pipeBottom.png");
    pipeX = x;
    pipeY  = int(random(150));
    
    spaceBetween = random(200,300);
  }

  
  void setup(){
    pipeY = int(random(300)+50);
  }
  
  void draw(){
    movePipe();
    
  }
  
  void movePipe(){
    image(ptop,pipeX-20,pipeY-spaceBetween);
    image(pbot,pipeX-20,pipeY+spaceBetween);
    pipeX-=3;
    
    
    
    if(pipeX < -200){
      spaceBetween = random(234,238);
      pipeY  = int(random(150));
      pipeX = width;
    }
    collision();
  }
  
  void collision(){
    if(pipeX>40 && pipeX<95){
      if(pY<pipeY+300-spaceBetween || pY + 30>pipeY+spaceBetween){
        game = false;
      }
    }
  }
}
