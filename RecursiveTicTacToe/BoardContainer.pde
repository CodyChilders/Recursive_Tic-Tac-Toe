
class BoardContainer extends Board
{
  private Board[][] board;
  private int depth;

  public BoardContainer()
  {
    board = null;
  }
  
  public BoardContainer(int xx, int yy, int ww, int hh, int recursionDepth)
  {
    x = xx;
    y = yy;
    w = ww;
    h = hh;
    depth = recursionDepth;
    movesPerformed = 0;
    CreateNewBoard();
  }
  
  private void CreateNewBoard()
  {
    board = new Board[3][3];
    for(int i = 0; i < board.length; i++)
    {
      for(int j = 0; j < board[i].length; j++)
      {
        if(depth == 1)
        {
          board[i][j] = new Board(x + i * w / 3, y + j * h / 3, w / 3, h / 3);
        }
        else
        {
          board[i][j] = new BoardContainer(x + i * w / 3, y + j * h / 3, w / 3, h / 3, depth - 1);
        }
      }
    }
  }

  public void ProcessMouseEvent()
  {
    //It is isn't in the bounds, no need to do anything
    if (mouseX < x || mouseY < y || mouseX > x + w || mouseY > y + h)
    {
      return;
    }
    //Update the sub-boards
    for (int i = 0; i < board.length; i++) 
    {
      for (int j = 0; j < board[i].length; j++) 
      {
        board[i][j].ProcessMouseEvent();
      }
    }
  }

  public void Draw()
  {
    if(movesPerformed < 9)
    {
      DrawLines();
      for (int i = 0; i < board.length; i++) 
      {
        for (int j = 0; j < board[i].length; j++) 
        {
          board[i][j].Draw();
        }
      }
    }
    else
    {
      DrawWinner();
    }
  }
  
  private void CheckWin()
  {
    
  }
  
  public int GetWinner()
  {
    return 0;
  }
}

