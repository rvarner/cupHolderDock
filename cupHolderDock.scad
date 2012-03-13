// Cup holder dock for a 2012 Jeep Wrangler	
// ----------------------------------------
// Note: You must have the nexusCradle library found at git@github.com:rvarner/nexusCradle.git

// Parameters
topDiameter = 86;
bottomDiameter = 74;
depth = 60;


// Do not touch
topRadius = topDiameter/2;
bottomRadius = bottomDiameter/2;


module baseCylinder() {
	translate(v=[0,0,depth/2]) cylinder(h = depth, r2 = topRadius, r1 = bottomRadius,center = true);
}



baseCylinder();
