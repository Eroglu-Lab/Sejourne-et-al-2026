// This macro chops an image into NxN tiles, where N is the number
// of divisions chosen by the user, and saves measurements for all tiles
// of a single image in one CSV file.

dir = getDirectory("Choose file directory for analysis");
list = getFileList(dir);
output = dir + File.separator + "Results" + File.separator;
File.makeDirectory(output);

n = 10; // number of tiles
run("Set Measurements...", "area mean integrated redirect=None decimal=3");

for (i = 0; i < list.length; i++) {
	if(endsWith(list[i], ".tif")){
		open(dir + list[i]); 
		
		//reset brightness and contrast in all channels
		run("Channels Tool...");
		run("Brightness/Contrast...");
		Property.set("CompositeProjection", "null");
		Stack.setDisplayMode("color");
		Stack.setChannel(1);
		resetMinAndMax;
		Stack.setChannel(2);
		resetMinAndMax;
		Stack.setChannel(3);
		resetMinAndMax;
		Stack.setChannel(4);
		resetMinAndMax;
		
		title = getTitle(); 
		getLocationAndSize(locX, locY, sizeW, sizeH); 
		width = getWidth(); 
		height = getHeight(); 
		tileWidth = width; 
		tileHeight = height / n;
		getDimensions(width, height, channels, slices, frames);
		
		run("Split Channels");

		for (c = 2; c < channels; c++) {
			ch = c +1;
			chanTitle = "C" + ch + "-" + title;
			selectWindow(chanTitle);
			id = getImageID();

			// Clear results at the beginning of each image processing
			run("Clear Results");
	
			for (y = 0; y < n; y++) { 
				offsetY = y * height / n;
				offsetX = 0;
	
				selectImage(id); 
				call("ij.gui.ImageWindow.setNextLocation", locX + offsetX, locY + offsetY); 
				tileTitle = chanTitle + " [" + y + "]"; 
	
				run("Duplicate...", "duplicate");
				makeRectangle(offsetX, offsetY, tileWidth, tileHeight); 
				//waitForUser("verify");
				run("Crop");  
				saveAs("tiff", output + tileTitle + ".tif");

				//tileImageTitle = getTitle();
				run("Threshold...");
				setThreshold(1, 255, "raw");
				run("Create Selection");
				run("Measure");
				close(); // Close channel after measurement
				}
				
				selectWindow(chanTitle);
				run("Threshold...");
				setThreshold(1, 255, "raw");
				run("Create Selection");
				run("Measure");

			// Close tile image windows
			//close("*");
					// Save combined results for all tiles/channels of this image

				saveAs("Results", output + chanTitle + "_AllTiles.csv");
				run("Clear Results");
		}
		run("Close All");
	}
}
