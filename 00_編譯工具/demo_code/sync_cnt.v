module sync_cnt(out, clk, reset);

    parameter WIDTH = 8;

    output [WIDTH-1 : 0] out;
    input                clk;
    input                reset;

    reg [WIDTH-1 : 0]    out;
    wire                 clk;
    wire                 reset;

    always@(posedge clk) begin
        if (reset)
            out <= 0;
        else
            out <= out + 1;
    end
endmodule
