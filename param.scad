//-----------------------------------------------------------------------
//                  FEEDER PARAM
//-----------------------------------------------------------------------
//Feeder_Width = 13.5; //[13.5:8mm tape, 16:12mm tape, 20:16mm tape, 28:24mm tape]
feeder_width_list = [13.5,16,20,28];			//list of feeder width for different SMD tape width
Feeder_Width = feeder_width_list[SMD_Tape_Width];
feeder_mount_y_list = [7.55,9.55,11.55,15.55];		//list of y positions for feeder width
feeder_mount_y = feeder_mount_y_list[SMD_Tape_Width];


//-----------------------------------------------------------------------
//                  3D PRINTING PARAM
//-----------------------------------------------------------------------
M3_drill_hole_d = 3D_Printing_M3_tap/1000;  //diameter to directly screw M3 screws in
M3_loose_hole_d = 3D_Printing_M3_through/1000;  //diameter for thouhole
head_912_loose_d = 3D_Printing_M3_head/1000;  //head of a 912 screw helps for worm gear alighnment

//param for gear_mount = 1
gears_pinion_mount_screw = 3D_Printing_Mount_head/1000; //used for geartype==1 gear runs on screw head M3
//param for gear_mount = 2
pin_d_loose = 3D_Printing_Pin_loose/1000;              //hole diameter for loose pin
pin_d_fixed = 3D_Printing_Pin_pressfit/1000;             //hole diameter for press fit
gears_pinion_mount_shim = Shim_Thickness/1000;  //thickness of shim
//param for gear_mount = 3
gears_pinion_mount_683 = 3D_Printing_683_pressfit/1000;   //hole for bearing press fit
gears_pinion_mount_623 = 10.0;   //hole for bearing press fit
//param for gear_mount = 4
gears_pinion_mount_post_id = 9;     //needs to fit in od
gears_pinion_mount_post_od = 3D_Printing_Post_loose/1000;   //needs to fit id

//screw post param for case
//top has cylinder with scew in hole
//bottom has through hole and countersunk scew
case_post_top_od = M3_drill_hole_d + 8*3dp_ew;                   //top outer diameter
case_post_bot_id = head_912_loose_d+0.3;                 //bottom inner diameter needs to fit screw head
case_post_bot_od = case_post_bot_id+8*3dp_ew;  //bottom outer diameter
case_post_bot_id2 = case_post_top_od+0.4; //bottom inner diameter 2 needs to fit top outer diameter


pi = 3.14159;
//-----------------------------------------------------------------------
//                  GEARS PARAM
//-----------------------------------------------------------------------
//param gears, no need to change anything here
RPM_300 =  [20,10,0.9,15,20,2];
RPM_200 =  [20,17,1.0,14,20,3];
RPM_150 =  [20,22,1.0,13,20,4];
RPM_List = [RPM_300,RPM_200,RPM_150];
RPM_Values = RPM_List[N20_RPM];

gears_pressure_angle = RPM_Values[0];              //pressure angel for gears
gears_lead_angle = RPM_Values[1];                  //lead angle for gears
gears_module = RPM_Values[2];                     //module for gearset
gears_pinion1_teeth = RPM_Values[3];                //number of theeth for pinio gears
gears_pinion2_teeth = RPM_Values[4];                //number of theeth for pinio gears
gears_pinion_with = round_lh(Feeder_Width-6.5);                  //with of pinion gears
gears_worm_threads = RPM_Values[5];                 //number of threads on worm gear

