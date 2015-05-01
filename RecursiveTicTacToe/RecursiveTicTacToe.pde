int boardDepth = 2;

BoardContainer board;
boolean playerOnesTurn = true;
int topLeft = 0;
int topRight = 0;
color backgroundColor = color(255);

void setup()
{
  size(950, 950);
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

void keyPressed()
{
  int val = 0;
  switch(key)
  {
    //At levels above 3, it gets too small to be functional.  Maybe uncomment this and try on a jumbotron someday.
    /*
    case '0':
      val++;
    case '9':
      val++;
    case '8':
      val++;
    case '7':
      val++;
    case '6':
      val++;
    case '5':
      val++;
    case '4':
      val++;
    */
    case '3':
      val++;
    case '2':
      val++;
    case '1':
      val++;
      break;
    default: //No need to respond if it wasn't a number
      return;
  }
  board = new BoardContainer(topLeft, topRight, width, height, val);
  loop();
}
