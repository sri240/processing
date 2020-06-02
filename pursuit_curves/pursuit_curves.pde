import java.util.*;
int sides = 6;
int counter = 1;
float ratio = 0.90;
float len = 300;
float len2 = len;
float angle = 0;
float iterations = 25;
float area;
ArrayList<Shape> array = new ArrayList<Shape>();
public void setup(){
  background(255);
  size(610,610);
}

public void draw(){
  //point(305, ratio+300);
  //ratio = ratio+10;
  if(counter < iterations){
    if(sides == 4){
      area = pow(2*len/sqrt(2),2);
    }
    while(len2 > 1){
      array.add(new Shape(sides, len2, angle));
      len2 = len2 * ratio;
      angle = radians((360/iterations)*(counter));
      counter++;
    }
    for(Shape i : array){
      i.draw();
    }
    counter = 1;
    len2 = len;
    angle = 0;
  }
}
