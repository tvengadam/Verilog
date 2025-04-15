module tb_siso_shift_register;

    reg clk;
    reg rst;
    reg serial_in;
    wire serial_out;

    siso_shift_register uut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Clock toggles every 5 time units
    end

    initial begin
        $dumpfile("siso.vcd");      // VCD file for waveform
        $dumpvars(0, tb_siso_shift_register);

        rst = 1;
        serial_in = 0;

        #10 rst = 0;

        #10 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 1;

        #40 $finish;
    end

endmodule

