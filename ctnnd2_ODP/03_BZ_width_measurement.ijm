dir = getDirectory("choose folder to analyze");
list = getFileList(dir);
output = dir + File.separator + "Output"+File.separator;
File.makeDirectory(output);

for (i = 0; i < list.length; i++) {
	if(endsWith(list[i], ".tif")){
		open(dir + list[i]);
		name = getTitle();
		//run("Split Channels");
		//arc = "C2-"+name;
		//selectWindow(arc);
		setTool("line");
		waitForUser("Press OK to continue once you have drawn a line over the binocular zone.");
		run("Measure");
		run("Add Selection...");
		saveAs("tiff", output + "Line_" + name);
		run("Close All");
	}
}
saveAs("Results", output + "BZ_width.csv");