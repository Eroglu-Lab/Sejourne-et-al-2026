dir = getDirectory("Choose a Directory");
list = getFileList(dir);
stitch = dir + "/Stitched/";
File.makeDirectory(stitch);

for (i = 0; i < list.length; i++) {
	img_list = getFileList(dir+list[i]);
	name = substring(list[i],0,lengthOf(list[i])-7);
	img_name = "Stitched-"+name;
	eval("bsh", "mpicbg.stitching.GlobalOptimization.ignoreZ = true");
	run("Grid/Collection stitching", "type=[Positions from file] order=[Defined by TileConfiguration] directory=["+dir+list[i]+"] layout_file=TileConfiguration1.txt fusion_method=[Linear Blending] regression_threshold=0.30 max/avg_displacement_threshold=2.50 absolute_displacement_threshold=3.50 compute_overlap computation_parameters=[Save memory (but be slower)] image_output=[Fuse and display]");
	saveAs("tiff", stitch + img_name);
	run("8-bit");
	saveAs("tiff", stitch + img_name);
	run("Collect Garbage");
	run("Close All");
}
print("Done");
