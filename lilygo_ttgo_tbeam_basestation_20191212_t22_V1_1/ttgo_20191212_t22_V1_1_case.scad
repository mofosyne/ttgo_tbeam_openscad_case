// ttgo_20191212_t22_V1.1 case
use <ttgo_t22_V1_1_model.scad> 

module ttgoV2Bottom(smdUseIPEX = false)
{
    // http://www.lilygo.cn/claprod_view.aspx?TypeId=62&Id=1281&FId=t28:62:28

    caseThickness = 3;
    caseZipTieExtra = 10;
    
    holeSMA_dia = 7;
    holeSMA_thickness = 1;
    holeSpacing = 5;

    /////////////////////////////////////////////////////////////////////////
    ttgoxExact = 32.89;
    ttgoyExact = 100.13;
    ttgox = ttgoxExact + caseThickness * 2 + caseZipTieExtra;
    ttgoy = ttgoyExact + caseThickness * 2;
    ttgoSMD = 3.5; ///< SMD Standoff
    ttgoPCB = 2; ///< PCB thickness
    ttgoPCBHoleOff = 2.36;
    ttgoPCBHoleDia = 2;
    rd=2;
    
    // TopStandoff
    //color("grey")
    translate([0,0,ttgoPCB/2])
        hull()
        {
            translate([ttgox/2-rd,ttgoy/2-rd,0])
                cylinder(r=rd,h=ttgoSMD,$fn=10);
            translate([-ttgox/2+rd,-ttgoy/2+rd,0])
                cylinder(r=rd,h=ttgoSMD,$fn=10);
            translate([ttgox/2-rd,-ttgoy/2+rd,0])
                cylinder(r=rd,h=ttgoSMD,$fn=10);
            translate([-ttgox/2+rd,ttgoy/2-rd,0])
                cylinder(r=rd,h=ttgoSMD,$fn=10);
        }
    
    // PCB
    //color("green")  
    hull()
    {
        translate([ttgox/2-rd,ttgoy/2-rd,0])
            cylinder(r=rd,h=ttgoPCB,$fn=10, center=true);
        translate([-ttgox/2+rd,-ttgoy/2+rd,0])
            cylinder(r=rd,h=ttgoPCB,$fn=10, center=true);
        translate([ttgox/2-rd,-ttgoy/2+rd,0])
            cylinder(r=rd,h=ttgoPCB,$fn=10, center=true);
        translate([-ttgox/2+rd,ttgoy/2-rd,0])
            cylinder(r=rd,h=ttgoPCB,$fn=10, center=true);
    }

    // Main Body
    hull()
    {
        translate([0,0,0])
        hull()
        {
            translate([ttgox/2-rd,ttgoy/2-rd,0])
                cylinder(r=rd,h=ttgoPCB,$fn=10, center=true);
            translate([-ttgox/2+rd,-ttgoy/2+rd,0])
                cylinder(r=rd,h=ttgoPCB,$fn=10, center=true);
            translate([ttgox/2-rd,-ttgoy/2+rd,0])
                cylinder(r=rd,h=ttgoPCB,$fn=10, center=true);
            translate([-ttgox/2+rd,ttgoy/2-rd,0])
                cylinder(r=rd,h=ttgoPCB,$fn=10, center=true);
        }
        translate([0,0,-ttgoPCB/2-7-caseThickness])
        hull()
        {
            translate([ttgox/2-rd,ttgoy/2-rd,0])
                cylinder(r=rd,h=0.01,$fn=10, center=true);
            translate([-ttgox/2+rd,-ttgoy/2+rd,0])
                cylinder(r=rd,h=0.01,$fn=10, center=true);
            translate([ttgox/2-rd,-ttgoy/2+rd,0])
                cylinder(r=rd,h=0.01,$fn=10, center=true);
            translate([-ttgox/2+rd,ttgoy/2-rd,0])
                cylinder(r=rd,h=0.01,$fn=10, center=true);
        }
        translate([0,0,-ttgoPCB/2-20-caseThickness])
        hull()
        {
            ttgox2=16+caseThickness;
            ttgoy2=78+caseThickness;
            translate([ttgox2/2-rd,ttgoy2/2-rd,0])
                cylinder(r=rd,h=0.01,$fn=10, center=true);
            translate([-ttgox2/2+rd,-ttgoy2/2+rd,0])
                cylinder(r=rd,h=0.01,$fn=10, center=true);
            translate([ttgox2/2-rd,-ttgoy2/2+rd,0])
                cylinder(r=rd,h=0.01,$fn=10, center=true);
            translate([-ttgox2/2+rd,ttgoy2/2-rd,0])
                cylinder(r=rd,h=0.01,$fn=10, center=true);
        }
    }
    
