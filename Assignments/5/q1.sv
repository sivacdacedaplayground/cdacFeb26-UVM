/*
# Exercise 1: Even Number Generator

## Problem Statement

Create a constraint such that only even values of `a` are generated.

### Requirements

- Use a 4-bit random variable `a`
- Apply a constraint to generate only even numbers
- Randomize the object 10 times
- Display the generated values

### Expected Output Example

```text
2
4
8
10
14
```
*/

`include "uvm_macros.svh"
import uvm_pkg::*;

class obj extends uvm_object;
    `uvm_object_utils(obj)
    
    rand bit [3:0] a;
    
    // Constraint: a must be even (LSB = 0)
    constraint c_even {
        a % 2 == 0;  // Even numbers: 0, 2, 4, 6, 8, 10, 12, 14
    }
    
    function new(string name = "obj");
        super.new(name);
    endfunction
endclass

module tb;
    obj o;
    
    initial begin
        o = new("obj");
        
        repeat(10) begin
            assert(o.randomize()) else $fatal(1, "Randomization failed!");
            `uvm_info("TB_TOP", $sformatf("Value of a: %0d", o.a), UVM_NONE)
        end
    end
endmodule

/*
output generated:

[2026-06-26 07:48:47 UTC] vlib work && vlog '-timescale' '1ns/1ns' +incdir+$RIVIERA_HOME/vlib/uvm-1.2/src -l uvm_1_2 -err VCP2947 W9 -err VCP2974 W9 -err VCP3003 W9 -err VCP5417 W9 -err VCP6120 W9 -err VCP7862 W9 -err VCP2129 W9 design.sv testbench.sv  && vsim -c -do "vsim +access+r; run -all; exit"  
VSIMSA: Configuration file changed: `/home/runner/library.cfg'
ALIB: Library "work" attached.
work = ./work/work.lib
MESSAGE_SP VCP2124 "Package uvm_pkg found in library uvm_1_2."
MESSAGE "Unit top modules: tb."
SUCCESS "Compile success 0 Errors 0 Warnings  Analysis time: 5[s]."
done
# Aldec, Inc. Riviera-PRO version 2025.04.139.9738 built for Linux64 on May 30, 2025.
# HDL, SystemC, and Assertions simulator, debugger, and design environment.
# (c) 1999-2025 Aldec, Inc. All rights reserved.
# ELBREAD: Elaboration process.
# ELBREAD: Warning: ELBREAD_0049 The "uvm_pkg" design unit does not have a time unit/precision defined but other design units do.
# ELBREAD: Elaboration time 0.8 [s].
# KERNEL: Main thread initiated.
# KERNEL: Kernel process initialization phase.
# ELAB2: Elaboration final pass...
# KERNEL: PLI/VHPI kernel's engine initialization done.
# PLI: Loading library '/usr/share/Riviera-PRO/bin/libsystf.so'
# ELAB2: Create instances ...
# KERNEL: Info: Loading library:  /usr/share/Riviera-PRO/bin/uvm_1_2_dpi
# KERNEL: Time resolution set to 1ns.
# ELAB2: Create instances complete.
# SLP: Started
# SLP: Elaboration phase ...
# SLP: Elaboration phase ... skipped, nothing to simulate in SLP mode : 0.0 [s]
# SLP: Finished : 0.0 [s]
# ELAB2: Elaboration final pass complete - time: 2.3 [s].
# KERNEL: Warning: You are using the Riviera-PRO EDU Edition. The performance of simulation is reduced.
# KERNEL: Warning: Contact Aldec for available upgrade options - sales@aldec.com.
# KERNEL: Kernel process initialization done.
# Allocation: Simulator allocated 26729 kB (elbread=1980 elab2=20510 kernel=4238 sdf=0)
# KERNEL: UVM_INFO ./uvm-1.2/src/base/uvm_root.svh(392) @ 0: reporter [UVM/RELNOTES] 
# KERNEL: ----------------------------------------------------------------
# KERNEL: UVM-1.2
# KERNEL: (C) 2007-2014 Mentor Graphics Corporation
# KERNEL: (C) 2007-2014 Cadence Design Systems, Inc.
# KERNEL: (C) 2006-2014 Synopsys, Inc.
# KERNEL: (C) 2011-2013 Cypress Semiconductor Corp.
# KERNEL: (C) 2013-2014 NVIDIA Corporation
# KERNEL: ----------------------------------------------------------------
# KERNEL: 
# KERNEL:   ***********       IMPORTANT RELEASE NOTES         ************
# KERNEL: 
# KERNEL:   You are using a version of the UVM library that has been compiled
# KERNEL:   with `UVM_NO_DEPRECATED undefined.
# KERNEL:   See http://www.eda.org/svdb/view.php?id=3313 for more details.
# KERNEL: 
# KERNEL:   You are using a version of the UVM library that has been compiled
# KERNEL:   with `UVM_OBJECT_DO_NOT_NEED_CONSTRUCTOR undefined.
# KERNEL:   See http://www.eda.org/svdb/view.php?id=3770 for more details.
# KERNEL: 
# KERNEL:       (Specify +UVM_NO_RELNOTES to turn off this notice)
# KERNEL: 
# KERNEL: ASDB file was created in location /home/runner/dataset.asdb
# KERNEL: UVM_INFO /home/runner/testbench.sv(27) @ 0: reporter [TB_TOP] Value of a: 6
# KERNEL: UVM_INFO /home/runner/testbench.sv(27) @ 0: reporter [TB_TOP] Value of a: 4
# KERNEL: UVM_INFO /home/runner/testbench.sv(27) @ 0: reporter [TB_TOP] Value of a: 2
# KERNEL: UVM_INFO /home/runner/testbench.sv(27) @ 0: reporter [TB_TOP] Value of a: 4
# KERNEL: UVM_INFO /home/runner/testbench.sv(27) @ 0: reporter [TB_TOP] Value of a: 14
# KERNEL: UVM_INFO /home/runner/testbench.sv(27) @ 0: reporter [TB_TOP] Value of a: 12
# KERNEL: UVM_INFO /home/runner/testbench.sv(27) @ 0: reporter [TB_TOP] Value of a: 10
# KERNEL: UVM_INFO /home/runner/testbench.sv(27) @ 0: reporter [TB_TOP] Value of a: 8
# KERNEL: UVM_INFO /home/runner/testbench.sv(27) @ 0: reporter [TB_TOP] Value of a: 6
# KERNEL: UVM_INFO /home/runner/testbench.sv(27) @ 0: reporter [TB_TOP] Value of a: 8
# KERNEL: Simulation has finished. There are no more test vectors to simulate.
# VSIM: Simulation has finished.
Done

*/
