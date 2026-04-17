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
		Dialog.create("Hemisphere");

		Dialog.addCheckbox("Left", true);
		Dialog.addCheckbox("Right", true);
		
		Dialog.show();
		left = Dialog.getCheckbox();
		right = Dialog.getCheckbox();
		
		run("Z Project...", "projection=[Max Intensity]");

		
		selectWindow(max_proj);
		
		images_array[i] = name;
		
		setTool("line");
		waitForUser("Measure angle for image rotation. Press 'OK' when you are done.");
		run("Measure");
		run("Select None");
		
		angle = getResult("Angle",0);
		angles_array[i] = angle;
		
		selectWindow(max_proj);
				
		run("Channels Tool...");
		//Stack.setChannel(1);
		//run("Blue");
		//Stack.setChannel(2);
		//run("Green");
		//setMinAndMax(0, 150);
		//Stack.setChannel(3);
		//run("Magenta");
		//setMinAndMax(0, 50);
		//Stack.setChannel(4);
		//run("Yellow");	
		//setMinAndMax(0, 150);
		
		run("Rotate... ", "angle=["+angle+"] grid=1 interpolation=Bilinear enlarge stack");	
		// Block usage
		if (right) {
		    run("Flip Vertically");
		}
		
		Stack.setDisplayMode("color");	
		
		setTool("rectangle");
		run("Specify...", "width=500 height=1200 x=0 y=0 slice=1");
		waitForUser("Place rectangle with top aligned to edge of pia and drag bottom to align with bottom of corpus callosum. Then press OK.");
		run("ROI Manager...");
		run("Duplicate...", "duplicate");
		
		Stack.setDisplayMode("composite");
		
		saveAs("tiff", output+max_proj+"_rotated.tif");
		
		run("Fresh Start");
	
	}
}

