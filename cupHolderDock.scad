// Cup holder dock for a 2012 Jeep Wrangler	
// ----------------------------------------
// Note: You must have the nexusCradle library found at git@github.com:rvarner/nexusCradle.git

////////////////
// Parameters //
////////////////

topDiameter = 86;
bottomDiameter = 74;
depth = 60;
tiltAngle = 10;

////////////////////////
// Do not touch below //
////////////////////////


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
			translate(v=[0,0,depth - cradleHeight]) 
				rotate(a=[0,-tiltAngle,0]) nexusBrick();
		}
		translate(v=[0,0, depth - cradleHeight -1]) 
			rotate(a=[0,-tiltAngle,0]) nexusCradle();
	}
}

dock();
