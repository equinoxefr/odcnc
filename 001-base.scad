/*
OPENSCAD Project - EquinoxeFR 2011
License Creative Commons

Object: Base
*/
include <999-parameters.scad>

module base()
{
	cube(size = [baseX,baseY,baseHeight], center = false);
}
