/* [Feeder Settings] */

//select the motor to drive the worm gear
Motor_Type = 2; //[0:SG90, 1:MG90, 2:N20]

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

echo("TODO");
echo("reduce screw variaty");
echo("------Releas Version-------------");
echo("6 ballbearing gear 2");
echo("1 chamfer on self tap screws");
echo("3 Testteil einbauen");
echo("5 case_mounts add inside and outside chamfer to strengthen lid post");
echo("5 print BOM");
echo("7 screws for servo and N20 mounting");
echo("10 calc cost");

//use/include librarys
include <libs/hardware.scad>
use <libs/nutsnbolts/cyl_head_bolt.scad>
include <libs/N20.scad>
servo_type = Motor_Type;
include <libs/servo.scad>
include <libs/gears.scad>
include <param.scad>

difference(){
    partgenerator();
    if (!Prepare_For_3D_Printing){
        if(Cut&&(CUT_X!=0))
            translate ([100*CUT_X/100-100,-25,0])cube([100,50,100],center=false);
        if(Cut&&(CUT_Y!=0))
            translate ([-5,case_w/2-case_w*CUT_Y/100,-5])cube([100,50,100],center=false);
        if(Cut&&(CUT_Z!=0))
            translate ([0,-25,80-80*CUT_Z/100])cube([100,50,100],center=false);
    }
}


