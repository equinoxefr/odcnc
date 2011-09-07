use <SBR16.scad>;

function xposition() = 134; // valid range 0-210

module xrail() {
	translate([0,-xposition()+150-22.5,45]) {
		translate([0,-45,0]) {
			SBR16UU();
		}
		SBR16UU();
	}
	difference() {
		scale([1, 300, 1]) {
			SBR16_rail_normalized();
		}
		// mounting holes
		translate([-15,-141,0]) {
			cylinder(r=2.5,h=6,center=false);
		}
		translate([-15,141,0]) {
			cylinder(r=2.5,h=6,center=false);
		}
		translate([15,-141,0]) {
			cylinder(r=2.5,h=6,center=false);
		}
		translate([15,141,0]) {
			cylinder(r=2.5,h=6,center=false);
		}
		translate([-15,-75,0]) {
			cylinder(r=2.5,h=6,center=false);
		}
		translate([15,-75,0]) {
			cylinder(r=2.5,h=6,center=false);
		}
		translate([15,75,0]) {
			cylinder(r=2.5,h=6,center=false);
		}
		translate([-15,75,0]) {
			cylinder(r=2.5,h=6,center=false);
		}
	}
}

module xzplate() {
	translate([xposition(),-60,0]) {
		rotate([90,0,0]) {
			translate([0,0,-7.5]) {
				dxf_linear_extrude(file="dxf/xaxis.dxf",layer="1",height=15,center=true,$fn=100);
			}
		}
	}
}

module xaxis() {
	rotate([90,0,0]) {
		translate([0,0,-7.5]) {
			dxf_linear_extrude(file="dxf/xaxis.dxf",layer="0",height=15,center=true,$fn=100);
		}
	}
	xzplate();
	translate([200,0,0]) {
		rotate([0,-90,90]) {
			translate([-50,0,0]) {
				xrail();
			}
			translate([50,0,0]) {
				xrail();
			}
		}
	}
}

xaxis();

