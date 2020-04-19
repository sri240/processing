
//version 2
public class Ball{
  int r, red, blue, green, id;
  float x, y, xv, mv, my;
  float yv;
  float yacc=20;
  boolean ceiling = false;
  
  public Ball(float x, float y, int r, int id){
    this.r = r;
    this.x = x;
    this.y = y;
    this.red = int(random(0,250));
    this.green = int(random(0,250));
    this.blue = int(random(0,150));
    this.xv = random(-5,5);
    this.id = id;
  }
  
  public void draw(){
    noStroke();
    if(r > 7){
      fill(red, green, 250,150);
    }
    else{fill(250,green,blue,150);}
    ellipse(x, y, r,r);
    move();
    collision();
  }
  
  public void move(){
    x = x+xv;
    y = y+yv;
    yv+=.5;
    //bounce off top and bottom
    if(y > (height-r/2) || y < (r/2)+40){
      yv*=-0.7;
      y+=yv;
      if(yv<0){
        yv += 1.5;
      } 
      if(yv >=-1 && yv <=1){
        yv = 0;
      }
    }
    if(y <= r + 20){
      ceiling = true;
    }
    //bounce off mouse
    if(mouseX != x && mouseY != y){
      if(abs(mouseX-x)<=r/2 && abs(mouseY-y)<=r/2){
        xv=(abs(mouseX-x)*-.5);
        x+=xv;
        yv=(abs(mouseY-y)*-.5);
        y+=yv;
      }
    }
    //bounce off sides
    if(x-r < 0 || x > (width-r)){
      xv*=-1;
      x+=xv;
      if(xv>0){
        xv = xv*.9;
      }
      else{
        xv = xv*.9;
      }
    }
  }
  
  public void collision() {
    if(r > 7){
      for (int i=0; i < bol.size(); i++) {
        
        float dx = bol.get(i).getX() - x;
        float dy = bol.get(i).getY() - y;
        float distance = sqrt(dx*dx + dy*dy);
        float minDist = (bol.get(i).getRadius() + r);
        if (distance < minDist-r) {
          float angle = atan2(dy, dx);
          float targetX = x + cos(angle) * minDist;
          float targetY = y + sin(angle) * minDist;
          float ax = (targetX - bol.get(i).getX()) * .05;
          float ay = (targetY - bol.get(i).getY()) * .05;
          if(x+r+.5 <= width || x-r-0.5 >= 0){
            xv -= ax;
            x+=xv;
          }
          if(y+r-.5 <= height){
            yv -= ay;
            y+=yv;
          }
          if(bol.get(i).getX()+r+.5 <= width || bol.get(i).getX()-r-0.5 >= 0){
            bol.get(i).accX(ax);
            bol.get(i).velX(ax);
          }
          if(bol.get(i).getY()+r-.5 <= height && bol.get(i).getyVel() > 0){
            bol.get(i).accY(ay);
            bol.get(i).velY(ay);
            bol.get(i).velY(-1*abs(bol.get(i).getyVel()));
          }
        }
      }   
    }
    else{
      for (int i = id + 1; i < bal.size(); i++) {
        float dx = bal.get(i).getX() - x;
        float dy = bal.get(i).getY() - y;
        float distance = sqrt(dx*dx + dy*dy);
        float minDist = bal.get(i).getRadius() + r;
        if (distance < minDist) { 
          float angle = atan2(dy, dx);
          float targetX = x + cos(angle) * minDist;
          float targetY = y + sin(angle) * minDist;
          float ax = (targetX - bal.get(i).getX()) * .05;
          float ay = (targetY - bal.get(i).getY()) * .05;
          xv -= ax;
          yv -= ay;
          bal.get(i).accX(ax);
          bal.get(i).accY(ay);
        }
      }
      for (int i = 0; i < bol.size(); i++) {
        float dx = bol.get(i).getX() - x;
        float dy = bol.get(i).getY() - y;
        float distance = sqrt(dx*dx + dy*dy);
        float minDist = bol.get(i).getRadius() + r;
        if (distance < minDist) { 
          float angle = atan2(dy, dx);
          float targetX = x + cos(angle) * minDist;
          float targetY = y + sin(angle) * minDist;
          float ax = (targetX - bol.get(i).getX()) * .05;
          float ay = (targetY - bol.get(i).getY()) * .05;
          xv -= ax;
          yv -= ay;
        }
      }
    }
  }
  
  
  public float getX(){
    return x;
  }
  public float getY(){
    return y;
  }
  public float getRadius(){
    return r;
  }
  public void velX(float xv){
    x += xv;
  }
  public void velY(float yv){
    y += yv;
  }
  public void accX(float xa){
    xv += xa;
  }
  public void accY(float ya){
    yv += ya;
  }
  public float getyVel(){
    return yv;
  }
}
