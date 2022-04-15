size_out = 10;

size_x=68.5;
size_y=93.9;
size_z=36.5;

size_wheel_z=5;
size_wheel_rad=15;
o_ring_dia=2;

size_wall=1.5;
tolerance=1;

screw_size=3;

card_slot=4;

module mount() // дупки резбова втулка
{
	difference()
	{
		cube([screw_size*2,screw_size*2,screw_size*2], center=true);
		
		cylinder(d=screw_size+1,h=screw_size*2+1, $fn=60, center=true);
	}
}

*union() // left/right
{
	translate([0,0,-size_wall/2])
	cube([size_z ,size_y-size_out,size_wall], center=true);
	
	for(y=[-1:2:1])
	{
		for(x=[-1:2:1])
		{
			translate([(size_z/2-screw_size)*x,((size_y-size_out)/2-screw_size)*y,screw_size])
			rotate([0,90,0])
			mount();
		}
	}
	
	translate([0,((size_y-size_out)/2-screw_size),screw_size])
	rotate([90,0,0])
	mount();
}

*union() //front
{
	
	translate([0,0,-size_wall/2])
	{
		difference()
		{
			 cube([size_x+(screw_size*2+size_wall)*2,size_z-card_slot,size_wall], center=true);
			for(x=[-1:2:1])
			{
				translate([x*(size_x/2+(screw_size*2+size_wall)-screw_size),-card_slot/2,0])
				cylinder(h=size_wall+1,d=screw_size, $fn=60, center=true);
			}
		}
	}
	
	for(x=[-1:2:1])
	{
		translate([x*(size_x/2+(screw_size*2+size_wall)-screw_size),(size_z-card_slot)/2-screw_size,screw_size])
		rotate([90,0,0])
		mount();
	}
	
}

*union() // top
{
	translate([0,0,-size_wall/2])
	difference()
	{
		cube([size_x+2*(size_wall+screw_size*2),size_y-size_out,size_wall], center=true);
		
		for(y=[-1:2:1])
		{
			for(x=[-1:2:1])
			{
				translate([((size_x+2*(size_wall+screw_size*2))/2-screw_size)*x,((size_y-size_out)/2-screw_size)*y,0])
				cylinder(h=size_wall+1, d=screw_size, $fn=60, center=true);
			}
		}
		
		translate([0,(size_y-size_out)/4,0])
		cube([size_wheel_z+tolerance,size_wheel_rad*2+o_ring_dia+tolerance,size_wall+1],center=true);
	}
	
	for(y=[-1:2:1])
	{
		translate([21.5-screw_size,(size_y-size_out)/4+(6+screw_size+size_wall)*y,screw_size])
		rotate([0,90,0])
		mount();
	}
	
}

union() // bottom
{
	translate([0,0,-(size_wall+0.5)/2])
	difference()
	{
		cube([size_x+2*(size_wall+screw_size*2),size_y-size_out+screw_size*2+size_wall,size_wall+0.5], center=true);
		
		for(y=[-1:2:1])
		{
			for(x=[-1:2:1])
			{
				translate([((size_x+2*(size_wall+screw_size*2))/2-screw_size)*x,((size_y-size_out+screw_size*2+size_wall)/2-screw_size)*y,0])
				cylinder(h=size_wall+1, d=screw_size, $fn=60, center=true);
			}
		}
	}
	
	for(y=[-1:2:1])
	{
		for(x=[-1:2:1])
		{
			translate([(size_x+2*(size_wall+screw_size))/2*x,((size_y-size_out+screw_size*2+size_wall)/2-screw_size*8)*y,screw_size])
			rotate([0,90,0])
			mount();
		}
	}
}