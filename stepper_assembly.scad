module aluminium_profile() {
	color([.9,.9,.9]) {
		difference() {
			dxf_linear_extrude(file="dxf/aluminium_profile.dxf",layer="0",height=60,center=true,$fn=100,convexity=10);
			// stepper shaft hole
			rotate([90,0,0]) {
				translate([0,0,15]) {
					cylinder(r=19,h=31,center=true);
				}

				// nema23 mounting holes
				translate([23.57,23.57,15]) {
					cylinder(r=2.5,h=31,center=true);
				}
				translate([-23.57,23.57,15]) {
					cylinder(r=2.5,h=31,center=true);
				}
				translate([-23.57,-23.57,15]) {
					cylinder(r=2.5,h=31,center=true);
				}
				translate([23.57,-23.57,15]) {
					cylinder(r=2.5,h=31,center=true);
				}

				// leadscrew hole
				translate([0,0,-15]) {
					cylinder(r=8,h=31,center=true);
				}
				// dunnowhat holes
				translate([15,0,-15]) {
					cylinder(r=3,h=31,center=true);
				}
				translate([-15,0,-15]) {
					cylinder(r=3,h=31,center=true);
				}
			}
		}
	}
}


module stepper() {
	translate([0,0,-2.5]) {
		color([.9,.9,.9]) {
			difference() {
				dxf_linear_extrude(file="dxf/stepper.dxf",layer="0",height=5,center=true,$fn=100,convexity=10);
				// mounting holes
				translate([-23.57,23.57,0]) {
					cylinder(r=2.5,h=6,center=true);
				}
				translate([-23.57,-23.57,0]) {
					cylinder(r=2.5,h=6,center=true);
				}
				translate([23.57,-23.57,0]) {
					cylinder(r=2.5,h=6,center=true);
				}
			}
			// shaft
			translate([0,0,2.5]) {
				cylinder(r=19.05,h=1.6,center=true);
				cylinder(r=3.175,h=21,center=false);
			}
		}
		// body
		translate([0,0,-48.5]) {
			color([.3,.3,.3]) {
				cylinder(r=28.2,h=46,center=false);
			}
			translate([0,0,-4]) {
				color([.9,.9,.9]) {
					cylinder(r=3.175,h=4,center=false);
				}
			}
		}
	}
}

module stepper_assembly() {
	aluminium_profile();
	translate([0,-30,0]) {
		rotate([-90,-90,0]) {
			stepper();
		}
	}
}


stepper_assembly();
