class Ball{
  
  float x, y;
  double vx, vy;
  color c;
  
  Ball(){
    int r = (int)( Math.random() * 256 );
    int g = (int)( Math.random() * 256 );
    int b = (int)( Math.random() * 256 );
    c = color(r, g, b);
    x = (float)( Math.random() * 550 ) + 25;
    y = (float)( Math.random() * 550 ) + 25;
    vx = Math.random() * 3 + 2;
    vy = Math.random() * 3 + 2;
  }
  
  void move(){
    x += vx;
    y += vy;
    fill(c);
    ellipse(x, y, 50, 50);
    if (x < 25 || x > 575)
      vx = -vx;
    if (y < 25 || y > 575)
      vy = -vy;
  }
  
}
