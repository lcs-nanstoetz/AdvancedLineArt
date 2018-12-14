float turtleX;
float turtleY;
float turtleHeading = 0;



import processing.pdf.*;
PImage bitmapImage;
PGraphics vectorImage;

// this runs once
void setup() {
  //  WIDTH  HEIGHT
  size(600, 600); // size of canvas matches bitmapImage image
  
  noFill();
  strokeWeight(2);
  background(255);

  // load the image
  bitmapImage = loadImage("van.JPG");

  // we want to manipulate the pixels of this image directly
  bitmapImage.loadPixels();
  
  // create the empty output PDF
  vectorImage = createGraphics(width, height, PDF, "output.pdf");
  
  // start drawing to the output PDF file
  vectorImage.beginDraw();

  // Make a loop that lets us look at all pixels
  // From 0 to 423,999 (800 x 530)
  int position = 0;  // make a simple variable that starts at 0
  // loop so long as position is less than or equal to 423,999
  while (position <= 359999) {
    
    // Get the brightness
    float b = 255 - brightness(bitmapImage.pixels[position]);  // 0 to 255
    float diameter = map(b, 0, 255, 2, 5);         // 1 to 8
    
    // Where to draw the ellipse?
    int x = position % width;
    int y = position / width;
    
    // Draw an ellipse for every 100th pixel
    //   CONDITION1   AND  CONDITION2
    if ( (x > 0) && (x % 7 == 0) && (y > 0) && (y % 7 == 0) ) {

      ellipse(x, y, diameter, diameter);  // Draw at (x, y) with given diameter
      
      // draw the circle to the PDF
      vectorImage.ellipse(x, y, diameter, diameter); // draw circle at (x, y) with given diameter

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
//}
//func randomLines(withinRadius radius : Double) {
       
//        // Make the line size be twice the radius
//        let size = radius * 2
        
//        // Make sure the point generated is inside the circle
//        var x1 = 0.0
//        var y1 = 0.0
//        repeat {
//            x1 = self.random(size) - size / 2
//            y1 = self.random(size) - size / 2
//        } while outsideCircle(radius: radius, xPos: x1, yPos: y1)
        
//        // Now go to the starting point
//        self.goto(x1, y1)
//        self.penDown()
        
//        // Make sure the endpoint is in the circle
//        var x2 = 0.0
//        var y2 = 0.0
//        repeat {
            
//            x2 = self.random(size) - size / 2
//            y2 = self.random(size) - size / 2
            
//        } while outsideCircle(radius: radius, xPos: x2, yPos: y2)
        
//        // draw the line to the endpoint
//        self.goto(x2,y2)
        
//        self.penUp()
        
//    }
    
//    func outsideCircle(radius : Double, xPos : Double, yPos : Double) -> Bool {
//        let distance = sqrt(xPos * xPos + yPos * yPos)
//        if distance > radius {
//            return true
//        } else {
//            return false
//        }
//    }
