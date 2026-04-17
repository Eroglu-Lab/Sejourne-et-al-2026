/* This macro was written for the analysis of fluorescent in situ hybridization samples processed to visualize Arc mRNA trancripts in mouse brain sections. 
*/

dir = getDirectory("Choose file directory for analysis");
list = getFileList(dir);
output = dir + File.separator + "Output" + File.separator;
File.makeDirectory(output);

images_array = newArray(10000);
angles_array = newArray(10000);

for (i = 0; i < list.length; i++) {
	if(endsWith(list[i], ".tif")){
		open(dir + list[i]);
		name = getTitle();
		max_proj = "MAX_"+name;
		
		getDimensions(width, height, channels, slices, frames);
		
		run("Z Project...", "projection=[Max Intensity]");
		//arc_signal = getNumber("What Channel is your Arc signal on?", 2);
		
		//selectWindow(max_proj);
		selectWindow(name);
		
		images_array[i] = name;
		
		setTool("line");
		waitForUser("Measure angle for image rotation. Press 'OK' when you are done.");
		run("Measure");
		run("Select None");
		
		angle = getResult("Angle",0);
		angles_array[i] = angle;
		
		selectWindow(max_proj);
		run("Rotate... ", "angle=["+angle+"] grid=1 interpolation=Bilinear enlarge stack");
		//run("Flip Vertically");
		
		setTool("rectangle");
		run("Specify...", "width=500 height=1200 x=0 y=0 slice=1");
		waitForUser("Place rectangle with top aligned to edge of pia, then press OK.");
		run("ROI Manager...");
		run("Duplicate...", "duplicate");
		
		//run("Channels Tool...");
		Stack.setActiveChannels("0111");
		Stack.setActiveChannels("0110");
		
		saveAs("tiff", output+max_proj+"_rotated.tif");
		
		run("Fresh Start");
	
	}
}

