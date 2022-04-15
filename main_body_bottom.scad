degree=30;

card_size=93.9;
size_out = 10;

wall_size=2;
wall_size_small=1.5;
screw_size=3;

square_size=10;

size_z=36.5;
card_slot=4;

size_x=68.5;

total_y=cos(degree)*card_size*2-screw_size-(screw_size+screw_size*3)+screw_size*2;

module mount() // дупка резбова втулка
{
	difference()
	{
		cube([screw_size*2,screw_size*2,screw_size*2], center=true);
		
		cylinder(d=screw_size+1,h=screw_size*2+1, $fn=60, center=true);
	}
}

translate([0,0,-wall_size/2])
cube([size_x+2*(wall_size_small+screw_size*2),total_y,wall_size], center=true);

for(y=[-1:2:1])
{
	for(x=[-1:2:1])
	{
		translate([((size_x+2*(wall_size_small+screw_size*2))/2-screw_size)*x,((total_y)/2-screw_size)*y,screw_size])
		rotate([0,90,0])
		mount();
	}
}






