/*
    Dos figuras regulares: polígono y estrella
*/

Poligono P;
Estrella E;
float px,py;
float ex,ey;

void setup()
{
  size(600,600);
  
  px = random(0,width);
  ex = random(0,width);
  py = random(0,height);
  ey = random(0,height);
  P = new Poligono(px,py,7,50);
  E = new Estrella(ex,ey,6,25,75);
}

void draw()
{
  background(50);
  
  fill(200,100,200);
  E.Dibujar();  

  fill(100,200,100);
  P.Dibujar();
  
  if ( P.Dentro(mouseX,mouseY) ) 
        fill(0,0,255);
  else if ( E.Dentro(mouseX,mouseY) )
        fill(0,255,0);
  else
        fill(255,0,0);
  circle(mouseX,mouseY,10);
  
  px++; py++;
  if ( px<0 ) px=width;
  if ( px>width ) px=0;
  if ( py<0 ) py=height;
  if ( py>height ) py=0;

  ex++; ey--;
  if ( ex<0 ) ex=width;
  if ( ex>width ) ex=0;
  if ( ey<0 ) ey=height;
  if ( ey>height ) ey=0;
  
  P.Mover(px,py);
  E.Mover(ey,ex);
}

/* Fin de archivo */
