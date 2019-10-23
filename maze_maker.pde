 GridPoint[][] grid;
 MazeWalker walker;
 int n_squares = 10;
 float grid_w;
 
 boolean save_frame = false;
 String filename = "maze_build_1/frame_#####.png";
 
 void setup() {
   size(900,900);
   //frameRate(6);
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
   //println(frameRate);
   if (save_frame) {
     saveFrame(filename);
   }
 }
 
 void mouseClicked() {
   int i = int(mouseY / grid_w);
   int j = int(mouseX / grid_w);
   grid[i][j].visited = true;
 }
