use <SBR16.scad>;
use <stepper_assembly.scad>;
use <bearing_support.scad>;
use <dremel_mount.scad>;

function zposition() = (1-(2*$t-1)*(2*$t-1))*110/2; // valid range 0-110
function zplates_thickness() = 15;

zrails_spacing = 135;
zrails_length  = 200;
leadscrew_height = 30;
bearing_supports_spacing = 210;

module zrail() {
	translate([0,zposition()+SBR16UU_size()/2-zrails_length/2,assembled_rail_height()]) {
		translate([0,SBR16UU_size(),0]) {
			SBR16UU();
		}
		SBR16UU();
	}
	difference() {
		scale([1, zrails_length, 1]) {
			SBR16_rail_normalized();
		}
		translate([0,0,-.5]) {
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
}

module zaxis() {
	translate([0,-zposition(),0]) {
		translate([0,0,-zplates_thickness()/2]) {
			dxf_linear_extrude(file="dxf/zaxis.dxf",layer="0",height=15,center=true,$fn=100,convexity=10);
		}
		translate([0,zrails_length/2,0]){
			translate([-zrails_spacing/2,0,0]) {
				zrail();
			}
			translate([zrails_spacing/2,0,0]) {
				zrail();
			}
		}
		translate([0,0,leadscrew_height]) {
			translate([0,zplates_thickness()/2+zplates_thickness(),0]) {
				bearing_support();
				translate([0,bearing_supports_spacing,0]) {
					bearing_support();
				}
			}
		}
		translate([0,275,30]) {
			rotate([0,0,180]) {
				stepper_assembly();
			}
		}
		// leadscrew
		translate([0,0,leadscrew_height]) {
			rotate([-90,0,0]) {
				color([.5,.5,.5]) {
					cylinder(r=5,h=270,center=false);
				}
			}
		}
		translate([0,zplates_thickness()/2,-tool_offset()-zplates_thickness()]) {
			rotate([0,180,0]) {
				dremel_mount();
			}
		}
	}
}

zaxis();

