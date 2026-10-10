`timescale 1ns / 1ns

module tb_sync_cnt;

    // 1. Parameters and Signal Declarations
    parameter WIDTH = 8;

    reg clk;
    reg reset;
    wire [WIDTH-1 : 0] out;

    // 2. Instantiate the Design Under Test (DUT)
    sync_cnt #(
        .WIDTH(WIDTH)
    ) uut (
        .out(out), 
        .clk(clk), 
        .reset(reset)
    );

    // 3. Clock Generation (50MHz clock: period = 20ns)
    always begin
        #10 clk = ~clk;
    end

    // 4. Test Stimulus and VCD Generation
    initial begin
        // Initialize VCD dump for iverilog
        $dumpfile("sim_out.vcd"); // Specifies the VCD file name
        $dumpvars(0, tb_sync_cnt);    // Dumps all signals in this testbench

        // Initialize Signals
        clk = 0;
        reset = 1;

        // Apply Reset
        #25;
        reset = 0;  // Release reset

        // Let the counter run for a while
        #500;

        // Apply Reset again to test sync/async behavior
        reset = 1;
        #20;
        reset = 0;

        // Run a bit longer then finish
        #200;
        $display("Simulation finished.");
        $finish;
    end

endmodule
