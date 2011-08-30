/*
OPENSCAD Project - EquinoxeFR 2011
License Creative Commons

Object: X Axis
*/
include <999-parameters.scad>
include <004-NSC-housing.scad>

$fn=100;

module XAxis()
{
	//Back panel
	translate([-200,-XAxisMaterialHeight,150])
		cube([400,XAxisMaterialHeight,150]);


	//Right panel
	translate([200+XAxisMaterialHeight,0,0])
		rotate([90,0,270])
			dxf_linear_extrude(file="PROFILES/X_panels.dxf",layer="border",height=XAxisMaterialHeight,$fn=20);


	//Left panel
	translate([-200,0,0])
		rotate([90,0,270])
			dxf_linear_extrude(file="PROFILES/X_panels.dxf",layer="border",height=XAxisMaterialHeight,$fn=20);

	//Left NSC housing
	translate([-200+38,-200+40,7])
		rotate([90,270,0])
			nsc_housing();

	translate([-200+38,-200+90,7])
		rotate([90,270,0])
			nsc_housing();


	//Right NSC housing
	translate([200-38,-200+40,44])
		rotate([90,90,0])
			nsc_housing();

	translate([200-38,-200+90,44])
		rotate([90,90,0])
			nsc_housing();

}