module partgenerator(){
    //pepare for 3dprinting?
	if (Prepare_For_3D_Printing) {
        //higher resolution for finer details
        $fn = 96;
        //all parts - removed caused scad to crash
//        if (Part==0){
//            // create gears
//            translate([gears_worm_r,0,0])gear(5+Motor_Type,Worm_Mount);
//            translate([-2*gears_pinion1_r,0,gears_pinion_with])rotate([180,0,0])gear(Pinion_2_Mount,Worm_Mount);
//            translate([-(gears_pinion2_r+gears_worm_r)/2,-2.5*gears_pinion2_r,gears_pinion_with])rotate([180,0,0])gear(Pinion_1_Mount,Worm_Mount,true);
//            //case + lever
//            translate([gears_worm_r*3,0,case_w/2])rotate([90,0,0])case(1);
//            translate([2*case_h,0,case_w/2])rotate([90,180,0])case(2);
//            if (Motor_Type == 2)
//                translate([gears_worm_r*8,-case_w,0])
//                    rotate([180,0,0])
//                        translate([-wormx,0,-wormz+0.5])case(3);
//            translate([-(gears_pinion2_r+gears_worm_r)/2+40,-2.5*gears_pinion2_r+20,case_lever_w/2])rotate([90,0,-90])case_lever(1);
//            translate([-(gears_pinion2_r+gears_worm_r)/2-10,-2.5*gears_pinion2_r+20,case_lever_w/2])rotate([-90,0,180])case_lever(2);
//        }
        //worm
        if (Part==0){
            translate([0,0,0])gear(5+Motor_Type,Worm_Mount);
        }
        //pinnion 1
        if (Part==1){
            translate([0,0,gears_pinion_with])rotate([180,0,0])gear(Pinion_1_Mount,Worm_Mount,true);
        }
        //pinnion 2
        if (Part==2){
            translate([0,0,gears_pinion_with])rotate([180,0,0])gear(Pinion_2_Mount,Worm_Mount);
        }
        //case
        if (Part==3){
            translate([-case_h+10,0,case_w/2])rotate([90,0,0])case(1);
            translate([+case_h-10,0,case_w/2])rotate([90,180,0])case(2);
            if (Motor_Type == 2)
                translate([-case_h+10+gears_worm_r*4,-case_w,0])
                    rotate([180,0,0])
                        translate([-wormx,0,-wormz+0.5])case(3);
        }
        //lever
        if (Part==4){
            translate([70,40,case_lever_w/2])rotate([90,0,-90])case_lever(1);
            translate([20,40,case_lever_w/2])rotate([-90,0,180])case_lever(2);
        }
	}
    //show assembly
	else { 
       // reduce resolution for faster rendering
       $fn = 20;
        //wormgear
        translate([wormx,0,wormz])
            rotate([0,0,90])
                gear_dummy(5+Motor_Type,Worm_Mount);
        //gear1
        translate([gear1x,gears_pinion_with/2,gear1z])
            rotate([90,0,0])
                gear_dummy(Pinion_1_Mount,Worm_Mount,true);
        //gear2
        translate([gear2x,-gears_pinion_with/2,gear2z])
            rotate([-90,0,0])
                gear_dummy(Pinion_2_Mount,Worm_Mount,false);
        //case
        if(!Hide_Lid) color("GreenYellow")case(2);
        color("DarkOliveGreen")translate([0,0.01,0])case(1);
        if(Motor_Type == 2) color("Olive")case(3); 
        //case lever
        color("Green")case_lever(1);
        if(!Hide_Lid) color("Green")case_lever(2);
        //servo + screws
        if (((Motor_Type==0)||(Motor_Type==1))&&(!Hide_Motor)){
            translate([wormx,0,wormz-servo_arm_dist])rotate([0,180,180])servo();
            echo("add screws here");
            //if(!Hide_Hardware))
        }
        //N20
        if ((Motor_Type==2)&&(!Hide_Motor)){
            translate([wormx,0,wormz-case_walls])rotate([0,0,0])N20();
            echo("add screws here");
            //if(!Hide_Hardware))
        }
        
        //mounted on screw -> create screws
        if ((Pinion_1_Mount==1)&&(!Hide_Hardware)){
            color("Silver")translate([gear1x,-gears_pinion_with/2+3,gear1z])rotate([-90,0,0])screw("M3x6");
            translate([gear1x,-gears_pinion_with/2-0.5,gear1z])rotate([-90,0,0])hardware_shim(3.2,7,gears_pinion_mount_shim);
        }
        //gear 1 mounted on pin -> creat pin
        if ((Pinion_1_Mount==2)&&(!Hide_Hardware)){
            //add pins
            translate([gear1x,6+0.45,gear1z])rotate([-90,0,0])hardware_pin_din7(3,12,0.45);
            //add shims
            translate([gear1x,-gears_pinion_with/2-gears_pinion_mount_shim,gear1z])rotate([-90,0,0])hardware_shim(3.2,7,gears_pinion_mount_shim);
            translate([gear1x,+gears_pinion_with/2,gear1z])rotate([-90,0,0])hardware_shim(3.2,7,gears_pinion_mount_shim);
        }
        //gear 1 mounted bearing -> create bearing
        if ((Pinion_1_Mount==3)&&(!Hide_Hardware)){
            translate([gear1x,-gears_pinion_with/2+2,gear1z])rotate([-90,0,0])hardware_bearing_683();
            //screws for bearing
            hardware_screw_din7991(gear1x,-gears_pinion_with/2+2+4.5,gear1z,90,0,0,3,8,5);
//            echo("Bearing 683");
//            echo("Din 7991 M3x8 683");
        }
        //gear 2 mounted on pin -> creat pin
        if ((Pinion_2_Mount==2)&&(!Hide_Hardware)){
            //add pin
            translate([gear2x,5+0.45,gear2z])
                rotate([-90,0,0])
                    hardware_pin_din7(3,10,0.45);
            //add shims on both sides
            translate([gear2x,-gears_pinion_with/2-gears_pinion_mount_shim,gear2z])rotate([-90,0,0])hardware_shim(3.2,7,gears_pinion_mount_shim);
            translate([gear2x,+gears_pinion_with/2,gear2z])rotate([-90,0,0])hardware_shim(3.2,7,gears_pinion_mount_shim);
        }
        //gear 2 mounted on post -> creat scew -> screw connects both lever halfs
        if ((Pinion_2_Mount==4)&&(!Hide_Hardware)){
            color("Silver")translate([gear2x,-case_lever_w/2+3.5,gear2z])rotate([90,0,0])screw("M3x6");
        }
        //screw and shim to hold worm gear
        if (!Hide_Hardware){
            worm_shimz = wormz+gears_worm_height;
            worm_screw_z = wormz + gears_worm_height + gears_pinion_mount_shim + 2;
            if (Worm_Mount==0){
                color("Silver")translate([wormx,0,worm_screw_z])rotate([0,0,0])screw("M3x8");
                translate([wormx,0,worm_shimz])rotate([0,0,0])hardware_shim(3.2,7,gears_pinion_mount_shim);
            }
            if (Worm_Mount==1){
                translate([wormx,0,wormz+gears_worm_height])hardware_bearing_683();
                //screws for bearing
                hardware_screw_din7991(wormx,0,wormz+gears_worm_height+4,-180,0,0,3,8,5);
            }
            color("Silver")translate([rotate_x,-3.5,rotate_z])rotate([90,0,0])screw("M3x8");
            color("Silver")translate([5,-3.5,57])rotate([90,0,0])screw("M3x8");
            //removed screw cause i removed lower part for easy access
            //color("Silver")translate([wormx+servo_shaft_dist,-3.5,4])rotate([90,0,0])screw("M3x8");
            //lever screw + shim
            translate([5,0,case_h+case_lever_t1+3])rotate([0,0,0])hardware_shim(3.2,7,gears_pinion_mount_shim);
            color("Silver")translate([5,0,case_h+case_lever_t1+3+0.5])rotate([0,0,0])screw("M3x16");
            //hardware_screw_din7991(7,0,case_h+case_lever_t1+3,180,0,0,3,16,6);
        }
	}
}

