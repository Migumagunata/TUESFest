degree=30;

card_size=93.9;
size_out = 10;

wall_size=2;
wall_size_small=1.5;
screw_size=3;

square_size=10;

size_z=36.5;
card_slot=4;

difference()
{
	linear_extrude(wall_size,center=true)
	
	{
		polygon([[0,0],[cos(degree)*card_size*2,0],[cos(degree)*card_size*2,sin(degree)*card_size*2]]);
		rotate([0,0,degree])
		square([card_size,wall_size_small+4+2*screw_size]);
		
		translate([cos(degree)*card_size,-square_size/2,0])
		square([cos(degree)*card_size*2,square_size],center=true);
	}
	
	translate([cos(degree)*card_size*2-screw_size,-square_size+screw_size+wall_size,0])
	cylinder(h=wall_size+1, d=screw_size,$fn=60, center=true);
	
	translate([screw_size+screw_size*3,-square_size+screw_size+wall_size,0])
	#cylinder(h=wall_size+1, d=screw_size,$fn=60, center=true);
	
	rotate([0,0,degree])
	translate([screw_size,-screw_size-wall_size_small,0])
	cylinder(h=wall_size+1, d=screw_size,$fn=60, center=true);
	
	rotate([0,0,degree])
	translate([screw_size+((card_size/2-screw_size))*2,-screw_size-wall_size_small,0])
	cylinder(h=wall_size+1, d=screw_size,$fn=60, center=true);
	
	rotate([0,0,degree])
	translate([screw_size,wall_size_small+4+2*screw_size-screw_size,0])
	cylinder(h=wall_size+1, d=screw_size,$fn=60, center=true);
	
	rotate([0,0,degree])
	translate([screw_size+((card_size/2-screw_size))*2,wall_size_small+4+2*screw_size-screw_size,0])
	cylinder(h=wall_size+1, d=screw_size,$fn=60, center=true);
	
	rotate([0,0,degree])
	translate([card_size+screw_size*8,-size_z+card_slot-wall_size-screw_size,0])
	cylinder(h=wall_size+1, d=screw_size,$fn=60, center=true);
	
	rotate([0,0,degree])
	translate([card_size+screw_size*8+(((card_size-size_out+screw_size*2+wall_size_small)/2-screw_size*8))*2,-size_z+card_slot-wall_size-screw_size,0])
	cylinder(h=wall_size+1, d=screw_size,$fn=60, center=true);
	
}


