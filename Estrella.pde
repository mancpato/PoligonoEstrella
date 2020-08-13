/*
    Estrella regular
    
    Métodos:
      - Constructor
      - Dibujar
      - Mover
      - Dentro (para saber si el punto dado está dentro
                de la estrella)
*/

class Estrella {
    float x, y;   // Coordenadas del centro
    int n;        // Cantidad de picos
    float rint;   // Radio interior
    float rext;   // Radio exterior
    
    Estrella(float X, float Y, int N, float Rint, float Rext) {
        x = X;
        y = Y;
        n = N;
        rint = Rint;
        rext = Rext;
    }
    void Dibujar() {
        float delta = TWO_PI / n;
        float delta_2 = delta / 2.0;
        
        beginShape();
        for (float t=0 ; t < TWO_PI; t += delta ) {
            float sx = cos(t) * rext;
            float sy = sin(t) * rext;
            vertex(x + sx, y + sy);
            
            sx = rint*cos(t+delta_2);
            sy = rint*sin(t+delta_2);
            vertex(x + sx, y + sy);
        }
        endShape(CLOSE);
    }
    
    void Mover(float X, float Y) {
      x = X;
      y = Y;
    }
    
    boolean Dentro(float X, float Y) {
        float D = Distancia(x,y,X,Y); 
        if ( D > rext )
            return false;
        if ( D < rint )
            return true;

        float px = x+rext;
        float py = y;
        float L = Distancia(X,Y,px,py);
        float Alfa = acos( (D*D + rext*rext - L*L)/(2*D*rext) );
        if ( y>Y )
            Alfa = TWO_PI - Alfa;
            
        float delta = TWO_PI / (2*n);
        float ant;
        float t;
        boolean ext=false;
        for ( t=0 ; t < Alfa ; t += delta ) 
            ext = !ext;
        ant = t-delta;
        
        float r1, r2;
        if ( ext ) {
            r1 = rext;
            r2 = rint;
        } else {
            r1 = rint;
            r2 = rext;
        }

        float x1 = x + r1*cos(ant);
        float y1 = y + r1*sin(ant);
        float x2 = x + r2*cos(t);
        float y2 = y + r2*sin(t);

        float ax = x2-x1;
        float ay = y2-y1;
        float bx = X-x;
        float by = Y-y;
        float p = x-x1;
        float q = y-y1;
        
        float Det = ax*by - ay*bx;
        float s = (p*by - q*bx)/Det;
        
        float ix =  x1 + s*ax;
        float iy =  y1 + s*ay;
        
        return D < Distancia(x,y,ix,iy) ? true : false;
    }
}

/* Fin de archivo */
