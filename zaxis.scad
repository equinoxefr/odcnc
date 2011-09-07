use <SBR16.scad>;
use <stepper_assembly.scad>;
use <bearing_support.scad>;
use <dremel_mount.scad>;
use <xaxis.scad>;

module zrail() {
	translate([0,0,45]) {
		translate([0,45,0]) {
			SBR16UU();
		}
		SBR16UU();
	}
	difference() {
		scale([1, 200, 1]) {
			SBR16_rail_normalized();
		}
		// mounting holes
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

module zaxis() {
		translate([0,0,-7.5]) {
			dxf_linear_extrude(file="dxf/zaxis.dxf",layer="0",height=15,center=true,$fn=100);
		}
		translate([-70,100,0]) {
			zrail();
		}
		translate([70,100,0]) {
			zrail();
		}
		translate([0,22.5,30]) {
			bearing_support();
		}
		translate([0,232.5,30]) {
			bearing_support();
		}
		translate([0,275,30]) {
			rotate([0,0,180]) {
				stepper_assembly();
			}
		}
		// leadscrew
		translate([0,0,30]) {
			rotate([-90,0,0]) {
				cylinder(r=5,h=270,center=false);
			}
		}
		translate([0,7.5,-50]) {
			rotate([0,180,0]) {
				dremel_mount();
			}
		}
}
xaxis();

translate([xposition()+50+45,-15-45-45,-150]) {
	rotate([90,0,180]) {
		zaxis();
	}
}