//part = create 1st half or 2nd half or both
module case_lever(part=0){
    key_h =5;
    key_size =8;
    cutout_y = gears_pinion_with+2*gears_pinion_mount_shim+2*3dp_lh;
    screw_post_h = case_lever_w-(case_lever_w - cutout_y)/2-2*3dp_lh;
    d = case_post_bot_od+0.5;
    screw_1_x =14;
    screw_1_z =case_h+3+case_lever_t1/2+1.5;
    screw_2_x =rotate_x+3.5;
    screw_2_z =rotate_z+(case_post_bot_od+0.5)/2+head_912_loose_d/2+1.5;
    union(){
        if((part==1)||(part==0))
            union(){
                difference(){
                    //1st half of lever
                    case_lever_body();
                    cube([100,case_w,case_h*2],false);
                    //remove key, key was removed, we now screw these halfs together
                    //translate([rotate_x,0,rotate_z+d/2+key_size/2-0.5])rotate([90,-90,0])linear_extrude(height = key_h, center = true, convexity = 10, twist = 0)circle(d = key_size,$fn=3,false);
                    //remove screw in hole
                    if (Pinion_2_Mount==4)translate([0,-case_lever_w/2,0])case_screw_post(gear2x,gear2z,case_lever_w,false);
                    //screw hole to connect lever halfs
                    translate([0,-case_lever_w/2,0])case_screw_post(screw_1_x,screw_1_z,case_lever_w,false);
                    translate([0,-case_lever_w/2,0])case_screw_post(screw_2_x,screw_2_z,case_lever_w,false);
                }
                //add screw in post
                if (Pinion_2_Mount==4)difference(){
                    translate([gear2x,-case_lever_w/2,gear2z])rotate([-90,0,0])cylinder(h=screw_post_h, d=gears_pinion_mount_post_id, center=false);
                    translate([0,-case_lever_w/2,0])case_screw_post(gear2x,gear2z,case_lever_w,false);
                }
            }
        if((part==2)||(part==0))
        union(){
            difference(){
                case_lever_body();
                //remove half of body
                translate([0,-case_w,0])cube([100,case_w,case_h*2],false);
                //remove screw post
                if (Pinion_2_Mount==4)translate([gear2x,-case_lever_w/2+3,gear2z])rotate([-90,0,0])cylinder(h=case_lever_w, d=case_post_top_od-0.1, center=false);
            }
            //add key, key was removed, we now screw these halfs together
            //translate([rotate_x,0,rotate_z+d/2+key_size/2-0.5])rotate([90,-90,0])linear_extrude(height = key_h-1, center = true, convexity = 10, twist = 0)circle(d=key_size-0.5,$fn=3,false);
            //add screw in post
            if (Pinion_2_Mount==4)translate([0,0,0])case_screw_post(gear2x,gear2z,case_lever_w,true);
            //screws to connect both lever halfs
//            case_screw_post(screw_1_x,screw_1_z,case_lever_w,true);
        }
    }
}

