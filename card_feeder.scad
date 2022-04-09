tolerance=1;
size_platform_z=1.5;
size_spring_z=5;
size_spring_dia=9;
size_wall=1.5;
size_x=63.5+size_wall*2+tolerance;
size_y=88.9+size_wall*2+tolerance;
size_z=20+size_wall*2+size_platform_z+size_spring_z*2+tolerance;
card_size_z=20;

//poker size
card_size_x=63.5+tolerance;
card_size_y=88.9+tolerance;

//bridge size
//card_size_x=56+tolerance;
//card_size_y=88.9+tolerance;

//b8
//card_size_x=62+tolerance;
//card_size_y=88+tolerance;


difference()
{
	//main box
	cube([size_x,size_y,size_z], center = true);
	
	//hollow deck + platform
	cube([card_size_x,card_size_y,size_z-size_wall*2], center = true);
	
	//cut card feeder
	translate([0,size_y/2-size_wall/2,(size_z-card_size_z)/2-size_wall])
	{
		cube([card_size_x, size_wall+1,card_size_z],center=true);
	}
	//cut roof
	translate([0,size_wall*3,size_z/2-size_wall/2])
	{
		cube([card_size_x-size_wall*6,card_size_y,size_wall+1], center=true);
	}
}

//spring holder
translate([0,0,-size_z/2+size_spring_z/2+size_wall])
{
	cylinder(h=size_spring_z, d1= size_spring_dia, d2=size_spring_dia, $fn=60, center = true);
}