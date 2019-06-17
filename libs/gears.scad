//-----------------------------------------------------------------------
//                  GEARS
//-----------------------------------------------------------------------
use <getriebe/files/Getriebe.scad>

//***********************************************************************
//                  TEST
//***********************************************************************
//define what to create
//general_motor_type = 1;                 //select the motor type 1 = servo, 2 = N20
//general_gear_mount = 3;                 //pinion gears mount 1 = screw head; 2 = pin; 3 = bearing 683ZZ
//general_feeder_with = 13.5;             //with of the feeder
//general_tape_with = 8;                  //with of the tape to be pulled, not SMD tape with
//general_lightshow = false;              //build tape puller with light show?
//general_prepare_for_printing = false;   //separates and rotates parts for 3Dprinting
//include <param.scad>;

//gear_test();

module gear_test(){
    // create gears
    $fn = 20;

    bevel_gear(2);
    //tooth(1,2,3);
    //translate([40,0,0])bevel_gear(2);
    
//    translate([3*gears_pinion2_r,0,0])rotate([0,0,0])gear(1);
//    translate([6*gears_pinion2_r,0,0])rotate([0,0,0])gear(2);
//    translate([9*gears_pinion2_r,0,0])rotate([0,0,0])gear(3);
//    translate([3*gears_pinion2_r,3*gears_pinion2_r,0])rotate([0,0,0])gear(1,true);
//    translate([6*gears_pinion2_r,3*gears_pinion2_r,0])rotate([0,0,0])gear(2,true);
//    translate([9*gears_pinion2_r,3*gears_pinion2_r,0])rotate([0,0,0])gear(3,true);
//    
    
//    translate([3*gears_pinion2_r,6*gears_pinion2_r,0])rotate([0,0,0])gear(4);
//    translate([6*gears_pinion2_r,6*gears_pinion2_r,0])rotate([0,0,0])gear(4);
//    translate([9*gears_pinion2_r,6*gears_pinion2_r,0])rotate([0,0,0])gear(4);
//    translate([3*gears_pinion2_r,9*gears_pinion2_r,0])rotate([0,0,0])gear(5);
//    translate([6*gears_pinion2_r,9*gears_pinion2_r,0])rotate([0,0,0])gear(5);
//    translate([9*gears_pinion2_r,9*gears_pinion2_r,0])rotate([0,0,0])gear(5);
}

