module SBR16UU() {
	difference() {
		// main body
		translate([0,0,-16.5]) {
			cube(size = [45,45,33], center = true);
		}
		// mounting holes (m5, rectangle 30x32)
		translate([0,0,-10]) {
			translate([-15,-16,0]) {
				cylinder(r=2.5,h=10,center=false);
			}
			translate([15,16,0]) {
				cylinder(r=2.5,h=10,center=false);
			}
			translate([-15,16,0]) {
				cylinder(r=2.5,h=10,center=false);
			}
			translate([15,-16,0]) {
				cylinder(r=2.5,h=10,center=false);
			}
		}
		// the rail
		translate([0,0,-20]) {
			rotate([90,0,0]) {
				// NB the real radius is r=8, 9 was set for better rendering
//				cylinder(r=8,h=46,center=true);
				cylinder(r=9,h=46,center=true);
			}
		}
		// the cut
		translate([0,0,-20]) {
			rotate([0,180,0]) {
				polyhedron ( points = [[0, -23, 0], [0, 23, 0], [33*sin(40), 23, 33*cos(40)], [33*sin(40), -23, 33*cos(40)], [33*sin(-40), -23, 33*cos(40)], [33*sin(-40), 23, 33*cos(40)]],
						triangles = [[0,3,2], [0,2,1], [3,0,4], [1,2,5], [0,5,4], [0,1,5],  [5,2,4], [4,2,3], ]);
			}
		}
	}
}


module SBR16_rail_normalized() {
	difference() {
		translate([0,0,2.5]) {
			cube(size = [40,1,5], center = true);
		}
		translate([0,0,2.75]) {
			cube(size = [9.5,1,5.5], center = true);
		}
	}
	difference() {
		translate([0,0,4.25]) {
			cube(size = [18.5,1,8.5], center = true);
		}
		translate([0,0,2.75]) {
			cube(size = [9.5,1,5.5], center = true);
		}
	}

	translate([0,0,25]) {
		rotate([90,0,0]) {
			cylinder(r=8,h=1,center=true);
		}

		rotate([0,180,0]) {
			polyhedron ( points = [[0, -.5, 0], [0, .5, 0], [18*sin(20), .5, 18*cos(20)], [18*sin(20), -.5, 18*cos(20)], [18*sin(-20), -.5, 18*cos(20)], [18*sin(-20), .5, 18*cos(20)]],
					triangles = [[0,3,2], [0,2,1], [3,0,4], [1,2,5], [0,5,4], [0,1,5],  [5,2,4], [4,2,3], ]);
		}
	}
}

