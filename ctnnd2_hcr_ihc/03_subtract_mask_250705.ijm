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
		run("Channels Tool...");
		Stack.setDisplayMode("color");
		Stack.setChannel(2);
		setAutoThreshold("Default dark no-reset");
		run("Threshold...");
		
		waitForUser("set Threshold, then press 'OK'");
		run("Create Selection");
		setBackgroundColor(0, 0, 0);
		run("Clear Outside", "stack");
		run("Select None");		
		
		Stack.setDisplayMode("composite");
		
		saveAs("tiff", output+name+"_subtracted.tif");
		
		run("Fresh Start");
	
	}
}
