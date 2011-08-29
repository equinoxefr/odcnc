/*
OPENSCAD Project - EquinoxeFR 2011
License Creative Commons

Object: Main File
*/

include <999-parameters.scad>
include <001-base.scad>
include <002-linear_X_Y_rail.scad>
include <003-linear_mount.scad>

// Draw base
base();

// Draw rail mounts
translate([40,13,baseHeight+footHeight])
	linearRailMount();

translate([baseX-100,13,baseHeight+footHeight])
	linearRailMount();

translate([40,YLinearRailLength,baseHeight+footHeight])
	linearRailMount();

translate([baseX-100,YLinearRailLength,baseHeight+footHeight])
	linearRailMount();

// Draw left rail
translate([40,YLinearRailLength/2+13,28+baseHeight])
	linearRail(YLinearRailLength);

// Draw right rail
translate([baseX-100,YLinearRailLength/2+13,28+baseHeight])
	linearRail(YLinearRailLength);