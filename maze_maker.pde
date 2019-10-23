// maze_maker.pde
// Created by Austin Poor

GridPoint[][] grid;
MazeWalker walker;
int n_squares = 30;
float grid_w;

boolean save_frame = false;
String filename = "maze_build_1/frame_#####.png";

void setup() {
  size(900, 900);
  frameRate(60);
  grid_w = width / n_squares;
  grid = new GridPoint[n_squares][n_squares];
  for (int i = 0; i < grid.length; i++)
    for (int j = 0; j < grid[0].length; j++)
      grid[i][j] = new GridPoint(j, i, n_squares, grid_w);
  walker = new MazeWalker(grid);
}

void draw() {
  walker.get_next_move();
  for (int i = 0; i < grid.length; i++)
    for (int j = 0; j < grid[0].length; j++)
      grid[i][j].show();
  if (save_frame) {
    saveFrame(filename);
  }
}
