// Cup holder dock for a 2012 Jeep Wrangler	

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

difference() {
	baseCylinder();
	translate(v=[0,0,depth/2]) cylinder(h = depth, r2 = topRadius-2, r1 = bottomRadius-2,center = true);
}
