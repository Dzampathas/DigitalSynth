String[] imagesDir;
String savePath;

void selectFolder(File selection) {
  if(selection == null) {
   exit(); 
  } else{
    filePath = selection.getAbsolutePath();
    println(filePath);
    findImages();
    selectedFile = true;
  }
}

void findImages() {
  if(filePath != null) {
    File imgDir = new File(filePath);
    imgFile = imgDir.listFiles();
  }
}


void selectMidiPath(File selection) {
  if(selection == null) {
   exit(); 
  } else{
    savePath = selection.getAbsolutePath();
    println(savePath);
    score.writeMidiFile(savePath + "\\File.mid");
  }
}