    // SMD Hole
    if (smdUseIPEX)
    {
        // IPEX SMA Antenna Hole
        SMAExtra=10;
        SMAMountThickness=1;
        hull()
        {
            top_size = (holeSMA_dia*2+holeSpacing*2+caseThickness*2);
            translate([0,-(ttgoyExact/2+SMAExtra+SMAMountThickness)/2,+ttgoPCB/2+ttgoSMD])
                cube([top_size,(ttgoyExact/2+SMAExtra+SMAMountThickness),0.01], center=true);
            translate([top_size/2-(holeSMA_dia/2 + holeSpacing),-(ttgoyExact/2+SMAExtra+SMAMountThickness)/2,-ttgoPCB/2-(holeSMA_dia+holeSpacing)/2+holeSpacing/2])
                rotate([90,0,0])
                    cylinder(r=(holeSMA_dia/4 + holeSpacing + caseThickness/2), h=(ttgoyExact/2+SMAExtra+SMAMountThickness), $fn=20, center=true);
            translate([-(top_size/2-(holeSMA_dia/2 + holeSpacing)),-(ttgoyExact/2+SMAExtra+SMAMountThickness)/2,-ttgoPCB/2-(holeSMA_dia+holeSpacing)/2+holeSpacing/2])
                rotate([90,0,0])
                    cylinder(r=(holeSMA_dia/4 + holeSpacing + caseThickness/2), h=(ttgoyExact/2+SMAExtra+SMAMountThickness), $fn=20, center=true);
            translate([0,-(78/2)/2,-ttgoPCB/2-20-caseThickness])
                cube([(holeSMA_dia+holeSpacing*2),(78/2),0.01], center=true);
        }
    }
}

module ttgoV2Top(smdUseIPEX = false)
{
    // http://www.lilygo.cn/claprod_view.aspx?TypeId=62&Id=1281&FId=t28:62:28

    caseTopThickness = 1;
    caseThickness = 3;
    caseZipTieExtra = 10;
    
    holeSMA_dia = 7;
    holeSMA_thickness = 1;
    holeSpacing = 5;

    /////////////////////////////////////////////////////////////////////////
    ttgoxExact =  32.89;
    ttgoyExact = 100.13;
    ttgox = ttgoxExact + caseThickness * 2 + caseZipTieExtra;
    ttgoy = ttgoyExact + caseThickness * 2;
    ttgoSMD = 3.5; ///< SMD Standoff
    ttgoPCB = 2; ///< PCB thickness
    ttgoPCBHoleOff = 2.36;
    ttgoPCBHoleDia = 2;
    rd=2;
    
