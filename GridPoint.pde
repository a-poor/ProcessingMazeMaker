// GridPoint.pde
// Created by Austin Poor

class GridPoint {
  int x, y;
  float sq_w;
  boolean n,s,e,w,visited,current_node;
  
  GridPoint(int x_, int y_, int n_squares_, float sq_w_) {
    x = x_;
    y = y_;
    n_squares = n_squares_;
    sq_w = sq_w_;
    
    visited = false;
    current_node = false;
    
    n = true;
    s = true;
    e = true;
    w = true;
  }
  void show() {
    push();
    translate(x*sq_w, y*sq_w);
    //Draw BG Square
    noStroke();
    //if (current_node) fill(100,200,100);
    //else if (visited) fill(200,100,200);
    //else fill(50);
    if (visited) fill(255);
    else fill(0);
    rect(0,0,sq_w,sq_w);
    //Draw Walls
    noFill();
    stroke(0);
    strokeWeight(2);
    strokeCap(ROUND);
    if (n) line(   0,   0,sq_w,   0);
    if (e) line(sq_w,   0,sq_w,sq_w);
    if (s) line(   0,sq_w,sq_w,sq_w);
    if (w) line(   0,   0,   0,sq_w);
    pop();
  }
  int get_dir(GridPoint[][] grid) {
    int i = 0;
    int[] choices = new int[4];
    if (y-1 >= 0 && !grid[y-1][x].visited) { //North
      choices[i] = 0;
      i++;
    }
    if (x+1 < n_squares && !grid[y][x+1].visited) { //East
      choices[i] = 1;
      i++;
    }
    if (y+1 < n_squares && !grid[y+1][x].visited) { //South
      choices[i] = 2;
      i++;
    }
    if (x-1 >= 0 && !grid[y][x-1].visited) { //West
      choices[i] = 3;
      i++;
    }
    if (i == 0) {
      return -1;
    } else {
      int c = floor(random(i));
      return choices[c];
    }
  }
}
