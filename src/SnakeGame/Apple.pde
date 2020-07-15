class Apple {
 PVector position;
 Snake snake;
  
 public Apple(PVector position) {
    this.position = position;
  }
  
  void show() {
    noStroke();
    fill(255, 50, 0);
    rect(this.position.x, this.position.y, scl, scl);
  }
  
  
}
