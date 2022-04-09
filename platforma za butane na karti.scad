
size_platform_z=1.5;
size_spring_z=5;
size_spring_dia=9;
//poker size
card_size_x=63.5;
card_size_y=88.9;

//bridge size
//card_size_x=56;
//card_size_y=88.9;

//b8
//card_size_x=62;
//card_size_y=88;


union(){
	
cube([card_size_x,card_size_y,size_platform_z], center=true);

translate([0,0,size_spring_z/2+size_platform_z/2])
cylinder(h=size_spring_z, d1= size_spring_dia, d2=size_spring_dia, $fn=60, center = true);

}