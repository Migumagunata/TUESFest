dia_big=73;
dia_small=10;
dia_spring=3.5;
dia_interface=9+1;
interface_z=5;
size_z=2.5;
wall_size=1.5;

difference(){
	union(){
	translate([0,0,(interface_z+0.5)/2]) //top cylinder
	cylinder(h=interface_z+0.5,d1=dia_interface+2,d2=dia_interface+2,$fn=60, center=true);
	
	translate([0,0,wall_size/2]) // hexagon_big
	cylinder(h=wall_size,d1=dia_big,d2=dia_big, $fn=6, center=true);
	}
	
	translate([0,0,interface_z/2]) //hole
	cylinder(h=interface_z,d1=dia_interface,d2=dia_interface,$fn=60, center=true );
}

for(i=[-1:2:1])
{
	translate([i*(dia_big/2-dia_small/2),0,0])
	{
		translate([0,0,wall_size+(size_z-wall_size)/2]) //hexagons_small
		cylinder(h=size_z-wall_size,d1=dia_small, d2=dia_small, $fn=6, center=true);

		translate([0,0,size_z/2+size_z])
		cylinder(h=size_z,d1=dia_spring,d2=dia_spring, $fn=60, center=true);
	}
}
