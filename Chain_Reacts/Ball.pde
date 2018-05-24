class Ball {

  final static int MOVING = 0, 
    GROWING = 1, 
    SHRINKING = 2, 
    DEAD = 3;

  final float dr = .25;
  final float maxR = 50;

  float x, y, r, dx, dy;
  color c;
  int state; 

  Ball() {
    state = 0;
    r = 10;
    int r = (int)( Math.random() * 256 );
    int g = (int)( Math.random() * 256 );
    int b = (int)( Math.random() * 256 );
    c = color(r, g, b);
    x = (float)( Math.random() * 580 ) + r;
    y = (float)( Math.random() * 580 ) + r;
    dx = (float) (Math.random() * 3 + 2);
    dy = (float) (Math.random() * 3 + 2);
  }

  void update(){
    if (state == MOVING){
      x += dx;
      y += dy;
      fill(c);
      ellipse(x, y, 2r, 2r);
      if (x < 10 || x > 590)
        dx = -dx;
      if (y < 10 || y > 590)
        dy = -dy;
    }
    if (state == GROWING){
      r += dr;
      fill(c);
      ellipse(x, y, 2r, 2r);
      if (r >= maxR)
        state ++;
    }
    if (state == SHRINKING){
      r -= dr;
      fill(c);
      ellipse(x, y, 2r, 2r);
    }
  }
}