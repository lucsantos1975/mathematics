/*************************************************************
 * Function animated plot - Basic trigonometric functions 
 * f(x) = sin(x)
 * g(x) = cos(x)
 * h(x) = tan(x)
 *************************************************************/

float px, x;
float py, y;

float unityFactor = 100;

color sinColor = color(255, 0, 0);
color cosColor = color(0, 0, 255);
color tanColor = color(0, 115, 0);

boolean drawSin = true;
boolean drawCos = false;
boolean drawTan = false;

void setup() {
    size(840, 480);
    background(255);
    
    drawUnityFactorAxis();
    drawAxis();
    
    x = width/2 * (-1) - 20;
    y = 0;
    
    px = x;
    py = y;
    
    strokeWeight(1);
}

void draw() {
    if (x > (width / 2) && (drawSin || drawCos || drawTan)) {
        x = width/2 * (-1) - 20;
        y = 0;
        
        px = x;
        py = y;
        
        if (drawSin) {
            drawSin = false;
            drawCos = true;
        } else if (drawCos) {
            drawCos = false;
            drawTan = true;
        } else {
            drawTan = false;
        }
    }
    
    if (drawSin) {
        y = sin(x / (unityFactor/4)) * unityFactor;
        stroke(sinColor);
    } else if (drawCos) {
        y = cos(x / (unityFactor/4)) * unityFactor;
        stroke(cosColor);
    } else if (drawTan) {
        y = tan(x / (unityFactor/4)) * unityFactor;
        stroke(tanColor);
    } else {
        noLoop();
        return;
    }
    
    translate(width/2, height/2);
    
    if (y >= (0.0 - height) && y <= (2 * height)) {
        line(px, -py, x, -y);
    }
    
    px = x;
    py = y;
    x += 1;
    
    drawFunction();
}

void drawAxis() {
    strokeWeight(1);    
    stroke(0);
    line(width/2, 0, width/2, height);
    line(0, height/2, width, height/2);
    
    textSize(14);
    fill(0);
    text("y", width/2 + 5, 10);
    text("x", width - 15, height/2 + 15);
}

void drawUnityFactorAxis() {
    strokeWeight(1);
    stroke(215);
    
    float xf1 = width/2 - ((unityFactor/4) * PI);
    float xf2 = width/2 + ((unityFactor/4) * PI);
    
    float yf1 = height/2 - unityFactor;
    float yf2 = height/2 + unityFactor;
    
    line(0, yf1, width, yf1);
    line(0, yf2, width, yf2);
    line(xf1, 0, xf1, height);
    line(xf2, 0, xf2, height);
    
    textSize(14);
    fill(150);
    text("-π", xf1 + 5, height/2 + 15);
    text("π", xf2 + 5, height/2 + 15);
    text("1", width/2 + 5, yf1 - 12);
    text("-1", width/2 + 5, yf2 + 15);
}

void drawFunction() {
    fill(255);
    stroke(0);
    rect(-width/2, -height/2, 150, 80);
    
    textSize(14);
    
    fill(sinColor);
    text("f(x) = sin(x)", (-width/2 + 10), (-height/2 + 20));
    
    fill(cosColor);
    text("g(x) = cos(x)", (-width/2 + 10), (-height/2 + 45));
    
    fill(tanColor);
    text("h(x) = tan(x)", (-width/2 + 10), (-height/2 + 70));
}
