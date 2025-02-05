// ttgo_20191212_t22_V1.1 model

module ttgoV2Model()
{
    // http://www.lilygo.cn/claprod_view.aspx?TypeId=62&Id=1281&FId=t28:62:28
    ttgox = 32.89;
    ttgoy = 100.13;
    ttgoSMD = 3; ///< SMD Standoff
    ttgoPCB = 2; ///< PCB thickness
    ttgoPCBHoleOff = 2.36;
    ttgoPCBHoleDia = 2;
    rd=2;
    //%cube([ttgox,ttgoy,1], center=true);
    
    // OLED Screen
    color("black")
    translate([ttgox/2-6-7.5,+ttgoy/2-25,ttgoPCB/2+ttgoSMD+1+2])
        union()
        {
            cube([15,25,2],center=true);
        }
    color("blue")
    translate([0,+ttgoy/2-25,ttgoPCB/2+ttgoSMD+1])
        union()
        {
            cube([30,30,2],center=true);
        }
    
    // SMD ANTENNA
    translate([ttgox/2-7/2,-ttgoy/2+40,ttgoPCB/2+10/2])
        union()
        {
            cube([7,6,10],center=true);
            translate([6/2,0,1])
              rotate([0,90,0])
                cylinder(r=6/2, h=6);
        }
    translate([ttgox/2-7/2,-ttgoy/2+40,-ttgoPCB/2-3/2])
        union()
        {
            cube([7,6,3],center=true);
        }

    // USB
    translate([-ttgox/2+6/2-1,2,ttgoPCB/2+3/2])
            cube([6,6,3],center=true);
        
    // Button
    translate([-ttgox/2+5/2-1,-7,ttgoPCB/2+3/2])
            cube([5,5,3],center=true);
    translate([-ttgox/2+5/2-1,-7-9.5,ttgoPCB/2+3/2])
            cube([5,5,3],center=true);
    translate([-ttgox/2+5/2-1,-7-9.5-9.5,ttgoPCB/2+3/2])
            cube([5,5,3],center=true);
            
    // TopStandoff
    //color("grey")
    translate([0,0,ttgoPCB/2])
        hull()
        {
            translate([ttgox/2-rd,ttgoy/2-rd,0])
                cylinder(r=rd,h=ttgoSMD,$fn=100);
            translate([-ttgox/2+rd,-ttgoy/2+rd,0])
                cylinder(r=rd,h=ttgoSMD,$fn=100);
            translate([ttgox/2-rd,-ttgoy/2+rd,0])
                cylinder(r=rd,h=ttgoSMD,$fn=100);
            translate([-ttgox/2+rd,ttgoy/2-rd,0])
                cylinder(r=rd,h=ttgoSMD,$fn=100);
        }
    
    // PCB
    //color("green")
    difference()
    {   
        hull()
        {
            translate([ttgox/2-rd,ttgoy/2-rd,0])
                cylinder(r=rd,h=ttgoPCB,$fn=100, center=true);
            translate([-ttgox/2+rd,-ttgoy/2+rd,0])
                cylinder(r=rd,h=ttgoPCB,$fn=100, center=true);
            translate([ttgox/2-rd,-ttgoy/2+rd,0])
                cylinder(r=rd,h=ttgoPCB,$fn=100, center=true);
            translate([-ttgox/2+rd,ttgoy/2-rd,0])
                cylinder(r=rd,h=ttgoPCB,$fn=100, center=true);
        }

        // Holes
        union()
        {
            translate([ttgox/2-ttgoPCBHoleOff,ttgoy/2-ttgoPCBHoleOff,0])
                cylinder(r=ttgoPCBHoleDia/2,h=1+ttgoPCB,$fn=100, center=true);
            translate([-ttgox/2+ttgoPCBHoleOff,-ttgoy/2+ttgoPCBHoleOff,0])
                cylinder(r=ttgoPCBHoleDia/2,h=1+ttgoPCB,$fn=100, center=true);
            translate([ttgox/2-ttgoPCBHoleOff,-ttgoy/2+ttgoPCBHoleOff,0])
                cylinder(r=ttgoPCBHoleDia/2,h=1+ttgoPCB,$fn=100, center=true);
            translate([-ttgox/2+ttgoPCBHoleOff,ttgoy/2-ttgoPCBHoleOff,0])
                cylinder(r=ttgoPCBHoleDia/2,h=1+ttgoPCB,$fn=100, center=true);
        }
    }


    // Battery
    //color("grey")
    hull()
    {
        translate([0,0,-ttgoPCB/2-7/2])
                cube([23,78,7],center=true);
        translate([0,0,-ttgoPCB/2-20])
                cube([16,78,0.01],center=true);
    }
}

module ttgoV2Model_PCBOnly()
{
    // http://www.lilygo.cn/claprod_view.aspx?TypeId=62&Id=1281&FId=t28:62:28
    ttgox = 32.89;
    ttgoy = 100.13;
    ttgoSMD = 4; ///< SMD Standoff
    ttgoPCB = 2; ///< PCB thickness
    ttgoPCBHoleOff = 2.36;
    ttgoPCBHoleDia = 2;
    rd=2;
    
    // PCB
    //color("green")
    difference()
    {   
        hull()
        {
            translate([ttgox/2-rd,ttgoy/2-rd,0])
                cylinder(r=rd,h=ttgoPCB,$fn=100, center=true);
            translate([-ttgox/2+rd,-ttgoy/2+rd,0])
                cylinder(r=rd,h=ttgoPCB,$fn=100, center=true);
            translate([ttgox/2-rd,-ttgoy/2+rd,0])
                cylinder(r=rd,h=ttgoPCB,$fn=100, center=true);
            translate([-ttgox/2+rd,ttgoy/2-rd,0])
                cylinder(r=rd,h=ttgoPCB,$fn=100, center=true);
        }

        // Holes
        union()
        {
            translate([ttgox/2-ttgoPCBHoleOff,ttgoy/2-ttgoPCBHoleOff,0])
                cylinder(r=ttgoPCBHoleDia/2,h=1+ttgoPCB,$fn=100, center=true);
            translate([-ttgox/2+ttgoPCBHoleOff,-ttgoy/2+ttgoPCBHoleOff,0])
                cylinder(r=ttgoPCBHoleDia/2,h=1+ttgoPCB,$fn=100, center=true);
            translate([ttgox/2-ttgoPCBHoleOff,-ttgoy/2+ttgoPCBHoleOff,0])
                cylinder(r=ttgoPCBHoleDia/2,h=1+ttgoPCB,$fn=100, center=true);
            translate([-ttgox/2+ttgoPCBHoleOff,ttgoy/2-ttgoPCBHoleOff,0])
                cylinder(r=ttgoPCBHoleDia/2,h=1+ttgoPCB,$fn=100, center=true);
        }
    }
}

ttgoV2Model();