    translate([0,0,ttgoPCB/2+ttgoSMD])
        hull()
        {
            translate([ttgox/2-rd,ttgoy/2-rd,0])
                cylinder(r=rd,h=ttgoSMD,$fn=10);
            translate([-ttgox/2+rd,-ttgoy/2+rd,0])
                cylinder(r=rd,h=ttgoSMD,$fn=10);
            translate([ttgox/2-rd,-ttgoy/2+rd,0])
                cylinder(r=rd,h=ttgoSMD,$fn=10);
            translate([-ttgox/2+rd,ttgoy/2-rd,0])
                cylinder(r=rd,h=ttgoSMD,$fn=10);

            // SMD Hole
            if (smdUseIPEX)
            {
                SMAExtra=10;
                SMAMountThickness=1;
                top_size = (holeSMA_dia*2+holeSpacing*2+caseThickness*2);
                translate([0,-(ttgoyExact/2+SMAExtra+SMAMountThickness)/2,ttgoSMD/2])
                    cube([top_size,(ttgoyExact/2+SMAExtra+SMAMountThickness),ttgoSMD], center=true);
            }
        }
}

module ttgoV2Cut(smdUseIPEX = false)
{
    // http://www.lilygo.cn/claprod_view.aspx?TypeId=62&Id=1281&FId=t28:62:28
    caseThickness = 3;
    caseZipTieExtra = 10;

    holeSMA_dia = 7;
    holeSMA_thickness = 1;
    holeSpacing = 5;

    ///////////////////
    pcbTolx = 1.5;
    pcbToly = 3;
    ttgoxExact = 32.89;
    ttgoyExact = 100.13;
    ttgox = ttgoxExact + pcbTolx;
    ttgoy = ttgoyExact + pcbToly;
    ttgoSMD = 3.5; ///< SMD Standoff
    ttgoPCB = 2; ///< PCB thickness
    ttgoPCBHoleOff = 2.36;
    ttgoPCBHoleDia = 2;
    rd=2;
    //%cube([ttgox,ttgoy,1], center=true);
    
    // OLED Screen
    oledtol=10;
    color("black")
    translate([ttgoxExact/2-6-7.5,ttgoyExact/2-25,ttgoPCB/2+ttgoSMD+1+2])
        union()
        {
            cube([15,25,2+0.01],center=true);
        }
    color("blue")
    translate([0,ttgoyExact/2-25,ttgoPCB/2+ttgoSMD+1])
        union()
        {
            cube([30,30+oledtol,2],center=true);
        }

    // SMD ANTENNA
    if (!smdUseIPEX)
    {
        tol = 1.1; 
        smdAntennaXOffset = -0.5; ///< For adjustment 
        translate([ttgoxExact/2-7/2,-ttgoyExact/2+40+smdAntennaXOffset,0])
        {
            translate([0,0,ttgoPCB/2+10/2])
                union()
                {
                    %cube([7,6,10],center=true);
                    %translate([6/2,0,1])
                        rotate([0,90,0])
                        cylinder(r=6/2, h=6, $fn=50);
                    // Cover
                    intersection()
                    {
                        translate([-tol,0,1])
                        hull()
                        {
                            translate([-3.5,0,1])
                                rotate([0,90,0])
                                cylinder(r=6/2+tol, h=16, $fn=40);
                            translate([-3.5,0,-(6/2+tol)/2+2])
                                rotate([0,90,0])
                                cylinder(r=6/2+tol, h=16, $fn=40);
                            //%translate([16/2-3.5,0,-(6+tol)/2-0.5])
                            //    cube([16,(6+tol*2),0.1],center=true);
                        }
                    }
                    translate([-tol,0,1])
                    hull()
                    {
                        hh = 8.95;
                        translate([-3.5,0,3])
                            rotate([0,90,0])
                            cylinder(r=6/2+tol, h=hh, $fn=40);
                        translate([hh/2-3.5,0,-(6+tol)/2-0.5])
                            cube([hh,(6+tol*2),0.1],center=true);
                    }
                }
            translate([0,0,-ttgoPCB/2-4/2])
                cube([7,6,4],center=true);
        }
    }

