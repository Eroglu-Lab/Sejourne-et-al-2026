/* This macro was written for the analysis of fluorescent in situ hybridization samples processed to visualize Arc mRNA trancripts in mouse brain sections. 
*/

dir = getDirectory("Choose file directory for analysis");
dir1 = getDirectory("Choose parent folder for output directory");
list = getFileList(dir);
output = dir + File.separator + "Cropped Cortex Images" + File.separator;
File.makeDirectory(output);

images_array = newArray(10000);
angles_array = newArray(10000);

for (i = 0; i < list.length; i++) {
	if(endsWith(list[i], ".tif")){
		open(dir + list[i]);
		name = getTitle();

		selectWindow(name);
		
		images_array[i] = name;
		
		setTool("line");
		waitForUser("Measure angle for image rotation. Press 'OK' when you are done.");
		run("Measure");
		run("Select None");
		
		angle = getResult("Angle",0);
		angles_array[i] = angle;
		
		selectWindow(name);
		run("Rotate... ", "angle=["+angle+"] grid=1 interpolation=Bilinear enlarge stack");
		//run("Flip Vertically");
		
		setTool("rectangle");
		run("Specify...", "width=1600 height=1100 x=0 y=0 slice=1");
		waitForUser("Place rectangle with top aligned to edge of pia, then press OK.");
		run("ROI Manager...");
		//roiManager("Add");
		run("Duplicate...", "duplicate");

		//setBackgroundColor(0, 0, 0);
		//run("Clear Outside");
		
		saveAs("tiff", output+name+"_rotated.tif");
		
		run("Fresh Start");
	
	}
}

