public class Button{
  String text;
  int num;
  int filler = 0;
  int filler2 = 255;
  boolean active = false;
  

  public Button(String text, int num){
    this.num = num;
    this.text = text;
  }
  
  public void draw(){
    strokeWeight(2);
    fill(filler,100);
    rect(width-(num*200),0,600,40);
    fill(filler2);
    textSize(17);
    textAlign(CENTER);
    text(text, width/2,25);
  }
  
  public void toggle(){
    fill(0);
    rect(0,0,width,height);
    for(int i = 0; i < bol.size(); ){
      bol.remove(i);
    }
    for(int m = 0; m < bal.size(); ){
      bal.remove(m);
    }
  }
  
  public int getLeft(){
    return width-(num*200);
  }
  public int getRight(){
    return width-(num*200)+600;
  }
  public int getBottom(){
    return 40;
  }
  public int getTop(){
    return 0;
  }
  public boolean activated(){
    return active;
  }
}