    // Detail Cutout
    hull()
    {
        translate([-ttgoxExact/2+6/2-0.5-caseThickness-2,0,ttgoPCB/2+3/2+5/2])
            cube([1,65,3+0.1+5],center=true);
        translate([-ttgoxExact/2+6/2-0.5-caseZipTieExtra-1,0,ttgoPCB/2+3/2+5/2])
            cube([1,70,10+0.1+5],center=true);
    }
    hull()
    {
        translate([-(-ttgoxExact/2+6/2-0.5-caseThickness-2),0,ttgoPCB/2+3/2+5/2])
            cube([1,65,3+0.1+5],center=true);
        translate([-(-ttgoxExact/2+6/2-0.5-caseZipTieExtra-1),0,ttgoPCB/2+3/2+5/2])
            cube([1,70,10+0.1+5],center=true);
    }

    // Port Cutout
    hull()
    {
        translate([-ttgoxExact/2+6/2-0.5-caseThickness,-12,ttgoPCB/2+3/2+5/2])
            cube([1,40,3+0.1+5],center=true);
        translate([-ttgoxExact/2+6/2-0.5-caseZipTieExtra-1,-12,ttgoPCB/2+3/2+5/2])
            cube([1,45,10+0.1+5],center=true);
    }

    // TopStandoff
    //color("grey")
    translate([0,0,ttgoPCB/2])
        hull()
        {
            translate([ttgox/2-rd,ttgoy/2-rd,0])
                cylinder(r=rd,h=ttgoSMD+0.2,$fn=10);
            translate([-ttgox/2+rd,-ttgoy/2+rd,0])
                cylinder(r=rd,h=ttgoSMD+0.2,$fn=10);
            translate([ttgox/2-rd,-ttgoy/2+rd,0])
                cylinder(r=rd,h=ttgoSMD+0.2,$fn=10);
            translate([-ttgox/2+rd,ttgoy/2-rd,0])
                cylinder(r=rd,h=ttgoSMD+0.2,$fn=10);
        }
    
    extraCut = 0.1;

    // PCB
    //color("green")
    difference()
    {
        hull()
        {

            translate([ttgox/2-rd,ttgoy/2-rd,0])
                cylinder(r=rd,h=ttgoPCB+(extraCut*2),$fn=10, center=true);
            translate([-ttgox/2+rd,-ttgoy/2+rd,0])
                cylinder(r=rd,h=ttgoPCB+(extraCut*2),$fn=10, center=true);
            translate([ttgox/2-rd,-ttgoy/2+rd,0])
                cylinder(r=rd,h=ttgoPCB+(extraCut*2),$fn=10, center=true);
            translate([-ttgox/2+rd,ttgoy/2-rd,0])
                cylinder(r=rd,h=ttgoPCB+(extraCut*2),$fn=10, center=true);
        }
    }

    // Battery
    difference()
    {
        pcbBatTol=3; ///< Account for battery tolerance
        pcbLedgeX=3;
        union()
        {
            //color("grey")
            hull()
            {
                translate([0,0,-ttgoPCB/2-10/2])
                    cube([23+pcbBatTol,ttgoy-pcbLedgeX,10],    center=true);
                translate([0,0,-ttgoPCB/2-20])
                    cube([16,78,0.01], center=true);
            }
            hull()
            {
                translate([0,0,-ttgoPCB/2-10/2])
                    cube([ttgox,78+pcbBatTol,10],    center=true);
                translate([0,0,-ttgoPCB/2-20])
                    cube([16,78,0.01], center=true);
            }
        }

        // Account For Lanyard Cutout
        translate([0,-(-ttgoy/2-holeSMA_dia+4),-ttgoPCB/2-5/2])
            cube([100,20,100], center=true);
    
        if (!smdUseIPEX)
        {
            translate([0,-ttgoy/2-holeSMA_dia+4,-ttgoPCB/2-5/2])
                cube([100,20,100], center=true);
        }
    }

