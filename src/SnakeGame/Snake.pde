class Snake {
  PVector position;
  PVector velocity = new PVector(0,1);;
  int total = 0;
  ArrayList<PVector> tail = new ArrayList<PVector>();
  int textSize = 12;
  
  Snake(PVector position) {
    this.position = position;
  }
  
  void death() {
    for(int i = 0; i < tail.size(); i++) {
      PVector pos = tail.get(i);
      float d = dist(this.position.x, this.position.y, pos.x, pos.y);
      if(d < 1) {
        total = 0;
        tail.clear();
        textSize += 2;
      }
    }
    textSize(textSize);
    text("You've lost!", 20, 20);
  }
  void update() {
    if(total > 0) {
      if(total == tail.size() && !tail.isEmpty()) {
        tail.remove(0);
      }
      tail.add(new PVector(this.position.x, this.position.y));
    }
    
    this.position.x = this.position.x + velocity.x * scl;
    this.position.y = this.position.y + velocity.y * scl;
    this.position.x = constrain(this.position.x, 0, width-scl);
    this.position.y = constrain(this.position.y, 0, height - scl);
  }
  
  void show() {
    fill(255);
    stroke(0);
    strokeWeight(2);
    for(PVector v : tail) {
      rect(v.x, v.y, scl, scl);
    }
    
    rect(this.position.x, this.position.y, scl, scl);
    
    print(tail.size());
  }
  
  boolean eat(PVector applePosition) {
    if(position.equals(applePosition)) {
      total++;
      return true;
    } else {
      return false;
    }

  }
}
