dir = getDirectory("Choose file directory for analysis");
list = getFileList(dir);
output = dir + File.separator + "Subtracted" + File.separator;
File.makeDirectory(output);

images_array = newArray(10000);

for (i = 0; i < list.length; i++) {
	if(endsWith(list[i], ".tif")){
		open(dir + list[i]);
		name = getTitle();
		
		run("Subtract Background...", "rolling=50 sliding");
		run("Gaussian Blur...", "sigma=0.5 stack");
		run("Enhance Contrast...", "saturated=0.35");
		
		run("Channels Tool...");
		Stack.setDisplayMode("color");
		Stack.setChannel(1);
		run("Blue");
		setMinAndMax(0, 70);
		Stack.setChannel(2);
		run("Green");
		setMinAndMax(0, 70);
		Stack.setChannel(3);
		run("Magenta");
		setMinAndMax(0, 70);
		Stack.setChannel(4);
		run("Yellow");	
		setMinAndMax(0, 70);
		
		saveAs("tiff", output+name+"_subtracted.tif");
		
		run("Fresh Start");
	
	}
}
