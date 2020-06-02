public class Shape{
  int sides, blue, red;
  float sideLength, angle;
  ArrayList<Float> x = new ArrayList<Float>();
  ArrayList<Float> y = new ArrayList<Float>();
  public Shape(int sides, float sideLength, float angle){
    this.sides = sides;
    this.sideLength = sideLength;
    this.angle = angle;
  }
  
  public void draw(){
    stroke(0, blue, red);
    for(int i = 1; i <= sides; i++){
      x.add( ( cos( (((radians(360)/sides))* i)+angle) * sideLength) + 305);
      y.add((sin(((radians(360)/sides)*i)+angle)*sideLength) + 305);
    }
    for(int i = 1; i <= sides; i++){
      if(i==sides){
        line(x.get(i-1),y.get(i-1), x.get(0),y.get(0));
      }
      else{
        line(x.get(i-1),y.get(i-1), x.get(i),y.get(i));
      }
    }
  }
}
