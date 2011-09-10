/*
OPENSCAD Project - EquinoxeFR 2011
License Creative Commons

Object: NSC Housing
*/

module nsc_housing ()
{

	difference()
		{
		// Translate and extrude profile.
		translate([-7,0,-5])
		dxf_linear_extrude(file="PROFILES/SUPPORT_DOUILLE_PROFIL.dxf",layer="profil",height=44,$fn=200,convexity=10);

		// drill 4 support holes.
		rotate([90,0,0])
		{
			cylinder(r=2.5,h=100,center=true,$fn=100);
			translate([36,0,0])
			cylinder(r=2.5,h=100,center=true,$fn=100);
			translate([0,34,0])
			cylinder(r=2.5,h=100,center=true,$fn=100);
			translate([36,34,0])
			cylinder(r=2.5,h=100,center=true,$fn=100);

		}
	}
}
