module bearing_support() {
	difference(){
		rotate([90,0,0]) {
			dxf_linear_extrude(file="dxf/bearing_support.dxf",layer="0",height=15,center=true,$fn=100);
		}
		translate([15,0,-25]) {
			cylinder(r=2.5,h=11,center=true);
		}
		translate([-15,0,-25]) {
			cylinder(r=2.5,h=11,center=true);
		}
	}
}

bearing_support();
