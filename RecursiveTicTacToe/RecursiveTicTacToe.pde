// (w > h) should always be true
static final int w = 1150;
static final int h = 950;

int boardDepth = 2;

BoardContainer board;
boolean playerOnesTurn = true;
boolean freshBoard = true;
int topLeft = 0;
int topRight = 0;
color backgroundColor = color(255);

void setup()
{
  size(w, h);
  smooth();
  board = new BoardContainer(topLeft, topRight, min(w, h), min(w, h), boardDepth);
  SetupHUD();
  audio = new Audio();
}

void draw()
{
  background(backgroundColor);
  board.Draw();
  DrawHUD();
  if(GameDone())
    DrawWinnerText();
  noLoop();
}

void mousePressed(){
  freshBoard = false;
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
    case 'r':
      val = 2;
      freshBoard = true;
      break;
    default: //No need to respond if it wasn't a number
      return;
  }
  //This prevents it from resetting the game if it is in the middle of one
  if(freshBoard || GameDone())
  {
    board = new BoardContainer(topLeft, topRight, min(w, h), min(w, h), val);
    playerOnesTurn = true;
    freshBoard = true;
    loop();
  }
}

