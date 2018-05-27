ArrayList<Ball> balls = new ArrayList();

void setup(){
  size(600, 600);
  background(0);
  float x, y;
  for (int i = 0; i < 30; i ++){
    x = (float)( Math.random() * 500 + 50 );
    y = (float)( Math.random() * 500 + 50 );
    balls.add( new Ball(0, x, y) );
  }
}

void draw(){
  clear();
  for (Ball b : balls) {
    b.update();
    for (Ball c : balls)
      if (b.state == Ball.MOVING &&
          (c.state == Ball.GROWING ||
           c.state == Ball.SHRINKING) &&
          b.touches(c) )
        b.state ++;
  } 
}

void mouseClicked(){
  balls.add( new Ball(1, mouseX, mouseY) );
}
