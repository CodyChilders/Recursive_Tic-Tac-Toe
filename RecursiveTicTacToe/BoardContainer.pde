
class BoardContainer extends Board
{
  private BoardContainer[][] board;

  public BoardContainer()
  {
    board = null;
  }

  public void ProcessMouseEvent()
  {
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        board[i][j].ProcessMouseEvent();
      }
    }
  }

  public void Draw()
  {
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        board[i][j].Draw();
      }
    }
  }
}

