Board board;
boolean playerOnesTurn = true;
int topLeft = 0;
int topRight = 0;

void setup()
{
  size(800, 800);
  board = new Board(topLeft, topRight, width, height);
}

void draw()
{
  background(255);
  board.Draw();
  noLoop();
}

void mousePressed(){
  board.ProcessMouseEvent();
  loop();
}
