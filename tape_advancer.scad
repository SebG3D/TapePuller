/* [Feeder Settings] */

//select the motor to drive the worm gear
Motor_Type = 2; //[0:SG90, 1:MG90, 2:N20]

//select N20 rpm
N20_RPM = 0; //[0:300 rpm, 1:123, 2:456]

//select SMD tape width
SMD_Tape_Width = 0; //[0:8mm tape, 1:12mm tape, 2:16mm tape, 3:24mm tape]

/* [Gear Settings] */

//worm gear mount type
Worm_Mount = 1; //[0:screw head, 1:bearing 683]

//fixed pinion mount type
Pinion_1_Mount = 3; //[1:screw head, 2:pin, 3:bearing 683]

//lever pinion mount type
Pinion_2_Mount = 4; //[2:pin, 4:post]

/* [3D Printing Settings] */

//assemble buildplate or show assembly
Prepare_For_3D_Printing = false;

//create a part to test your settings --- not jet implemented
3D_Printing_Test_Part = false;

//select parts to be created
Part = 0; //[0:worm, 1:pinnion 1, 2:pinnion 2, 3:case, 4:lever]

//layerheight you want to use, fractions of this setting can be used as well
3D_Printing_Layerheight = 0.25; //[0.25:0.25, 0.2:0.2]

//extrusionwith in µm, depends on your nozzle diameter and slicer settings
3D_Printing_Extrusionwidth = 450;

/* [Mechanical Settings] */

//screw type to use to mount to feeder case
Feeder_Mount_Screw = 1; //[0:countersunk, 1:flat head]

//M3 throughhole diameter in µm
3D_Printing_M3_through = 3400;

//M3 tap diameter in µm
3D_Printing_M3_tap = 2800;

//M3 head diameter in µm
3D_Printing_M3_head = 6000;

//GearMount:Screw head diameter, needs to be a tight fit in µm
3D_Printing_Mount_head = 5700;

//GearMount:Pin loose diameter in µm
3D_Printing_Pin_loose = 3400;

//GearMount:Pin pressfit diameter in µm
3D_Printing_Pin_pressfit = 2800;

//GearMount:Ballbearing 683 pressfit diameter in µm
3D_Printing_683_pressfit = 7000;

//GearMount:Post outer diameter, needs to freely turn on 9 mm Post, in µm
3D_Printing_Post_loose = 9300;

//thickness of used M3 shims, 0.5 mm is standard, in µm
Shim_Thickness = 500;

/* [Debug/View] */

//hide hardware/vitamins
Hide_Hardware = false;

//hide lid for more insight
Hide_Lid = false;

//hide motor (servo or N20)
Hide_Motor = false;

//enable cutting assembly
Cut = false;

//cut in x direction
CUT_X = 0; //[0:100]

//cut in y direction
CUT_Y = 0; //[0:100]

//cut height in z direction
CUT_Z = 0; //[0:100]

/* [Hidden] */

//shorten some param for userinterface
3dp_lh = 3D_Printing_Layerheight;
3dp_ew = 3D_Printing_Extrusionwidth/1000;

//use/include librarys
include <libs/hardware.scad>
use <libs/nutsnbolts/cyl_head_bolt.scad>
include <libs/N20.scad>
servo_type = Motor_Type;
include <libs/servo.scad>
include <libs/gears.scad>
include <param.scad>

//***********************************************************************
//                  SMD tape specification
//***********************************************************************
//param order: [B1,D,E,F,K,P0,P1,P2,R,T,W];
//naming after vishay spec
Tape_8mm =  [4.55,1.5,1.75,3.5,2.5,4,2,2,25,0.4,8];
Tape_12mm = [1,2,3,4,5,6,7,8,9,10,11];
Tape_16mm = [1,2,3,4,5,6,7,8,9,10,11];
SMD_tapes = [Tape_8mm,Tape_12mm,Tape_16mm];
Tape = SMD_tapes[SMD_Tape_Width];
B1 = 0;
D = 1;
E = 2;
F = 3;
K = 4;
P0 = 5;
P1 = 6;
P2 = 7;
R = 8;
T = 9;
W = 10;

