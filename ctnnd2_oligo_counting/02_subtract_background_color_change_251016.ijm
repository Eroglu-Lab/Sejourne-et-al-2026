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
		Stack.setChannel(2);
		run("Red");
		setMinAndMax(0, 150);
		Stack.setChannel(3);
		run("Cyan");
		setMinAndMax(0, 50);
		Stack.setChannel(4);
		run("Yellow");
		setMinAndMax(0, 150);
		Stack.setChannel(1);
		run("Grays");
		Stack.setDisplayMode("composite");
		
		saveAs("tiff", output+name+"_subtracted.tif");
		
		run("Fresh Start");
	
	}
}
