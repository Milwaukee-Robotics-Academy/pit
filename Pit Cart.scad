// caster 

module caster() {
    translate([2.5, 1.5, 2])
    rotate([90, 0, 0])
    cylinder(1, 2, 2);
    
    translate([0, 0, 4.875])
    cube([5, 3, 0.125]);
}


module top() {
    translate([0, 0, 32])
    cube([56, 30, 1]);
}

module frame() {
    translate([1, 1, 5])
    cube([54, 28, 27]); 
}

module framebottom() {
    translate([1, 1, 5])
    cube([54, 28, 0.5]);
}

module frameside(position) {
    translate([position, 1, 5.5])
    cube([0.5, 28, 26.5]);
}

module batteryCompartmentSides(x) {
    translate([x, 1, 5.5])
    cube([0.5, 8, 26.5]);
    translate([x + 7.875, 1, 5.5])
    cube([0.5, 8, 26.5]);
    translate([x, 9, 5.5])
    cube([8.375, 0.5, 26.5]);
}


// 15, 19, 6

module packout() {
    
}
translate([1.5, 1.5, 0])
caster();
top();
%frame();
framebottom();
frameside(1);
frameside(54.5);
batteryCompartmentSides(23.8125);