final int lineThickness = 2;
final int distanceFromEdges = 5;

class Board
{
  //constants, done this way because Java enums confuse me
  private static final int EMPTY   = 0;
  private static final int PLAYER1 = 1;
  private static final int PLAYER2 = 2;

  protected int x;
  protected int y;
  protected int w;
  protected int h;

  private int[][] board;

  public Board()
  {
    x = 0;
    y = 0;
    w = width;
    h = height;
  }

  public Board(int xx, int yy, int ww, int hh)
  {
    board = new int[3][3];
    for(int i = 0; i < board.length; i++)
    {
      for(int j = 0; j < board[i].length; j++)
      {
        board[i][j] = EMPTY;
      }
    }
    x = xx;
    y = yy;
    w = ww;
    h = hh;
  }

  public void ProcessMouseEvent()
  {
    //It is isn't in the bounds, no need to do anything
    if (mouseX < x || mouseY < y || mouseX > x + w || mouseY > y + h)
    {
      return;
    }
    //Update the board array
    //First column
    for(int i = 0; i < board.length; i++)
    {
      for(int j = 0; j < board[i].length; j++)
      {
        //only have to process less-than since it checks in increasing order
        //also, only have to check one because the mouse can only click on one per turn
        if(mouseX < x + w * (i + 1) / 3 && mouseY < y + h * (j + 1) / 3)
        {
          board[i][j] = (playerOnesTurn ? PLAYER1 : PLAYER2 );
          playerOnesTurn = !playerOnesTurn;
          return;
        }
      }
    }
  }

  public void Draw()
  {
    DrawLines();
    DrawPieces();
  }

  private void DrawPieces()
  {
    //draw x's and o's
    for (int i = 0; i < board.length; i++) 
    {
      for (int j = 0; j < board[i].length; j++) 
      {
        int piece = board[i][j];
        //If the cell is empty, move on to the next one
        if(piece == EMPTY)
        {
          continue;
        }
        else
        {
          //Determine the size and location of the token
          int px = x + i * w / 3;
          int py = y + j * h / 3;
          int dx = w / 3;
          int dy = h / 3;
          //Draw the correct shape
          if(piece == PLAYER1)
          {
            DrawX(px, py, dx, dy);
          }
          else if(piece == PLAYER2)
          {
            DrawY(px, py, dx, dy);
          }
          else
          {
            println("ERROR: invalid option detected in a board: " + piece);
          }
        }
      }
    }
  }

  private void DrawLines()
  {
    stroke(0);
    strokeWeight(lineThickness);
    //draw the board
    line(x + distanceFromEdges, y + h / 3            , x + w - distanceFromEdges, y + h / 3                );
    line(x + distanceFromEdges, y + h * 2 / 3        , x + w - distanceFromEdges, y + h * 2 / 3            );
    line(x + w / 3            , y + distanceFromEdges, x + w / 3                , y + h - distanceFromEdges);
    line(x + w * 2 / 3        , y + distanceFromEdges, x + w * 2 / 3            , y + h - distanceFromEdges);
  } 

  private void DrawX(int px, int py, int dx, int dy)
  {
    fill(255, 0, 0);
    noStroke();
    rect(px, py, dx, dy);
  }

  private void DrawY(int px, int py, int dx, int dy)
  {
    fill(0, 0, 255);
    noStroke();
    ellipseMode(CORNER);
    ellipse(px, py, dx, dy);
  }
}


