
class BoardContainer extends Board
{
  private BoardContainer[][] board;

  public BoardContainer()
  {
    board = null;
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
    for (int i = 0; i < board.length; i++) 
    {
      for (int j = 0; j < board[i].length; j++) 
      {
        board[i][j].Draw();
      }
    }
  }
}