    // SMD Hole
    if (smdUseIPEX)
    {
        SMAExtra=10;
        translate([+(holeSMA_dia+holeSpacing)/2,-ttgoyExact/2-SMAExtra,-ttgoPCB/2-(holeSMA_dia+holeSpacing)/2+holeSpacing])
            rotate([90,0,0])
            cylinder(r=holeSMA_dia/2, h=10+SMAExtra, $fn=20, center=true);

        // Extra Hole For GPS antenna
        translate([-(holeSMA_dia+holeSpacing)/2,-ttgoyExact/2-SMAExtra,-ttgoPCB/2-(holeSMA_dia+holeSpacing)/2+holeSpacing])
            rotate([90,0,0])
            cylinder(r=holeSMA_dia/2, h=10+SMAExtra, $fn=20, center=true);

        hull()
        {
            top_size = (holeSMA_dia*2+holeSpacing*2);
            translate([0,-(ttgoyExact/2+SMAExtra)/2,+ttgoPCB/2+ttgoSMD+0.01])
                cube([top_size,(ttgoyExact/2+SMAExtra),0.01], center=true);
            translate([top_size/2-(holeSMA_dia/2),-(ttgoyExact/2+SMAExtra)/2,-ttgoPCB/2-(holeSMA_dia+holeSpacing)/2+holeSpacing/2])
                rotate([90,0,0])
                cylinder(r=(holeSMA_dia/4 + holeSpacing/2), h=(ttgoyExact/2+SMAExtra), $fn=20, center=true);
            translate([-(top_size/2-(holeSMA_dia/2)),-(ttgoyExact/2+SMAExtra)/2,-ttgoPCB/2-(holeSMA_dia+holeSpacing)/2+holeSpacing/2])
                rotate([90,0,0])
                cylinder(r=(holeSMA_dia/4 + holeSpacing/2), h=(ttgoyExact/2+SMAExtra), $fn=20, center=true);
            translate([0,-(78/2)/2,-ttgoPCB/2-20])
                cube([(holeSMA_dia+holeSpacing*2),(78/2),0.01], center=true);
        }
    }

    // ZipTie/M3Screw Slot
    translate([0,ttgoy/2-8,0])
    {
        translate([-ttgox/2-caseZipTieExtra/2+1.5,0,0])
        union()
        {
            cube([2,5.5,100], center=true);
            cylinder(r=3/2-0.05, h=100, center=true, $fn=20);
        }
        translate([-(-ttgox/2-caseZipTieExtra/2+1.5),0,0])
        union()
        {
            cube([2,5.5,100], center=true);
            cylinder(r=3/2-0.05, h=100, center=true, $fn=20);
        }
    }
    translate([0,-ttgoy/2+8,0])
    {
        translate([-ttgox/2-caseZipTieExtra/2+1.5,0,0])
        union()
        {
            cube([2,5.5,100], center=true);
            cylinder(r=3/2-0.05, h=100, center=true, $fn=20);
        }
        translate([-(-ttgox/2-caseZipTieExtra/2+1.5),0,0])
        union()
        {
            cube([2,5.5,100], center=true);
            cylinder(r=3/2-0.05, h=100, center=true, $fn=20);
        }
    }

    // M2Screw Slot
    translate([0,ttgoy/2-14.5,0])
    {
        translate([-ttgox/2-caseZipTieExtra/2+1.5,0,0])
            cylinder(r=2/2-0.05, h=100, center=true, $fn=20);
        translate([-(-ttgox/2-caseZipTieExtra/2+1.5),0,0])
            cylinder(r=2/2-0.05, h=100, center=true, $fn=20);
    }
    translate([0,-ttgoy/2+14.5,0])
    {
        translate([-ttgox/2-caseZipTieExtra/2+1.5,0,0])
            cylinder(r=2/2-0.05, h=100, center=true, $fn=20);
        translate([-(-ttgox/2-caseZipTieExtra/2+1.5),0,0])
            cylinder(r=2/2-0.05, h=100, center=true, $fn=20);
    }

    if (!smdUseIPEX)
    {
        translate([0,-(ttgoy/2-3),-ttgoPCB/2-4])
            rotate([0,90,0])
                cylinder(r=2,h=100,$fn=40, center=true);
    }


