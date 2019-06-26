//***********************************************************************
//                  Hardware
//***********************************************************************
//creates a pressfit/dowel pin hole
module hole_pin(x,y,z,rx,ry,rz,l_pin,d_pin,chamfer=true){
    translate([x,y,z])rotate([rx,ry,rz])union(){
        cylinder(h=l_pin, d=d_pin, center=false);
        //chamfer
        if (chamfer){
            translate([0,0,-0.5])cylinder(1, d1=d_pin+2,d2=d_pin, false);
            translate([0,0,l_pin-0.5])cylinder(1, d1=d_pin,d2=d_pin+2, false);
        }
    }
}

//creates a outer chamfer
//di = inner diameter (e.g. of post)
//da = outer diameter
module post_chamfer(id,ad){
    //translate([0,0,gears_pinion_with+0.01])
    rotate_extrude() 
    polygon( points=[[id/2,0],[ad/2,0],[id/2,(ad/2-id/2)]]);
}

//creates a countersunk 912 screw hole in z direction
//d = diameter
//l = length
//d_head = head diameter
//k = head countersunk depth
module hole_screw_912_countersunk(x,y,z,rx,ry,rz,d,l,d_head,k){
    s=(d_head-d)/2;
    translate([x,y,z])rotate([rx,ry,rz])union(){
        difference(){
            union()
            {
                //screw head
                translate([0,0,-0.1])cylinder(k+0.1, d=d_head, center=false);
                //scew head steps for easy 3d printing
                translate([-(d_head+5)/2,-d/2,k-0.1])cube([d_head+5,d,0.5+0.1],false);
                translate([-d/2,-d/2,k-0.1])cube([d,d,1+0.1],false);
                //screw shaft
                cylinder(h=l, d=d, center=false);
            }
            difference(){
                //build negative to cut acess form screw + screw steps
                translate([-d_head,-d_head,0])cube([d_head*2,d_head*2,l],false);
                translate([0,0,-0.5])cylinder(l+1, d=d_head, center=false);
            }
        }
        //translate([0,0,k-0.001])cylinder(s, d_head/2,d_head/2-s, false);
    }
}

//creates a countersunk 912 screw hole in xy direction
//d = diameter
//l = length
//d_head = head diameter
//k = head countersunk depth
module hole_screw_912_countersunkxy(x,y,z,rx,ry,rz,d,l,d_head,k){
    s=(d_head-d)/2;
    translate([x,y,z])rotate([rx,ry,rz])union(){
        //difference(){
            //union()
            //{
                //screw head
                translate([0,0,-0.1])cylinder(k+0.1, d=d_head, center=false);
                //scew head steps for easy 3d printing
                //translate([-(d_head+5)/2,-d/2,k-0.1])cube([d_head+5,d,0.5+0.1],false);
                //translate([-d/2,-d/2,k-0.1])cube([d,d,1+0.1],false);
                //screw shaft
                cylinder(h=l, d=d, center=false);
            //}
            //difference(){
                //build negative to cut acess form screw + screw steps
               // translate([-d_head,-d_head,0])cube([d_head*2,d_head*2,l],false);
               //translate([0,0,-0.5])cylinder(l+1, d=d_head, center=false);
            //}
        //}
        //translate([0,0,k-0.001])cylinder(s, d_head/2,d_head/2-s, false);
    }
}



//creates a countersunk screw hole
//d = diameter
//l = length
//d_head = head diameter
//k = head countersunk depth
module hole_screw_countersunk(x,y,z,rx,ry,rz,d,l,d_head,k){
    s=(d_head-d)/2;
    translate([x,y,z])rotate([rx,ry,rz])union(){
        //shaft
        cylinder(h=l, d=d, center=false);
        //head
        translate([0,0,-0.1])cylinder(k+0.1, d=d_head, center=false);
        //head chamfer part
        translate([0,0,k-0.001])cylinder(s, d_head/2,d_head/2-s, false);
    }
}

//creats DIN 7 dowel Pin
//d = diameter
//l = length
module hardware_pin_din7(d,l,c){
    //calc diameter od face
    r_ends = (d/2)/(sin((4*atan(2*c/d))/2));
    color("Silver")union(){
        difference(){
            translate([0,0,-l-2*c+r_ends])sphere(r = r_ends);
            translate([0,0,-l-c])cylinder(r_ends*2, d=r_ends*2+1, center=false);
        }
        difference(){
            translate([0,0,-r_ends])sphere(r = r_ends);
            translate([0,0,-c-r_ends*2])cylinder(r_ends*2, d=r_ends*2+1, center=false);
        }
        translate([0,0,-l-c])cylinder(l, d=d, center=false);
    }
}

//creates 683 bearing
module hardware_bearing_683(){
    //bearing measures are 3x7x3
    id = 3;
    od = 7;
    t = 3;
    id_ring = 4;
    od_ring = 6;
    color("SlateGray")translate([0,0,t/2])
        difference(){
            cylinder(t, d=od, center=true);
            translate([0,0,t/2])difference(){
                cylinder(0.2, d=od_ring, center=true);
                cylinder(t, d=id_ring, center=true);
            }
            translate([0,0,-t/2])difference(){
                cylinder(0.2, d=od_ring, center=true);
                cylinder(t, d=id_ring, center=true);
            }
            cylinder(t+1, d=id, center=true);
        }
}

//creats DIN 7991 countersunk screw
//d = diameter
//l = length
//d_head = head diameter
module hardware_screw_din7991(x,y,z,rx,ry,rz,d,l,d_head){
    k=d/3;
    s=(d_head-d)/2;
    color("Silver")translate([x,y,z])rotate([rx,ry,rz])union(){
        cylinder(h=l, d=d, center=false);
        translate([0,0,-k/2])cylinder(k, d=d_head, center=false);
        translate([0,0,k/2-0.001])cylinder(s, d_head/2,d_head/2-s, false);
    }
}

//creates shim
//id = inner diameter
//od = outer diameter
//t = thickness
module hardware_shim(id,od,t){
    color("Gray")difference(){
        cylinder(t, d=od, center=false);
        cylinder(t*2+1, d=id, center=true);
    }
}

//rounds values to the layerheight to get accurate prints
function round_lh(x) = round (x/3dp_lh)*3dp_lh ;
function round_lh_up(x) = ((round_lh(x))<x ? round_lh(x)+ 3dp_lh : round_lh(x) );
//rounds values to the extrusionwidth to get accurate prints
function round_ew(x) = round (x/3dp_ew)*3dp_ew ;
function round_ew_up(x) = ((round_ew(x))<x ? round_ew(x)+ 3dp_ew : round_ew(x) );
