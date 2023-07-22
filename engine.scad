// settings
$fa = 1;
$fs = 0.4;
bore = 10;
stroke = 10;

// engine block
module block() {
    difference() {
        // main block
        cube([16,16,16], center = true);
        
        // piston sleeve
        translate([0,0,-(bore+1)])
            cylinder(h=2*(bore+1), r=bore/2);
        
    }
}

// piston head
module pistonHead() {
    difference() {
        cylinder(h=bore/2, r=bore/2);
        
        sphere(r=0.8*(bore/2));
    }
}
translate([0,0,15])
    pistonHead();

// valve head
module valveHead() {
    difference() {
        cylinder(h=5, r=2.5);
        
        sphere(r=2.5);
    }
}

// conrod
module conrod() {
    //connector
    difference() {
        translate([0,0.3*(bore/2),0])
            rotate([90,0,0])
            cylinder(h=0.6*(bore/2),r=0.6*(bore/2));

        translate([0,0.3*(bore/2)+0.1,0])
            rotate([90,0,0])
            cylinder(h=0.7*(bore/2),r=0.2*(bore/2));
    }

    // rod
    translate([0,0,8.5])
        cube([0.6*(bore/2), 0.6*(bore/2), 14], center = true);

    // ball
    translate([0,0,15-3])
        sphere(r=0.6*(bore/2));
}
conrod();


// crankshaft
module arm() {
    union() {
        cube([5,2,5], center=true);
        translate([0,1,-2.5])
            rotate([90,0,0])
            cylinder(r=2.5, h=2);
        translate([0,1,2.5])
            rotate([90,0,0])
            cylinder(r=2.5, h=2);
    }
}

module crankshaft() {

    translate([0,-2.5,0])
        arm();

    translate([0,2.5,0])
        arm();

    translate([0,1.45,2.5])
        rotate([90,0,0])
        cylinder(r=1, h=3.1);

    translate([0,6,-2.5])
        rotate([90,0,0])
        cylinder(r=1, h=3.1);

    translate([0,-3,-2.5])
        rotate([90,0,0])
        cylinder(r=1, h=3.1);
}

/*
rotate([0,0,0])
    translate([0,0,2.5])
    crankshaft();
translate([0,0,5-0])
    conrod();
translate([0,0,17.5-0])
    pistonHead();
translate([0,0,18.5])
    block();
*/