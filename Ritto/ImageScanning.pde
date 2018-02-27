//create image class with R, G, and B variables
class soundImage {
  PImage img;
  int wholeImage;
  //setup
  soundImage (File input){
    img = loadImage(input.getAbsolutePath());
    img.loadPixels();
    img.resize(width, height);
    wholeImage = img.width * img.height;
  }
  public void display() {
    image(img, 0,0);
  }
  //creating the redValues
  int redValue(){
    float sum = 0;
    for(int i =0; i < wholeImage; i++) {
      sum += red(img.pixels[i]);
    }
    return round(map(sum/wholeImage,0,255,0,100));
  }
  //creating the blueValues
  int blueValue(){
    float sum = 0;
    for(int i =0; i < wholeImage; i++) {
      sum += blue(img.pixels[i]);
    }
    return round(map(sum/wholeImage,0,255,0,100));
  }
  //creating the green values
  float greenValue(){
    float sum = 0;
    for(int i =0; i < wholeImage; i++) {
      sum += green(img.pixels[i]);
    }
    return map(sum/wholeImage,0,255,0,3);
  }
  
}