//creates pinion gears or worm gear with different mounting options
//gear_type = type of gear to create
//1 = pinion mounted on screw head
//2 = pinion mounted on pin
//3 = pinion mounted on bearing 683ZZ
//4 = pinion mounted on post
//5 = worm gear for servo
//6 = worm gear for servo
//7 = worm gear for N20
//worm_mount 0=screw, 1=bearing
module gear(gear_type,worm_mount=0,invert_lead_angle=false){
    //pinion mounted on screw head
    if (gear_type==1){
//        color("DarkOrange")
        difference(){
            union(){
                if(invert_lead_angle)
                    stirnrad (gears_module, gears_pinion1_teeth, gears_pinion_with, 3.8, gears_pressure_angle, -gears_lead_angle, false);
                else
                    stirnrad (gears_module, gears_pinion2_teeth, gears_pinion_with, 3.8, gears_pressure_angle, gears_lead_angle, false);
            }
            //chamfer for easy printing
            translate([0,0,-0.5])cylinder(h=1, r1=3.8/2+1, r2=3.8/2, center=false);
            //head
            translate([0,0,-0.5])cylinder(h=gears_pinion_with+0.5-3, d=gears_pinion_mount_screw, center=false);
            //chamfer on theeth for easy 3d printing
//            gear_chamfer(invert_lead_angle);
        }

    }
    //pinion mounted on pin
    if (gear_type==2){
//        color("DarkOrange")
        difference(){
            union(){
                if(invert_lead_angle)
                    stirnrad (gears_module, gears_pinion1_teeth, gears_pinion_with, pin_d_loose, gears_pressure_angle, -gears_lead_angle, false);
                else
                    stirnrad (gears_module, gears_pinion2_teeth, gears_pinion_with, pin_d_loose, gears_pressure_angle, gears_lead_angle, false);
                //add post for less friction
//                translate([0,0,gears_pinion_with])
//                    rotate([0,0,0])
//                        cylinder(h=0.25, d=pin_d_loose+4, center=false);
            }
            //hole for pin
            translate([0,0,-0.5])cylinder(h=gears_pinion_with+1, d=pin_d_loose, center=false);
            //chamfer for easy printing
            translate([0,0,-0.5])
                cylinder(h=1, r1=pin_d_loose/2+1, r2=pin_d_loose/2, center=false);
            translate([0,0,gears_pinion_with+0.5])rotate([180,0,0])
                cylinder(h=1, r1=pin_d_loose/2+1, r2=pin_d_loose/2, center=false);
            //chamfer on theeth for easy 3d printing
//            gear_chamfer(invert_lead_angle);
        }
    }
    //bearing mount
    if (gear_type==3){
//        color("DarkOrange")
        difference(){
            if(invert_lead_angle)
                stirnrad (gears_module, gears_pinion1_teeth, gears_pinion_with, gears_pinion_mount_683_through, gears_pressure_angle, -gears_lead_angle, false);
            else
                stirnrad (gears_module, gears_pinion2_teeth, gears_pinion_with, gears_pinion_mount_683_through, gears_pressure_angle, gears_lead_angle, false);
            //chamfer top side for easy printing
            translate([0,0,gears_pinion_with+0.25])rotate([180,0,0])cylinder(h=1.5, r1=gears_pinion_mount_683_through/2+1.5, r2=gears_pinion_mount_683_through/2, center=false);
            //hole for bearing
            translate([0,0,-0.5])cylinder(h=gears_pinion_with+0.5-2, d=gears_pinion_mount_683, center=false);
            //chamfer on bearing opening
            translate([0,0,-0.5])cylinder(h=1, r1=gears_pinion_mount_683/2+2, r2=gears_pinion_mount_683/2, center=false);
            //chamfer on theeth for easy 3d printing
//            gear_chamfer(invert_lead_angle);
        }
    }
    //post mount
    if (gear_type==4){
        d = gears_pinion_mount_post_od;
        difference(){
            union(){
                if(invert_lead_angle)
                    stirnrad (gears_module, gears_pinion1_teeth, gears_pinion_with, pin_d_loose, gears_pressure_angle, -gears_lead_angle, false);
                else
                    stirnrad (gears_module, gears_pinion2_teeth, gears_pinion_with, pin_d_loose, gears_pressure_angle, gears_lead_angle, false);
            }
            //hole for pin
            translate([0,0,-0.5])cylinder(h=gears_pinion_with+1, d=d, center=false);
            //chamfer for easy printing
            translate([0,0,-0.5])
                cylinder(h=1, r1=d/2+1, r2=d/2, center=false);
            translate([0,0,gears_pinion_with+0.5])rotate([180,0,0])
                cylinder(h=1, r1=d/2+1, r2=d/2, center=false);
            //chamfer on theeth for easy 3d printing
//            gear_chamfer(invert_lead_angle);
        }
    }
    //worm gear for servo
    if ((gear_type==5)||(gear_type==6)){
//        color("DarkOrange")
        difference(){
        union(){
            //worm_gear
            schnecke(gears_module, gears_worm_threads, gears_worm_height, 0, gears_pressure_angle, gears_lead_angle, true);
            //base for servomount
            cylinder(h=servo_arm_h+1, d=13, center=false);
        }
        union(){
            if(worm_mount==1){
                //bearing seat inner ring
                translate([0,0,gears_worm_height-2*3dp_lh])difference(){
                    cylinder(h=2*3dp_lh+0.1, d=gears_worm_da+4, center=false);
                    cylinder(h=3dp_lh, d=M3_loose_hole_d+4*3dp_ew, center=false);
                    cylinder(h=2*3dp_lh, d=M3_loose_hole_d+2*3dp_ew, center=false);
                }
            }
            //hole for screwshaft
            translate([0,0,servo_arm_h+3]){cylinder(h=gears_worm_height, d=M3_drill_hole_d, center=false);};
            //hole for screw alighnment help
            translate([0,0,gears_worm_height-1.5]){cylinder(h=gears_worm_height, d=M3_loose_hole_d, center=false);};
            //hole for servoarm
            servo_arm (servo_arm_d ,servo_arm_h,servo_arm_w1,servo_arm_w2,servo_arm_l);
            }
        }  
    }
    //worm gear for N20
    if (gear_type==7){
	//servo_arm_h = 4;
//        color("DarkOrange")
        difference(){
        union(){
            //worm_gear
            schnecke(gears_module, gears_worm_threads, gears_worm_height, 0, gears_pressure_angle, gears_lead_angle, true);
            //base for servomount
            cylinder(h=4, d=13, center=false);
        }
        union(){
            if(worm_mount==1){
                //bearing seat inner ring
                translate([0,0,gears_worm_height-2*3dp_lh])difference(){
                    cylinder(h=2*3dp_lh+0.1, d=gears_worm_da+4, center=false);
                    cylinder(h=3dp_lh, d=M3_loose_hole_d+4*3dp_ew, center=false);
                    cylinder(h=2*3dp_lh, d=M3_loose_hole_d+2*3dp_ew, center=false);
                }
            }
            //hole for screwshaft
            translate([0,0,7]){cylinder(h=gears_worm_height, d=M3_drill_hole_d, center=false);};
            //hole for screw alighnment help
            translate([0,0,gears_worm_height-1.5]){cylinder(h=gears_worm_height, d=M3_loose_hole_d, center=false);};
            //hole for servoarm
            translate([0,0,-(N20_h_axsis_base+0.1)])N20_body();
            //chamfer for axis
            translate([0,0,-0.5])cylinder(1, N20_d_axis/2+1,N20_d_axis/2, false);
            }
        }  
    }
}

