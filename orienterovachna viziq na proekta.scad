include <gears.scad>
teeth_length = 5;
box_x=170;
box_y=170;
box_z=50;
size_wall=1.5;
platform_z=10;
platform_radius = 50;
rotary_button_radius=10;
rotary_button_z=4;

display_cut_y=26.6;
display_cut_z=11.5;

teeth_count = 2*(platform_radius/teeth_length - 1);
render()
intersection()
{
	Gear(m=teeth_length, z=teeth_count, h =10);
	cylinder(h=platform_z, r= platform_radius, $fn=60,center =true); //кръгла, въртяща се платформа върху която ще седи механизъма
}
translate([0,0,10])
cylinder(h=platform_z, r= platform_radius, $fn=60,center =true);


translate([0,0,-60])
difference(){
//translate([0, 250, 0])
cube([box_x+2*size_wall, box_y+2*size_wall, box_z+2*size_wall], center=true); //кутия в която се съдържа цялата елекртоника

translate([0,0,5])
cylinder(h=50, r= platform_radius, $fn=60,center =true);
	
cube([box_x, box_y, box_z+size_wall], center=true);// празнина
	
translate([box_y/2+size_wall/2,0,0])
cube([size_wall, display_cut_y, display_cut_z], center=true);// отвор за OLED екран 
	
translate([box_y/2+size_wall/2,display_cut_y,0])
rotate([0,90,0])
cylinder(h=rotary_button_z, r= rotary_button_radius, $fn=60,center =true);//отвор за въртящ се бутон

}







