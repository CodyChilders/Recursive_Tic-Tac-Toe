
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
    //slightly optimize things for early game
    if(movesPerformed < 3)
    {
      return;
    }
    boolean foundWin = false;
    //check the 8 ways, 1 by 1 in a loop for each player
    for(int i = PLAYER1; i <= PLAYER2; i++)
    {
      //stupid Processing doesn't do goto so I can't skip unnecessary if-statements without nesting them in elses :(
      //Rows
      if(board[0][0].GetWinner() == i && board[0][1].GetWinner() == i && board[0][2].GetWinner() == i)
        foundWin = true;
        
      if(board[1][0].GetWinner() == i && board[1][1].GetWinner() == i && board[1][2].GetWinner() == i)
        foundWin = true;

      if(board[2][0].GetWinner() == i && board[2][1].GetWinner() == i && board[2][2].GetWinner() == i)
        foundWin = true;

      //columns
      if(board[0][0].GetWinner() == i && board[1][0].GetWinner() == i && board[2][0].GetWinner() == i)
        foundWin = true;
        
      if(board[0][1].GetWinner() == i && board[1][1].GetWinner() == i && board[2][1].GetWinner() == i)
        foundWin = true;
        
      if(board[0][2].GetWinner() == i && board[1][2].GetWinner() == i && board[2][2].GetWinner() == i)
        foundWin = true;
        
      //diagonals
      if(board[0][0].GetWinner() == i && board[1][1].GetWinner() == i && board[2][2].GetWinner() == i)
        foundWin = true;
        
      if(board[2][0].GetWinner() == i && board[1][1].GetWinner() == i && board[0][2].GetWinner() == i)
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
}

