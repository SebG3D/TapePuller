use <hardware.scad>;
//***********************************************************************
//                  N20 motor
//***********************************************************************
//param for N20 motor
N20_l_axis = 10;        //length of axis
N20_d_axis = 3.2;         //diameter of axis
N20_t_cutoff = 2.4;     //"diameter" or thickness of cutoff
N20_d_axis_base = 4;    //ring around axis on fange
N20_h_axsis_base = 1;   //hight of ring
N20_l_body = 26;        //length of body (gears and motor)
N20_w_body = 12;        //with
N20_t_body = 10;        //tickness
N20_worm_mount_dist = 4; //distance between N20 mount and worm gear, is > 3

//N20();
//N20_mount(4,axis=true);

module N20(){
    color("FireBrick")difference(){
        N20_body();
        N20_mount(4,false);
    }
}

//creates mounting holes with scountersunk screws
// t_mount = thickness of mounting wall
module N20_mount(t_mount,axis=true){
    //param for N20 mount
    w_mounts = 9;      //distance screwholes
    //holes for screw
    hole_screw_countersunk(w_mounts/2,0,t_mount,180,0,0,1.9,t_mount+0.1,3.4,0.5);
    hole_screw_countersunk(-w_mounts/2,0,t_mount,180,0,0,1.9,t_mount+0.1,3.4,0.5);
    //hole for axis base and axis
    if (axis){
        translate([0,0,-0.1])cylinder(N20_h_axsis_base+0.5, d=(N20_d_axis_base+0.5), center=false);
        cylinder(t_mount+0.1, d=N20_d_axis+0.4, center=false);
        //translate([0,0,-1])cylinder(N20_h_axsis_base+1.5, d=(N20_d_axis_base+0.5), center=false);
    }
}

//creates N20 body and axis
module N20_body(){
    union(){
        //axis
        difference(){
            cylinder(N20_l_axis, d=N20_d_axis, center=false);
            translate([N20_t_cutoff,0,N20_l_axis/2])cube([N20_d_axis,N20_d_axis*2,N20_l_axis+1],true);
        }
        cylinder(N20_h_axsis_base, d=N20_d_axis_base, center=false);
        //body = gears + motor
        translate([0,0,-N20_l_body/2])cube([N20_w_body,N20_t_body,N20_l_body],true);
    }
}
