//***********************************************************************
//                  PARAMETERS OLD now in array to make adding new one easier
//***********************************************************************
//servo arm param
/*servo_arm_d = 7;        //diamteter of center part
servo_arm_h = 4;        //hight of servo arm
servo_arm_w1 = 5.3;     //greatest arm with, close to round center part
servo_arm_w2 = 4;       //arm with measured at last hole, most distant from center
servo_arm_l = 29;       //distance between outer most holes
servo_arm_dist = 2;   //distance between servoarm and servobody, when mounted
//servo body + mount param
servo_w = 12;           //with or thickness of servo, should be between 12 and 12.5
servo_h = 28;           //hight of mainbody, without axis/shaft
servo_l = 23;           //lenght of servo mainbody (not the mount)
servo_shaft_d = 5;      //diameter of servo axis/shaft
servo_shaft_h = 3;      //hight of servo axis/shaft
servo_shaft_dist = 5.5; //distnace shaft from center mainbody
servo_mount_l = 33;     //lenght of mount, should be 32 to 34
servo_mount_dist = 8;   //distance from topside of mainbody to mount
servo_hole_dist = 27.7; //distance of mounting holes, should be 26 to 28*/

//***********************************************************************
//                  SERVO motor specification
//***********************************************************************
//param order: [servo_arm_d,servo_arm_h ,servo_arm_w1,servo_arm_w2,servo_arm_l,servo_arm_dist,servo_w,servo_h,servo_l,servo_shaft_d,servo_shaft_h,servo_shaft_dist,servo_mount_l, servo_mount_dist,servo_hole_dist]

SG90 =  [7,4,5.3,4,29,2,12,28,23.2,5,3,5.5,33,8.5,27.7];
MG90 =  [7,4,5.3,4,29,2,12,29,23.2,5,3,5.5,33,7.5,27.7];
Servo_List = [SG90,MG90];
Servo = Servo_List[servo_type];

//set param according to selected servo
servo_arm_d = Servo[0];        //diamteter of center part
servo_arm_h = Servo[1];        //hight of servo arm
servo_arm_w1 = Servo[2];     //greatest arm with, close to round center part
servo_arm_w2 = Servo[3];       //arm with measured at last hole, most distant from center
servo_arm_l = Servo[4];       //distance between outer most holes
servo_arm_dist = Servo[5];   //distance between servoarm and servobody, when mounted
//servo body + mount param
servo_w = Servo[6];           //with or thickness of servo, should be between 12 and 12.5
servo_h = Servo[7];           //hight of mainbody, without axis/shaft
servo_l = Servo[8];           //lenght of servo mainbody (not the mount)
servo_shaft_d = Servo[9];      //diameter of servo axis/shaft
servo_shaft_h = Servo[10];      //hight of servo axis/shaft
servo_shaft_dist = Servo[11]; //distnace shaft from center mainbody
servo_mount_l = Servo[12];     //lenght of mount, should be 32 to 34
servo_mount_dist = Servo[13];   //distance from topside of mainbody to mount
servo_hole_dist = Servo[14]; //distance of mounting holes, should be 26 to 28

module servo(){
    color("FireBrick")difference(){
        servo_body(servo_w,servo_h,servo_l,servo_shaft_d,servo_shaft_h,servo_shaft_dist,servo_mount_l,servo_mount_dist);
        servo_mount(servo_h,servo_shaft_dist,servo_hole_dist);
    }
    color("FireBrick")translate([0,0,-servo_arm_dist])rotate([0,180,90])servo_arm(servo_arm_d ,servo_arm_h,servo_arm_w1,servo_arm_w2,servo_arm_l);
}

module servo_body(servo_w,servo_h,servo_l,servo_shaft_d,servo_shaft_h,servo_shaft_dist,servo_mount_l,servo_mount_dist){
    //genarate servo itself
    union()
     {
        //shaft
        translate([0,0,-servo_shaft_h])cylinder(h=servo_shaft_h+0.1, d=servo_shaft_d, center=false);
        //mainbody
        translate([servo_shaft_dist,0,0])
            union(){
                translate([0,0,servo_h/2])cube([servo_l,servo_w,servo_h],true);
                translate([0,0,servo_mount_dist+2.5/2])cube([servo_mount_l,servo_w,2.5],true);
            }
    }
}

//generates servo mount
module servo_mount(servo_h,servo_shaft_dist,servo_hole_dist){
    //genarate mounting holes
    translate([servo_shaft_dist,0,0])union(){
        //mounting holes
        translate([-servo_hole_dist/2,0,1])cylinder(h=servo_h-1, d=1.8, center=false);
        translate([servo_hole_dist/2,0,1])cylinder(h=servo_h-1, d=1.8, center=false);
    }
}

module servo_arm_test(servo_arm_d ,servo_arm_h,servo_arm_w1,servo_arm_w2,servo_arm_l){
    difference(){
        translate([0,0,(servo_arm_h+2)/2])cube([servo_arm_l-1,servo_arm_d+5,servo_arm_h+2],true);
        servo_arm (servo_arm_d ,servo_arm_h,servo_arm_w1,servo_arm_w2,servo_arm_l);
    }
}

//servo_arm_d diamteter of center part
//servo_arm_h hight of center part
//servo_arm_w1 greatest arm with, close to round center part
//servo_arm_w2 arm with measured at last hole, most distant from center
//servo_arm_l distance between outer most holes
module servo_arm (servo_arm_d ,servo_arm_h,servo_arm_w1,servo_arm_w2,servo_arm_l){
    arm_offset = sqrt(pow(servo_arm_d/2,2)-pow(servo_arm_w1/2,2));
    arm_lenght = servo_arm_l/2 - arm_offset;
    clearance = 0.1;        //clearance for 3Dprinting
    
    //servoarms building
    CubePoints = [
      [  0,  -(servo_arm_w1/2+clearance),  0 ],                 //0
      [ arm_lenght,  -(servo_arm_w2/2+clearance),  0 ],         //1
      [ arm_lenght,  (servo_arm_w2/2+clearance),  0 ],          //2
      [  0,  (servo_arm_w1/2+clearance),  0 ],                  //3
      [  0,  -(servo_arm_w1/2+clearance),  servo_arm_h+1 ],           //4
      [ arm_lenght,  -(servo_arm_w2/2+clearance),  servo_arm_h+1 ],   //5
      [ arm_lenght,  (servo_arm_w2/2+clearance),  servo_arm_h+1 ],    //6
      [  0,  (servo_arm_w1/2+clearance),  servo_arm_h+1 ]];           //7 
    CubeFaces = [
      [0,1,2,3],  // bottom
      [4,5,1,0],  // front
      [7,6,5,4],  // top
      [5,6,2,1],  // right
      [6,7,3,2],  // back
      [7,4,0,3]]; // left
      
    union(){
      //servoarms
        translate([arm_offset,0,-1])polyhedron( CubePoints, CubeFaces );
        mirror(v= [1, 0, 0] ) {translate([arm_offset,0,-1])polyhedron( CubePoints, CubeFaces );}
    //center cylinder
        translate([0,0,-1])cylinder(h = servo_arm_h+1, d=(servo_arm_d+2*clearance), center=false);
    }      
}
