//initiallizing all of the requirements to run
  import arb.soundcipher.*;
  import arb.soundcipher.constants.*;
//Global Varriables
  File[] imgFile;
  soundImage image;
  String filePath;
  boolean selectedFile = false;
  boolean firstTime = true;
  float notePlace = 0;
  boolean saving = false;
//creating the score  
  SCScore score = new SCScore();
  
void setup(){
  selectFolder("Select folder of imgFile.getAbsolutePath()", "selectFolder");
  //initializing the program
    size(500,500);
}

void draw(){
  if(selectedFile == true){
    if(imgFile[0] == null) {
      exit();
      } else {
        if(firstTime == true){
          readImages();
        } else {
          if(saving == false) {
             selectFolder("Select folder to save", "selectMidiPath");
             saving = true;
          }
          if(score.playing == false){
              score.play(); 
          }
        }
    }
  }
  
  
}


void readImages() {
  for(int i = 0; i < imgFile.length; i ++){
    println(i);
   image = new soundImage(imgFile[i]);
   //Check if the next note is too similar
   int count = 0;
   boolean stillSimilar = true;
   int b = i;
   while(stillSimilar){
     if(b < imgFile.length){
       soundImage Temp = new soundImage(imgFile[b]);
       b++;
       if(image.redValue() == Temp.redValue()){
         count++;
       } else {
          stillSimilar = false; 
       }
       } else {
      stillSimilar = false; 
     }
   }
   //end check
   //score.addNote(notePlace,image.redValue(),image.blueValue(),image.greenValue() * count*2);
   score.addNote(notePlace,map(image.redValue(),0,127,0,10),map(image.blueValue(),0,127,1,10),image.redValue(),map(image.greenValue(),0,3,0,127),image.greenValue() * count*2,0.8,64);
   notePlace += ((count+1)/2)*(image.greenValue()/3);
   println(notePlace);
   i += count;
   count = 0;
   firstTime = false;
 }
}