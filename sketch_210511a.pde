int paddle_speed = 10;
int ball_speed = 3;

int y = 100;
int x = 300;
int radius = 10;
int dx = ball_speed;
int dy = ball_speed;

int paddle_x = 10;
int paddle_y = 10;
int paddle_width = 3;
int paddle_height = 40;

int display_width = 500;
int display_height = 500;

void setup() {
  size(500, 500);
  background(0);
  stroke(255);
}

boolean hit_back() {
  if (x + radius > display_width) {
    return true;
  }
  return false;
}

boolean hit_slides() {
  if (y - radius < 0 || y + radius > display_height) {
    return true;
  }

  return false;
}

boolean hit_paddle() {
  if (x - radius <= paddle_x + paddle_width && y > paddle_y && y < paddle_y + paddle_height) {
    return true;
  }
  
  return false;
}

void draw() {
  background(0);

  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      if (paddle_y - 10 >= 0) {
        paddle_y -= paddle_speed;
      }
    }

    else if (key == 's' || key == 'S') {
      if (paddle_y + paddle_height + 10 <= display_height) {
        paddle_y += paddle_speed;
      }
    }
  }
  
  x += dx;
  y += dy;
  
  rect(25, paddle_y, paddle_width, paddle_height);
  circle(x, y, radius);
  
  if (x < radius) {
    exit();
  }
  
  if (hit_back() || hit_paddle()) {
    dx *= -1;
  }

  if (hit_slides()) {
    dy *= -1;
  }
}
