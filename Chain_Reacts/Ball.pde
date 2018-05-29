class Ball {

  final static int MOVING = 0, 
                   GROWING = 1, 
                   SHRINKING = 2, 
                   DEAD = 3;

  final float dr = 0.25;
  final float maxR = 50;

  float x, y, dx, dy;
  float r = 10;
  color c;
  int state;

  Ball(int s, float px, float py) {
    state = s;
    int r = (int)( Math.random() * 256 );
    int g = (int)( Math.random() * 256 );
    int b = (int)( Math.random() * 256 );
    c = color(r, g, b);
    x = px;
    y = py;
    dx = (float)( Math.random() * 4 + 1 );
    dy = (float)( Math.random() * 4 + 1 );
    fill(c);
    ellipse(x, y, 2*r, 2*r);
  }
  
  

  void update(){
    if (state == MOVING){
      x += dx;
      y += dy;
      fill(c);
      ellipse(x, y, 2*r, 2*r);
      if (x <= 10 || x >= 590)
        dx = -dx;
      if (y <= 10 || y >= 590)
        dy = -dy;
    }
    if (state == GROWING){
      r += dr;
      fill(c);
      ellipse(x, y, 2*r, 2*r);
      if (r >= maxR)
        state ++;
    }
    if (state == SHRINKING){
      r -= dr;
      fill(c);
      ellipse(x, y, 2*r, 2*r);
      if (r <= 0)
        state ++;
    }
  }
  
  boolean touches( Ball other ){
    return Math.pow(other.x-x, 2) + Math.pow(other.y-y, 2)
           <= Math.pow(r + other.r, 2);
  }
}
