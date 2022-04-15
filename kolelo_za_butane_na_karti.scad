body_radius=15;
hole_dia=4;
size_z=5;
square_size=3;
o_ring_dia=2;

difference()
{	
	translate([0,0,-size_z/2])
	rotate_extrude($fn=60)
	//!translate([0,0,0])
	{
		difference()
		{
			square([body_radius,size_z]);
			translate([body_radius,size_z/2,0])
			circle(d=o_ring_dia, $fn=60);
		}
	}
	
	difference()
	{
		cylinder(h=size_z+1, d=hole_dia, $fn=60, center=true);
		
		translate([0,square_size,0])
		cube([hole_dia, hole_dia, size_z+2], center=true);
	}
	
}
