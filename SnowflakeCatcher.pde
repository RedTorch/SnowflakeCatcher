SnowFlake [] snowstorm;
int preX;
int preY;
boolean firststroke = true;
void setup()
{
  size(400,400);
  background(0);
  snowstorm = new SnowFlake[500];
  for(int i = 0; i < snowstorm.length; i++)
  {
    snowstorm[i] = new SnowFlake();
  }
}
void draw()
{
  //background(0);
  for(int i = 0; i < snowstorm.length; i++)
  {
    if(snowstorm[i].falling==true)
      snowstorm[i].erase();
    snowstorm[i].lookDown();
    snowstorm[i].move();
    snowstorm[i].wrap();
    snowstorm[i].show();
  }
}
void mouseDragged()
{
  if(mouseButton==LEFT)
  {
  if(firststroke==true)
  {
    preX=mouseX;
    preY=mouseY;
    firststroke=false;
  }
  stroke(150);
  line(preX,preY,mouseX,mouseY);
  preX=mouseX;
  preY=mouseY;
  }
  else
  {
    noStroke();
    fill(0);
    rect(mouseX-6,mouseY-6,12,12);
  }
}
void mouseReleased()
{
  firststroke=true;
}

class SnowFlake
{
  int x;
  int y;
  boolean falling;
  SnowFlake()
  {
    x = (int)(Math.random()*400);
    y = (int)(Math.random()*400);
  }
  void show()
  {
    stroke(255);
    point(x,y);
  }
  void lookDown()
  {
    if((get(x,y+1) != color(0))&&(y<=398))
    {
      falling = false;
    }
    else {
      falling = true;
    }
  }
  void erase()
  {
    stroke(0);
    strokeWeight(2);
    point(x,y);
    strokeWeight(1);
  }
  void move()
  {
    if(falling == true)
    {
      y++;
    }
    else if (falling == false) {
      if((get(x+1,y+1) == color(0))&&(get(x+1,y) == color(0)))
      {
        x++;
      }
      else if((get(x-1,y+1) == color(0))&&(get(x-1,y) == color(0)))
      {
        x--;
      }
    }
  }
  void wrap()
  {
    if(y>400)
    {
      y = 0;
      x = (int)(Math.random()*400);
    }
  }
}