function tool_offset() = 35;
module dremel_lower_mount() {
	difference(){
		rotate([90,0,0]) {
			dxf_linear_extrude(file="dxf/dremel_mount.dxf",layer="0",height=15,center=true,$fn=100,convexity=10);
		}
		// drill left mounting hole
		translate([27.5,0,0]) {
			cylinder(r=2.5,h=100,center=true);
		}
		// drill right mounting hole
		translate([-27.5,0,0]) {
			cylinder(r=2.5,h=100,center=true);
		}

		// drill the clamping hole
		translate([0,0,25]) {
			rotate([0,90,0]) {
				cylinder(r=2,h=50,center=true);
			}
		}
	}
}


mounting_bolts_spacing = 81;
module dremel_upper_mount() {
	difference(){
		rotate([90,0,0]) {
			dxf_linear_extrude(file="dxf/dremel_mount.dxf",layer="1",height=15,center=true,$fn=100,convexity=10);
		}
		// drill left mounting hole
		translate([mounting_bolts_spacing/2,0,0]) {
			cylinder(r=2.5,h=100,center=true);
		}
		// drill right mounting hole
		translate([-mounting_bolts_spacing/2,0,0]) {
			cylinder(r=2.5,h=100,center=true);
		}

		// drill the clamping hole
		translate([0,0,41]) {
			rotate([0,90,0]) {
				cylinder(r=2,h=50,center=true);
			}
		}
	}
}

module dremel_mount() {
	dremel_lower_mount();
	translate([0,80,0]) {
		dremel_upper_mount();
	}
}

dremel_mount();