module gear_chamfer(invert_lead_angle){
    //select proper param
    id = (invert_lead_angle)? gears_pinion1_df : gears_pinion2_df;
    ad = (invert_lead_angle)? gears_pinion1_ad : gears_pinion2_ad;

    translate([0,0,gears_pinion_with+0.01])rotate_extrude()//($fn=200) 
    polygon( points=[[id/2,0],[ad/2+0.5,0],[(ad/2+0.5),-((ad/2+0.5)-id/2)/2]]);
}

module chamfer(d,h){
    translate([0,0,0])rotate_extrude()//($fn=200) 
    polygon( points=[[d/2+0.1,-0.01],[d/2+0.1,h],[d/2-h,-0.01]]);
}

//creates pinion gears or worm gear with different mounting options
//gear_type = type of gear to create
//1 = pinion mounted on screw head
//2 = pinion mounted on pin
//3 = pinion mounted on bearing 683ZZ
//4 = pinion mounted on post
//5 = worm gear for servo
//6 = worm gear for N20
module gear_dummy(gear_type,worm_mount=0,invert_lead_angle=false){
    //pinion mounted on screw head
    if (gear_type==1){
        difference(){
            color("DarkOrange")union(){
                if(invert_lead_angle)
                    cylinder(h=gears_pinion_with, d=gears_pinion1_ad, center=false);
                else
                    cylinder(h=gears_pinion_with, d=gears_pinion2_ad, center=false);
            }
            //chamfer for easy printing
            translate([0,0,-0.5])cylinder(h=1, r1=3.8/2+1, r2=3.8/2, center=false);
            //head
            translate([0,0,-0.5])cylinder(h=gears_pinion_with+0.5-3, d=gears_pinion_mount_screw, center=false);
        }
    }
    //pinion mounted on pin
    if (gear_type==2){
       difference(){
            color("DarkOrange")union(){
                if(invert_lead_angle)
                    cylinder(h=gears_pinion_with, d=gears_pinion1_ad, center=false);
                else
                    cylinder(h=gears_pinion_with, d=gears_pinion2_ad, center=false);
            }
            //hole for pin
            translate([0,0,-0.5])cylinder(h=gears_pinion_with+1, d=pin_d_loose, center=false);
            //chamfer for easy printing
            translate([0,0,-0.5])
                cylinder(h=1, r1=pin_d_loose/2+1, r2=pin_d_loose/2, center=false);
            translate([0,0,gears_pinion_with+0.5])rotate([180,0,0])
                cylinder(h=1, r1=pin_d_loose/2+1, r2=pin_d_loose/2, center=false);
        }
    }
    //bearing mount
    if (gear_type==3){
        color("DarkOrange")
        difference(){
            if(invert_lead_angle)
                cylinder(h=gears_pinion_with, d=gears_pinion1_ad, center=false);
            else
                cylinder(h=gears_pinion_with, d=gears_pinion2_ad, center=false);
            //chamfer top side for easy printing
            translate([0,0,gears_pinion_with+0.25])rotate([180,0,0])cylinder(h=1.5, r1=gears_pinion_mount_683_through/2+1.5, r2=gears_pinion_mount_683_through/2, center=false);
            //hole for bearing
            translate([0,0,-0.5])cylinder(h=gears_pinion_with+0.5-2, d=gears_pinion_mount_683, center=false);
	    //through hole for bearing inner ring
            translate([0,0,-0.5])cylinder(h=gears_pinion_with+1, d=gears_pinion_mount_683_through, center=false);
            //chamfer on bearing opening
            translate([0,0,-0.5])cylinder(h=1, r1=gears_pinion_mount_683/2+2, r2=gears_pinion_mount_683/2, center=false);
            //chamfer on theeth for easy 3d printing
            gear_chamfer(invert_lead_angle);
        }
    }
    //pinion mounted on post
    if (gear_type==4){
        d = gears_pinion_mount_post_od;
       difference(){
            color("DarkOrange")union(){
                if(invert_lead_angle)
                    cylinder(h=gears_pinion_with, d=gears_pinion1_ad, center=false);
                else
                    cylinder(h=gears_pinion_with, d=gears_pinion2_ad, center=false);
                //add post for less friction
//                translate([0,0,gears_pinion_with])
//                    rotate([0,0,0])
//                        cylinder(h=0.25, d=pin_d_loose+4, center=false);
            }
            //hole for pin
            translate([0,0,-0.5])cylinder(h=gears_pinion_with+1, d=d, center=false);
            //chamfer for easy printing
            translate([0,0,-0.5])
                cylinder(h=1, r1=d/2+1, r2=d/2, center=false);
            translate([0,0,gears_pinion_with+0.5])rotate([180,0,0])
                cylinder(h=1, r1=d/2+1, r2=d/2, center=false);
        }
    }
    //worm gear for servo
    if ((gear_type==5)||(gear_type==6)){
        color("DarkOrange")difference(){
        union(){
            //worm_gear
            cylinder(h=gears_worm_height, d=gears_worm_da, center=false);
//            schnecke(gears_module, gears_worm_threads, gears_worm_height, 0, gears_pressure_angle, gears_lead_angle, true);
            //base for servomount
            cylinder(h=servo_arm_h+1, d=13, center=false);
        }
        union(){
            if(worm_mount==1){
                //bearing seat inner ring
                translate([0,0,gears_worm_height-2*3dp_lh])difference(){
                    cylinder(h=2*3dp_lh+0.1, d=gears_worm_da+4, center=false);
                    cylinder(h=3dp_lh, d=M3_loose_hole_d+4*3dp_ew, center=false);
                    cylinder(h=2*3dp_lh, d=M3_loose_hole_d+2*3dp_ew, center=false);
                }
            }
            //hole for screwshaft
            translate([0,0,servo_arm_h+3]){cylinder(h=gears_worm_height, d=M3_drill_hole_d, center=false);};
            //hole for screw alighnment help
            translate([0,0,gears_worm_height-1.5]){cylinder(h=gears_worm_height, d=M3_loose_hole_d, center=false);};
            //hole for servoarm
            servo_arm (servo_arm_d ,servo_arm_h,servo_arm_w1,servo_arm_w2,servo_arm_l);
            }
        }  
    }
    //worm gear for N20
    if (gear_type==7){
	//servo_arm_h = 4; 
        color("DarkOrange")difference(){
        union(){
            //worm_gear
            cylinder(h=gears_worm_height, d=gears_worm_da, center=false);
            //schnecke(gears_module, gears_worm_threads, gears_worm_height, 0, gears_pressure_angle, gears_lead_angle, true);
            //base for servomount
            cylinder(h=4, d=13, center=false);
        }
        union(){
            if(worm_mount==1){
                //bearing seat inner ring
                translate([0,0,gears_worm_height-2*3dp_lh])difference(){
                    cylinder(h=2*3dp_lh+0.1, d=gears_worm_da+4, center=false);
                    cylinder(h=3dp_lh, d=M3_loose_hole_d+4*3dp_ew, center=false);
                    cylinder(h=2*3dp_lh, d=M3_loose_hole_d+2*3dp_ew, center=false);
                }
            }
            //hole for screwshaft
            translate([0,0,7]){cylinder(h=gears_worm_height, d=M3_drill_hole_d, center=false);};
            //hole for screw alighnment help
            translate([0,0,gears_worm_height-1.5]){cylinder(h=gears_worm_height, d=M3_loose_hole_d, center=false);};
            //hole for servoarm
            translate([0,0,-(N20_h_axsis_base+0.1)])N20_body();
            //chamfer for axis
            translate([0,0,-0.5])cylinder(1, N20_d_axis/2+1,N20_d_axis/2, false);
            }
        }  
    }
    //worm gear for N20 with bearing mount
/*    if (gear_type==8){
	servo_arm_h = 4; 
        color("DarkOrange")difference(){
        union(){
            //worm_gear
            cylinder(h=gears_worm_height, d=gears_worm_da, center=false);
            //schnecke(gears_module, gears_worm_threads, gears_worm_height, 0, gears_pressure_angle, gears_lead_angle, true);
            //base for servomount
            cylinder(h=4, d=13, center=false);
        }
        union(){
            //bearing seat inner ring
            translate([0,0,gears_worm_height-2*3dp_lh])difference(){
                cylinder(h=2*3dp_lh+0.1, d=gears_worm_da+4, center=false);
                cylinder(h=3dp_lh, d=M3_drill_hole_d+4*3dp_ew, center=false);
                cylinder(h=2*3dp_lh, d=M3_drill_hole_d+2*3dp_ew, center=false);
            }
	    //hole for screwshaft
            translate([0,0,servo_arm_h+3]){cylinder(h=gears_worm_height-10, d=M3_drill_hole_d, center=false);};
            //hole for screw alighnment help
            translate([0,0,servo_arm_h+12]){cylinder(h=gears_worm_height-10, d=M3_loose_hole_d, center=false);};
            //hole for servoarm
            translate([0,0,-(N20_h_axsis_base+0.1)])N20_body();
            //chamfer for axis
            translate([0,0,-0.5])cylinder(1, N20_d_axis/2+1,N20_d_axis/2, false);
            }
        }  
    }*/
}

