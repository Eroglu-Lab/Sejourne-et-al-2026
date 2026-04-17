sourcedir = getDirectory("Choose the folder only containing cropped images of the visual cortex, annotated with each of the layers.");
finaldir = getDirectory("Choose folder where you will place the new images");
list  = getFileList(sourcedir);

//layer_num = getNumber("How many layers ", 5)

/*Make a ton of folders */
DAPI = finaldir + File.separator + "DAPI";
Sox9 = finaldir + File.separator + "Sox9";
NeuN = finaldir + File.separator + "NeuN";
Olig2 = finaldir + File.separator + "Olig2";

File.makeDirectory(DAPI);
File.makeDirectory(Sox9);
File.makeDirectory(NeuN);
File.makeDirectory(Olig2);

setOption("Display label", true);
setBatchMode(true);

for (a=0; a<list.length; a++) {    /*This part iterates over all the files*/
	
	open(sourcedir + list[a]);
	run("Duplicate...", "duplicate");
    title = getTitle(); 
    Title = title.replace(".tif","");
    name = title.replace("-1.tif","");		
    run("Split Channels");

	Saveimage("C1-",DAPI,"DAPI_");
    Saveimage("C2-",Sox9,"Sox9_");      /*For each individual channel, save the three z planes using the Saveimage function*/
    Saveimage("C3-",NeuN,"NeuN_");
    Saveimage("C4-",Olig2,"Olig2_"); 
	}



function Saveimage(channel,folder,nuclei) {   /*Makes a function to split the planes and save them in the corresponding folder*/
	        selectWindow(channel + title);
	        //run("Stack to Images");
	        //for (d = 1 ; d < 4 ; d++) {
		        //selectWindow(channel + title + "-000" + d);
		        saveAs("Tiff", folder + File.separator + nuclei + name);
		        close();
	        //}
	    }





