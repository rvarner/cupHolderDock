// Cup holder dock for a 2012 Jeep Wrangler	
// ----------------------------------------
// Note: You must have the nexusCradle library found at git@github.com:rvarner/nexusCradle.git

////////////////
// Parameters //
////////////////

topDiameter = 86;
bottomDiameter = 74;
depth = 60;
tiltAngle = 20;
cradleThickness = 17.84;
nexusThickness = 13.84;

////////////////////////
// Do not touch below //
////////////////////////

//rotationDelta = (cradleThickness * sin(tiltAngle))/2; 
rotationDelta = (nexusThickness * sin(tiltAngle))/2; 

topRadius = topDiameter/2;
bottomRadius = bottomDiameter/2;

//////////////////////////////////////
// Basic Cylinder for the cupholder //
//////////////////////////////////////
module baseCylinder() {
	translate(v=[0,0,depth/2]) cylinder(h = depth, r2 = topRadius, r1 = bottomRadius,center = true);
}

///////////////////////
// Cradle (imported) //
///////////////////////
cradleHeight = 24.5;
module nexusCradle() {
	import_stl("nexusCradleSimple_BackRest_NoAudio.stl");
}

//////////////////
// Galaxy Nexus //
//////////////////
module galaxyNexus() {
	import_stl("galaxyNexus.stl");
}

/////////////////////////////
// Cradle Brick (imported) //
/////////////////////////////
module nexusBrick() {
	import_stl("nexusCradleBrick.stl");
}

//////////
// Dock //
//////////
module dock() {
	union() {
		difference() {
			baseCylinder();
			translate(v=[0,0, (depth - cradleHeight) - rotationDelta]) 
				rotate(a=[0,-tiltAngle,0]) galaxyNexus(); //nexusBrick();
		}
		translate(v=[0,0, (depth - cradleHeight) - rotationDelta]) 
			rotate(a=[0,-tiltAngle,0]) nexusCradle();
	}
}
//galaxyNexus();
dock();
