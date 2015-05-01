final int lineThickness = 2;
final int distanceFromEdges = 5;

class Board
{
  //constants, done this way because Java enums confuse me
  public static final int EMPTY   = 0;
  public static final int PLAYER1 = 1;
  public static final int PLAYER2 = 2;

  protected int x;
  protected int y;
  protected int w;
  protected int h;
  
  protected int movesPerformed;
  protected int winner;

  private int[][] board;

  public Board()
  {
    CreateNewBoard();
    x = 0;
    y = 0;
    w = width;
    h = height;
    movesPerformed = 0;
    winner = EMPTY;
  }

  public Board(int xx, int yy, int ww, int hh)
  {
    CreateNewBoard();
    x = xx;
    y = yy;
    w = ww;
    h = hh;
    movesPerformed = 0;
    winner = EMPTY;
  }
  
  private void CreateNewBoard()
  {
    board = new int[3][3];
    for(int i = 0; i < board.length; i++)
    {
      for(int j = 0; j < board[i].length; j++)
      {
        board[i][j] = EMPTY;
      }
    }
  }

  public void ProcessMouseEvent()
  {
    //It is isn't in the bounds, no need to do anything
    //if this board is full, don't need to do it either
    if (mouseX < x || mouseY < y || mouseX > x + w || mouseY > y + h || movesPerformed == 9)
    {
      return;
    }
    //Update the board array
    for(int i = 0; i < board.length; i++)
    {
      for(int j = 0; j < board[i].length; j++)
      {
        //only have to process less-than since it checks in increasing order
        //also, only have to check one because the mouse can only click on one per turn
        if(mouseX < x + w * (i + 1) / 3 && mouseY < y + h * (j + 1) / 3)
        {
          if(board[i][j] == EMPTY)
          {
            board[i][j] = (playerOnesTurn ? PLAYER1 : PLAYER2 );
            playerOnesTurn = !playerOnesTurn;
            movesPerformed++;
            CheckForWin();
          }
          return;
        }
      }
    }
  }
  
  private void CheckForWin()
  {
    //slightly optimize things for early game
    if(movesPerformed < 3)
    {
      return;
    }
    boolean foundWin = false;
    //check the 8 ways, 1 by 1 in a loop for each player
    for(int i = PLAYER1; i <= PLAYER2; i++)
    {
      //stupid Processing doesn't do goto so I can't skip unnecessary if-statements :(
      //Rows
      if(board[0][0] == i && board[0][1] == i && board[0][2] == i)
        foundWin = true;
        
      if(board[1][0] == i && board[1][1] == i && board[1][2] == i)
        foundWin = true;

      if(board[2][0] == i && board[2][1] == i && board[2][2] == i)
        foundWin = true;

      //columns
      if(board[0][0] == i && board[1][0] == i && board[2][0] == i)
        foundWin = true;
        
      if(board[0][1] == i && board[1][1] == i && board[2][1] == i)
        foundWin = true;
        
      if(board[0][2] == i && board[1][2] == i && board[2][2] == i)
        foundWin = true;
        
      //diagonals
      if(board[0][0] == i && board[1][1] == i && board[2][2] == i)
        foundWin = true;
        
      if(board[2][0] == i && board[1][1] == i && board[0][2] == i)
        foundWin = true;
        
      //finally, resolve if a win was found
      if(foundWin)
      {
        winner = i;
        movesPerformed = 9; //Setting this to full closes off the board to other use
        return;
      }
    }
    //if it exits the loop but there were 9 moves performed, it is a cats-game.  Reset
    if(movesPerformed == 9)
    {
      CreateNewBoard();
      movesPerformed = 0;
      return;
    }
  }

  public void Draw()
  {
    if(movesPerformed < 9)
    {
      DrawLines();
      DrawPieces();
    }
    else
    {
      DrawWinner();
    }
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
  
  protected void DrawWinner()
  {
    if(winner == EMPTY)
    {
      println("Error: winner declared as the EMPTY type");
    }
    else if(winner == PLAYER1)
    {
      DrawX(x, y, w, h);
    }
    else
    {
      DrawY(x, y, w, h);
    }
  }

  protected void DrawX(int px, int py, int dx, int dy)
  {
    fill(255, 0, 0);
    noStroke();
    rect(px, py, dx, dy);
  }

  protected void DrawY(int px, int py, int dx, int dy)
  {
    fill(0, 0, 255);
    noStroke();
    ellipseMode(CORNER);
    ellipse(px, py, dx, dy);
  }
  
  public int GetWinner()
  {
    return winner;
  }
}