//case param
case_height = 110;
case_length = 120;
case_width = 20;
case_tape_dist = 1;

difference(){
    partgenerator();
    if (!Prepare_For_3D_Printing){
        if(Cut&&(CUT_X!=0))
            translate ([case_length*CUT_X/100-case_length,-1,-1])cube([case_length,case_width+2,case_height+2],center=false);
        if(Cut&&(CUT_Y!=0))
            translate ([-1,case_width-case_width*CUT_Y/100,-1])cube([case_length+2,case_width,case_height+2],center=false);
        if(Cut&&(CUT_Z!=0))
            translate ([-1,-1,case_height-case_height*CUT_Z/100])cube([case_length+2,case_width+2,case_height],center=false);
    }
}

module partgenerator(){
    //pepare for 3dprinting?
	if (Prepare_For_3D_Printing) {
        //higher resolution for finer details
        $fn = 20;
        // create gears
        translate([60,0,0])bevel_gear(1);
        bevel_gear(2);
        //case
        translate([-40,50,case_width])rotate([-90,0,0])case_bottom(case_height,case_length,case_width,case_tape_dist);
        translate([-40,280,0])rotate([90,0,0])case_top(case_height,case_length,case_width,case_tape_dist);
	}
    //show assembly
	else { 
       // reduce resolution for faster rendering
       $fn = 80;
        case_bottom(case_height,case_length,case_width,case_tape_dist);
        if(!Hide_Lid)case_top(case_height,case_length,case_width,case_tape_dist);
        //bevel_gear(1);
//        translate([60,7-Tape[E]+0.5,case_height-4-76.4/2])
//            rotate([90,0,0])
//                bevel_gear(2);
//        translate([60,7-Tape[E]+0.5,case_height-4-76.4/2])
//            rotate([0,0,0])
//                bevel_gear(1);
    //param copie from gears
    modul=1.2;
    zahnzahl_rad=40;
    zahnzahl_ritzel=11;
    achsenwinkel=90;
    zahnbreite=6;
    bohrung_rad = 4.2;
    bohrung_ritzel=3.2;
    eingriffswinkel = 20;
    schraegungswinkel=10;
    zusammen_gebaut=false;
    spiel = 0.05;	// Spiel zwischen Zähnen
    
    //calc stuff
    r_rad = modul*zahnzahl_rad/2;							// Teilkegelradius des Rads
	delta_rad = atan(sin(achsenwinkel)/(zahnzahl_ritzel/zahnzahl_rad+cos(achsenwinkel)));	// Kegelwinkel des Rads
	delta_ritzel = atan(sin(achsenwinkel)/(zahnzahl_rad/zahnzahl_ritzel+cos(achsenwinkel)));// Kegelwingel des Ritzels
	rg = r_rad/sin(delta_rad);								// Radius der Großkugel
	c = modul / 6;											// Kopfspiel
	df_ritzel = pi*rg*delta_ritzel/90 - 2 * (modul + c);	// Fußkegeldurchmesser auf der Großkugel 
	rf_ritzel = df_ritzel / 2;								// Fußkegelradius auf der Großkugel
	delta_f_ritzel = rf_ritzel/(pi*rg) * 180;				// Kopfkegelwinkel
	rkf_ritzel = rg*sin(delta_f_ritzel);					// Radius des Kegelfußes
	hoehe_f_ritzel = rg*cos(delta_f_ritzel);				// Höhe des Kegels vom Fußkegel
 
	df_rad = pi*rg*delta_rad/90 - 2 * (modul + c);			// Fußkegeldurchmesser auf der Großkugel 
	rf_rad = df_rad / 2;									// Fußkegelradius auf der Großkugel
	delta_f_rad = rf_rad/(pi*rg) * 180;						// Kopfkegelwinkel
	rkf_rad = rg*sin(delta_f_rad);							// Radius des Kegelfußes
	hoehe_f_rad = rg*cos(delta_f_rad);						// Höhe des Kegels vom Fußkegel
	
	drehen = istgerade(zahnzahl_ritzel);
    
    translate([60,case_width-case_tape_dist-Tape[E]+0.5,case_height-4-76.4/2])
        rotate([90,0,0])
            union(){
                // Rad
                rotate([0,0,180*(1-spiel)/zahnzahl_rad*drehen])
                    bevel_gear(2);
                // Ritzel
                    translate([-hoehe_f_ritzel*cos(90-achsenwinkel),0,hoehe_f_rad-hoehe_f_ritzel*sin(90-achsenwinkel)+4])
                        rotate([0,achsenwinkel,0])
                            {bevel_gear(1);if(!Hide_Motor)translate([0,0,-2])rotate([0,0,90])N20();}
                }
    }
}