//creates bevel gears
//gear_type = type of gear to create
//1 = bevel gear mounted on N20
//2 = bevel gear mounted on bearing
module bevel_gear(gear_type){
    //param
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
    
    //test param
    N20_d_axis=3.0;
    N20_d_cutoff=2.5;
    pi=3.14159;
    gears_pinion_mount_683 = 7.3;   //hole for bearing press fit
    gears_pinion_mount_683_through = 5.5;
    
    //indentation/fillet param
    tape_wheel_teeth_h =1;  //height of teeth
    hole_dia = 1.5 - 0.1;   //+-0,1 tolerance so teeth needs to fit 1,4 mm hole
    fillet_w = sqrt(pow(hole_dia,2)-pow(tape_wheel_teeth_h,2))-0.1;          //needs to fit in tape holes of D1.5 mm
    fillet_l =0.5;          //height of fillet with width of fillet_w (without the height of the round tip
    fillet_dist =4;         //distance between tape holes, should be fixed
    tape_wheel_teeth =60;   //number of teeth on wheel
    echo("make this dependent on layerheight");
    tape_wheel_u = fillet_dist * tape_wheel_teeth;//results from number of teeth and teeth dist
    tape_wheel_d = tape_wheel_u/pi;//results from number of teeth
    echo("Tape wheel diameter =",tape_wheel_d);
    
    
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
	
