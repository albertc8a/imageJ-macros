// Fiji (ImageJ) Macro to open images from multiple folders, excluding _Overlay.tif and .bcf files, and create a stack

macro "Open Images and Create Stack" {
    inputDir = getDirectory("Select the parent directory");
    folderList = getFileList(inputDir);
    run("Close All"); // Ensure a clean workspace
    
    for (i = 0; i < folderList.length; i++) {
        folderPath = inputDir + folderList[i];
        if (File.isDirectory(folderPath)) {
            fileList = getFileList(folderPath);
            for (j = 0; j < fileList.length; j++) {
                if (endsWith(fileList[j], ".tif") && !endsWith(fileList[j], "_Overlay.tif")) {
                    open(folderPath + "/" + fileList[j]);
                }
            }
        } else {
            if (endsWith(folderList[i], ".tif") && !endsWith(folderList[i], "_Overlay.tif")) {
                open(inputDir + folderList[i]);
            }
        }
    }
    
    run("Images to Stack", "use"); // Convert opened images to a stack
}