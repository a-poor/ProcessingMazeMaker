// MazeWalker.pde
// Created by Austin Poor

class MazeWalker {
  int cX, cY, grid_size, n_visited;
  GridPoint[][] grid;
  boolean still_running;
  int[] queue;
  int queue_length;
  
  MazeWalker(GridPoint[][] grid_) {
    grid = grid_;
    cX = 0;
    cY = 0;
    grid[cY][cX].visited = true;
    grid_size = grid.length * grid[0].length;
    n_visited = 1;
    queue = new int[grid_size];
    queue[0] = 0;
    queue_length = 1;
  }
  void get_next_move() {
    if (n_visited < grid_size) {
      grid[cY][cX].current_node = false;
      int move = grid[cY][cX].get_dir(grid);
      if (move == -1) {
        //Nowhere to move from here
        int[] pos = new int[2];
        queue_length--;
        one2two_d(queue[queue_length-1], pos);
        cX = pos[0];
        cY = pos[1];
        grid[cY][cX].visited = true;
      } else {
        switch (move) {
          case 0: //North
            grid[cY][cX].n = false;
            cY--;
            grid[cY][cX].s = false;
            break;
          case 1: //East
            grid[cY][cX].e = false;
            cX++;
            grid[cY][cX].w = false;
            break;
          case 2: //South
            grid[cY][cX].s = false;
            cY++;
            grid[cY][cX].n = false;
            break;
          case 3: //West
            grid[cY][cX].w = false;
            cX--;
            grid[cY][cX].e = false;
            break;
        }
        grid[cY][cX].visited = true;
        grid[cY][cX].current_node = true;
        n_visited++;
        queue[queue_length] = two2one_d(cY,cX);
        queue_length++;
      }
    } else {
      println("Maze complete.");
      noLoop();
    }
  }
  void one2two_d(int n, int[] pos) {
    pos[0] = int(n / grid[0].length);
    pos[1] = int(n % grid[0].length);
  }
  int two2one_d(int c, int r) {
    return r * grid.length + c;
  }
}
