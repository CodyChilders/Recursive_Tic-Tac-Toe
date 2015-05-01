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
    //update the board array
    
  }

  public void Draw()
  {
    stroke(0);
    strokeWeight(lineThickness);
    //draw the board
    line(x + distanceFromEdges, y + h / 3            , x + w - distanceFromEdges, y + h / 3                );
    line(x + distanceFromEdges, y + h * 2 / 3        , x + w - distanceFromEdges, y + h * 2 / 3            );
    line(x + w / 3            , y + distanceFromEdges, x + w / 3                , y + h - distanceFromEdges);
    line(x + w * 2 / 3        , y + distanceFromEdges, x + w * 2 / 3            , y + h - distanceFromEdges);
    //draw x's and o's
    
  }
}

