PImage source;  // source image to work with

// this runs once
void setup() {
  //  width height
  size(800, 530); // size of canvas matches source image

  // load the image
  source = loadImage("van.JPG");

  // we want to manipulate the pixels of this image directly
  source.loadPixels();

  // make a loope that lets us look at all pixels
  // from 0 to 423,999 (800 * 500)
  int position = 0;  // make a simple variable that starts at 0
  //loop so long as position is less then or equal to 423,999
  while (position<= 423999) {

    //get the brightness
    float b = brightness(source.pixels[position]);
    float diameter = map(b, 0, 255, 1, 10);

    // where to draw the ellipse
    int x = position % width;
    int y = position / width;

    //draw an ellipse for every 100th pixel
    //   CONDITION 1  AND  CONDITION 2
    if ( (x % 10 == 0) && (y % 10 == 0  )) {
      ellipse(x, y, diameter, diameter); // draw at (x, y) with given diameter
    }

    // increment the position 
    position += 1;
  }
}

// this runs repeatedly until we tell it to stop
void draw() {
}