module case_bottom(h,l,w,tape){
    //calc top and bottom separation position
    top_bot_sep = tape+Tape[E]+Tape[F]-Tape[B1]/2+0.025;
    difference(){
        case(h,l,w,tape);
        translate([-1,-top_bot_sep,-1])cube([l+2,w,h+2],center=false);
    }
    //wheel mount
    wheel_y = w-tape-Tape[E]+0.5;
    offset_bearing = 2;
    mount_height = w - wheel_y + offset_bearing;
    case_gear_mounts(60,w,h-4-76.4/2,90,0,0,mount_height);
}

module case_top(h,l,w,tape){
    //calc top and bottom separation position
    top_bot_sep = tape+Tape[E]+Tape[F]-Tape[B1]/2+0.025;
    difference(){
        case(h,l,w,tape);
        translate([-1,w-top_bot_sep,-1])cube([l+2,w,h+2],center=false);
    }
}

module case(h,l,w,tape){
//    case_height = 110;
//    case_length = 120;
//    case_width = 20;
    difference(){
        //mainbody
        union(){
            cube([l,w,h],center=false);
            //n20 mount
//            translate([0,-10,h-4-76.4/2-10])cube([30,10,20],center=false);
        }
        //tape path and wheel cutout
        translate([0,w-tape,0])
        union(){
            //tape path
            translate([0,0,h-4])tape_path()tape_shape();
            //tape_wheel cutout 0,5 ist teeth_h/2 and 3dp_lh is play
            translate([60,-Tape[E]+0.5+3dp_lh,h-4-76.4/2])rotate([90,0,0])cylinder(h=2+2*3dp_lh, d=76.4+2*0.5+1, center=false);
            //bevel gear on tape wheel cutout
            translate([60,-Tape[E]+0.5+3dp_lh,h-4-76.4/2])rotate([90,0,0])cylinder(h=w*2, d=52, center=false);
            //space for N20 motor
            translate([-1,-10-8.25,h-4-76.4/2-6])cube([60,10,12],center=false);
            //hole for gear mount screw
            translate([60,w-1,h-4-76.4/2])rotate([90,0,0])cylinder(h=w*2, d=M3_drill_hole_d, center=false);
            //holes for assembling top and bottom
//            translate([0,tape+1,0])rotate([90,0,0]){
//                cylinder(h=w+2, d=M3_drill_hole_d, center=false);
//                cylinder(h=w+2, d=M3_drill_hole_d, center=false);
//            }
            hole_screw_912_countersunk(10,-w+tape-3dp_lh,20,-90,0,0,M3_drill_hole_d,w,6.5,4);
            hole_screw_912_countersunk(10,-w+tape-3dp_lh,90,-90,0,0,M3_drill_hole_d,w,6.5,4);
            hole_screw_912_countersunk(105,-w+tape-3dp_lh,90,-90,0,0,M3_drill_hole_d,w,6.5,4);
            hole_screw_912_countersunk(105,-w+tape-3dp_lh,20,-90,0,0,M3_drill_hole_d,w,6.5,4);
        }
    }
//    //wheel mount
//    wheel_y = 18-Tape[E]+0.5;
//    offset_bearing = 2;
//    mount_height = w - wheel_y + offset_bearing;
//    case_gear_mounts(60,w,h-4-76.4/2,90,0,0,mount_height);
}

