module tb_full_subtractor_dataflow;
    reg A, B, Bin;
    wire Diff, Bout;

    full_subtractor_dataflow uut (A, B, Bin, Diff, Bout);

    initial begin
        $dumpfile("full_sub_dataflow.vcd");
        $dumpvars(0, tb_full_subtractor_dataflow);
        
        A = 0; B = 0; Bin = 0; #10;
        A = 1; B = 1; Bin = 0; #10;
        A = 1; B = 0; Bin = 1; #10;
        A = 0; B = 1; Bin = 1; #10;

        $finish;
    end
endmodule

