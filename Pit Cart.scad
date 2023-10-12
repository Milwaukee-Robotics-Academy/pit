// Measurements are in inches.

mountingPlateDepth = 18.4;
mountingPlateWidth = 23.4;
mountingPlateHeight = 1.1;

woodThickness = 0.5;

// Top depth is mounting plate depth rounded up
// plus wood thickness * 3 (the compartment back pannel,
// the cart back pannel, and the mounting brackets for
// the cart back pannel) plus 2" storage compartment.
//  23.5"
topDepth = 23.5;

// Top width is 10 foot pit divided in half minus 2 inches for courtesy.
topWidth = 58;

// Battery Width 
batteryWidth = 7.375;

// Compartment height is a packout mounting plate
// plus a toolbox (14.3 inches) plus a vacuum 
// (12.8 inches) minus two cleats (0.4 inches) plus
// inch for clearance rounded up to the half inch.
compartmentHeight = 28.5;

// Compartment width is top width - 4 thicknesses of 
// wood - the width of the battery compartment. Then
// split that in half.
// 58 - 2 - 7.375
// 24.3125

compartmentWidth = (topWidth - (woodThickness * 4) - batteryWidth) /2;



// Top is compartment height plus wood thickness
// for the bottom plus the caster above the floor.
topZPosition = compartmentHeight + 5.5;

backYPosition = 19;


 // caster 
module caster() {
    translate([2.5, 1.5, 2])
    rotate([90, 0, 0])
    cylinder(1, 2, 2);
    
    translate([0, 0, 4.875])
    cube([5, 3, 0.125]);
}


module top() {
    translate([0, 0, topZPosition])
    cube([topWidth, topDepth, woodThickness]);
}

module frame() {
    translate([1, 1, 5])
    cube([54, 28, 27]); 
}

module framebottom() {
    translate([0, 0, 5])
    cube([topWidth, topDepth, 0.5]);
}

module frameside(position) {
    translate([position, 0, 5.5])
    cube([0.5, topDepth, compartmentHeight]);
}

module batteryCompartmentSides(x) {
    translate([x, 0, 5.5])
    cube([0.5, backYPosition, compartmentHeight]);
    translate([x + batteryWidth + woodThickness, 0, 5.5])
    cube([0.5, backYPosition, compartmentHeight]);
    translate([x + woodThickness, 8, 5.5])
    cube([batteryWidth, 0.5, compartmentHeight]);
}

module backPannel(position) {
    translate([position, backYPosition, 5.5])
    cube([compartmentWidth + woodThickness, woodThickness, compartmentHeight]);
}

module charger() {
    translate([(topWidth / 2) - (6.9 / 2) , 0, topZPosition - 5.6 - 1])
    cube([6.9, 14.2, 5.6]);
}

// 15, 19, 6

module packout() {
    
}
translate([1.5, 1.5, 0])
caster();
top();
// %frame();
framebottom();
frameside(0);
frameside(topWidth - woodThickness);
batteryCompartmentSides(compartmentWidth + woodThickness);
backPannel(woodThickness);
backPannel(topWidth - (woodThickness * 2) - compartmentWidth);
charger();