module case_lever_body(){
    offset = 7;
    //calc main points for shape, we only need x and z, P0 is bottom left corner
    //points
    P0_x = rotate_x-case_lever_t2/2;
    P0_z = rotate_z;
    P1_x = rotate_x+case_lever_t2/2;
    P1_z = rotate_z;
    P2_x = P1_x;
    P2_z = gear2z + gear2x - P2_x + 2*offset/sqrt(2);
    P5_z = case_h + 3;
    P3_z = P5_z + case_lever_t1;
    P3_x = P2_x - P3_z + P2_z; 
    P4_x = 1;
    P4_z = P3_z;
    P5_x = P4_x;
    P7_x = P0_x;
    P7_z = gear1z + gear1x - P7_x + 2*(gears_pinion1_r + case_tape_channel/2)/sqrt(2);
    P6_z = P5_z;
    P6_x = P7_x - P6_z + P7_z;
    //with of cutout for gear and tape
    cutout_y = (Pinion_2_Mount == 2)? (gears_pinion_with+2*gears_pinion_mount_shim+2*3dp_lh): (gears_pinion_with+2*3dp_lh);
    //cutout_y = gears_pinion_with+2*gears_pinion_mount_shim+2*3dp_lh;
    cutout_z = P3_z-gear2z+4;
    cutout_x = gear2x-gear1x+11;
    //screw positions
    screw_1_x =14;
    screw_1_z =case_h+3+case_lever_t1/2+1.5;
    screw_2_x =rotate_x+3.5;
    screw_2_z =rotate_z+(case_post_bot_od+0.5)/2+head_912_loose_d/2+1.5;
  
  //create actual shape
  difference(){
    union(){
        //mainshape of lever
        rotate([90,0,0])translate([0,0,-case_lever_w/2])linear_extrude(height = case_lever_w, center = false, convexity = 10, twist = 0)polygon(points=[[P0_x,P0_z],[P1_x,P1_z],[P2_x,P2_z],[P3_x,P3_z],[P4_x,P4_z],[P5_x,P5_z],[P6_x,P6_z],[P7_x,P7_z]]);
        //rotate cylinder
        translate([rotate_x,-case_lever_w/2,rotate_z])rotate([-90,0,0])cylinder(h=case_lever_w, d=case_lever_t2, center=false);
        //screw cylinder
        translate([screw_1_x,-case_lever_w/2,screw_1_z])rotate([-90,0,0])cylinder(h=case_lever_w, d=case_post_bot_od, center=false);
    }
    //cutout for gear
    union(){
        //cutout for gear 2
        translate([gear2x,-cutout_y/2,gear2z])rotate([-90,0,0])cylinder(h=cutout_y, d=gears_pinion2_ad+2, center=false);
        //cutout for tape
        translate([gear2x-cutout_x,-cutout_y/2,gear2z-2])cube([cutout_x,cutout_y,cutout_z],false);
    }
    //screw hole
    translate([screw_1_x,-case_lever_w/2-0.1,screw_1_z])rotate([-90,0,0])cylinder(h=case_lever_w+0.2, d=M3_drill_hole_d, center=false);
    translate([screw_2_x,-case_lever_w/2-0.1,screw_2_z])rotate([-90,0,0])cylinder(h=case_lever_w+0.2, d=M3_drill_hole_d, center=false);
    //hole for mount/to rotate
    translate([rotate_x,-(case_lever_w+1)/2,rotate_z])rotate([-90,0,0])union(){
        d = case_post_bot_od+0.5;
        cylinder(h=case_lever_w+1, d=d, center=false);
        //chamfer for hole
        translate([0,0,-0.5])cylinder(2, d/2+2.5,d/2, false);
        translate([0,0,case_lever_w-0.5])cylinder(2, d/2,d/2+2.5, false);
    }
    //hole for gear mount
    if (Pinion_2_Mount==2)hole_pin(gear2x,-case_lever_w/2,gear2z,-90,0,0,case_lever_w,pin_d_fixed,true);

    //hole for springloaded screw
    hull() {
        translate([5,0,P5_z + case_lever_t1/2])cylinder(h=case_lever_t1+1, d=M3_loose_hole_d, center=true);
        translate([8,0,P5_z + case_lever_t1/2])cylinder(h=case_lever_t1+1, d=M3_loose_hole_d, center=true);
    }
  }
  case_gear_mounts(gear2x,-case_lever_w/2,gear2z,-90,0,0,Pinion_2_Mount,case_lever_w);
}

