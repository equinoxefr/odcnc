use <SBR16.scad>;

function yposition() = $t*210; // valid range 0-210
function xplates_thickness() = 15;

function xrails_spacing() = 100;
function xrails_length()  = 300;
function xplate_width() = 400;

module xrail() {
	translate([0,-yposition()+xrails_length()/2-SBR16UU_size()/2,assembled_rail_height()]) {
		translate([0,-SBR16UU_size(),0]) {
			SBR16UU();
		}
		SBR16UU();
	}
	difference() {
		scale([1, xrails_length(), 1]) {
			SBR16_rail_normalized();
		}
		translate([0,0,-.5]) {// to drill properly
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
}

module xzplate() {
	translate([yposition(),-xplates_thickness()-assembled_rail_height(),0]) {
		rotate([90,0,0]) {
			translate([0,0,-xplates_thickness()/2]) {
				dxf_linear_extrude(file="dxf/xaxis.dxf",layer="1",height=xplates_thickness(),center=true,$fn=100,convexity=10);
			}
		}
	}
}

module xaxis() {
	rotate([90,0,0]) {
		translate([0,0,-xplates_thickness()/2]) {
			dxf_linear_extrude(file="dxf/xaxis.dxf",layer="0",height=xplates_thickness(),center=true,$fn=100,convexity=10);
		}
	}
	xzplate();
	translate([xplate_width()/2,0,0]) {
		rotate([0,-90,90]) {
			translate([-xrails_spacing()/2,0,0]) {
				xrail();
			}
			translate([xrails_spacing()/2,0,0]) {
				xrail();
			}
		}
	}
}

xaxis();

