/*
    Polígono regular
    
    Métodos:
      - Constructor
      - Dibujar
      - Mover
      - Dentro (para saber si el punto dado está dentro
                del polígono)
*/

class Poligono {
    float x, y;   // Coordenadas del centro
    int n;        // Cantidad de lados
    float r;      // Radio a los vértices
    
    Poligono(float X, float Y, int N, float R) {
        x = X;
        y = Y;
        n = N;
        r = R;
    }
    void Dibujar() {
        float delta = TWO_PI / n;
        beginShape();
        for (float t=0 ; t < TWO_PI ; t += delta ) {
            float vx = r*cos(t);
            float vy = r*sin(t);
            vertex(x + vx, y + vy);
        }
        endShape(CLOSE);
    }

    void Mover(float X, float Y) {
        x = X;
        y = Y;
    } 
    
    boolean Dentro(float X, float Y) {
        float D = dist(x,y,X,Y); 
        if ( D > r )
            return false;
        float Apotema = r*cos(PI/n);
        if ( D < Apotema )
            return true;

        float px = x+r;
        float py = y;
        float L = dist(X,Y,px,py);
        float Alfa = acos( (D*D + r*r - L*L)/(2*D*r) );
        if ( y>Y )
            Alfa = TWO_PI - Alfa;
        
        float delta = TWO_PI / n;

        float ant = 0;
        float t;
        for ( t=0 ; t < Alfa ; t += delta )
            ;
        ant = t-delta;

        float x1 = x + r*cos(ant);
        float y1 = y + r*sin(ant);
        float x2 = x + r*cos(t);
        float y2 = y + r*sin(t);
        
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
        
        return D < dist(x,y,ix,iy) ? true : false;
    }
}

/* Fin de archivo */