//gears_pressure_angle = 20;              //pressure angel for gears
//gears_lead_angle = 10;                  //lead angle for gears
//gears_module = 0.9;                     //module for gearset
//gears_pinion1_teeth = 15;                //number of theeth for pinio gears
//gears_pinion2_teeth = 20;                //number of theeth for pinio gears
//gears_pinion_with = round_lh(Feeder_Width-6.5);                  //with of pinion gears
//gears_worm_threads = 2;                 //number of threads on worm gear
gears_worm_height = round_lh(22);                 //height of worm gear
gears_pinion_mount_683_through = 5.5;   //through hole diameter for 683
gears_pinion_mount_623_through = 8;   //through hole diameter for 623
//some calculated values
c = gears_module / 6;					// Kopfspiel
gears_worm_r = gears_module*gears_worm_threads/(2*sin(gears_lead_angle));		// Teilzylinder-Radius Schnecke
gears_pinion1_r = gears_module*gears_pinion1_teeth/2;									// Teilkegelradius Stirnrad
gears_pinion2_r = gears_module*gears_pinion2_teeth/2;
gears_pinion1_df = 2*gears_pinion1_r - 2 * (gears_module + c);//inner diameter/start of teeth
gears_pinion2_df = 2*gears_pinion2_r - 2 * (gears_module + c);//inner diameter/start of teeth
gears_worm_rf = gears_worm_r - gears_module - c;						// Fußzylinder-Radius
//gamma = -90*gears_pinion_with*sin(gears_lead_angle)/(pi*gears_pinion_r);			// Rotationswinkel Stirnrad
gears_tooth_dist = gears_module*pi/cos(gears_lead_angle);				// gears_tooth_dist im Transversalschnitt
gears_pinion1_ad = (gears_module <1)? gears_pinion1_r*2 + gears_module * 2.2 : gears_pinion1_r*2 + gears_module * 2;				// Kopfkreisdurchmesser nach DIN 58400 bzw. DIN 867
gears_pinion2_ad = (gears_module <1)? gears_pinion2_r*2 + gears_module * 2.2 : gears_pinion2_r*2 + gears_module * 2;
gears_worm_da = gears_worm_r*2.3;

//-----------------------------------------------------------------------
//                  CASE
//-----------------------------------------------------------------------
case_h = 70; //hight of tapepuller case
case_w = round_lh(Feeder_Width - 3dp_lh);
case_walls=3;                           //wall thickness for test assemblys
case_walls_z = 4*3dp_lh;		//wall thickness in Z
case_tape_channel = 2;                  //with of tape channel
case_offset_n20 = 20;			//offset form worm x to tape channel if n20 motor is used

//Feeder_Width = 13.5; //[13.5:8mm tape, 16:12mm tape, 20:16mm tape, 28:24mm tape]
//feeder_width_list = [13.5,16,20,28];			//list of feeder width for different SMD tape width
//Feeder_Width = feeder_width_list[SMD_Tape_Width];
//feeder_mount_y_list = [7.55,9.55,11.55,15.55];		//list of y positions for feeder width
//feeder_mount_y = feeder_mount_y_list[SMD_Tape_Width];

//pramam for positioning
gear1z = case_h-case_walls-gears_pinion1_r-6-4;
//calc gear2 z position with 45°
gear2z = gear1z + (gears_pinion1_r+gears_pinion2_r)/sqrt(2);
wormx = (Motor_Type == 2)? 18 : (servo_mount_l/2-servo_shaft_dist+case_walls+0.5+4);
//wormx = servo_mount_l/2-servo_shaft_dist+case_walls+0.5+4;
gear1x = wormx+gears_worm_r+gears_pinion1_r;
gear2x = gear1x+sqrt(pow(gears_pinion1_r+gears_pinion2_r,2)-pow(gear1z-gear2z ,2));
//added -3,5 for 912 screwhead
wormz = case_h-gears_worm_height-case_walls-0.5-3.5-6;

// param for case lever
case_lever_w = case_w-2*case_walls_z-2*3dp_lh;   //with of lever
case_lever_t1 = 7;                                        //thickness above case
case_lever_t2 = 17;                                       //thickness behind case
rotate_x = (Motor_Type == 2)? (wormx + case_offset_n20 + case_tape_channel+case_lever_t2/2) : (wormx + servo_shaft_dist + servo_mount_l/2 + case_tape_channel+case_lever_t2/2);  //x position of rotation point
rotate_z = (Motor_Type == 2)? (wormz-case_walls+case_lever_t2/2-0.5) : (wormz-servo_arm_dist-servo_mount_dist+case_lever_t2/2);  //z position of rotation point