module tape_path(){
    path_1_length = 60;
    path_2_D = 76.4;
    path_3_length = 5;
    path_4_D = path_2_D;
    rotate([-90,0,-90])
        union(){
            linear_extrude(height = path_1_length, center = false, convexity = 10, twist = 0)children();
            translate([0,path_2_D/2,path_1_length])
            rotate([90,0,90])
                rotate_extrude(angle = -180, convexity = 10)
                    translate([-path_2_D/2,0,0])
                        rotate([180,0,90])
                            children();
            translate([0,path_2_D,path_1_length])rotate([180,0,0])linear_extrude(height = path_3_length, center = false, convexity = 10, twist = 0)children();
            translate([0,path_4_D/2+path_2_D,path_1_length-path_3_length])
                rotate([90,0,90])
                    rotate_extrude(angle = 90, convexity = 10)
                        translate([-path_4_D/2,0,0])
                            rotate([0,0,90])
                                children();
        }
}

module tape_shape(){
    //calc param
    play_z = 3dp_lh;
    play_xy = 0.5;
    tape_width = Tape[W] + 2*play_z;
    tape_height = Tape[T] + play_xy; //0,5 for tolerance
    pocket_width = Tape[B1] + 2*play_z;
    pocket_height = Tape[K] + play_xy;
    pocket_x = Tape[E] + Tape[F] - Tape[B1]/2 - play_z;
//    echo(tape_width);
//    echo(tape_height);
//    echo(pocket_width);
//    echo(pocket_height);
//    echo(Tape[W]-pocket_x-Tape[B1]);
    translate([-play_z, -tape_height, 0])square([tape_width,tape_height],center=false);
    translate([pocket_x, -tape_height, 0])square([pocket_width,pocket_height],center=false);
}

module case_screw_post(x,z,mount_with,post,screwtype=1)
{
    echo("Add outside chamfer");
    //calc param
    Din912_head_h = 3.5;                        //height of screw head
    bot_post_coutout_dist = Din912_head_h + 4;  //distance for bottom post cutout
    post_h = mount_with - bot_post_coutout_dist;    //height screw post screw in part
    post_offset = mount_with/2 - post_h; //offset for part

    translate([x,0,z])rotate([-90,0,0]){
        if (post){
            //top post to screw in
            //cylinder to screw in
            translate([0,0,post_offset])difference()
            {
                //post main body
                cylinder(h=post_h, d=case_post_top_od, center=false);
                //screw in hole
                translate([0,0,-0.5])cylinder(h=post_h+1, d=M3_drill_hole_d, center=false);
                //chamfer
                translate([0,0,post_h-0.5])cylinder(1, M3_drill_hole_d/2,M3_drill_hole_d/2+1, false);
            }
        }else{
            //bottom screw coutout
            //negetive to cout out of mainbody
            union(){
                //screw head + shaft
                hole_screw_912_countersunk(0,0,0,0,0,0,M3_loose_hole_d,case_w,case_post_bot_id,Din912_head_h);
                //hole for scew post
                translate([0,0,bot_post_coutout_dist])cylinder(h=case_w, d=case_post_bot_id2, center=false);
            }
        }
    }
}

//creates mounts for gears
module case_gear_mounts(x,y,z,rx,ry,rz,height){
    //bearing mount
    difference(){
        translate([x,y,z])
            rotate([rx,ry,rz])
                //cylinder(h=case_w/2-y_mount_offset, d=8, center=false);
                cylinder(h=height, r1=2+height/5, r2=3, center=false);
        //hole_screw_countersunk(x,y+y_mount_offset,z,rx,ry,rz-180,M3_drill_hole_d,case_w+1,6.5,1.7);
        translate([x,y,z])
            rotate([rx,ry,rz])
                cylinder(h=height+1, d=M3_drill_hole_d, center=false);
    }
}