//module case(gears_pinion1_r,gears_pinion2_r,gear1x,gear2x,wormx,gear1z,gear2z,wormz){  
module case(part=0){  
    //lenght of case depends on feeder parameters
    case_l = (Motor_Type == 2)? (wormx+case_offset_n20+case_tape_channel+case_lever_t2): (wormx+servo_mount_l/2+servo_shaft_dist+case_tape_channel+case_lever_t2);
    d_gearspacer=8;
    //cutout wormgear
    h_cutount = (Motor_Type == 2)? (gears_worm_height+(1-Worm_Mount)*gears_pinion_mount_shim+0.5) : (gears_worm_height+servo_arm_dist+(1-Worm_Mount)*gears_pinion_mount_shim);
    l_cutount = gears_worm_da+4;
    w_cutount = case_w+1;
    cutoutz = (Motor_Type == 2)? (wormz + h_cutount/2-0.5) : (wormz + h_cutount/2-servo_arm_dist);
    //tape input slot
    l_slot = gears_pinion1_r*4;
    w_slot = gears_pinion_with+0.5;
    h_slot = case_walls+0.2;
    slotx=(gear2x-gear1x)/2+gear1x;
    slotz=case_h-case_walls/2;
    
    //caculate edge points of case in a clockwise direction
    P0_x = 0;
    P0_y = 0;
    P1_x = (Motor_Type == 2)? (wormx+case_offset_n20) : (wormx+servo_mount_l/2+servo_shaft_dist);
    P1_y = P0_y;
    P2_x = P1_x;
    P2_y = (Motor_Type == 2)? (wormz-case_walls-0.5) : (wormz-servo_arm_dist-servo_mount_dist);
    P3_x = case_l;
    P3_y = P2_y;
    P4_x = P3_x;
    P4_y = P3_y+30-15;
    P5_x = P4_x-15-15;
    P5_y = case_h;
    P6_x = 0;
    P6_y = P5_y;
    P7_x = case_walls;
    P7_y = 8;
    P8_x = P1_x;
    P8_y = P7_y;

    P9_x = P1_x;
    P9_y = -P9_x+gear1z+gear1x+2*(gears_pinion1_r-case_tape_channel/2)/sqrt(2);
    P10_y = P5_y;
    P10_x = P9_x-P10_y+P9_y;
    P11_x = P7_x;
    P11_y = P2_y;
    
    //heights for case sections
    height_wall = case_walls_z;
    height_middle = case_w-height_wall;