	echo("Kegelwinkel Rad = ", delta_rad);
	echo("Kegelwinkel Ritzel = ", delta_ritzel);
 
	df_rad = pi*rg*delta_rad/90 - 2 * (modul + c);			// Fußkegeldurchmesser auf der Großkugel 
	rf_rad = df_rad / 2;									// Fußkegelradius auf der Großkugel
	delta_f_rad = rf_rad/(pi*rg) * 180;						// Kopfkegelwinkel
	rkf_rad = rg*sin(delta_f_rad);							// Radius des Kegelfußes
	hoehe_f_rad = rg*cos(delta_f_rad);						// Höhe des Kegels vom Fußkegel

	echo("Höhe Rad = ", hoehe_f_rad);
	echo("Höhe Ritzel = ", hoehe_f_ritzel);
	
	drehen = istgerade(zahnzahl_ritzel);
    
    //bevel mounted on N20
    if (gear_type==1){
        color("DarkOrange")difference(){
            pfeilkegelrad(modul, zahnzahl_ritzel, delta_ritzel, zahnbreite, 1, eingriffswinkel, -schraegungswinkel);
            union(){
                //hole for screwshaft
                difference(){
                    translate([0,0,-0.5]){cylinder(h=hoehe_f_ritzel+1, d=N20_d_axis, center=false);};
                    translate([N20_d_cutoff,0,hoehe_f_ritzel/2+0.5])cube([N20_d_axis,N20_d_axis*2,hoehe_f_ritzel+2],true);
                }
                //chamfer for axis
                translate([0,0,-0.5])cylinder(1, N20_d_axis/2+1,N20_d_axis/2, false);
                }
        }
    }
    //bevel gear mounted on bearing
    if (gear_type==2){
        color("DarkOrange")difference(){
            union(){
                //bevel gear
                translate([0,0,4])pfeilkegelrad(modul, zahnzahl_rad, delta_rad, zahnbreite, 3.2, eingriffswinkel, schraegungswinkel);
                //cylinder to connect bevel gear to tape wheel
                cylinder(h=4+0.01, d=47.0, center=false);
                //cylinder for tape wheel
                difference(){
                    cylinder(h=tape_wheel_teeth_h+1, d=tape_wheel_d-1, center=false);
                    chamfer((tape_wheel_d-1),0.5);
                } 
                //generate teeth
                for (i =[0:(360/tape_wheel_teeth):360]){
                rotate([0,0,i])
                    translate([tape_wheel_d/2,0,0])union(){
                        //shape of indentation
                        tooth(tape_wheel_teeth_h,fillet_w,fillet_l);
                }
                }
            }
            union(){
                //bearing seat for 623 2RS 3x10x4 mm -> maybe later, biggest m3 bearing i found
                translate([0,0,-0.5])cylinder(h=10, d=gears_pinion_mount_623_through, center=false);
                //hole for bearing
                translate([0,0,2])cylinder(h=10, d=gears_pinion_mount_623, center=false);
                //chamfer on bearing opening
                translate([0,0,5])cylinder(h=1, r2=gears_pinion_mount_623/2+1, r1=gears_pinion_mount_623/2, center=false);
                //chamfer top side for easy printing
                translate([0,0,-0.1])cylinder(h=1.5, r1=gears_pinion_mount_623_through/2+1.5, r2=gears_pinion_mount_623_through/2, center=false);
            }
        }
    }
}

module tooth(height,width,length){
    difference(){
        linear_extrude(height = height, center = false, convexity = 10){
            polygon([[-width-length,-width],[-length,-width/2],[0,-width/2],[0,width/2],[-length,width/2],[-width-length,width]],[[0,1,2,3,4,5,0]]);
            translate([0,0,0])circle(d=width);
        }
        union(){
            //chamfer for straigt part
            translate([-length,0,0])
                rotate([0,90,0])
                    linear_extrude(height = length, center = false, convexity = 10)
                    {
                    translate([0,-width/2,0])polygon([[0.01,-0.01],[-0.25,-0.01],[0.01,0.25]],[[0,1,2,0]]);
                    translate([0,width/2,0])polygon([[0.01,0.01],[-0.25,0.01],[0.01,-0.25]],[[0,1,2,0]]);
                    }
            //chamfer round tip
            translate([0,0,0])rotate([0,0,-90])rotate_extrude(angle=180)//,$fn=200) 
            polygon( points=[[width/2+0.01,-0.01],[width/2+0.01,0.25],[width/2-0.25,-0.01]]);
        }
    }
}
