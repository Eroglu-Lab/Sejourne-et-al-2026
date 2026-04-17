dir = getDirectory("Choose file directory for analysis");
list = getFileList(dir);
output = dir + File.separator + "Representative Images" + File.separator;
File.makeDirectory(output);

images_array = newArray(10000);
angles_array = newArray(10000);
max_inten = newArray(10000);
min_inten = newArray(10000);
length_array = newArray(10000);

for (i = 0; i < list.length; i++) {
	if(endsWith(list[i], ".tif")){
		open(dir + list[i]);
		name = getTitle();
		max_proj = "MAX_"+name;
		run("Subtract Background...", "rolling=50");
		run("Z Project...", "projection=[Max Intensity]");
		//Stack.setActiveChannels("01");
		setMinAndMax(0, 75);
		run("Apply LUT");
		run("Grays");
		
		setTool("line");
		waitForUser("Measure angle for image rotation. Press 'OK' when you are done.");
		run("Measure");
		run("Select None");
		
		angle = getResult("Angle",0);
		angles_array[i] = angle;
		
		selectWindow(max_proj);
		run("Rotate... ", "angle=["+angle+"] grid=1 interpolation=Bilinear enlarge stack");
		
		new_name = "Adjusted_"+name;
		saveAs("tiff", output + File.separator + new_name);
		run("Close All");
	}
}
print("Done");