    //create mainbody of the case
    if((part==1)||(part==0)){
    translate([0,-case_w/2,0])
        difference(){
              //create base body
              union(){
                  rotate([90,0,0]){
                    //build outer thin wall of case
                    translate([0,0,-height_wall])linear_extrude(height = height_wall, center = false, convexity = 10, twist = 0)polygon(points=[[P0_x,P0_y],[P1_x,P1_y],[P2_x,P2_y],[P3_x,P3_y],[P4_x,P4_y],[P5_x,P5_y],[P6_x,P6_y]]);
                    //build outer thin wall of case
                    translate([0,0,-height_middle])linear_extrude(height = height_middle, center = false, convexity = 10, twist = 0)polygon(points=[[P0_x,P0_y],[P1_x,P1_y],[P2_x,P2_y],[P8_x,P8_y],[P7_x,P7_y],[P11_x,P11_y],[P2_x,P2_y],[P9_x,P9_y],[P10_x,P10_y],[P6_x,P6_y]]);
                      
                    }
                    //add post for lever to rotate on
                    union(){
                        translate([rotate_x,0,rotate_z])rotate([-90,0,0])cylinder(h=height_middle-3dp_lh, d=case_post_bot_od, center=false);
                        translate([rotate_x,0,rotate_z])rotate([-90,0,0])post_chamfer(case_post_bot_od-0.01,case_post_bot_od+2);
                    }                            
            }
            //union of stuff to remove from base body
            union(){
                //round corner of lever rotation post
                difference(){
                    translate([rotate_x,-0.5,rotate_z-case_lever_t2])cube([case_lever_t2,case_w+1,case_lever_t2],false);
                    translate([rotate_x,-0.5,rotate_z])rotate([-90,0,0])cylinder(h=case_w+1, d=case_lever_t2, center=false);
                    }
                //connection to feeder
                union(){
                    //screw holes to connect to feeder
                    if (Feeder_Mount_Screw==0){
                        hole_screw_countersunk(wormx,feeder_mount_y,case_h-20.5,0,-90,0,3.5,wormx+0.1,6,wormx-case_walls+0.5);
                        hole_screw_countersunk(case_walls,feeder_mount_y,case_h-60.5,0,-90,0,3.5,case_walls+0.1,6,0.5);
                    }else{
                        //hole_screw_912_countersunk(x,y,z,rx,ry,rz,d,l,d_head,k);
                        hole_screw_912_countersunkxy(wormx,feeder_mount_y,case_h-20.5,0,-90,0,3.5,wormx+0.1,6,wormx-case_walls);
                        hole_screw_912_countersunkxy(case_walls,feeder_mount_y,case_h-60.5,0,-90,0,3.5,case_walls+0.1,6,0);
                    }
                    //hole for cable routing
                    translate([case_walls/2,feeder_mount_y,case_h-48.5])cube([case_walls+1,6,6],true);
                }
                //features for gears + worm
                union(){
                    //cutout fot worm bearing if used
                    if (Worm_Mount==1){
                        translate([wormx,case_w/2,cutoutz+h_cutount/2-0.1])rotate([0,0,0])cylinder(h=3+0.1, d=gears_pinion_mount_683, center=false);
                        translate([wormx,case_w/2,cutoutz+h_cutount/2-0.1])cylinder(h=worm_screw_h, d=head_912_loose_d, center=false);
                    }
                    //cutout for gear
                    translate([gear1x,case_w/2-gears_pinion_with/2-1,gear1z])rotate([-90,0,0])cylinder(h=case_w, d=gears_pinion1_ad+1, center=false);
                    //cutout for wormgear
                    translate([wormx,case_w/2,cutoutz])cube([l_cutount,w_cutount,h_cutount],true);
                    //cutout for wormgear screw head
                    //worm_screw_h = 3.5+wormz-gears_worm_height;
                    worm_screw_z = wormz + gears_worm_height + 0.5 + 2;
                    worm_screw_h = case_h-worm_screw_z+0.1;
                    translate([wormx,case_w/2,worm_screw_z])cylinder(h=worm_screw_h, d=head_912_loose_d, center=false);
                    //hole worm screw
                    translate([wormx,case_w/2,case_h-case_walls-9.5])
                        rotate([0,0,0])
                            cylinder(h=case_walls+10, d=M3_loose_hole_d, center=false);
                    //remove material for gear mounts
                    translate([gear1x,case_w+0.5,gear1z])
                        rotate([90,0,0])
                            cylinder(h=case_w+1, d=M3_drill_hole_d, center=false);
                }
                //features for servo
                if (Motor_Type != 2) union(){
                    //remove servo body in case case_walls_z in to high
                    translate([wormx,case_w/2,wormz-servo_arm_dist])
                        rotate([0,180,180])
                            servo_body(servo_w,servo_h,servo_l,servo_shaft_d,servo_shaft_h,servo_shaft_dist,servo_mount_l,servo_mount_dist);
                    translate([wormx,case_w/2+servo_w-0.1,wormz-servo_arm_dist])
                        rotate([0,180,180])
                            servo_body(servo_w,servo_h,servo_l,servo_shaft_d,servo_shaft_h,servo_shaft_dist,servo_mount_l,servo_mount_dist);
                    //holes to mount servo
                    translate([wormx,case_w/2,wormz-servo_arm_dist])
                        rotate([0,180,180])
                            servo_mount(servo_h,servo_shaft_dist,servo_hole_dist);
                }
                //remove cube for N20 adapter
                if (Motor_Type == 2)union(){
                    rotate([90,0,0])translate([0,0,-(height_middle+height_wall)])linear_extrude(height = case_w+0.1, center = false, convexity = 10, twist = 0)polygon(points=[[P11_x,P11_y-0.01],[P2_x,P2_y-0.01],[P2_x,P2_y+case_walls],[P11_x,P11_y+case_walls]]);
                    //holes to connect to case
                    hole_screw_countersunk(case_walls+4,case_w/2,P2_y,0,0,0,M3_drill_hole_d,case_walls+5,6,1);
                    hole_screw_countersunk(wormx+l_cutount/2+4,case_w/2,P2_y,0,0,0,M3_drill_hole_d,case_walls+5,6,1);
                }
                //screw holes case
                union(){
                    case_screw_post(rotate_x,rotate_z,case_w,false);
                    case_screw_post(5,57,case_w,false);
                    //case_screw_post(wormx+servo_shaft_dist,4,case_w,false); not used anymore
                    //screwin hole for lever
                    hole_screw_countersunk(5,case_w/2,case_h+1,180,0,0,M3_drill_hole_d,8,M3_drill_hole_d+2,1);
                }
                //remove lower part for easy access to servo
                translate([P7_x,-0.1,-0.1])cube([P8_x-P7_x+0.1,case_w+0.2,P2_y+0.1],false);
            }
        }
        //add pinion mount
        translate([0,-case_w/2,0])case_gear_mounts(gear1x,0,gear1z,-90,0,0,Pinion_1_Mount,case_w);
}
    //create lid for case
    if((part==2)||(part==0)){
    translate([0,-case_w/2,0])
        difference(){
              //create base body
              union(){
                  rotate([90,0,0]){
                    //build outer thin wall of case
                    translate([0,0,-(height_middle+height_wall)])linear_extrude(height = height_wall, center = false, convexity = 10, twist = 0)polygon(points=[[P0_x,P0_y],[P1_x,P1_y],[P2_x,P2_y],[P3_x,P3_y],[P4_x,P4_y],[P5_x,P5_y],[P6_x,P6_y]]);
                    }
                    //screw holes case
                    translate([0,case_w/2,0])
                    union(){
                    case_screw_post(rotate_x,rotate_z,case_w,true);
                    case_screw_post(5,57,case_w,true);
                    //case_screw_post(wormx+servo_shaft_dist,4,case_w,true); not used anymore
                    }
            }
            //union of stuff to remove from base body
            union(){
                //round corner of lever rotation post
                difference(){
                    translate([rotate_x,-0.5,rotate_z-case_lever_t2])cube([case_lever_t2,case_w+1,case_lever_t2],false);
                    translate([rotate_x,-0.5,rotate_z])rotate([-90,0,0])cylinder(h=case_w+1, d=case_lever_t2, center=false);
                    }
                //features for gears + worm
                union(){
                    //cutout for wormgear
                    translate([wormx,case_w/2,cutoutz])cube([l_cutount,w_cutount,h_cutount],true);
                    //remove material for gear mounts
//                    translate([gear1x,case_w+0.5,gear1z])
//                        rotate([90,0,0])
//                            cylinder(h=case_w+1, d=M3_drill_hole_d, center=false);
                }
                //remove servo body in case case_walls_z in to high
                if (Motor_Type != 2)
                    translate([wormx,case_w/2,wormz-servo_arm_dist])
                        rotate([0,180,180])
                            servo_body(servo_w,servo_h,servo_l,servo_shaft_d,servo_shaft_h,servo_shaft_dist,servo_mount_l,servo_mount_dist);
                //screw holes case
                translate([rotate_x,+case_w/2,rotate_z])
                    rotate([90,0,0])
                        cylinder(h=case_w+1, d=M3_drill_hole_d, center=true);
                translate([5,+case_w/2,57])
                    rotate([90,0,0])
                        cylinder(h=case_w+1, d=M3_drill_hole_d, center=true);
                //was placed under servo -> not used anymore
//                translate([wormx+servo_shaft_dist,+case_w/2,4])
//                    rotate([90,0,0])
//                        cylinder(h=case_w+1, d=M3_drill_hole_d, center=true);
                //remove lower part for easy access to servo
                translate([-0.1,-0.1,-0.1])cube([P8_x+0.2,case_w+0.2,P2_y+0.1],false);
                //hole for pin if gear is mounted on pin
                if(Pinion_1_Mount==2)
                    translate([gear1x,case_w/2,gear1z])
                        rotate([-90,0,0])
                            cylinder(h=case_w, d=pin_d_loose, center=false);
            }
        }
        //add pinion mount if pin is used
        if(Pinion_1_Mount==2)
            translate([0,case_w/2,0])
                difference(){
                //calc offset from y, 0,5 mm is thickness of m3 shim
                case_gear_mounts(gear1x,0,gear1z,90,0,0,Pinion_1_Mount,case_w);
                translate([gear1x,gears_pinion_with/2+gears_pinion_mount_shim-0.1,gear1z])
                    rotate([90,0,0])
                        cylinder(h=case_w, d=pin_d_loose, center=true);
                }
    }
    //create N20 adapter for case
    if((part==3)||((part==0)&&(Motor_Type == 2))){
        translate([0,-case_w/2,0])
            difference(){
                rotate([90,0,0])
                    //build cube
                    translate([0,0,-(height_middle)])linear_extrude(height = height_middle, center = false, convexity = 10, twist = 0)polygon(points=[[P11_x,P11_y],[P2_x,P2_y],[P2_x,P2_y+case_walls],[P11_x,P11_y+case_walls]]);
                //holes to connect to case
                hole_screw_countersunk(case_walls+4,case_w/2,P2_y,0,0,0,3.5,case_walls+1,6,1);
                hole_screw_countersunk(wormx+l_cutount/2+4,case_w/2,P2_y,0,0,0,3.5,case_walls+1,6,1);
                translate([wormx,case_w/2,P2_y])N20_mount(case_walls);
            }  
    }
}

