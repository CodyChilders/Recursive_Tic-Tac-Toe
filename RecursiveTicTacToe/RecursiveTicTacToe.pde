final int boardDepth = 2;

BoardContainer board;
boolean playerOnesTurn = true;
int topLeft = 0;
int topRight = 0;
color backgroundColor = color(255);

void setup()
{
  size(800, 800);
  //board = new Board(topLeft, topRight, width, height);
  board = new BoardContainer(topLeft, topRight, width, height, boardDepth);
}

void draw()
{
  background(backgroundColor);
  board.Draw();
  noLoop();
}

void mousePressed(){
  board.ProcessMouseEvent();
  loop();
}

