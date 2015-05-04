int HUDStartX;
int HUDwidth;
int offsetBetweenStrings = 110;
int edgeOffset = 15;

final String[] instructions = { 
                                "Instructions:",
                                "- Click in a space\nto claim it",
                                "- Win small games to\nprogress the\nbigger game",
                                "- 1, 2, and 3 start\na new game",
                                "- 1, 2, and 3 are\nthe number of\nsub-games in each\nmain game",
                                "- You can't start a\nnew game in the\nmiddle of a game",
                                "- Made by:\nCody Childers"
                               };

void SetupHUD()
{
  //Take the min because the game should always be square.  HUD gets what is left of the rectangle.
  HUDStartX = min(w, h);  
  HUDwidth = max(w, h) - min(w, h);
}

void DrawHUD()
{
  DrawDividerLine();
  DrawTurnText();
  DrawInstructions();
}

void DrawDividerLine()
{
  stroke(0);
  strokeWeight(2);
  line(HUDStartX, 0, HUDStartX, height);
}

void DrawTurnText()
{
  noStroke();
  textSize(32);
  if(playerOnesTurn)
  {
    fill(255, 0, 0);
  }
  else
  {
    fill(0, 0, 255);
  }
  String turnDisplay = String.format("%s's turn", (playerOnesTurn ? "X" : "O"));
  text(turnDisplay, HUDStartX + edgeOffset, 50);
}

void DrawInstructions()
{
  int stringsPrinted = 0;
  int startY = 200;
  fill(0);
  textSize(20);
  for(String s : instructions)
  {
    text(s, HUDStartX + edgeOffset, startY + stringsPrinted++ * offsetBetweenStrings);
  }
}

void DrawWinnerText()
{
  int x = min(width, height) / 2;
  int y = min(width, height) / 2;
  fill(0);
  textSize(100);
  //This value will be reversed since the last move toggles it anyway
  if(playerOnesTurn)
  {
    DrawPlayerTwoWins(x, y);
  }
  else
  {
    DrawPlayerOneWins(x, y);
  }
}

void DrawPlayerOneWins(int x, int y)
{
  text("X wins!", x, y);
}

void DrawPlayerTwoWins(int x, int y)
{
  text("O wins!", x, y);
}
