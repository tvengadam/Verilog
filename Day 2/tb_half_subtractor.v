module tb_half_subtractor;
    reg a, b;
    wire diff, borrow;

    half_subtractor_behavioral uut (
        .a(a), 
        .b(b), 
        .diff(diff), 
        .borrow(borrow)
    );

    initial begin
        $dumpfile("half_subtractor.vcd");
        $dumpvars(0, tb_half_subtractor);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end
endmodule

