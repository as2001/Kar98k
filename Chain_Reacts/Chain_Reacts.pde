Ball[] balls = new Ball[30];

void setup(){
  size(600, 600);
  background(0);
  for (int i = 0; i < 30; i ++){
    balls[i] = new Ball();
  }
}


void draw(){
  clear();
  for (Ball b : balls)
    b.move();
}