module case_screw_post(x,z,mount_with,post,screwtype=1)
{
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
                //chamfer for 3d printing bed
                translate([0,0,post_h-0.5])cylinder(1, M3_drill_hole_d/2,M3_drill_hole_d/2+1, false);
            }
        }else{
            //bottom screw coutout
            //negetive to cout out of mainbody
            union(){
                //screw head + shaft
                hole_screw_912_countersunk(0,0,0,0,0,0,M3_loose_hole_d,case_w,case_post_bot_id,Din912_head_h);
                //hole for scew post
                translate([0,0,bot_post_coutout_dist])cylinder(h=case_w-bot_post_coutout_dist+0.1, d=case_post_bot_id2, center=false);
            }
        }
    }
}

//creates mounts for gears
module case_gear_mounts(x,y,z,rx,ry,rz,type,case_w){
    //screw head
    if (type==1){
        //calc offset from y, 0,5 mm is thickness of m3 shim
        y_mount_offset=gears_pinion_with/2+gears_pinion_mount_shim;
        //generate gearspacer with hole for M3
        difference(){
            translate([x,y,z])
                rotate([rx,ry,rz])
                    cylinder(h=case_w/2-y_mount_offset, d=M3_drill_hole_d+10*3dp_ew, center=false);
            //hole_screw_countersunk(x,y+y_mount_offset,z,rx,ry,rz-180,M3_drill_hole_d,case_w+1,6.5,1.7);
            translate([x,y-0.5,z])
                rotate([rx,ry,rz])
                    cylinder(h=case_w/2-y_mount_offset+1, d=M3_drill_hole_d, center=false);
        }
    }
    //pin
    if (type==2){
        //calc offset from y, 0,5 mm is thickness of m3 shim
        y_mount_offset=gears_pinion_with/2+gears_pinion_mount_shim;
        //generate gearspacer with hole for M3
        difference(){
            translate([x,y,z])
                rotate([rx,ry,rz])
                    cylinder(h=case_w/2-y_mount_offset, d=8, center=false);
            //hole_screw_countersunk(x,y+y_mount_offset,z,rx,ry,rz-180,M3_drill_hole_d,case_w+1,6.5,1.7);
            translate([x,y-0.5,z])
                rotate([rx,ry,rz])
                    cylinder(h=case_w/2-y_mount_offset+1, d=pin_d_fixed, center=false);
        }
        //gears_pinion_mount_shim
        
        
 /*       //calc offset from y, 2 mm is bearingoffset inside gear
        gear_play = 0.25;
        y_mount_offset=gears_pinion_with/2+gear_play;
        
        translate([x,y,z])
            rotate([rx,ry,rz])
                difference(){
                    cylinder(h=case_w/2-y_mount_offset, d=pin_d_fixed+4, center=false);
                    //cylinder(h=case_w/2-y_mount_offset, r1=2+case_w/5, r2=2, center=false);
                    translate([0,0,-1])cylinder(h=case_w/2+1, d=pin_d_fixed, center=false);
                }*/
    }
    //bearing
    if (type==3){
        //calc offset from y, 2 mm is bearingoffset inside gear
        y_mount_offset=gears_pinion_with/2-2;

        difference(){
            translate([x,y,z])
                rotate([rx,ry,rz])
                    //cylinder(h=case_w/2-y_mount_offset, d=8, center=false);
                    cylinder(h=case_w/2-y_mount_offset, r1=2+case_w/5, r2=2, center=false);
            //hole_screw_countersunk(x,y+y_mount_offset,z,rx,ry,rz-180,M3_drill_hole_d,case_w+1,6.5,1.7);
            translate([x,y-0.5,z])
                rotate([rx,ry,rz])
                    cylinder(h=case_w/2-y_mount_offset+1, d=M3_drill_hole_d, center=false);
        }
    }
}

