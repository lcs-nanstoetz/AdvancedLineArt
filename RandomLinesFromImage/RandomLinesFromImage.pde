float turtleX;
float turtleY;
float turtleHeading = 0;



import processing.pdf.*;
PImage bitmapImage;
PGraphics vectorImage;

// this runs once
void setup() {
  //  WIDTH  HEIGHT
  size(550, 550); // size of canvas matches bitmapImage image
  
  noFill();
  strokeWeight(2);
  background(255);

  // load the image
  bitmapImage = loadImage("image.jpg");

  // we want to manipulate the pixels of this image directly
  bitmapImage.loadPixels();
  
  // create the empty output PDF
  vectorImage = createGraphics(width, height, PDF, "output.pdf");
  
  // start drawing to the output PDF file
  vectorImage.beginDraw();

  // Make a loop that lets us look at all pixels
  // From 0 to 423,999 (550 x 550)
  int position = 0;  // make a simple variable that starts at 0
  // loop so long as position is less than or equal to 423,999
  while (position <= 302499) {
    
    // Get the brightness
    float b = 255 - brightness(bitmapImage.pixels[position]);  // 0 to 255
    float diameter = map(b, 0, 255, 2, 10);         // 1 to 8
    
    // Where to draw the ellipse?
    int x = position % width;
    int y = position / width;
    
    // Draw an ellipse for every 100th pixel
    //   CONDITION1   AND  CONDITION2
    if ( (x > 0) && (x % 12 == 0) && (y > 0) && (y % 12 == 0) ) {

     // ellipse(x, y, diameter, diameter);  // Draw at (x, y) with given diameter
     int timesToRepeat = round(diameter) / 2 ;
     int j = 0;
     while (j  < timesToRepeat) {
       randomLine(diameter / 2, x, y);
       j += 1; 
     }
      
    }
  
    
    
    // Increment the position
    position += 1;
    
  }
  
  // Stop drawing to the PDF
  vectorImage.endDraw();
  vectorImage.dispose();
  vectorImage = null;
}
    


// this runs repeatedly until we tell it to stop
void draw() {
}


void forward(float amount) {
  
  float newX = turtleX + cos(radians(turtleHeading)) * amount;
  float newY = turtleY + sin(radians(turtleHeading)) * amount;

  line(turtleX, turtleY, newX, newY);
  fill(0);
  
  turtleX = newX;
  turtleY = newY;
}

void rotateTurtle(float degrees) {
  turtleHeading += degrees;
}

void penUp() {
  noStroke();
}

void penDown() {
 strokeWeight(1);
}


 
void randomLine(float radius, float centreX, float centreY) {
 
  // Make the line size be twice the radius
  final float size = radius * 2;
 
  // Make sure the point generated is inside the circle
  float x1 = 500.0;
  float y1 = 500.0;
  while (outsideCircle(radius, centreX, centreY, x1, y1) == true) {
      x1 = random(size) - size / 2 + centreX;
      y1 = random(size) - size / 2 + centreY;
  } 
          
  // Make sure the endpoint is in the circle
  float x2 = 500.0;
  float y2 = 500.0;
  while (outsideCircle(radius, centreX, centreY, x2, y2) == true) {
      x2 = random(size) - size / 2 + centreX;
      y2 = random(size) - size / 2 + centreY;
  } 
  
  //draw random line
  vectorImage.line(x1, y1, x2, y2); 
  line(x1, y1, x2, y2); //<>//
  
}
    
boolean outsideCircle(float radius, float centreX, float centreY, float endXPos, float endYPos) {
  
    final float distance = sqrt(pow(centreX - endXPos, 2) + pow(centreY - endYPos, 2) );
    if (distance > radius) {
        return true;
    } else {
        return false;
    }
}
