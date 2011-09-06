/*
OPENSCAD Project - EquinoxeFR 2011
License Creative Commons

Object: Linear rail for X or Y
*/
include <999-parameters.scad>

module linearRail(L)
{
	color([90, 90, 90])
	{
		rotate(a=[90,90,0])
		{
		cylinder(h = L, r=YLinearRailDiameter / 2, center=true);
		}
	}
}