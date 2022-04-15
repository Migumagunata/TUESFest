screw_size=3;

size_wall=1.5;
tolerance=1;

motor_size_x=12;
motor_size_y=10;

wheel_down=3;
wheel_rad=15;

motor_offset=wheel_rad-2*size_wall-wheel_down-motor_size_y/2;

module motor(h)
{
	intersection()
	{	
		cylinder(h=h,d=motor_size_x, $fn=60, center=true);
		
		cube([motor_size_x,motor_size_y,h], center=true );
	}
}

union()
{
	//motor offset
	translate([(motor_size_x/2+size_wall)/2,(motor_size_y+size_wall*2)/2 + motor_offset/2,0])
	cube([motor_size_x/2+size_wall,motor_offset,screw_size*2],center=true);
	
	//screw_mount
	translate([screw_size+motor_size_x/2+size_wall,(motor_size_y+size_wall*2)/2+motor_offset-screw_size,0])
	difference()
	{
		cube([screw_size*2, screw_size*2, screw_size*2],center=true);
		
		cylinder(d=screw_size,h=screw_size*2+1, $fn=60, center=true);
	}
	
	// motor holder
	difference()
	{
		translate([(motor_size_x/2+size_wall)/2,0,0])
		cube([motor_size_x/2+size_wall,motor_size_y+size_wall*2,screw_size*2],center=true);
		
		motor(screw_size*2+1);
	}
	
	// дупка за съединяване на двете части
	translate([size_wall/2,-screw_size-(motor_size_y+size_wall*2)/2,0])
	difference()
	{
		cube([size_wall, screw_size*2, screw_size*2], center=true);
		
		rotate([0,90,0])
		cylinder(d=screw_size, h=size_wall+1, $fn=60, center=true);
	}
}
