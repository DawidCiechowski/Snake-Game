Snake snake;
Apple apple;
PVector ran;
int scl = 20;
void setup() {
  size(600, 600);
  frameRate(15);
  snake = new Snake(new PVector(300, 200));
  pickAppleLocation();
}

void draw() {
  background(0);
  snake.death();
  snake.show();
  snake.update();
  apple.show();
  
  if(snake.eat(apple.position)) {
    pickAppleLocation();
  }
}

void keyPressed() {
  
  if(key == 'w' && snake.velocity.y != 1) {
      snake.velocity.y = -1;
      snake.velocity.x = 0;
  } else if(key == 'a' && snake.velocity.x != 1) {
      snake.velocity.y = 0;
      snake.velocity.x = -1;
  } else if(key == 's' && snake.velocity.y != -1) {
      snake.velocity.y = 1;
      snake.velocity.x = 0;
  } else if(key == 'd' && snake.velocity.x != -1) {
      snake.velocity.y = 0;
      snake.velocity.x = 1;
  }
    
} 

void pickAppleLocation() {
  int cols = floor(width/scl);
  int rows = floor(height/scl);
  PVector appleVector = new PVector(floor(random(cols)), floor(random(rows)));
  appleVector.mult(scl);
  apple = new Apple(appleVector);
}
