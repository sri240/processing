import java.util.*;
ArrayList<Ball> bol = new ArrayList<Ball>();
ArrayList<Ball> bal = new ArrayList<Ball>();
int m;
Button b1 = new Button("clear", 3);

public void setup(){
  background(0);
  size(600,600);
  //bol.add(new Ball(random(width), 100, int(random(30,60))));
}

public void draw(){
  fill(0);
  rect(0,0,width,height);
  b1.draw();
  if(mousePressed && mouseY > 40){
    Ball i = new Ball(mouseX, mouseY, int(random(3,6)), m);
    m++;
    bal.add(i);
  }
  for(int u = 0; u < bol.size(); u++){
    bol.get(u).draw();
  }
  for(int u = 0; u < bal.size(); u++){
    bal.get(u).draw();
  }
}

public void mouseClicked(){
  if(mouseX > b1.getLeft() && mouseX < b1.getRight() && mouseY > b1.getTop() && mouseY < b1.getBottom()){
    b1.toggle();
  }
  if(mouseY > 40){
    Ball i = new Ball(mouseX, mouseY, int(random(30,60)), m);
    m++;
    bol.add(i);
  }
}
