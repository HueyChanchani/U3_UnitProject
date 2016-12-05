class Line
{
  
 PVector _sPoint;
 PVector _ePoint;
 color _c;
 
 Line(PVector sPoint, PVector ePoint)
 {
   _sPoint = sPoint;
   _ePoint = ePoint;
   _c = color((random(0,255)), (random(0,255)), (random(0,255)));
 }
 
 public void Draw()
 {
   stroke(_c);
   line(_sPoint.x, _sPoint.y, _ePoint.x, _ePoint.y); 
 }
}