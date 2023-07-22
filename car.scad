// settings
$fa = 1;
$fs = 0.4;

// car body
baseHeight = 1.5;
topHeight = 10;
wheelTurn = 20;
bodyRoll = 3;

rotate([bodyRoll,0,(wheelTurn/4)]) {
    // base
    scale([3, 1, baseHeight/2])
        sphere(r=10);

    // top
    translate([0,0,6 - 0.001])
        scale([1.5, .6, baseHeight/2])
        sphere(r=10);
}
    
    
// wheels
wheelRadius = 10;
wheelWidth = 0.4;
track = 40;

// front left
translate([-20,-(track/2),0])
    rotate([0,0,-wheelTurn])
    scale([1,wheelWidth,1])
    sphere(r=wheelRadius);
    
// front right
translate([-20,(track/2),0])
    rotate([0,0,-wheelTurn])
    scale([1,wheelWidth,1])
    sphere(r=wheelRadius);
    
// rear left
translate([20,-(track/2),0])
    scale([1,wheelWidth,1])
    sphere(r=wheelRadius);
    
// rear right
translate([20,(track/2),0])
    scale([1,wheelWidth,1])
    sphere(r=wheelRadius);

    
// axles

// front
translate([-20,0,0])
    rotate([90,0,0])
    cylinder(h=track,r=2,center=true);
    
// rear
translate([20,0,0])
    rotate([90,0,0])
    cylinder(h=track,r=2,center=true);