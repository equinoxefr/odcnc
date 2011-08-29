/*
OPENSCAD Project - EquinoxeFR 2011
License Creative Commons

Object: Support
*/
include <999-parameters.scad>

$fn=50;

module linearRailMount()
{
	color([90/255, 90/255, 90/255])
	{
		difference()
		{
		
			difference()
			{
			union()
			{
				translate([-25,0,0])
				{
					cube(size = [50,16,6.5]);		
				}
					translate([-14,0,0])
				{
					cube(size = [28,16,42]);
				}
			}
			// Hole for rail
			rotate([90,0,0])
			{
				translate([0,25,-50])
				{
					cylinder(r=YLinearRailDiameter/2,h=100);
				}
			}
			// Support hole
			rotate([0,0,0])	
			{
				translate([20,8,0])
				{
					cylinder(r=2.5,h=100);
				}
				translate([-20,8,0])
				{
					cylinder(r=2.5,h=100);
				}	

			}			

		}
		translate([-1.5,-3,28])
		cube(size = [3,22,15]);	
		}
	}
}