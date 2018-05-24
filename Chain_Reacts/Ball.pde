class Ball {

  final static int MOVING = 0, 
                   GROWING = 1, 
                   SHRINKING = 2, 
                   DEAD = 3;

  final float dr = .25;
  final float maxR = 50;

  float x, y, dx, dy;
  float r = 10;
  color c;
  int state = 0;

  Ball() {
    int r = (int)( Math.random() * 256 );
    int g = (int)( Math.random() * 256 );
    int b = (int)( Math.random() * 256 );
    c = color(r, g, b);
    x = (float)( Math.random() * 560 + r + 10);
    y = (float)( Math.random() * 560 + r + 10);
    dx = (float)( Math.random() * 4 + 1 );
    dy = (float)( Math.random() * 4 + 1 );
  }

  void update(){
    if (state == MOVING){
      fill(c);
      ellipse(x, y, 2*r, 2*r);
      x += dx;
      y += dy;
      if (x <= 10 || x >= 590)
        dx = -dx;
      if (y <= 10 || y >= 590)
        dy = -dy;
    }
    if (state == GROWING){
      r += dr;
      fill(c);
      ellipse(x, y, r, r);
      if (r >= maxR)
        state ++;
    }
    if (state == SHRINKING){
      r -= dr;
      fill(c);
      ellipse(x, y, r, r);
      if (r <= 0)
        state ++;
    }
  }
  
  boolean touches( Ball other ){
    return Math.sqrt( Math.pow(other.x-x, 2) + Math.pow(other.y-y, 2) ) <= r + other.r;
  }
}
