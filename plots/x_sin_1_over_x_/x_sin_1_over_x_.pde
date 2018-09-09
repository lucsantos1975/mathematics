/***************************************************
 * Function animated plot 
 * f(x) = x sin(1/x)
 *
 ***************************************************/

float px, x;
float py, y;
float unityFactor = 200;
color functionColor = color(255, 0, 0);

void setup() {
    size(1000, 480);
    background(255);
    
    drawUnityFactorAxis();
    drawAxis();
    drawFunction();
    
    x = width/2 * (-1) - 20;
    y = 0;
    
    px = x;
    py = y;
}

void draw() {
    if (x > (width / 2)) {
        noLoop();
    }
    
    y = (x / unityFactor) * sin(1 / (x / unityFactor)) * unityFactor;
    
    translate(width/2, height/2);
    
    stroke(functionColor);
    strokeWeight(1);
    line(px, -py, x, -y);
    
    px = x;
    py = y;
    x += 1;
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
    
    float xf1 = width/2 - unityFactor;
    float xf2 = width/2 + unityFactor;
    
    float yf1 = height/2 - unityFactor;
    float yf2 = height/2 + unityFactor;
    
    line(0, yf1, width, yf1);
    line(0, yf2, width, yf2);
    line(xf1, 0, xf1, height);
    line(xf2, 0, xf2, height);
    
    textSize(14);
    fill(150);
    text("-1", xf1 + 5, height/2 + 15);
    text("1", xf2 + 5, height/2 + 15);
    text("1", width/2 + 5, yf1 + 15);
    text("-1", width/2 + 5, yf2 + 15);
}

void drawFunction() {
    textSize(14);
    fill(functionColor);
    text("f(x) = x sin(x / 1)", 10, 20);
}
