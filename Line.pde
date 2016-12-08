class Line
{

  color[] colors = {color(#604439), color(#9e9a75), 
                  color(#1c222e), color(#41533b)};
                  
  PVector _sPoint;
  PVector _ePoint;
  color _c;

  Line(PVector sPoint, PVector ePoint)
  {
    _sPoint = sPoint;
    _ePoint = ePoint;
    _c = (colors[(int)random(4)]);
  }

  public void Draw()
  {
    strokeWeight(3);
    stroke(_c);
    line(_sPoint.x, _sPoint.y, _ePoint.x, _ePoint.y, _sPoint.z, _ePoint.z);
  }
}