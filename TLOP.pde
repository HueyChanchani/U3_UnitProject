class TLOP
{
  String _TLOP;
  float _x;
  float _y;
  color _n;

  TLOP(float x, float y, String TLOP)
  {
    _x = x;
    _y = y;
    _TLOP = TLOP;
  }

  public void Pablo()
  {
    fill(0);
    textSize(50);
    _x = random(width);
    _y = random(height);
    text("THE LIFE OF PABLO", _x, _y);
  }
}