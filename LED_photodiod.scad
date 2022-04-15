size_y=93.9;
size_x=68.5;

screw_size=3;

size_wall=1.5;

size_x_front=size_x+(screw_size*2+size_wall)*2;

module mount() // дупки резбова втулка
{
	difference()
	{
		cube([screw_size*2,screw_size*2,screw_size*2], center=true);
		
		cylinder(d=screw_size+1,h=screw_size*2+1, $fn=60, center=true);
	}
}

difference()
{
	cube([size_x_front,size_y,size_wall], center=true);
	
	translate([0,size_y/4,0])
	cylinder(h=size_wall+1, d=5+1, $fn=60, center=true);
}

for(y=[-1:2:1])
	{
		for(x=[-1:2:1])
			{
				translate([(size_x_front/2-screw_size)*x,(size_y/2-screw_size)*y,size_wall/2+screw_size])
				rotate([0,90,0])
				mount();
			}
	}