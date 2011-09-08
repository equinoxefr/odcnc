use <SBR16.scad>;
use <xaxis.scad>;
use <zaxis.scad>;

xaxis();
translate([yposition()+SBR16UU_size()+(xplate_width()-xrails_length())/2,-2*assembled_rail_height()-xplates_thickness(),-xrails_spacing()/2-SBR16UU_size()/2]){
	rotate([90,0,180]) {
		zaxis();
	}
}