    /* Screw Holes */
    // M4 Base Mounting screw
    translate([0,-10,-ttgoPCB/2-20-caseThickness-1]) cylinder(r=4/2-0.05, h=10, $fn=20);
    translate([0,+10,-ttgoPCB/2-20-caseThickness-1]) cylinder(r=4/2-0.05, h=10, $fn=20);

    // M6 Base Mounting screw
    translate([0,-20,-ttgoPCB/2-20-caseThickness-1]) cylinder(r=6/2-0.05, h=10, $fn=20);
    translate([0,+20,-ttgoPCB/2-20-caseThickness-1]) cylinder(r=6/2-0.05, h=10, $fn=20);

    // M8 Base Mounting screw
    translate([0,-30,-ttgoPCB/2-20-caseThickness-1]) cylinder(r=8/2-0.05, h=10, $fn=20);
    translate([0,+30,-ttgoPCB/2-20-caseThickness-1]) cylinder(r=8/2-0.05, h=10, $fn=20);

    /* Chamfer */
    // M4 Base Mounting screw
    translate([0,-10,-ttgoPCB/2-20-caseThickness+2]) cylinder(r1=4/2-0.05, r2=(4+10)/2-0.05, h=2, $fn=20);
    translate([0,+10,-ttgoPCB/2-20-caseThickness+2]) cylinder(r1=4/2-0.05, r2=(4+10)/2-0.05, h=2, $fn=20);

    // M6 Base Mounting screw
    translate([0,-20,-ttgoPCB/2-20-caseThickness+2]) cylinder(r1=6/2-0.05, r2=(6+10)/2-0.05, h=2, $fn=20);
    translate([0,+20,-ttgoPCB/2-20-caseThickness+2]) cylinder(r1=6/2-0.05, r2=(6+10)/2-0.05, h=2, $fn=20);

    // M8 Base Mounting screw
    translate([0,-30,-ttgoPCB/2-20-caseThickness+2]) cylinder(r1=8/2-0.05, r2=(8+10)/2-0.05, h=2, $fn=20);
    translate([0,+30,-ttgoPCB/2-20-caseThickness+2]) cylinder(r1=8/2-0.05, r2=(8+10)/2-0.05, h=2, $fn=20);

}

///////////////////////////////////////////////////////

module part_ttgo_20191212_t22_V1_1_case_ipex_top() { // `make` me
    rotate([0,180,0])
    union()
    {
        difference()
        {
            ttgoV2Top(smdUseIPEX = true);
            ttgoV2Cut(smdUseIPEX = true);
        }
    }
}

module part_ttgo_20191212_t22_V1_1_case_ipex_bottom() { // `make` me
    difference()
    {
        ttgoV2Bottom(smdUseIPEX = true);
        ttgoV2Cut(smdUseIPEX = true);
    }
}

module part_ttgo_20191212_t22_V1_1_case_sma_top() { // `make` me
    rotate([0,180,0])
    union()
    {
        difference()
        {
            ttgoV2Top(smdUseIPEX = false);
            ttgoV2Cut(smdUseIPEX = false);
        }
    }
}

module part_ttgo_20191212_t22_V1_1_case_sma_bottom() { // `make` me
    difference()
    {
        ttgoV2Bottom(smdUseIPEX = false);
        ttgoV2Cut(smdUseIPEX = false);
    }
}


/* Dev Preview */ 
smdUseIPEXDev = true;
union()
{
    difference()
    {
        union()
        {
            ttgoV2Top(smdUseIPEX = smdUseIPEXDev);
            ttgoV2Bottom(smdUseIPEX = smdUseIPEXDev);
        }
        ttgoV2Cut(smdUseIPEX = smdUseIPEXDev);
    }
}

/* Model */
//%ttgoV2Model();
//%ttgoV2Model_PCBOnly();
